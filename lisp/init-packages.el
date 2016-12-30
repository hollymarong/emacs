(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  ;; (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  ;; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
  )

;;add whatever package you wnat here
(defvar marong/packages '(
			  company
			  monokai-theme
			  swiper
			  counsel
			  js2-mode
			  nodejs-repl
			  smartparens
			  hungry-delete
			  popwin
			 ) "Default packages")

(defun marong/packages-installed-p ()
  (loop for pkg in marong/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (marong/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg marong/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(smartparens-global-mode t)


(load-theme 'monokai t)

(global-company-mode t)

(require 'hungry-delete)
(global-hungry-delete-mode)


;; config js2-node-alist for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; nodejs-repl
(require 'nodejs-repl)

;; config popwin
(require 'popwin)
(popwin-mode 1)

;; config swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


(provide 'init-packages)
