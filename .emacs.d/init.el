;; Basic GUI settings
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(tooltip-mode -1)

(setq warning-minimum-level :emergency)

;; Font
(set-face-attribute 'default nil :font "Monaco" :height 120)

;; Line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; Visible bell
(setq visible-bell t)

;; Scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't
      scroll-step 1)

;; Preventing line wrapping
(set-default 'truncate-lines t)

;; Preventing backup files
(setq make-backup-files nil)

;; Autopair
(add-to-list 'load-path "~/.emacs.d/local-packages")
(require 'autopair)
(autopair-global-mode)

;; Package manager settings
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

;; Ivy
(use-package ivy)
(ivy-mode 1)

;; Auto complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

;; Projectile
(use-package projectile)

;; Org
(use-package org)
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; General
(use-package general)

;; Flycheck
(use-package flycheck
  :ensure t
  :hook (php-mode . flycheck-mode))
(setq flycheck-phpcs-standard "PSR4")

;; PHP
(use-package php-mode)

;; Web-mode
(use-package web-mode
  :ensure t
  :mode (("\\.blade.php\\'" . web-mode)
         ("\\.php\\'" . web-mode)
         ("\\.html\\'" . web-mode))
  :config
  (setq web-mode-engines-alist
        '(("blade" . "\\.blade\\."))))

;; CSS & SASS
(use-package css-mode
  :ensure t
  :mode (("\\.css\\'" . css-mode)))
(use-package scss-mode
  :ensure t
  :mode (("\\.scss\\'" . scss-mode)))

;; Emmet
(use-package emmet-mode
  :ensure t
  :hook (web-mode . emmet-mode))
(general-define-key
 "C-j" 'emmet-expand-line)

;; Markdown
(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

;; Magit
(use-package magit)

;; Package manager
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(markdown-mode scss-mode magit emmet-mode web-mode flycheck php-mode org-bullets projectile auto-complete general ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
