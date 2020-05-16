;; always show line numbers
(setq global-linum-mode t)
;; backup to certain directory
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
