(and
 (require 'gtags nil t)
 (message "gtags initializing...")
 (autoload 'gtags-mode "gtags"
   "Minor mode for browsing source code using GLOBAL" t))

(eval-after-load 'gtags
  '(progn
     (global-set-key (kbd "C-c C-f") 'gtags-find-file)
     (global-set-key (kbd "M-,") 'gtags-find-tag-other-window)
     (global-set-key (kbd "M-.") 'gtags-find-tag)
     (global-set-key (kbd "C-c r") 'gtags-find-rtag)
     (global-set-key (kbd "C-c g") 'gtags-find-with-grep)
     (global-set-key (kbd "C-c t") 'gtags-pop-stack)

     (define-key gtags-select-mode-map (kbd "RET")
       'gtags-select-tag)
     (define-key gtags-select-mode-map (kbd "C-o")
       'gtags-select-tag-other-window)

     (add-hook 'gtags-select-mode-hook
               '(lambda ()
                  (setq hl-line-face 'underline)
                  (hl-line-mode 1)))))

;;; koodev-gtags.el ends here.
