(require 'package):
(dolist (source '(("melpa" . "http://melpa.org/packages/")
          ("marmalade" . "https://marmalade-repo.org/packages/")))
  (add-to-list 'package-archives source t))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (pkg '(ace-window
           ag
           anzu
           better-defaults
           cider
           clojure-mode
           company
           evil
           evil-leader
           evil-matchit
           exec-path-from-shell
           flx-ido
           flycheck
           gist
           ido-ubiquitous
           ido-vertical-mode
           inf-ruby
           magit
           markdown-mode
           molokai-theme
           paredit
           projectile
           racket-mode
           smex
           web-mode
           yari))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(load-theme 'molokai t)

;; Smooth Scrolling
(setq scroll-step           1
      scroll-conservatively 10000)

(setq vc-follow-symlinks t)

;; Interactively do thingys
(require 'ido)
(ido-mode t)

;; Switch to vertical mod
(require 'ido-vertical-mode)
(ido-vertical-mode t)

;; Flex matching between words
(require 'flx-ido)
(flx-ido-mode t)
(setq ido-use-faces nil)

;; recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 25)

(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(global-set-key "\C-x\ \C-r" 'recentf-ido-find-file)

;; turn on syntax highlighting
(global-font-lock-mode 1)

;; Show full filename path in the file name
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Move backup to backup folder
(setq backup-directory-alist
          `((".*" . ,"~/.emacs.d/backup")))

;; Remove clutter 
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq auto-save-default nil)


;; Linenum mode on
(global-linum-mode t)                                                   
(setq linum-format "%4d ")
:
;; evil
(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
     (define-key evil-normal-state-map (kbd "C-p") 'ido-find-file)
     (define-key evil-normal-state-map (kbd "C-u") 'ido-switch-buffer)))

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

(global-evil-matchit-mode 1)

;; Copy to clipboard
(when (and (not (display-graphic-p)) (eq system-type 'darwin))
  (defun mw/copy-from-osx ()
    "Copies the current clipboard content using the `pbcopy` command"
    (shell-command-to-string "pbpaste"))

  (defun mw/paste-to-osx (text &optional push)
    "Copies the top of the kill ring stack to the OSX clipboard"
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))

  (setq interprogram-cut-function 'mw/paste-to-osx)
  (setq interprogram-paste-function 'mw/copy-from-osx))

(global-set-key (kbd "C-z") 'evil-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right
 '(inhibit-startup-screen t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120 :family "Menlo")))))
