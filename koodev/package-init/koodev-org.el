(and
 (require 'org nil t)
 (message "org initializing...")
 (require 'ox-confluence nil t))

(eval-after-load 'org
  '(progn
     ;; org-publish setting
     (and (require 'ox-publish nil t)
          (setq org-publish-project-alist
                ;; [FIXME] shuld be replaced with cutomized variables
                '(("koodev-org"
                   :base-directory "~/Workspace/private/document/org/org-article"
                   :base-extension "org"
                   :publishing-directory "~/Workspace/private/document/org/org-publish"
                   :recursive t
                   :publishing-function org-html-publish-to-html
                   :headline-levels 4
                   :html-extension "html"
                   :auto-sitemap t
                   :exclude "common.org")
                  ("koodev-static"
                   :base-directory "~/Workspace/private/document/org/org-article"
                   :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
                   :publishing-directory "~/Workspace/private/document/org/org-publish"
                   :recursive t
                   :publishing-function org-publish-attachment)
                  ("koodev" :components ("koodev-org" "koodev-static")))))

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

     ;; syntax highlight on code
     (setq org-src-fontify-natively t)

     ;; to display inline image
     (add-hook
      'org-babel-after-execute-hook
      (lambda ()
        (condition-case nil
            (org-display-inline-images)
          (error nil))) t)

     ;; temporary for terminal miss translation for 'M-RET'
     (define-key org-mode-map "\C-\M-j" 'org-insert-heading)))

;;; koodev-org.el ends here.
