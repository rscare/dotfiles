;; AUCTeX mode setup

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

; setup parsing
(setq TeX-parse-self t)

(setq TeX-auto-untabify t)

(setq LaTeX-amsmath-label "eq:")
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; setup xpdf pdf viewing by default
(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (setq TeX-view-program-selection
                   (add-to-list
                    (remove '(output "Evince") 'TeX-view-program-selection)
                    '(output-pdf "xpdf")))))
