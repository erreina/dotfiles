(require 'req-package)

(req-package savehist
  :ensure t
  :config 
  (setq savehist-file (concat dot-emacs-dir ".savehist"))
  (savehist-mode 1)
  (setq history-length t)
  (setq history-delete-duplicates t)
  (setq savehist-save-minibuffer-history 1)
  (setq savehist-additional-variables
	'(kill-ring
	  search-ring
	  regexp-search-ring)))

(provide 'init-savehist)
