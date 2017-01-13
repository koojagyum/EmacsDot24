;; no splash
(setq inhibit-startup-message t)

;; to hide all the extraneous crap
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; disable blinking cursor
(blink-cursor-mode -1)

;; scroll adjustment
(setq scroll-margin 0
      scroll-conservatively 100000)
(setq scroll-preserve-screen-position nil)

;; display for modeline
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(display-time)

;; hide gutter
(fringe-mode 0)

;; window title format
(setq frame-title-format
      '("" invocation-name ": " (:eval (if (buffer-file-name)
                                           (abbreviate-file-name (buffer-file-name))
                                         "%b"))))

;; color-theme
(load-theme koodev-color-theme t)

;; copy path to clipboard
;; http://stackoverflow.com/questions/2416655/file-path-to-clipboard-in-emacs
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipbard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(provide 'koodev-ui)

;;; koodev-ui.el ends here
