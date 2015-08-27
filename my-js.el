(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq js2-highlight-level 3)

(add-hook 'js2-mode-hook
          (lambda () (flycheck-mode t)))


