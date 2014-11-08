;;; package --- Summary
;;; Commentary:
;;;   This is where your customizations should live
;;; Code:

;; required packages: (helm, helm-projectile, jedi)

;; Deactivate Guru
(setq prelude-guru nil)


;; env PATH
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))


;; Clipboard
(setq x-select-enable-clipboard t)


;; Scrollbars
(if (boundp 'scroll-bar-mode)
    (scroll-bar-mode -1))


;; Cursor Style
(setq-default cursor-type 'bar)


;; God Mode
(require 'god-mode)
(define-key god-local-mode-map (kbd "z") 'repeat)
(global-set-key (kbd "<escape>") 'god-local-mode)
(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)


;; Custom Keys
(global-set-key (kbd "C-x C-1") 'delete-other-windows)
(global-set-key (kbd "C-x C-2") 'split-window-below)
(global-set-key (kbd "C-x C-3") 'split-window-right)
(global-set-key (kbd "C-x C-0") 'delete-window)
(global-set-key (kbd "C-x o") 'other-window)
(global-set-key (kbd "C-x C-;") 'helm-projectile)


;; Theme
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(set-face-attribute 'default nil :height 105)
(setq-default truncate-lines 't)
(setq-default whitespace-line-column 100)


;; cursor
(blink-cursor-mode 1)


;; org-mode
(require 'org)
(setq org-log-done 'note)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;; Helm
(require 'helm)
(require 'helm-config)
(helm-mode 1)

(define-key helm-map
  (kbd "<tab>")
  'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map
  (kbd "C-i")
  'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map
  (kbd "C-z")
  'helm-select-action) ; list actions using C-z
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-c h C-c p") 'helm-projectile)


;; smooth scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time


;; tabs and such
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)


;; Theme
(set-face-background 'web-mode-block-face "grey12")


;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)


;; hippie expand - don't try to complete with file names
(setq hippie-expand-try-functions-list
      (delete 'try-complete-file-name hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list
      (delete 'try-complete-file-name-partially hippie-expand-try-functions-list))


;; Save here instead of littering current directory with emacs backup files
(setq backup-directory-alist '(("." . "~/.saves")))
(setq create-lockfiles nil)


;;; user.el ends here
