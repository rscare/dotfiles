;; Set up tabkey2 (intelligent tabbing)

(require 'tabkey2)
(setq tabkey2-completion-functions '(("Yasnippet" yas/expand
                                      (yas/expandable-at-point))
                                     ("Hippie expansion" hippie-expand nil)
                                     ("Emacs default completion" completion-at-point completion-at-point-functions)
                                     ("Tags completion" complete-tag nil)
                                     ("Spell check word" flyspell-correct-word-before-point nil)
                                     ("Semantic Smart Completion" senator-complete-symbol senator-minor-mode)
                                     ("Programmable completion" pcomplete
                                      (and
                                       (boundp 'pcomplete-parse-arguments-function)
                                       pcomplete-parse-arguments-function))
                                     ("nXML completion" nxml-complete
                                      (derived-mode-p 'nxml-mode))
                                     ("Complete Emacs symbol" lisp-complete-symbol
                                      (and
                                       (derived-mode-p 'emacs-lisp-mode)
                                       (not
                                        (fboundp 'completion-at-point))))
                                     ("Widget complete" widget-complete nil)
                                     ("Comint Dynamic Complete" comint-dynamic-complete nil)
                                     ("Ispell complete word" ispell-complete-word t)
                                     ("PHP completion" php-complete-function php-mode)
                                     ("Predictive word" complete-word-at-point predictive-mode)
                                     ("Predictive abbreviations" pabbrev-expand-maybe)
                                     ("Dynamic word expansion" dabbrev-expand t
                                      (setq dabbrev--last-abbrev-location nil))
                                     ("Anything" anything
                                      (commandp 'anything))
                                     ("Company Mode completion" company-complete company-mode)))
(tabkey2-mode 1)
