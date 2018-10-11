(require 'req-package)

(req-package yasnippet
  :diminish yas-minor-mode
  :ensure t
  :config
  (yas-reload-all)
  (yas-global-mode)
  (defun do-yas-expand ()
    (let ((yas/fallback-behavior 'return-nil))
      (yas/expand))))

(provide 'init-yasnippet)
