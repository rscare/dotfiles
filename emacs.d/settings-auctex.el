;; AUCTeX mode setup

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

; setup parsing
(setq TeX-parse-self t)
(setq TeX-auto-save t)

(setq TeX-auto-untabify t)

(setq LaTeX-amsmath-label "eq:")
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
