;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Korean language environment
;; (set-language-environment 'korean)
(set-language-environment 'utf-8)
(setq default-input-method "korean-hangul")
(when (window-system)
  (progn
    (set-face-attribute 'default nil :height 120)
    (set-fontset-font "fontset-default" '(#x1100 . #xffdc)
                      '("NanumGothicCoding" . "iso10646-1"))
    (set-fontset-font "fontset-default" '(#xe0bc . #xf66e)
                      '("NanumGothicCoding" . "iso10646-1"))))

(provide 'koodev-language)

;;; koodev-language.el ends here
