(require 'rvm)
(rvm-use-default)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
    (rvm-activate-corresponding-ruby))

(add-hook 'robe-mode-hook 'ac-robe-setup)
