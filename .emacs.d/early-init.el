;; Disable package.el at startup (we'll use use-package)
(setq package-enable-at-startup nil)

;; Faster startup
(setq gc-cons-threshold (* 50 1000 1000))

;; UI minimalism early
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

