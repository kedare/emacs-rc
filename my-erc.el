;; ERC 
(require 'erc)
(require 'erc-list)
(erc-track-mode t)
(setq erc-user-full-name "Mathieu Poussin")
(setq erc-email-userid "mpo@ntx.so")

;;(setq erc-input-line-position -2)

(setq erc-log-insert-log-on-open nil)
(setq erc-log-channels t)
(setq erc-log-channels-directory "~/.irclogs/")
(setq erc-save-buffer-on-part t)

(add-to-list 'erc-mode-hook (lambda ()
  (set (make-local-variable 'scroll-conservatively) 1)))

;; END OF ERC
