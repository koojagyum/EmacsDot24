;; no splash
(setq inhibit-startup-message t)

;; disable tool bar & menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; disable blinking cursor
(blink-cursor-mode -1)

;; scroll adjustment
(setq scroll-margin 0
      scroll-conservatively 100000)
(setq scroll-preserve-screen-position nil)

;; scroll without updating cursor position
(global-set-key (kbd "M-p")
      '(lambda ()
         "Scroll down without updating cursor position."
         (interactive)
         (progn
           (previous-line)
           (scroll-down 1))))
(global-set-key (kbd "M-n")
      '(lambda ()
         "Scroll up without updating cursor position."
         (interactive)
         (progn
           (next-line)
           (scroll-up 1))))

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

(when mswindows-p
  (progn
    ;; font
    (add-to-list 'default-frame-alist '(font . "Consolas-11"))
    ;; frame window size
    (add-to-list 'default-frame-alist '(height . 32))
    (add-to-list 'default-frame-alist '(width . 80))))

(when macosx-p
  (if window-system
      (custom-set-faces '(default ((t (:height 150 :family "Menlo")))))))


(provide 'koodev-ui)

;;; koodev-ui.el ends here
