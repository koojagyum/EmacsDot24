;; koodev-worklog

(require 'org-capture)

(defcustom koodev-worklog-path-ongoing "~/Workspace/Worklogs/Ongoing"
  "Default path for recording worklog"
  :type 'string
  :group 'koodev)

(defcustom koodev-worklog-default-template
  "#+SEQ_TODO: TODO(t) WAIT(w) | DONE(d) PEND(p) FAIL(f)
* Description
* Summary

#+BEGIN: clocktable :maxlevel 2
#+END:

* Worklog
* Milestones
* References
* Notes
* People
"
  "Default worklog template"
  :type 'string
  :group 'koodev)

(defun koodev-worklog-new (name)
  (interactive "sNew workitem name: ")
  (let ((worklog-dir
         (expand-file-name name koodev-worklog-path-ongoing)))
    (let ((worklog-file
           (expand-file-name "worklog.org" worklog-dir)))
      (mkdir worklog-dir)
      (write-region
       koodev-worklog-default-template nil worklog-file)
      (find-file worklog-file))))

;; Could that applied to directory variable?
(setq org-capture-templates
      '(("p" "Process" entry (file+headline buffer-file-name "Worklog")
         "** %^{Brief Description}")
        ("s" "Subprocess" entry
         (file+function buffer-file-name
                        (lambda ()
                          (org-goto-level 2)
                          (outline-get-next-sibling)
                          (org-open-line 1)
                          ))
         "*** %^{Subprocess Description}" :empty-lines 1)))

;; Hook for the bug of :clock-in property
(setq org-capture-after-finalize-hook (lambda ()
                                        (and (org-goto-level 2)
                                          (org-goto-last-child)
                                          (org-clock-in)
                                          )))


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
  "Going UPWARD"
  (interactive)
  (outline-back-to-heading)
  (if (= (org-current-level) level)
      (eval t)
    (if (< (org-current-level) level)
        (eval nil)
      (org-up-heading-safe)
      (org-goto-level level))))

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

(defun org-goto-last-sibling ()
  (interactive)
  (when (org-goto-sibling)
    (org-goto-last-sibling)))

(defun org-goto-last-child ()
  "Returns nil if there's not any child"
  (interactive)
  (when (org-goto-first-child)
    (org-goto-last-sibling)
    (eval t)))


(provide 'koodev-worklog)
