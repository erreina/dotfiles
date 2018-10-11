(require 'req-package)

(req-package company
  :diminish company-mode
  :ensure t
  :require yasnippet
  :config
  (setq company-idle-delay 0.1)
  (setq company-show-numbers t)
  (setq company-minimum-refix-length 1)
  (global-company-mode 1)
  (defun check-expansion ()
    (save-excursion
      (if (looking-at "\\_>") t
	(backward-char 1)
	(if (looking-at "\\.") t
	  (backward-char 1)
	  (if (looking-at "->") t nil)))))
  (defun tab-indent-or-complete ()
    (interactive)
    (if (minibufferp)
   	(minibuffer-complete)
      (if (or (not yas/minor-mode)
   	      (null (do-yas-expand)))
   	  (if (check-expansion)
   	      (company-complete-common)
   	    (indent-for-tab-command))))
    )
  (global-set-key [tab] 'tab-indent-or-complete))

(req-package company-quickhelp
  :ensure t
  :require company
  :config
  (setq company-quickhelp-mode-map nil)
    (company-quickhelp-mode 1))

(provide 'init-company)
