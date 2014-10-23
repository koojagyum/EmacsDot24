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
           (expand-file-name "platforms/android-19/android.jar" koodev-android-sdk-path)))))))

;;; koodev-android.el ends here.
