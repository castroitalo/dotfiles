;; Initialize package sources
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Better defaults
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Always use system clipboard
(setq select-enable-clipboard t)
(setq select-enable-primary t)

;; Lock files
(setq create-lockfiles nil)

;; Line numbers
(global-display-line-numbers-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Better scrolling
(setq scroll-conservatively 101)

;; UTF-8 everywhere
(set-language-environment "UTF-8")

;; Completion system
(use-package vertico
  :init
  (vertico-mode))
(use-package consult)
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil))

;; File management
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :config
  (setq dired-listing-switches "-agho --group-directories-first"))

;; Terminal emulator
(use-package vterm)
(add-hook 'vterm-mode-hook
          (lambda ()
            (set-window-fringes nil 0 0)))

;; Org mode
(use-package org
  :ensure nil
  :config
  ;; Better visuals
  (setq org-startup-indented t)
  (setq org-hide-leading-stars t)

  ;; Don't auto-confirm code execution
  (setq org-confirm-babel-evaluate nil))

;; Theme
(use-package gruber-darker-theme
  :config
  (load-theme 'gruber-darker t))

;; Markdown
(use-package markdown-mode
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "pandoc")
  :config
  ;; Better visuals
  (setq markdown-fontify-code-blocks-natively t)
  (setq markdown-hide-markup t))
(setq markdown-open-command
      (cond
       ((eq system-type 'darwin) "open")
       ((eq system-type 'gnu/linux) "xdg-open")
       ((eq system-type 'windows-nt) "start")))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(consult evil gruber-darker-theme markdown-mode orderless vertico
	     vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
