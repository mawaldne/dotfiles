(require 'package):
(dolist (source '(("melpa" . "http://melpa.org/packages/")))
  (add-to-list 'package-archives source t))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (pkg '(
           ace-window
           ag
           better-defaults
           flx-ido
           ido-ubiquitous
           ido-vertical-mode
           molokai-theme
           paredit
           smex
           projectile))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(load-theme 'molokai t)

;; Smooth Scrolling
(setq scroll-step           1
      scroll-conservatively 10000)

(setq vc-follow-symlinks t)

(global-set-key (kbd "M-p") 'ace-window)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(when (eq window-system 'mac)
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)
  (global-set-key (kbd "s-c") 'kill-ring-save)
  (global-set-key (kbd "s-x") 'kill-region)
  (global-set-key (kbd "s-v") 'yank))

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

(setq auto-save-default nil)

;; Linenum mode on
(global-linum-mode t)
(setq linum-format "%4d ")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120 :family "Menlo")))))

