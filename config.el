(use-package nix-mode)
(use-package agda2-mode)
(use-package idris-mode)
(use-package racket-mode)
(use-package magit)

; fullscreen by default
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
; no show startup screen
(setq inhibit-startup-screen t)
; font size: 1/10pt * :height
(set-face-attribute 'default nil :height 150)

; cmd+k for commit
(global-set-key (kbd "s-k") 'magit-commit)
; cmd+shift+k for push
(global-set-key (kbd "s-K") 'magit-push)
