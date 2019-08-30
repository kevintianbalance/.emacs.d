(require 'package)

(add-to-list 'package-archives
        '("melpa" . "http://melpa.org/packages/") t)


(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.3")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
;; for performance issue, removed, 201712
;; (require 'setup-cedet)
(require 'setup-editing)



;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (afternoon-theme hamburg-theme zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu)))
 '(safe-local-variable-values
   (quote
    ((hl-sexp-mode)
     (rainbow-mode . t)
     (eval when
           (fboundp
            (quote rainbow-mode))
           (rainbow-mode 1))))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; small font size
 ;; '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :family "Inconsolata"))))
 ;; media font size: normal:height 200
 '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 170 :width normal :family "Inconsolata"))))
;; bigger font size: normal:height 400
;; '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 400 :width normal :family "Inconsolata"))))
)

;;;;
;; helm + gtags
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;;;;
;; company
;; General Usage: Completion will start automatically after you type a few letters. Use M-n and M-p to select, <return> to complete or <tab> to complete the common part. Search through the completions with C-s, C-r and C-o. Press M-(digit) to quickly complete with one of the first 10 candidates. When the completion candidates are shown, press <f1> to display the documentation for the selected candidate, or C-w to see its source. Not all back-ends support this.

;; The variable company-backends specifies a list of backends that company-mode uses to retrieves completion candidates for you.

;; That's the basic. In the later sections, you will configure company-mode to provide completion candidates.

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; ;; ;;;;
;; ;; ;; clang
;; ;; remove clang
;; (setq company-backends (delete 'company-clang company-backends))
;; ;; Symbol's value as variable is void: c-mode-map
;; ;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

;; ;; (add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-backends 'company-semantic)
;; ;;(add-to-list 'company-c-headers "/usr/include/c++/5.4.0")

;;;;
;; Kevin's personal configurations
(load "my_cscope.el")
(load "my_bookmark.el")
(load "my_key.el");
;; (load "my_color-theme-linux.el");
;; (load "my_erlang-linux.el");
(load "my_setting.el");
(load "my_org.el");
(load "my_eval.el");
(load "my_function.el");
(load "my_bm.el");
;; (load "my_program.el");
(load "my_color-theme-linux.el");
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; EDTS: erlang IDE



;; (add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; ;; can not package-install edts
;; ;; http://melpa.milkbox.net/packages/dash-20170613.151.el: Not foundInvalid face attribute :foreground nil


;; ;; (add-hook 'after-init-hook 'my-after-init-hook)
;; ;; (defun my-after-init-hook ()
;; ;;     (require 'edts-start))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; GTE EDTS Wiki
;; ;; https://wiki.lmera.ericsson.se/wiki/GTE/Developing_GTE/EDTS
;; ;; Erlang/OTP with GTE adaptations
;; (setq load-path (cons "/proj/ltegte/app/gte-dev-env/emacs/elisp"
;;                 load-path))
;; (require 'gte)
;; (require 'gte-edts)

;; ;; Warning (gte): Unable to start the GTE Erlang adaptation.
;; ;; $ERLTOP and/or $GTETOP environment variables not set.

;; ;; To use the GTE Erlang adaptions, start it from Clearcase
;; ;; or follow the README file in the top of the GTE git
;; ;; repository.


(message "Successfully loaded all the files");

