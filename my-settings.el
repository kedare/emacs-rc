;; SETTINGS AND UI

(setq w32-get-true-file-attributes nil)
(transient-mark-mode t)
(autoload 'nuke-trailing-whitespace "whitespace" nil t)
(setq sentence-end-double-space nil)
(fset 'yes-or-no-p 'y-or-n-p)
(setq calendar-week-start-day 1)

(setq indent-tabs-mode nil)
(setq tab-width 2)

(require 'powerline)
(powerline-default-theme)

(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)

;; Autocompletion configuration
(add-hook 'after-init-hook 'global-company-mode)

;; Parenthesis highlight everywhere
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(require 'yasnippet)
(yas-global-mode 1)

(add-hook 'after-init-hook 'global-flycheck-mode)

(setq flycheck-idle-change-delay 5)

(setq select-active-regions nil)
(setq mouse-drag-copy-region t)
(global-set-key [mouse-2] 'mouse-yank-at-click)

(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq column-number-mode 1)
(setq line-number-mode 1)
;; (global-linum-mode 1) ;; No linum by default
(setq linum-format "%4d \u2502 ")
(setq c-basic-offset 2)

;; Font Configuration

;; Windows
(if (eq (window-system) 'w32)
    (progn 
      (when (display-graphic-p)
	(set-face-attribute 'default nil
			    :family "Source Code Pro"
			    :height 110
			    :weight 'normal
			    :width 'normal))
      (menu-bar-mode 1)
      )
  )

;; OS X / NextStep
(if (eq (window-system) 'ns)
    (progn
    (when (display-graphic-p)
      (set-face-attribute 'default nil
			  :family "Source Code Pro for Powerline"
			  :height 110
			  :weight 'normal
			  :width 'normal))
    (menu-bar-mode 1)
    )
  )
;; End of font configuration

(global-set-key (kbd "C-x C-z") 'next-multiframe-window)

(when (display-graphic-p)
  ;; Ultimate tweaking
  (progn 
    (nyan-mode t)
    (nyan-start-animation)
    (scroll-bar-mode -1)))


;; Helm rox
(require 'helm)
(require 'helm-buffers)
(require 'helm-config)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list) 
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-buffer-map (kbd "C-x C-k") 'helm-buffer-run-kill-buffers)

(global-set-key "\t" 'company-complete-common)

;; Use HELM for Flycheck
;;(eval-after-load 'flycheck
;;  '(define-key flycheck-mode-map (kbd "C-c C-c") 'helm-flycheck))

;; Mouse configuration
(setq xterm-mouse-mode t)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(defun scroll-up-10-lines ()
  "Scroll up 10 lines"
  (interactive)
  (scroll-up 10))

(defun scroll-down-10-lines ()
  "Scroll down 10 lines"
  (interactive)
  (scroll-down 10))

(global-set-key (kbd "<mouse-4>") 'scroll-down-10-lines)
(global-set-key (kbd "<mouse-5>") 'scroll-up-10-lines)

;; Dired everywhere
(global-set-key (kbd "C-X C-D") 'dired)

;; Occur is nice
(global-set-key (kbd "C-c o") 'helm-occur)

;; END OF SETTINGS
