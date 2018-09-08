(and
 (require 'ggtags nil t)
 (message "ggtags initializing...")
 (autoload 'ggtags-mode "ggtags"
   "Minor mode for browsing source code using GLOBAL" t))

(eval-after-load 'ggtags
  '(progn
     (add-hook 'c-mode-common-hook
               (lambda ()
                 (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'objc-mode)
                   (ggtags-mode 1))))
     (add-hook 'python-mode-hook (lambda () (ggtags-mode 1)))

     ;; Set GTAGS variables
     ;; (setenv "GTAGSCONF" (concat (expand-file-name "~") "/.globalrc"))
     (setenv "GTAGSCONF" "/usr/local/share/gtags/gtags.conf")
     (setenv "GTAGSLABEL" "pygments")

     (define-key ggtags-mode-map (kbd "C-c C-f") 'ggtags-find-file)
     (define-key ggtags-mode-map (kbd "C-c g") 'ggtags-grep)

     (add-hook 'ggtags-find-tag-hook 'recenter)
     ))

(provide 'koodev-ggtags)
