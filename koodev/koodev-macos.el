;; Emacs default startup directory for macos
(when window-system
  (setq default-directory "~/")

  ;; About PATH env
  (setq exec-path
        (append
         '("/usr/local/bin") exec-path))
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

  ;; Font setting
  (custom-set-faces '(default ((t (:height 150 :family "Menlo"))))))

(provide 'koodev-macos)