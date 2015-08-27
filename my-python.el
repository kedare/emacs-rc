;; PYTHON

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)    
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; END OF PYTHON
