;;; evil-easymotion.el --- A port of vim's easymotion to emacs

;; Copyright (C) 2014, 2015, 2016 PythonNut

;; Author: PythonNut <pythonnut@pythonnut.com>
;; Keywords: convenience, evil
;; Package-Version: 20160228.1609
;; Version: 20160228
;; URL: https://github.com/pythonnut/evil-easymotion
;; Package-Requires: ((emacs "24") (avy "0.3.0") (cl-lib "0.5"))

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; This is a clone of the popular easymotion package for vim, which
;; describes itself in these terms:

;; > EasyMotion provides a much simpler way to use some motions in vim.
;; > It takes the <number> out of <number>w or <number>f{char} by
;; > highlighting all possible choices and allowing you to press one key
;; > to jump directly to the target.

;; If you're having trouble picturing this, please visit the github repo
;; for a screencast.

;; Usage/status
;; ============

;; evil-easymotion, rather unsurprisingly can use evil. However, you don't
;; _need_ evil to use it. evil-easymotion can happily define motions for
;; regular emacs commands. With that said, evil is recommended, not
;; least because it's awesome.

;; Currently most motions are supported, and it's easy to define your own easymotions.

;;   (evilem-define (kbd "SPC w") 'evil-forward-word-begin)

;; To define easymotions for all motions that evil defines by default, add

;;   (evilem-default-keybindings "SPC")

;; This binds all motions under the prefix `SPC` in `evil-motion-state-map`. This is not done by default for motions defined manually. You will need to supply the prefix.

;; More advanced use-cases are detailed in the github README.

;;; Code:
(require 'cl-lib)

(eval-when-compile
  (require 'avy)
  (require 'evil))

(defgroup evilem nil
  "Emulate vim-easymotion"
  :group 'convenience
  :prefix "evilem-")

(defcustom evilem-keys nil
  "Value of `avy-keys' to set during motions. Set to nil to leave unchanged."
  :type '(repeat :tag "Keys" character))

(defcustom evilem-style nil
  "Value of `avy-style' to set during motions. Set to nil to leave unchanged."
  :type '(choice
          (const :tag "Pre" pre)
          (const :tag "At" at)
          (const :tag "At Full" at-full)
          (const :tag "Post" post)
          (const :tag "De Bruijn" de-bruijn)
          (const :tag "Default" nil)))

;; macro helper, from evil source
(eval-and-compile
  (defun evilem--unquote (exp)
    "Return EXP unquoted."
    (while (member (car-safe exp) '(quote function))
      (setq exp (cadr exp)))
    exp))

(defun evilem--jump (points)
  "avy-jump to the set of points generated by collector"
  (require 'avy)
  (let* ((avy-style (or evilem-style avy-style))
         (avy-keys (or evilem-keys avy-keys))
         (avy-all-windows nil))
    (avy--process (mapcar
                   (lambda (pt)
                     (cons pt  (get-buffer-window)))
                   points)
                  (avy--style-fn avy-style))))

(defun evilem--collect (func &optional scope)
  "Repeatedly execute func, and collect the cursor positions into a list"
  (let ((points)
        ;; make sure the motion doesn't move the window
        (scroll-conservatively 101)
        (smooth-scroll-margin 0)
        (scroll-margin 0))
    (save-excursion
      (save-restriction
        (cl-destructuring-bind (beg . end)
            (if scope
                (bounds-of-thing-at-point scope)
              (cons (point-min)
                    (point-max)))

          ;; trim trailing newline
          (when (= (char-before end) 10)
            (cl-decf end))

          (narrow-to-region (max beg (window-start))
                            (min end (1- (window-end)))))
        (while (and (ignore-errors
                      (setq this-command func
                            last-command func)
                      (call-interactively func)
                      t)
                    (not (memq (point) points))
                    (push (point) points))))
      (nreverse points))))

(cl-defmacro evilem-make-motion (name func &key pre-hook post-hook bind scope)
  "Automatically define an evil easymotion for `func', naming it `name'"
  `(evil-define-motion ,name (_count)
     (evil-without-repeat
       (setq evil-this-type 'inclusive)
       (let ,bind
         ,(when pre-hook `(funcall ,(if (functionp pre-hook)
                                        pre-hook
                                        `(lambda () ,pre-hook))))
         (evilem--jump (evilem--collect ,func ,scope))
         ,(when post-hook `(funcall ,(if (functionp post-hook)
                                         post-hook
                                         `(lambda () ,post-hook))))))))

(cl-defmacro evilem-make-motion-plain (name func &key pre-hook post-hook bind scope)
  "Automatically define a plain easymotion for `func', naming it `name'"
  `(defun ,name ()
     (interactive)
     (let ,bind
       ,(when pre-hook `(funcall ,(if (functionp pre-hook)
                                      pre-hook
                                      `(lambda () ,pre-hook))))
       (evilem--jump (evilem--collect ,func ,scope))
       ,(when post-hook `(funcall ,(if (functionp post-hook)
                                       post-hook
                                       `(lambda () ,post-hook)))))))

(cl-defmacro evilem-create (motion &key pre-hook post-hook bind scope)
  `(evilem-make-motion
    ,(intern
      (format "evilem--motion-%s-%s"
              (symbol-name (evilem--unquote motion))
              (symbol-name (cl-gensym))))
    ,motion
    :pre-hook ,pre-hook
    :post-hook ,post-hook
    :bind ,bind
    :scope ,scope))

(cl-defmacro evilem-create-plain (motion &key pre-hook post-hook bind scope)
  `(evilem-make-motion-plain
    ,(intern
      (format "evilem--motion-%s-%s"
              (symbol-name (evilem--unquote motion))
              (symbol-name (cl-gensym))))
    ,motion
    :pre-hook ,pre-hook
    :post-hook ,post-hook
    :bind ,bind
    :scope ,scope))

(cl-defmacro evilem-define (key motion &key pre-hook post-hook bind scope)
  "Automatically create and bind an evil motion"
  `(define-key evil-motion-state-map ,key
     (evilem-create ,motion
                    :pre-hook ,pre-hook
                    :post-hook ,post-hook
                    :bind ,bind
                    :scope ,scope)))

;;;###autoload
(defun evilem-default-keybindings (prefix)
  "Define easymotions for all motions evil defines by default"
  (define-key evil-motion-state-map (kbd prefix) nil)
  (evilem-define (kbd (concat prefix " w")) #'evil-forward-word-begin
                 :scope 'line)
  (evilem-define (kbd (concat prefix " W")) #'evil-forward-WORD-begin
                 :scope 'line)
  (evilem-define (kbd (concat prefix " e")) #'evil-forward-word-end
                 :scope 'line)
  (evilem-define (kbd (concat prefix " E")) #'evil-forward-WORD-end
                 :scope 'line)
  (evilem-define (kbd (concat prefix " b")) #'evil-backward-word-begin
                 :scope 'line)
  (evilem-define (kbd (concat prefix " B")) #'evil-backward-WORD-begin
                 :scope 'line)
  (evilem-define (kbd (concat prefix " ge")) #'evil-backward-word-end
                 :scope 'line)
  (evilem-define (kbd (concat prefix " gE")) #'evil-backward-WORD-end
                 :scope 'line)

  (evilem-define (kbd (concat prefix " j")) #'next-line
                 :pre-hook (setq evil-this-type 'line)
                 :bind ((temporary-goal-column (current-column))
                        (line-move-visual nil)))

  (evilem-define (kbd (concat prefix " k")) #'previous-line
                 :pre-hook (setq evil-this-type 'line)
                 :bind ((temporary-goal-column (current-column))
                        (line-move-visual nil)))

  (evilem-define (kbd (concat prefix " g j")) #'next-line
                 :pre-hook (setq evil-this-type 'line)
                 :bind ((temporary-goal-column (current-column))
                        (line-move-visual t)))

  (evilem-define (kbd (concat prefix " g k")) #'previous-line
                 :pre-hook (setq evil-this-type 'line)
                 :bind ((temporary-goal-column (current-column))
                        (line-move-visual t)))

  (evilem-define (kbd (concat prefix " t")) #'evil-repeat-find-char
                 :pre-hook (save-excursion
                             (let ((evil-cross-lines t))
                               (call-interactively #'evil-find-char-to)))
                 :bind ((evil-cross-lines t)))

  (evilem-define (kbd (concat prefix " T")) #'evil-repeat-find-char
                 :pre-hook (save-excursion
                             (let ((evil-cross-lines t))
                               (call-interactively #'evil-find-char-to-backward)))
                 :bind ((evil-cross-lines t)))

  (evilem-define (kbd (concat prefix " f")) #'evil-repeat-find-char
                 :pre-hook (save-excursion
                             (let ((evil-cross-lines t))
                               (call-interactively #'evil-find-char)))
                 :bind ((evil-cross-lines t)))

  (evilem-define (kbd (concat prefix " F")) #'evil-repeat-find-char
                 :pre-hook (save-excursion
                             (let ((evil-cross-lines t))
                               (call-interactively #'evil-find-char-backward)))
                 :bind ((evil-cross-lines t)))

  (evilem-define (kbd (concat prefix " [[")) #'evil-backward-section-begin
                 :pre-hook (setq evil-this-type 'line))

  (evilem-define (kbd (concat prefix " []")) #'evil-backward-section-end
                 :pre-hook (setq evil-this-type 'line))

  (evilem-define (kbd (concat prefix " ]]")) #'evil-forward-section-begin
                 :pre-hook (setq evil-this-type 'line))

  (evilem-define (kbd (concat prefix " ][")) #'evil-forward-section-end
                 :pre-hook (setq evil-this-type 'line))

  (evilem-define (kbd (concat prefix " (")) #'evil-forward-sentence-begin)
  (evilem-define (kbd (concat prefix " )")) #'evil-backward-sentence-begin)

  (evilem-define (kbd (concat prefix " n")) #'evil-search-next)
  (evilem-define (kbd (concat prefix " N")) #'evil-search-previous)
  (evilem-define (kbd (concat prefix " *")) #'evil-search-word-forward)
  (evilem-define (kbd (concat prefix " #")) #'evil-search-word-backward)

  (evilem-define (kbd (concat prefix " -"))
                 #'evil-previous-line-first-non-blank)
  (evilem-define (kbd (concat prefix " +"))
                 #'evil-next-line-first-non-blank))

(provide 'evil-easymotion)
;;; evil-easymotion.el ends here
