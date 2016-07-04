;;
;; Mathieu Poussin
;; mathieu.poussin@netyxia.net
;;

;; Generated custom variables

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(cperl-indent-parens-as-block t)
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("6df30cfb75df80e5808ac1557d5cc728746c8dbc9bc726de35b15180fa6e0ad9" "40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" "f3d6a49e3f4491373028eda655231ec371d79d6d2a628f08d5aa38739340540b" "323661478a9ebde802bb7fe1a10b261c65d01bd0eca25a5004968c44745cb369" "ff02e8e37c9cfd192d6a0cb29054777f5254c17b1bf42023ba52b65e4307b76a" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (zenburn-theme yascroll yas-jit yaml-mode websocket web-mode tle tern-auto-complete swiper solarized-theme smex smart-mode-line scss-mode scala-mode2 sass-mode sane-term rvm rustfmt robe racer python-mode powershell powerline plsql plsense-direx php-mode perlcritic perl-completion pde nyan-mode nvm noflet multi-term monokai-theme markdown-mode magit-svn magit-filenotify leuven-theme js2-refactor jedi-direx ido-vertical-mode highlight-parentheses helm-robe helm-perldoc helm-gitlab helm-flycheck helm-css-scss helm-c-yasnippet helm-ag-r helm-ag helm-ack gratuitous-dark-theme gotham-theme go-mode go-autocomplete flymake-yaml flymake-shell flymake-sass flymake-ruby flymake-python-pyflakes flymake-php flymake-perlcritic flymake-json flymake-css flymake-coffee flycheck-rust exec-path-from-shell evil-leader evil-escape evil-easymotion erc-hl-nicks ensime elpy dockerfile-mode docker dired-narrow debian-changelog-mode csharp-mode common-lisp-snippets color-theme-monokai auto-yasnippet arduino-mode ace-jump-mode ac-js2 ac-helm)))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
 ;; Packages Loading

(add-to-list 'load-path "~/.emacs.d/lib/")

(load "~/.emacs.d/my-packages")
(load "~/.emacs.d/my-settings")
(load "~/.emacs.d/my-spanish")
(load "~/.emacs.d/my-debian")
;(load "~/.emacs.d/my-erc")
(load "~/.emacs.d/my-evil")
(load "~/.emacs.d/my-perl")
(load "~/.emacs.d/my-python")
;(load "~/.emacs.d/my-ruby")
(load "~/.emacs.d/my-go")
(load "~/.emacs.d/my-js")
(load "~/.emacs.d/my-web")
(load "~/.emacs.d/my-org")
(load "~/.emacs.d/my-markdown")
;(load "~/.emacs.d/my-gnus")
(if (file-exists-p "~/.private-emacs.d/init.el")
    (load "~/.private-emacs.d/init")
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
