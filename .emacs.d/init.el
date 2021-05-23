;;; Code
;; Make sure org doesn't load unnecessary stuff
(defvar org-modules '(ol-bibtex))
;; Now tangle the config file
(org-babel-load-file "~/.emacs.d/config.org")
