(defvar emacsdot-dir (file-name-directory load-file-name)
  "The root dir(.emacs.d) of the Emacs configuration.")
(defvar koodev-dir (expand-file-name "koodev" emacsdot-dir)
  "The home of koodev's configuration codes.")
(defvar local-dir (expand-file-name "local" emacsdot-dir)
  "This dir contains local library.")
(defvar custom-dir (expand-file-name "custom" emacsdot-dir)
  "This dir is for your personal customization.")

(add-to-list 'load-path koodev-dir)
(add-to-list 'load-path local-dir)

;; config changes make through the cusomize UI will be store here
(setq custom-file (expand-file-name "custom.el" custom-dir))

;; load the personal settings (this includes `custom-file')
(when (file-exists-p custom-dir)
  (message "Loading personal configuration files in %s ..." custom-dir)
  (mapc 'load (directory-files custom-dir 't "^[^#].*el$")))

(message "Loading koodev's emacs initialization...")

(mapc 'require '(koodev-custom ;; Needs to be loaded at first
                 koodev-env ;; Needs to be loaded at first
                 koodev-packages
                 koodev-ui
                 koodev-editor
                 koodev-language
                 koodev-worklog))
