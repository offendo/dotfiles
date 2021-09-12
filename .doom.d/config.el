;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Nilay"
      user-mail-address "nilaypatel2@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Iosevka Extended" :size 14 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Iosevka Extended" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-material)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; pyvenv workon home
(setenv "WORKON_HOME" "~/.local/share/virtualenvs/")


;; tree-sitter
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))


;; disable comment continuation on o/O and enter
(setq +evil-want-o/O-to-continue-comments nil
      +default-want-RET-continue-comments nil)


;; disable spelling in buffers unless I enable it
(remove-hook 'text-mode-hook #'spell-fu-mode)

(use-package! kubel)
(use-package! kubel-evil)

;; latex image scale
(after! org (plist-put org-format-latex-options :scale 0.45))

;; Auto activate pyvenv
(defvar venv-directory)
(setq venv-directory "/home/offendo/.local/share/virtualenvs/")


(use-package! pipenv
  :init
  (defun auto-venv-activate ()
    "Automatically activate virtualenv if one is found in `venv-directory`"
    (interactive)
    (let ((venvs (seq-filter
                  (lambda (dirname)
                    (string-match-p (regexp-quote (projectile-project-name)) dirname))
                  (directory-files venv-directory))))
      (if venvs
          (progn (pyvenv-workon (car venvs))
                 (message (concat "Activated " (car venvs)))))))
  :hook (python-mode . auto-venv-activate))
