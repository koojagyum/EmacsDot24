;; tab width
(setq-default tab-width 4
              c-basic-offset 4
              default-tab-width 4)  ;; indent use only 4 spaces
(setq-default indent-tabs-mode nil) ;; no tab

;; column limit 80
(setq fill-column 80)

;; display matching parentheses
(show-paren-mode t)

;; delete the selection with a keypress
(delete-selection-mode t)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; not creating backup file
(setq make-backup-files nil)

;; confirm kill emacs
(setq confirm-kill-emacs 'yes-or-no-p)

;; enable copying to clipboard (make a region is to copy...)
(setq x-select-enable-clibboard t)

;; set recent file mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; use shift + arrow keys to switch between visible buffers
(require 'windmove)
(windmove-default-keybindings)

;; Add line-number to the left of each line.
(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(global-set-key (kbd "<f5>") 'linum-mode)
(defvar my-linum-format-string "%4d ")
(add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)
(defun my-linum-get-format-string ()
  (let* ((width (length (number-to-string
                         (count-lines (point-min) (point-max)))))
         (format (concat "%" (number-to-string width) "d ")))
    (setq my-linum-format-string format)))
(setq linum-format 'my-linum-format)
(defun my-linum-format (line-number)
  (propertize (format my-linum-format-string line-number) 'face 'linum))

;; http://www.emacswiki.org/emacs/SearchAtPoint
;; http://platypope.org/blog/2007/8/5/a-compendium-of-awesomeness
;; I-search with initial contents
(defvar isearch-initial-string nil)
(defun isearch-set-initial-string ()
  (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
  (setq isearch-string isearch-initial-string)
  (isearch-search-and-update))
(defun isearch-forward-at-point (&optional regexp-p no-recursive-edit)
  "Interactive search forward for the symbol at point."
  (interactive "P\np")
  (if regexp-p (isearch-forward regexp-p no-recursive-edit)
    (let* ((end (progn (skip-syntax-forward "w_") (point)))
           (begin (progn (skip-syntax-backward "w_") (point))))
      (if (eq begin end)
          (isearch-forward regexp-p no-recursive-edit)
        (setq isearch-initial-string (buffer-substring begin end))
        (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
        (isearch-forward regexp-p no-recursive-edit)))))
(global-set-key (kbd "C-c C-j") 'isearch-forward-at-point)

;; key map for find related file
(global-set-key (kbd "C-c o") 'ff-find-other-file)

;; other window other-window backward keymap
(global-set-key (kbd "C-x p") '(lambda ()
                                 "Backwarding other-window"
                                 (interactive)
                                 (other-window -1)))

(provide 'koodev-editor)

;;; koodev-editor.el ends here
