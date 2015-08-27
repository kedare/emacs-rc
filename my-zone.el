 (require 'zone)
(zone-when-idle 120)
(setq zone-timer (run-with-idle-timer 120 t 'zone))


(defun zone-choose (pgm)
  "Choose a PGM to run for `zone'."
  (interactive
   (list
    (completing-read
     "Program: "
     (mapcar 'symbol-name zone-programs))))
  (let ((zone-programs (list (intern pgm))))
    (zone)))

