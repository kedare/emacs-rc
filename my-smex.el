;; SMEX

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-yascroll-bar-mode 1)

(require 'multi-term)
(setq multi-term-program "/bin/zsh")

(add-hook 'ruby-mode-hook 'robe-mode)

(add-hook 'term-mode-hook
    (lambda ()
      (setq term-buffer-maximum-size 10000))
      (setq show-trailing-whitespace nil)
    )

(setq sml/theme 'respectful)
(sml/setup)

(require 'scss-mode)

;; END OF SMEX
