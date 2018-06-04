(require 'req-package)

(req-package saveplace
  :ensure t
  :config
  (setq save-place-file (concat dot-emacs-dir ".saveplace.el"))
  (setq-default save-place t)
  (save-place-mode 1))

(provide 'init-saveplace)
