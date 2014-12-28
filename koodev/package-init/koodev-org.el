(and
 (require 'org nil t)
 (message "org initializing...")
 (require 'ox-confluence nil t))

(eval-after-load 'org
  '(progn
     ;; org-publish setting
     (defun koodev-org-preparation () ;; preparation-function
       "Function to be called before publishing this project."
       (bookmark-set "koodev_org_bookmark_before_publishing"))
     (defun koodev-org-completion () ;; completion-function
       "Function to be called after publishing this project."
       (bookmark-jump "koodev_org_bookmark_before_publishing")
       (bookmark-delete "koodev_org_bookmark_before_publishing"))
     (and (require 'ox-publish nil t)
          (and (boundp 'koodev-org-basedir) koodev-org-basedir)
          (and (boundp 'koodev-org-publishdir) koodev-org-publishdir)
          (setq org-publish-project-alist
                `(("koodev-org"
                   :base-directory ,koodev-org-basedir
                   :recursive t
                   :publishing-directory ,koodev-org-publishdir
                   :base-extension "org"
                   :publishing-function org-html-publish-to-html
                   :headline-levels 4
                   :html-extension "html"
                   :auto-sitemap t
                   :exclude "common.org"
                   :preparation-function koodev-org-preparation
                   :completion-function koodev-org-completion)
                  ("koodev-static"
                   :base-directory ,koodev-org-basedir
                   :recursive t
                   :publishing-directory ,koodev-org-publishdir
                   :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
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
