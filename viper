;; Viper-specific configuration

;; Startup stuff
(setq viper-inhibit-startup-message t)
(setq viper-expert-level 5)

(setq viper-want-ctl-h-help t)
(setq viper-re-search t)

(setq-default viper-ex-style-motion t)
(setq-default viper-ex-style-editing nil)

(setq-default viper-want-emacs-keys-in-insert t)
(setq-default viper-want-emacs-keys-in-vi t)

;; Fix the backspace key to be mode-specific
(define-key viper-insert-basic-map (kbd "DEL") 'nil)
(add-hook 'viper-insert-state-hook '(lambda () (define-key viper-insert-basic-map [backspace] nil)))

;; Universal argument everywhere
(define-key viper-vi-global-user-map (kbd "C-u") 'universal-argument)

;; Allow cutting in insert mode
(define-key viper-insert-global-user-map (kbd "C-w") 'kill-region)
