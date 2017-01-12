(and
 (require 'ggtags nil t)
 (message "ggtags initializing...")
 (autoload 'ggtags-mode "ggtags"
   "Minor mode for browsing source code using GLOBAL" t))

(eval-after-load 'ggtags
  '(progn
     (if mswindows-p
         (setq exec-path
               (append '("C:/Utility/global-6.5.3-wb/bin" 
                         "C:/Utility/ctags58") exec-path)))

     (add-hook 'c-mode-common-hook
               (lambda ()
                 (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                   (ggtags-mode 1))))

     

     ;; (global-set-key (kbd "C-c C-f") 'gtags-find-file)
     ;; (global-set-key (kbd "M-,") 'gtags-find-tag-other-window)
     ;; (global-set-key (kbd "M-.") 'gtags-find-tag)
     ;; (global-set-key (kbd "C-c r") 'gtags-find-rtag)
     ;; (global-set-key (kbd "C-c g") 'gtags-find-with-grep)
     ;; (global-set-key (kbd "C-c t") 'gtags-pop-stack)

     ;; (define-key gtags-select-mode-map (kbd "RET")
     ;;   'gtags-select-tag)
     ;; (define-key gtags-select-mode-map (kbd "C-o")
     ;;   'gtags-select-tag-other-window)

     ;; (add-hook 'gtags-select-mode-hook
     ;;           '(lambda ()
     ;;              (setq hl-line-face 'underline)
     ;;              (hl-line-mode 1)))
     ))

;;; koodev-gtags.el ends here.
