(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  ;; (package-initialize)
  (setq package-archives
            '(("popkit" . "http://elpa.popkit.org/packages/")))
  ;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
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
			  web-mode
			  js2-refactor
			  expand-region
			  iedit
			  org-pomodoro
			  helm-ag
			  auto-yasnippet
			  ;;flycheck
			  evil
			  evil-leader
			  window-numbering
			  evil-surround
			  evil-nerd-commenter
			  which-key
			  powerline
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


(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     ad-do-it))))

(smartparens-global-mode t)

(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

(load-theme 'monokai t)

(global-company-mode t)

(require 'hungry-delete)
(global-hungry-delete-mode)


;; config js2-node-alist for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

;; nodejs-repl
(require 'nodejs-repl)

;; config popwin
(require 'popwin)
(popwin-mode 1)

;; config swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(defun my-web-mode-indent-setup()
  (setq web-mode-markup-indent-offset 2) ;web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mdoe, js code in html file
  )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)


(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))


;; config js2-refaotor
(add-hook 'js2-mode-hook #'js2-refactor-mode)


(defun js2-imenu-make-index ()
      (interactive)
      (save-excursion
	;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
	(imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
				   ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
				   ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
				   ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
	      (lambda ()
		(setq imenu-create-index-function 'js2-imenu-make-index)))

(require 'expand-region)

(require 'org-pomodoro)

(require 'yasnippet)
(yas-reload-all)

;; (add-hook 'js2-mode-hook 'flycheck-mode)

(evil-mode 1)
;; (setq-default evil-want-C-u-scroll t)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(global-evil-leader-mode)

(window-numbering-mode 1)

(require 'powerline)
(powerline-default-theme)

(require 'evil-surround)
(global-evil-surround-mode 1)


(evilnc-default-hotkeys)

(provide 'init-packages)
