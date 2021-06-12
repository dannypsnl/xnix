(use-package nix-mode)
(use-package agda2-mode)
(use-package idris-mode)
(use-package racket-mode)
(use-package magit)
(use-package company
  :config
  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0.1)
  (setq company-tooltip-align-annotations t)
  :hook
  ((racket-mode . company-mode)
   (racket-repl-mode . company-mode)))
(use-package rainbow-delimiters
  :hook
  ((racket-mode . rainbow-delimiters-mode)
   (racket-repl-mode . rainbow-delimiters-mode)))

; fullscreen by default
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
; no show startup screen
(setq inhibit-startup-screen t)
; font size: 1/10pt * :height
(set-face-attribute 'default nil :height 150)

; Edit
(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)
(global-set-key (kbd "s-<right>") 'move-end-of-line)

; Git
(global-set-key (kbd "s-k") 'magit-commit)
(global-set-key (kbd "s-K") 'magit-push)

; Tabs
(global-set-key (kbd "s-t") 'tab-bar-new-tab)
(global-set-key (kbd "s-w") 'tab-bar-close-tab)
(global-set-key (kbd "M-<left>") 'tab-bar-switch-to-prev-tab)
(global-set-key (kbd "M-<right>") 'tab-bar-switch-to-next-tab)
