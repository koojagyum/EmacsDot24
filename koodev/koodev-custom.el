(defgroup koodev nil
  "Emacs koodev configuration"
  :prefix "koodev-"
  :group 'convenience)

(defcustom koodev-color-theme 'deeper-blue
  "The default color theme."
  :type 'symbol
  :group 'koodev)

(defcustom koodev-android-sdk-path nil
  "The Android SDK path for using android-mode.el."
  :type 'string
  :group 'koodev)

(provide 'koodev-custom)

;;; koodev-custom.el ends here
