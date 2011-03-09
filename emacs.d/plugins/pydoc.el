;; Command intended to be used in python-mode to get the documentation
;; of python built-ins, with a method to get the full python symbol
;; under the cursor.
;;
;; Author: Yuri D. Lenskiy
;; Email: yuri.lenskiy@gmail.com

(defun python-get-symbol-under-cursor ()
  "Get the full python symbol under the cursor."
  (let ((validPythonSymbolChars "a-zA-Z._\-") symbolStart symbolEnd symbol)
    (save-excursion
      (skip-chars-forward validPythonSymbolChars)
      (setq symbolStart (point))
      (skip-chars-backward validPythonSymbolChars)
      (setq symbolEnd (point))
      (setq symbol (buffer-substring-no-properties symbolStart symbolEnd)))))

(defun python-pydoc ()
  "Get the documentation of a python symbol. Defaults to the symbol under the cursor."
  (interactive)
  (let (symbol)
    (setq symbol
          (read-from-minibuffer (concat "Symbol ("
                                        (python-get-symbol-under-cursor) "): ")))
    (if (equal symbol "") (setq symbol (python-get-symbol-under-cursor)))
    (shell-command (concat "pydoc " symbol))))
