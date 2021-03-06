(use-package nix-mode)
(use-package agda2-mode)
(use-package idris-mode)
(use-package racket-mode)
(use-package magit)
(use-package mermaid-mode)

; fullscreen by default
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
; no show startup screen
(setq inhibit-startup-screen t)
; font size: 1/10pt * :height
(set-face-attribute 'default nil :height 150)

; Git
(global-set-key (kbd "s-k") 'magit-commit)
(global-set-key (kbd "s-K") 'magit-push)

; Tabs
(global-set-key (kbd "s-t") 'tab-bar-new-tab)
(global-set-key (kbd "s-w") 'tab-bar-close-tab)
(global-set-key (kbd "M-<left>") 'tab-bar-switch-to-prev-tab)
(global-set-key (kbd "M-<right>") 'tab-bar-switch-to-next-tab)

; File
(cond
 ((string-equal system-type "gnu/linux")
  (global-set-key (kdb "M-s") 'save-buffer)
  (global-set-key (kdb "M-z") 'undo)))
