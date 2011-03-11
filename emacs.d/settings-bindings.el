;; Backspacing over indentation
(define-key viper-insert-global-user-map (kbd "<backspace>") 'backward-delete-char-untabify)

;; Insert mode is just native emacs mode
(define-key viper-vi-global-user-map (kbd "i") 'viper-toggle-key-action)

;; Python hook for proper backspacing
;; (add-hook 'python-mode-hook '(lambda ()
;;                                (progn
;;                                  (define-key viper-insert-local-user-map (kbd "<backspace>") 'python-backspace)
;;                                  (autopair-mode nil)
;;                                  (autopair-mode t))))

(global-set-key (kbd "M-SPC") 'hippie-expand)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "<escape>") 'viper-change-state-to-vi)

;; File finding
(global-set-key (kbd "C-x C-f") 'ido-find-file)

;; Pydoc
(add-hook 'python-mode-hook (lambda ()
                              (local-set-key (kbd "C-c h") 'python-pydoc)))

;; Quick edit notes file
(global-set-key (kbd "C-c n") '(lambda ()
                                 "Edit the default notes file."
                                 (interactive) (find-file "~/notes/main.org")))
