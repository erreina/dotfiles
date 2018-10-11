(require 'req-package)

(req-package auto-indent-mode
  :ensure t
  :diminish auto-indent-mode
  :config 
  (setq auto-indent-on-visit-file t)
  (setq auto-indent-indent-style 'conservative)
  (auto-indent-global-mode))

(req-package clean-aindent-mode
  :ensure t
  :require auto-indent-mode
  :config
  (clean-aindent-mode t))

(provide 'init-auto-indent-mode)
