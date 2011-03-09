(server-start)

(add-to-list 'load-path
	     "~/.emacs.d") ; For settings files
(add-to-list 'load-path
	     "~/.emacs.d/plugins/")

;; Loads general information, along with any variables set by 'customize'
(load "settings-general")

(load "settings-mutt")

(load "settings-indent")
(load "settings-viper")
(load "settings-yasnippets")

(load "settings-org")
(load "settings-remember")
(load "settings-PKGBUILD")

(load "settings-ido")
(load "settings-auctex")
(load "settings-hippie")

;; (load "settings-tabkey2")
;; (load "settings-autocomplete")

;; Setting up autopairing
(require 'autopair)
(autopair-global-mode 1)

;; Speedbar to appear in the same buffer
(require 'sr-speedbar)

;; Window numbering (M-#)
(require 'window-numbering)
(window-numbering-mode 1)

;; Self-written plugins
;; pydoc
(autoload 'python-pydoc "pydoc"
  "Get the documentation of a python symbol. Defaults to the symbol under the cursor." t)

;; Load keybindings last so we override other plugins
(load "settings-bindings")
