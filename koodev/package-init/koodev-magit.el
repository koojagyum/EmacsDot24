(and
 (require 'magit nil t)
 (message "magit initializing..."))

(eval-after-load 'magit
  '(progn
     (global-set-key (kbd "C-x g") 'magit-status)

     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "block"))))

;;; koodev-magit.el ends here.
