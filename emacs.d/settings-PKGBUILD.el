(add-to-list 'load-path "~/.emacs.d/plugins/pkgbuild-mode-git/")

(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(add-to-list 'auto-mode-alist '("/PKGBUILD$" . pkgbuild-mode))
