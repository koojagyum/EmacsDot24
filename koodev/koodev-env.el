;; Set up OS-vars to enable os-specific tweaking of emacs, eg.
;;   (if macosx-p
;;       (progn ...))
(defvar mswindows-p (string-match "windows" (symbol-name system-type)))
(defvar macosx-p (string-match "darwin" (symbol-name system-type)))
(defvar linux-p (string-match "linux" (symbol-name system-type)))

;; emacs default startup directory(for mac os x)
(if macosx-p
    (if window-system
        (progn
          (setq default-directory "~/")
          )))

(provide 'koodev-env)

;;; koodev-env.el ends here
