;; koodev-worklog

(require 'org-capture)

(defcustom koodev-worklog-worklog-path "~/Workspace/test/worklog"
  "Default path for recording worklog"
  :type 'string
  :group 'koodev)

(defcustom koodev-worklog-default-template
  "#+SEQ_TODO: TODO(t) WAIT(w) | DONE(d) PEND(p) FAIL(f)
* Description
* Summary
* Worklog
* Milestones
* References
* Notes
* People

# Local Variables:
# End:
"
  "Default worklog template"
  :type 'string
  :group 'koodev)

(defun koodev-worklog-new (name)
  (interactive "sNew workitem name: ")
  (mkdir (expand-file-name name koodev-worklog-worklog-path))
  (write-region
   koodev-worklog-default-template nil
   (expand-file-name
    "worklog.org"
    (expand-file-name name koodev-worklog-worklog-path))))

;; Could that applied to directory variable?
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline buffer-file-name "Worklog")
         "** TODO %^{Brief Description}")
        ("s" "Subprocess" entry
         ;; (file+function buffer-file-name (lambda () (end-of-line)))
         ;; (file+function buffer-file-name (lambda () (beginning-of-line)))
         (file+function buffer-file-name
                        (lambda ()
                          (progn
                            (org-goto-level 2)
                            (outline-get-next-sibling)
                            (org-open-line 1))))
         "*** %^{Subprocess Description} %U")))

(defun org-do-promote-top-level ()
  (interactive)
  (unless (<= (org-current-level) 1)
    (org-do-promote)
    (org-do-promote-top-level)))

(defun org-do-demote-until (level)
  (unless (= (org-current-level) level)
    (org-do-demote)
    (org-do-demote-until level)))

(defun org-do-fix-level (level)
  (interactive)
  (org-do-promote-top-level)
  (org-do-demote-until level))

(defun org-goto-level (level)
  (interactive)
  (outline-back-to-heading)
  (unless (= (org-current-level) level)
    (org-up-heading-safe)
    (org-goto-level level)))

(defun org-level-text (level)
  (interactive)
  (save-excursion
    (end-of-line)
    (org-goto-level level)
    (nth 4 (org-heading-components))))

(defun org-goto-matched-heading-parent (text)
  (interactive)
  (unless (= (org-current-level) 1)
    (or (string= text (nth 4 (org-heading-components)))
        (org-up-heading-safe)
        (org-goto-matched-heading-parent text))))

(defun org-outline-is-child-of (text)
  (interactive)
  (if (= (org-current-level) 1)
      (and (string= text (nth 4 (org-heading-components)))
           (t))
    (org-up-heading-safe)
    (org-outline-is-child-of text)))

    
(define-key global-map "\C-cc" 'org-capture)

(provide 'koodev-worklog)
