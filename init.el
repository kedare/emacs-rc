;;
;; Mathieu Poussin
;; mathieu.poussin@netyxia.net
;;

;; Generated custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-indent-parens-as-block t)
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("f3d6a49e3f4491373028eda655231ec371d79d6d2a628f08d5aa38739340540b" "323661478a9ebde802bb7fe1a10b261c65d01bd0eca25a5004968c44745cb369" "ff02e8e37c9cfd192d6a0cb29054777f5254c17b1bf42023ba52b65e4307b76a" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
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
(load "~/.emacs.d/my-erc")
(load "~/.emacs.d/my-evil")
(load "~/.emacs.d/my-perl")
(load "~/.emacs.d/my-python")
(load "~/.emacs.d/my-ruby")
(load "~/.emacs.d/my-go")
(load "~/.emacs.d/my-js")
(load "~/.emacs.d/my-web")
(load "~/.emacs.d/my-org")
(load "~/.emacs.d/my-markdown")
(load "~/.emacs.d/my-gnus")
(if (file-exists-p "~/.private-emacs.d/init.el")
    (load "~/.private-emacs.d/init")
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
