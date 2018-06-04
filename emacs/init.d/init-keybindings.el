(require 'erreina-fns)
(require 'xah-buffers)

(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-L") 'forward-word)

(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-J") 'backward-word)

(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-I") (lambda ()
			 (interactive)
			 (condition-case nil (scroll-down)
			   (beginning-of-buffer (goto-char (point-min))))))

(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-K") (lambda ()
			 (interactive)
			 (condition-case nil (scroll-up)
			   (end-of-buffer (goto-char (point-max))))))

(global-set-key (kbd "M-h") 'move-beginning-of-line)
(global-set-key (kbd "M-H") 'end-of-line)

(global-set-key (kbd "M-d") 'backward-delete-char)
(global-set-key (kbd "M-D") 'backward-kill-word)

(global-set-key (kbd "M-f") 'delete-char)
(global-set-key (kbd "M-F") 'kill-word)

(global-set-key (kbd "M-g") 'kill-line)
(global-set-key (kbd "M-G") 'backward-kill-line)

(global-set-key (kbd "M-p") 'pop-to-mark-command)

(global-set-key (kbd "M-q") 'keyboard-escape-quit)

(global-set-key (kbd "M-SPC") 'set-mark-command)

(global-set-key [M-return] 'open-next-line)
(global-set-key [S-return] 'open-previous-line)

(global-set-key (kbd "M-[") 'xah-next-user-buffer)
(global-set-key (kbd "M-]") 'xah-previous-user-buffer)

(require 'maximize-wm)
(global-set-key [f11] 'maximize-wm)

(req-package hydra
  :ensure t
  :require windmove winner
  :config
  (winner-mode 1) ; even when require it was not activated
  (require 'hydra-move-splitter)

  ;;TODO: define hydra commands for transpose frame
  (defhydra hydra-window ()
   "
Movement^^        ^Split^         ^Switch^      ^Resize^
----------------------------------------------------------------
_j_ ←          _v_ertical       _b_uffer         _J_ X←
_k_ ↓          _h_ horizontal   _f_ind files     _K_ X↓
_i_ ↑          _u_ undo         _a_ce 1          _I_ X↑
_k_ →          _r_ reset        _s_ave           _L_ X→
_SPC_ cancel   _D_lt Other      _S_wap           _m_aximize
^ ^            _o_nly this      _d_elete
"
   ("j" windmove-left )
   ("k" windmove-down )
   ("i" windmove-up )
   ("l" windmove-right )
   ("J" hydra-move-splitter-left)
   ("K" hydra-move-splitter-down)
   ("I" hydra-move-splitter-up)
   ("L" hydra-move-splitter-right)
   ("b" ido-switch-buffer :color blue)
   ("B" ido-switch-buffer)
   ;;   ("b" ivy-switch-buffer :color blue)
   ;;   ("B" ivy-switch-buffer)
   ("f" ido-find-file :color blue)
   ("F" ido-find-file)
   ;;   ("f" counsel-find-file :color blue)
   ;;   ("F" counsel-find-file)
   ("a" (lambda ()
          (interactive)
          (ace-window 1)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body))
    )
   ("h" (lambda ()
          (interactive)
          (split-window-right)
          (windmove-right))
    )
   ("v" (lambda ()
          (interactive)
          (split-window-below)
          (windmove-down))
    )
   ("S" (lambda ()
          (interactive)
          (ace-window 4)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body)))
   ("s" save-buffer :color blue)
   ("d" delete-window :color blue)
   ("D" (lambda ()
          (interactive)
          (ace-window 16)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body))
    )
   ("o" delete-other-windows :color blue)
   ("O" delete-other-windows)
   ("m" ace-maximize-window :color blue)
   ("M" ace-maximize-window)
   ("u" (progn
          (winner-undo)
          (setq this-command 'winner-undo))
    )
   ("r" winner-redo)
   ("SPC" nil)
   )

  (global-set-key (kbd "M-m") 'hydra-window/body))

(provide 'init-keybindings)

	     
