;;; init.el -- My emacs config
;;; Commentary:

;;; Code:
(require 'package)

;; Make sure we are doing things a bit more securely
(setq tls-checktrust t)
(setq gnutls-verify-error t)

(unless (file-directory-p "~/org")
  (make-directory "~/org"))

(setq package-enable-at-startup nil)

;;(unless (assoc-default "org" package-archives)
;;  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t))
(unless (assoc-default "elpa" package-archives)
  (add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t))
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
(unless (assoc-default "melpa-stable" package-archives)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t))
(package-initialize)

;; Pin use-package to the stable package repo
(setq package-pinned-packages
                '(
		  (use-package        . "melpa")
		  (org                . "elpa")
		  ))

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
      (package-install 'use-package))

(setq emacs-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(require 'org-install)
(require 'ob-tangle)

(defun load-org-config ()
  "Reprocess org based configuration files."
  (interactive)
  (mapc #'org-babel-load-file (directory-files emacs-dir t "\\.org$")))

(load-org-config)
;;; init.el ends here
