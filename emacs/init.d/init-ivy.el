(require 'req-package)

(req-package ivy
  :ensure t
  :diminish ivy-mode
  :require avy
  :config
  ;; (setq ivy-use-virtual-buffers t)
  ;; (setq ivy-extra-directories nil)
  ;; (ivy-mode 1)
  (global-set-key (kbd "M-r")   'ivy-resume)
  (define-key ivy-minibuffer-map (kbd "M-i") 'ivy-previous-line)
  (define-key ivy-minibuffer-map (kbd "M-k") 'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "M-I") 'ivy-scroll-down-command)
  (define-key ivy-minibuffer-map (kbd "M-K") 'ivy-scroll-up-command)
  (define-key ivy-minibuffer-map (kbd "M-;") 'ivy-avy)
  (define-key ivy-minibuffer-map (kbd "M-j") nil)
  (define-key ivy-minibuffer-map (kbd "M-o") nil)
  )

(provide 'init-ivy)
