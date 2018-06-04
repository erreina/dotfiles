(require 'req-package)

(req-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
  :bind(
        ("M-u" . undo-tree-undo)
        ("M-U" . undo-tree-redo)))

(provide 'init-undo-tree)
