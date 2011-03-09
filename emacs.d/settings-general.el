;; General settings for emacs

;; Appearance
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Startup screens
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; Shorten response chars
(fset 'yes-or-no-p 'y-or-n-p)

;; Save backups to one location
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Put "customize" information into a different file
(setq custom-file "~/.emacs.d/settings-custom.el")
(load custom-file)

;; Delete trailing whitespace on save
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; No new-line on down-key
(setq next-line-add-newlines nil)

;; Silent emacs
(setq visible-bell t)

;; Copy filename under cursor to C-x C-f
(ffap-bindings)

;; Syntax highlighting everywhere
(global-font-lock-mode 1)

;; Wrap at a reasonable length
(setq-default fill-column 77)

;; Enable disabled commands
(put 'narrow-to-region 'disabled nil)

;; Word counting
(defun count-words ()
  "Counts words in the active region, or if no region in the entire buffer. Uses the 'wc' program."
  (interactive)
  (let ((minpoint (if mark-active (min (point) (mark)) (point-min)))
        (maxpoint (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region minpoint maxpoint "wc -w")))
