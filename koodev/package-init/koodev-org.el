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
        ))))

;;; koodev-org.el ends here.
