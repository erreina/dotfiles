(require 'req-package)

(req-package badger-theme
  :ensure t
  :config (load-theme 'badger t))

(provide 'init-theme)
