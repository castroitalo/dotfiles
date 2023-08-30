;; Basic settings
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; Font
(set-frame-font "Iosevka 14" nil t)

;; Visible bell
(tooltip-mode -1)
(setq visible-bell t)

;; Scroll
(scroll-bar-mode -1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't
      scroll-step 1)

;; Indenting
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Preventing line wrapping
(set-default 'truncate-lines t)

;; Preventing emacs from creating backup files    
(setq make-backup-files nil)

;; Espace key to quit commands
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Packages settings
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
      
(unless (package-installed-p 'use-package)
  (package-install 'use-package))  ; Initialize use-package on non-linux platforms

(require 'use-package)
(setq use-package-always-ensure t)    

;; Package ivy    
(use-package ivy)
(ivy-mode 1)
(global-set-key "\C-s" 'swiper)

;; General
(use-package general)

;; Auto-complete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

;; Projectile
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Projects")
    (setq projectile-project-search-path '("~/Projects")))
  (setq projectile-switch-project-action #'projectile-dired))
(general-define-key
 "M-p" 'projectile-find-file)

;; Theme Zenburn
(use-package zenburn-theme)
(load-theme 'zenburn t)

;; Local package - autopair
(add-to-list 'load-path "~/.emacs.d/local-packages")
(require 'autopair)
(autopair-global-mode)

;; MELPA shit
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(projectile zenburn-theme use-package ivy general auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
