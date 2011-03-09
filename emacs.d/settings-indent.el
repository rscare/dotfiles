;; Proper indentation

(add-hook 'c-mode-hook '(lambda() (progn
                                    (c-set-style "k&r")
				    (setq c-basic-offset 4))))
(add-hook 'c++-mode-hook '(lambda() (c-set-style "stroustrup")))
(setq-default indent-tabs-mode nil) ; Spaces instead of tabs
(setq backward-delete-char-untabify-method 'hungry) ; Backspace over tabs
