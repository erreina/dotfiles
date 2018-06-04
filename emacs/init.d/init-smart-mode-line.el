(require 'req-package)

(req-package smart-mode-line-powerline-theme
  :ensure t)

(req-package smart-mode-line
  :ensure t
  :require smart-mode-line-powerline-theme
 :config
 (setq sml/no-confirm-load-theme t)
 (setq sml/theme 'smart-mode-line-powerline)
 (sml/setup))

(provide 'init-smart-mode-line)
