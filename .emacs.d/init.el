;; BASIC SETTINGS
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)

;;     Line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;;     Font
(set-frame-font "Iosevka 13" nil t)

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

;;     Theme
(use-package zenburn-theme)
(load-theme 'zenburn t)

;; CODING
;;     PHP 
(use-package php-mode
  :ensure t)
(use-package company-php
  :ensure t)
(use-package php-eldoc
  :ensure t
  :hook (php-mode . php-eldoc-enable))

;;     Flycheck
(use-package flycheck
  :ensure t
  :hook (php-mode . flycheck-mode))
(setq flycheck-phpcs-standard "PSR4")

;;     Web-mode
(use-package web-mode
  :ensure t
  :mode (("\\.blade.php\\'" . web-mode)
         ("\\.php\\'" . web-mode)
         ("\\.html\\'" . web-mode))
  :config
  (setq web-mode-engines-alist
        '(("blade" . "\\.blade\\."))))

;;     Emmet
(use-package emmet-mode
  :ensure t
  :hook (web-mode . emmet-mode))
(general-define-key
 "C-j" 'emmet-expand-line)

;;     SQL
(use-package sql-indent
  :ensure t)
(use-package sql-mode
  :ensure nil
  :mode ("\\.sql\\'" . sql-mode))

;;     SCSS
(use-package scss-mode
  :ensure t
  :mode "\\.scss\\'")
(setq scss-compile-at-save nil)

;;     JavaScript
(use-package js2-mode
  :ensure t
  :mode (("\\.js\\'" . js2-mode))
  :config
  (setq js2-basic-offset 2))

;;     React.js
(use-package rjsx-mode
  :ensure t
  :mode (("\\.jsx\\'" . rjsx-mode)
         ("\\.js\\'" . rjsx-mode))
  :config
  (setq js-indent-level 2))

;;     C
(add-hook 'c-mode-hook
          (lambda ()
            (setq c-basic-offset 4)))

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

;;     JSON
(use-package json-mode
  :ensure t
  :mode (("\\.json\\'" . json-mode)))
(use-package json-reformat
  :ensure t)

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
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(highlight-indentation json-reformat json-mode markdown-mode flycheck-yamllint yaml-mode dockerfile-mode rjsx-mode company-tern js2-mode scss-mode emmet-mode sql-indent web-mode dbgp flycheck php-eldoc company-php php-mode org-bullets zenburn-theme zenburn projectile auto-complete general ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
