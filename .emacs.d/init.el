;; ;; This is to make sure straight.el does all the heavy lifting instead of package.el
;; ;;; Code:
;; (setq straight-check-for-modifications nil)
;; (setq package-enable-at-startup nil)
;;
;; ;; disable menu-bar-mode
;; (menu-bar-mode -1)
;; ;; disable splash-screen
;; (setq inhibit-startup-screen t)
;;
;; ;; Initialization snippet
;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;       (bootstrap-version 5))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;;          'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))


(org-babel-load-file "~/.emacs.d/config.org")
