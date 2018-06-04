(require 'req-package)

(req-package avy
  :ensure t
  :config
  (global-set-key (kbd "M-;") 'avy-goto-char-2))

(provide 'init-avy)
