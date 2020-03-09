;; auto generated code.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (undo-tree elpy anaconda-mode markdown-mode git-gutter ggtags GGTags yasnippet jedi flycheck auto-complete smooth-scrolling ty smooth-scroll counsel swiper ace-window org-bullets solarized-dark solarized-theme which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#002b36" :foreground "#839496" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 113 :width normal :foundry "CTDB" :family "Fira Code")))))

;; user defined code.

;; inhibit the startup message
(setq inhibit-startup-message t)
;; remove the toolbar
(tool-bar-mode -1)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; try packages without installing.
(use-package try
  :ensure t)

;; which-key helps with the hotkeys.
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Org-mode stuff
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda() (org-bullet-mode 1))))

;; powerful handler for auto-completition on buffers, files etc.
;;(setq indo-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)

(defalias 'list-buffers 'ibuffer)

;; set dark solarized theme.
(use-package solarized-theme
  :ensure t
  :config (load-theme 'solarized-dark t))

;; enable wind-move for fast view switching
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; counsel
(use-package counsel
  :ensure t
  )

;; ivy
(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))

;; swiper
(use-package swiper
  :ensure try
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;; smooth-scrolling
(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1))

;; auto-complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

;;; git-gutter
(use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode +1))

;;; markdown-mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "markdown"))

;;; Python ;;;

;;; elpy
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;;; jedi
(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))



;; CPP IDE configuration. ;;

;; Flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;;; Yasnippet - nothing to do
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  )

;;; GGTags - ...
(use-package ggtags
  :ensure t
  :config
  (add-hook 'c-mode-common-hook
	    (lambda()
	      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		(ggtags-mode 1)))))

;;; undo-tree
(use-package undo-tree
  :ensure t
  :init
  (undo-tree-mode))
