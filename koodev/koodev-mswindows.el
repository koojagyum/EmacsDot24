;; Language
(set-language-environment 'korean)
(set-language-environment 'utf-8)

;; Font
(add-to-list 'default-frame-alist '(font . "Consolas-11"))
;; Frame window size
(add-to-list 'default-frame-alist '(height . 32))
(add-to-list 'default-frame-alist '(width . 80))

;; FIXME - which is not a global setting
;; Path for tags utility
(setq exec-path
      (append '("C:/Utility/global-6.5.3-wb/bin" 
                "C:/Utility/ctags58") exec-path))

(provide 'koodev-mswindows)
