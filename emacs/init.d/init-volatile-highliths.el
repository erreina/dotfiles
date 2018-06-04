(require 'req-package)

(req-package volatile-highlights
  :ensure t
  :diminish volatile-highlights-mode
  :require undo-tree
  :config
  (vhl/define-extension 'undo-tree 'undo-tree-yank 'undo-tree-move)
  (vhl/install-extension 'undo-tree)
  (volatile-highlights-mode t))

(provide 'volatile-highlights)
