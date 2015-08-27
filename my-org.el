;; ORG MODE

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(org-indent-mode)


;; END OF ORG MODE
