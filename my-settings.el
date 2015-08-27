;; My settings
(setq w32-get-true-file-attributes nil)
(transient-mark-mode t)
(autoload 'nuke-trailing-whitespace "whitespace" nil t)
(setq sentence-end-double-space nil)
(fset 'yes-or-no-p 'y-or-n-p)
(setq calendar-week-start-day 1)

(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
              emacs-tmp-dir)

(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

(setq select-active-regions nil)
(setq mouse-drag-copy-region t)
(global-set-key [mouse-2] 'mouse-yank-at-click)
