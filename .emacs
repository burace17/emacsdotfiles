(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(require 'org)
(setq org-log-done t)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

(global-linum-mode 1)

(load-theme 'badwolf t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (cider badwolf-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defvar leader-normal-map (make-sparse-keymap)
  "Normal state keymap for my vim shortcuts")
(define-key evil-normal-state-map "," leader-normal-map)
(define-key leader-normal-map "c" 'comment-line)
(define-key leader-normal-map "s" 'save-buffer)
(define-key leader-normal-map "e" 'eval-buffer)
(define-key leader-normal-map "w" 'switch-to-buffer)
(define-key leader-normal-map "t" 'term)
(define-key leader-normal-map "q" 'kill-buffer)

(defvar leader-visual-map (make-sparse-keymap)
  "Visual state keymap for my vim shortcuts")
(define-key evil-visual-state-map "," leader-visual-map)
(define-key leader-visual-map "v" 'comment-dwim)
