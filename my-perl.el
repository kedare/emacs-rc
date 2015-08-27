;; PERL

(defalias 'perl-mode 'cperl-mode)
(require 'plsense)
(plsense-config-default)
(setq cperl-indent-level 2)
(custom-set-variables
      '(cperl-indent-parens-as-block t))
;; END OF PERL
