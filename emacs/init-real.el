(require 'package)

(require 'server)
(unless (server-running-p)
  (server-start))

;; Save all tempfiles in $TMPDIR/emacs$UID/
(defconst emacs-tmp-dir
  (format "%s%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)

(prefer-coding-system 'utf-8)
(when (display-graphic-p)
    (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))
(winner-mode 1)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t) ; hide startup screen
(setq initial-scratch-message nil) ; cleaning the scratch buffer
(setq frame-title-format "%b") ; set window title to the buffer name.
(setq window-min-height 3) ; let's not have too-tiny windows.
(line-number-mode t) ; show the line number
(column-number-mode t) ; show the column number
(tool-bar-mode -1) ; hide the tool bar
(menu-bar-mode -1) ; hide the menu bar
(scroll-bar-mode -1) ; hide scroll bar
(global-font-lock-mode t) ; syntax highlight.
(setq font-lock-maximum-decoration t) ; maximum syntax highlight.
(setq pc-selection-mode t) ; conventional mouse/arrow movement and selection.
(delete-selection-mode t) ; deletes the region if text is entered.
(put 'overwrite-mode 'disabled t) ; disable over-write mode.
(setq x-select-enable-clipboard t) ; after copy Ctrl+c in Linux X11, you can paste by `yank' in Emacs
(setq x-select-enable-primary t) ; after mouse selection in X11, you can paste by `yank' in Emacs
(load "accel" t t) ; accelerate the cursor when scrolling.
(setq scroll-margin 2) ; start scrolling when 2 lines from top/bottom.
(setq scroll-preserve-screen-position t) ; keeps the cursor in the same relative row during pgups and pgdowns.
(fset 'yes-or-no-p 'y-or-n-p) ; never type 'yes' when 'y' will suffice.
(setq sentence-end-double-space nil) ; sentences ends with single space.
(setq set-mark-command-repeat-pop t)
(setq message-log-max t)



(setq custom-file (concat dot-emacs-dir ".emacs-custom.el"))
(load custom-file 'noerror)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)

(use-package diminish)
(use-package bind-key)
(use-package req-package
  :config
  (req-package--log-set-level 'debug))


(defconst my-elisp-dir (concat dot-emacs-dir "elisp/"))
(add-to-list 'load-path my-elisp-dir)
(byte-recompile-directory (expand-file-name my-elisp-dir) 0)

(defconst my-init-dir (concat dot-emacs-dir "init.d/"))
(add-to-list 'load-path my-init-dir)
(byte-recompile-directory (expand-file-name my-init-dir) 0)

(req-package load-dir
  :force true
  :init
  (setq force-load-messages nil)
  (setq load-dir-debug nil)
  (setq load-dir-recursive t)
  :config
  (load-dir-one my-init-dir)
  (req-package-finish))

(provide 'init-real)
