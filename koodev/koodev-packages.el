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
    htmlize
    magit
    ox-reveal
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

;; [FIXME] temporary for uptodate org-mode.
(unless (package-installed-p 'org '(20141110))
  (package-install 'org))

;; package initialization
(defvar package-init-dir
  (expand-file-name "package-init" (file-name-directory load-file-name))
  "Directory for package initialization.")
(when (file-exists-p package-init-dir)
  (message "Package initialization in %s..." package-init-dir)
  (mapc 'load (directory-files package-init-dir 't "^[^#].*el$")))

(provide 'koodev-packages)

;; Local Variables:
;; byte-compile-warnings: (not cl-functions)
;; End:

;;; koodev-packages.el ends here
