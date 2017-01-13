(and
 (require 'magit nil t)
 (message "magit initializing..."))

(eval-after-load 'magit
     (when (not window-system)
       (set-face-background 'magit-item-highlight "block")))

(provide 'koodev-magit)
