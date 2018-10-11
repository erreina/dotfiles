(require 'req-package)

(req-package projectile
  :ensure t
  :config
  (projectile-global-mode 1))

(provide 'init-projectile)
