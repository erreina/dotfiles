(require 'req-package)

(req-package expand-region
  :ensure t
  :defer t
  :bind ("M-=" . er/expand-region))

(provide 'init-expand-region)
