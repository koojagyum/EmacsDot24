(defun copy-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  ;; (open-line 1)
  ;; (next-line 1)
)

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)

;; tab width
(setq-default tab-width 4
              c-basic-offset 4
              sh-basic-offset 4
              default-tab-width 4)  ;; indent use only 2 spaces
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

;; hexl-mode for elf file format
(setq auto-mode-alist
      (append
       '(("\\.so\\'" . hexl-mode)
         ("\\.o\\'" . hexl-mode))
       auto-mode-alist))

;; elpy-mode for python
(elpy-enable)
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

;; Emacs IPython Notebook(ein) setup
(require 'ein)
(require 'ein-loaddefs)
(require 'ein-notebook)
(require 'ein-subpackages)

;; set recent file mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; use shift + arrow keys to switch between visible buffers
(require 'windmove)
(windmove-default-keybindings)

;; Add line-number to the left of each line.
(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
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


;; which-function-mode
;; http://www.emacswiki.org/emacs/WhichFuncMode
(which-function-mode 1)
(setq mode-line-format (delete (assoc 'which-func-mode
                                      mode-line-format) mode-line-format)
      which-func-header-line-format '(which-func-mode ("" which-func-format)))
(defadvice which-func-ff-hook (after header-line activate)
  (when which-func-mode
    (setq mode-line-format (delete (assoc 'which-func-mode
                                          mode-line-format) mode-line-format)
          header-line-format which-func-header-line-format)))
(eval-after-load 'which-func
  '(setq which-func-modes '(c-mode
                            c++-mode
                            java-mode
                            sh-mode)))

;; edit with root-privileges
(defun find-file-as-root ()
  "Like `find-file, but automatically edit the file with
root-privileges (using tramp/sudo), if the file is not writable by
useer."
  (interactive)
  (let ((file (read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (find-file file))
  )

;; -----------------------------------------------------------------------
;; Gyp mode (is really python-mode)
;; -----------------------------------------------------------------------
(define-derived-mode gyp-mode python-mode "Gyp"
  "Major mode for editing Generate Your Project files."
  (setq indent-tabs-mode nil
        tab-width 2
        python-indent 2))

(setq auto-mode-alist
      (append
       '(("\\.gyp\\'" . gyp-mode)
         ("\\.gypi\\'" . gyp-mode))
       auto-mode-alist))

;; start using ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'alway)
(ido-mode 1)

(provide 'koodev-editor)

;;; koodev-editor.el ends here
