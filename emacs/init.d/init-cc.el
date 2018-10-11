(require 'req-package)

(req-package lsp-mode
  :ensure t)

;; initialize cquery
(setq cquery-executable (locate-file "cquery" exec-path))
(req-package cquery
  :if cquery-executable
  :require lsp-mode
  :config
  (setq cquery-sem-highlight-method 'font-lock)
  (cquery-use-default-rainbow-sem-highlight)
  (add-hook 'c-mode-hook #'lsp-cquery-enable)
  (add-hook 'c+-mode-hook #'lsp-cquery-enable)
  (setq cquery-extra-init-params
	'(
	  :index (:comments 2)
;;	  :cacheDirectory "/var/cache/cquery"
	  :cacheFormat "msgpack"
	  :completion (:detailedLabel t)
	  :xref (:container t)))
  (defun cquery//enable ()
  	(condition-case nil
      	(lsp-cquery-enable)
    	(user-error nil)))
  (add-hook 'c-mode-common-hook #'cquery//enable))

(req-package ivy-xref
  :ensure t
  :require ivy
  :config
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(req-package lsp-ui
  :ensure t
  :require lsp-mode
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (setq lsp-ui-sideline-delay 2)
  (lsp-ui-peek-find-custom 'base "$cquery/base")
  (lsp-ui-peek-find-custom 'derived "$cquery/derived")
  (lsp-ui-peek-find-custom 'callers "$cquery/callers")
  (lsp-ui-peek-find-custom 'vars "$cquery/vars")
  (define-key lsp-ui-peek-mode-map (kbd "M-i") 'lsp-ui-peek--select-prev)
  (define-key lsp-ui-peek-mode-map (kbd "M-k") 'lsp-ui-peek--select-next)
  (define-key lsp-ui-peek-mode-map (kbd "M-j") 'lsp-ui-peek--select-prev-file)
  (define-key lsp-ui-peek-mode-map (kbd "M-l") 'lsp-ui-peek--select-next-file)
  (define-key lsp-ui-peek-mode-map (kbd "M-g") 'lsp-ui-peek--abort)
  (message lsp-ui-peek-mode-map))

(provide 'init-cc)
