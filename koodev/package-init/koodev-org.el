(and
 (require 'org nil t)
 (message "org initializing...")
 (require 'ox-confluence nil t))

(eval-after-load 'org
  '(progn
     ;; Babel-plantuml setting
     (setq org-plantuml-jar-path
           (expand-file-name "~/.emacs.d/jar/plantuml.jar"))

     ;; active Babel languages
     (org-babel-do-load-languages
      'org-babel-load-languages
      '((C . t)
        (emacs-lisp . t)
        (plantuml . t)
        (sh . t)
        ))

     ;; to display inline image
     (add-hook
      'org-babel-after-execute-hook
      (lambda ()
        (condition-case nil
            (org-display-inline-images)
          (error nil))) t)))

;;; koodev-org.el ends here.
