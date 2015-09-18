;; UI

(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(column-number-mode 1)
(line-number-mode 1)
(linum-mode 1)
(setq linum-format "%4d \u2502 ")
(setq c-basic-offset 2)
(load-library "paren")
(show-paren-mode 1)

;; Font Configuration

;; Windows
(if (eq (window-system) 'w32)
    (when (display-graphic-p)
      (set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 110
                    :weight 'normal
                    :width 'normal)))

;; OS X / NextStep
(if (eq (window-system) 'ns)
    (when (display-graphic-p)
      (set-face-attribute 'default nil
                    :family "Source Code Pro for Powerline"
                    :height 110
                    :weight 'normal
                    :width 'normal)))
;; End of font configuration

(global-set-key (kbd "C-x C-z") 'next-multiframe-window)

;; IDO is dead
;;(require 'ido)
;;(require 'ido-vertical-mode)
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode t)
;;(ido-vertical-mode t)


(when (display-graphic-p)
    ;; Ultimate tweaking
    (nyan-mode t)
  (nyan-start-animation))

;;(global-set-key (kbd "C-x C-b") 'ibuffer)
;;    (autoload 'ibuffer "ibuffer" "List buffers." t)

;; Helm rox

(require 'helm-config)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list) 
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

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

;; END OF UI
