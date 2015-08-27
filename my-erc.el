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

(defcustom pushover-token nil
  "pushover application token")

(defcustom pushover-user-key nil
  "pushover user-key")

(defun pushover-notify (title msg)
  (let ((url-request-method "POST")
	(url-request-data (concat "token=" pushover-token
				  "&user=" pushover-user-key
				  "&title=" title
				  "&message=" msg)))
    (url-retrieve "https://api.pushover.net/1/messages.json" 'http-kill-url-buffer)))

(defcustom pushalot-token nil
  "Pushalot authorization token"
  :type '(string))

(defun pushalot-notify (title msg)
  (let ((url-request-method "POST")
	(url-request-data (concat "AuthorizationToken=" pushalot-token
				  "&Title=" title
				  "&Body=" msg)))
        (url-retrieve "https://pushalot.com/api/sendmessage" 'http-switch-to-url-buffer)))

(defun http-kill-url-buffer (status)
  "Kill the buffer returned by `url-retrieve'.")

(defun http-switch-to-url-buffer (status)
        "Switch to the buffer returned by `url-retreive'.
    The buffer contains the raw HTTP response sent by the server."
	      (switch-to-buffer (current-buffer)))

;; Notify my when someone mentions my nick.
(defun erc-global-notify (matched-type nick msg)
  (interactive)
  (when (eq matched-type 'current-nick)
    (pushalot-notify (concat "ERC: " (buffer-name)) (concat "<" (car (split-string nick "!")) "> " message))
    (display-message-or-buffer (concat "ERC: " (buffer-name) ": <" (car (split-string nick "!")) "> " message) "ERC Notifications")
   ))
(add-hook 'erc-text-matched-hook 'erc-global-notify)

(add-to-list 'erc-mode-hook (lambda ()
  (set (make-local-variable 'scroll-conservatively) 1)))

;; END OF ERC
