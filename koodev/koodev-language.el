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

;; for Macbook pro, typing f9 needs a lot to care
(define-key hangul-im-keymap [f8] 'hangul-to-hanja-conversion)

(require 'unicad)

(provide 'koodev-language)

;;; koodev-language.el ends here
