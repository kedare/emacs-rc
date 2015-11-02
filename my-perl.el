;; PERL

(defalias 'perl-mode 'cperl-mode)
(require 'plsense)

(setq plsense-popup-help-key "C-:")
(setq plsense-display-help-buffer-key "M-:")
(setq plsense-jump-to-definition-key "C->")

(plsense-config-default)
(setq cperl-indent-level 2)
(custom-set-variables
      '(cperl-indent-parens-as-block t))
;; END OF PERL
