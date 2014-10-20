(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defvar koodev-packages
  '(android-mode
    color-theme
    color-theme-solarized
    ggtags
    magit
    tango-2-theme
    zenburn-theme)
  "A list of packages to ensure are installed at lunch."
)

(defun koodev-packages-installed-p ()
  "Check if all packages in `koodev-packages' are installed."
  (every #'package-installed-p koodev-packages))

(defun koodev-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package koodev-packages)
    (add-to-list 'koodev-packages pakcages))
  (unless (package-installed-p package)
    (package-install package)))

(defun koodev-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'koodev-require-package packages))

(defun koodev-install-packages ()
  "Install all packages listed in `koodev-packages'."
  (unless (koodev-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Refreshing its package database...")
    (package-refresh-contents)
    ;; install the missing packages
    (koodev-require-packages koodev-packages)))

;; run package installation
(koodev-install-packages)

;; package initialization
(let ((base-dir "~/.emacs.d/koodev/package-init")
      (packages '(android
                  gtags
                  magit
                  org)))
  (while packages
    (let ((init-file-path (format "%s/koodev-%s.el" base-dir (car packages))))
      (and init-file-path
           (file-exists-p init-file-path)
           (load-file init-file-path))
      )
    (setq packages (cdr packages))
    ))

(provide 'koodev-packages)

;; Local Variables:
;; byte-compile-warnings: (not cl-functions)
;; End:

;;; koodev-packages.el ends here
