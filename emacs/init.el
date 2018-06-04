;;; init.el --- erreina's Emacs configuration
;; -*- Mode: Emacs-Lisp -*-
;; -*- no-byte-compile: t -*-
;;
;; Filename: init.el
;; Description: erreina's Emacs configuration
;; Author: Ernesto Rodriguez Reina
;; URL: www.github.com/erreina/.emacs.d
;; Keywords: Emacs 25
;; Compatibility: Emacs >= 25
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This file contains the initial setup for Ernesto Rodriguez Reina (erreina)'s Emacs.
;; The initializacion of package.el, load of use-package and auto-compile is done
;; here.  The rest of the settings are in the file erreina-settings.el so it can be
;; byte-compiled and with that speed-up the startup of Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(setq gc-cons-threshold 100000000)
(defconst home-dir (getenv "HOME")  "The home directory.  It is OS dependent.")
(defconst dotfiles-dir (concat home-dir "/.dotfiles/"))
(defconst dot-emacs-dir (concat dotfiles-dir "emacs/"))
(defconst package-user-dir (concat dot-emacs-dir ".elpa"))

(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'auto-compile)
  (package-install 'auto-compile))

(setq load-prefer-newer t
      auto-compile-display-buffer nil
      auto-compile-mode-line-counter t)

(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(add-hook 'after-init-hook (lambda () (load (concat dot-emacs-dir "init-real.el"))))
