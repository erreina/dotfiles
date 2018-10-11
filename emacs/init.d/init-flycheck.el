(require 'req-package)

(req-package flycheck
  :ensure t
  :config
  (setq flycheck-indication-mode 'right-fringe)
  (setq flycheck-highlighting-mode 'lines)
  (add-hook 'prog-mode-hook 'flycheck-mode)
  )

(req-package flycheck-tip
  :ensure t
  :require flycheck
  :config
  (flycheck-tip-use-timer 'verbose))

(provide 'init-flycheck)
