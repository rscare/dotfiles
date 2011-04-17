(global-set-key (kbd "M-SPC") 'hippie-expand)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "<escape>") 'viper-change-state-to-vi)

;; Auto indentation
(global-set-key (kbd "RET") 'newline-and-indent)

;; File finding
(global-set-key (kbd "C-x C-f") 'ido-find-file)

;; Pydoc
(add-hook 'python-mode-hook (lambda ()
                              (local-set-key (kbd "C-c h") 'python-pydoc)))

;; Quick edit notes file
(global-set-key (kbd "C-c n") '(lambda ()
                                 "Edit the default notes file."
                                 (interactive) (find-file "~/notes/main.org")))

;; Delete matching parentheses
(global-set-key (kbd "M-)") 'delete-pair)

;; Enclosing regions in delimiters
(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)

;; Launch a terminal
(global-set-key (kbd "M-S-<return>") (lambda ()
                                       "Launch a default terminal session."
                                       (interactive) (ansi-term (getenv "SHELL"))))
