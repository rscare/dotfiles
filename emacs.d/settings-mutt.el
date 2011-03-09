;; Automatically use mail-mode with mutt-generated files
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

;; Enable on-the-fly spell-checking
(add-hook 'mail-mode-hook '(lambda () (flyspell-mode)))
