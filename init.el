(message "Loading koodev's emacs initialization...")

(add-to-list 'load-path "~/.emacs.d/koodev")
(add-to-list 'load-path "~/.emacs.d/local")

(mapc 'require '(koodev-packages
                 koodev-ui
                 koodev-editor
                 koodev-env
                 koodev-language))
