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

; cmd+k: commit
(global-set-key (kbd "s-k") 'magit-commit)
; cmd+shift+k: push
(global-set-key (kbd "s-K") 'magit-push)
; cmd+t: new tab
(global-set-key (kbd "s-t") 'tab-bar-new-tab)
; cmd+w: close tab
(global-set-key (kbd "s-w") 'tab-bar-close-tab)
