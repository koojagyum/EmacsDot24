(when (and koodev-android-sdk-path
           (file-exists-p koodev-android-sdk-path))
  (require 'android-mode)
  (eval-after-load 'android-mode
    '(progn
       (setq android-mode-sdk-dir koodev-android-sdk-path)
       (add-hook
        'gud-mode-hook
        (lambda ()
          (add-to-list 
           'gud-jdb-classpass
           (expand-file-name "platforms/android-19/android.jar" koodev-android-sdk-path))))

       (define-key android-logcat-map (kbd "F")
         (lambda (simple-filter)
           "Set the simple filter of `android-logcat-buffer' to
REGEXP-FILTER surrounded by a pair of \".*\"s."
           (interactive "MSimple Filter: ")
           (android-logcat-set-filter
            (concat ".*" simple-filter ".*")))))))

;;; koodev-android.el ends here.
