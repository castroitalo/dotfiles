;; BASIC SETTINGS
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)

;;     Line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;;     Visible bell
(tooltip-mode -1)
(setq visible-bell t)

;;     Scroll
(scroll-bar-mode -1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't
      scroll-step 1)

;;     Indenting
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;;     Preventing line wrapping
(set-default 'truncate-lines t)

;;     Preventing emacs from creating backup files
(setq make-backup-files nil)

;;     Escape key to quit commands
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;     Packages settings
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
      
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t) 

;; PACKAGES
;;     Autopair
(add-to-list 'load-path "~/.emacs.d/local-packages")
(require 'autopair)
(autopair-global-mode)

;;     Theme
(load-theme 'manoj-dark t)

;;     Ivy
(use-package ivy)
(ivy-mode 1)

;;     General
(use-package general)

;;     Auto-complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

;;     Projectile
(use-package projectile)
(general-define-key
 "C-c f" 'projectile-find-file)

;;     Org
(use-package org)
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; CODING
;;     PHP
(use-package php-mode
  :ensure t)

;;     LSP
(use-package lsp-mode
  :ensure t
  :hook (php-mode . lsp)
  :commands lsp)
(require 'lsp)
(setq lsp-prefer-flymake nil)
(setq lsp-log-io nil)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

;;     Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t)
  :bind
  (:map global-map
        ("M-0" . treemacs-select-window)
        ("C-x t 1" . treemacs-delete-other-windows)
        ("C-x t t" . treemacs)
        ("C-x t B" . treemacs-bookmark)))
(use-package treemacs-projectile
  :ensure t
  :after treemacs projectile)

;;     Company
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;;    HTML
(use-package web-mode
  :ensure t
  :mode (("\\.html\\'" . web-mode)
         ("\\.php\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-closing t))

;;     JavaScript and TypeScript
(use-package js2-mode
  :ensure t
  :mode (("\\.js\\'" . js2-mode)
         ("\\.jsx\\'" . js2-jsx-mode))
  :config
  (setq js-indent-level 2))
(use-package typescript-mode
  :ensure t
  :mode (("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . typescript-mode)))

;;     JSON
(use-package json-mode
  :ensure t
  :mode (("\\.json\\'" . json-mode)))

;;     CSS and SCSS
(use-package css-mode
  :ensure t
  :mode (("\\.css\\'" . css-mode)))
(use-package scss-mode
  :ensure t
  :mode (("\\.scss\\'" . scss-mode)))

;;     Emmet
(use-package emmet-mode
  :ensure t
  :hook ((web-mode php-mode html-mode sgml-mode) . emmet-mode)
  :config
  (setq emmet-expand-jsx-className? t))

;;     Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;;     Docker
(use-package dockerfile-mode
  :ensure t
  :mode ("Dockerfile\\'" . dockerfile-mode))
(use-package yaml-mode
  :ensure t
  :mode (("\\.yml\\'" . yaml-mode)
         ("\\.yaml\\'" . yaml-mode)))
(use-package flycheck-yamllint
  :ensure t)
(add-hook 'yaml-mode-hook 'flycheck-mode)

;;     Markdown
(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

;;     Indenting lines
(use-package highlight-indent-guides
  :ensure t)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)

;; MELPA 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(highlight-indent-guides flycheck-yamllint yaml-mode dockerfile-mode flycheck emmet-mode scss-mode typescript-mode js2-mode web-mode company-lsp treemacs-projectile lsp-treemacs company lsp-ui lsp-mode php-mode org-bullets projectile auto-complete general ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
