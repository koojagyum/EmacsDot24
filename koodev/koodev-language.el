;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Korean language environment
(if mswindows-p
    (set-language-environment 'korean)
  (set-language-environment 'utf-8))
(setq default-input-method "korean-hangul")

(require 'unicad)
(require 'hangul)

(provide 'koodev-language)

;;; koodev-language.el ends here
