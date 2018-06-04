(require 'req-package)

(req-package ido
  :config
  (ido-everywhere t)
  (ido-mode t)
  (setq ido-enable-flex-matching t)
    
  (defun bind-ido-keys ()
    "Keybindings for ido mode."
    "Work around since the bind command does not do this correctly"
    (define-key ido-completion-map (kbd "M-k")    'ido-next-match) 
    (define-key ido-completion-map (kbd "M-i")    'ido-prev-match)
    (define-key ido-completion-map (kbd "<down>") 'ido-next-match) 
    (define-key ido-completion-map (kbd "<up>")   'ido-prev-match)
    (define-key ido-completion-map (kbd "M-l")    'forward-char)
    (define-key ido-completion-map (kbd "M-j")    'backward-char)
    (define-key ido-completion-map (kbd "M-L")    'forward-word) 
    (define-key ido-completion-map (kbd "M-J")    'backward-word)
    (define-key ido-completion-map [tab]          'ido-complete)
    (define-key ido-completion-map [M-return]     'ido-select-text)
    (define-key ido-completion-map (kbd "M-d")    'backward-delete-char)
    (define-key ido-completion-map (kbd "M-f")    'delete-char)
    )
    
  (add-hook 'ido-setup-hook #'bind-ido-keys))

(req-package flx-ido
  :require ido
  :ensure t
  :config
  (flx-ido-mode 1)
  (setq flx-ido-use-faces nil))

(req-package ido-vertical-mode
  :require ido
  :ensure t
  :config
  (ido-vertical-mode))

(provide 'init-ido)

