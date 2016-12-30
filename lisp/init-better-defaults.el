(setq ring-bell-function 'ignore)
(global-auto-revert-mode t)
(global-linum-mode t)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("8mr" "marong")
					    ))

(setq make-backup-files nil)
(setq auto-save-default nil)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(delete-selection-mode t)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


(provide 'init-better-defaults)

