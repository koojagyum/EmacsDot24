(require 'koodev-editor)
(require 'koodev-ui)

;; Single stroke
(global-set-key (kbd "<f5>") 'linum-mode)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Ctrl-x stroke
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x p") '(lambda ()
                                 "Backwarding other-window"
                                 (interactive)
                                 (other-window -1)))
(global-set-key (kbd "C-x F") 'find-file-as-root)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-x |") 'toggle-window-split)

;; Ctrl-c stroke
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c o") 'ff-find-other-file)
(global-set-key (kbd "C-c C-j") 'isearch-forward-at-point)
(global-set-key (kbd "C-c C-p") 'copy-file-name-to-clipboard)

;; Ctrl-etc stroke
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Meta stroke
;; Scroll without moving cursor position
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

(provide 'koodev-global-keybindings)
