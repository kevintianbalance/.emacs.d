;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; shackle mode
;; Issue: Invalid face attribute :foreground nil
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/shackle/"))
(load "shackle.el");

(setq helm-always-two-windows t)

;;(setq helm-display-function 'pop-to-buffer)

;; (setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align right :ratio 0.46 :inhibit-window-quit t :other t :popup t :same nil :frame t :ignore t)))
;; not support :popup t
;; (setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align right :ratio 0.46 :inhibit-window-quit t :other t)))
(shackle-mode)

;; example by shackle mode
(setq helm-display-function 'pop-to-buffer) ; make helm play nice
(setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :size 0.4 :inhibit-window-quit t :same nil)))

;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;; keyfreq - :@@@@@:
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/keyfreq/"))
;; (require 'keyfreq)
;; (keyfreq-mode 1)
;; (keyfreq-autosave-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/sourcerer-theme-20161014.925")
(load-theme 'sourcerer t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c++/c indent correctly for indent-region
;; See also IndentingC and SmartTabs for more info.
;; Kevin Tian: take effect for fix java index error
(setq c-default-style "linux"
      c-basic-offset 2)

;;;;;;;;;;;;;;;;;;;;
;; highlight-symbol
(add-to-list 'load-path "~/.emacs.d/elisp/")
(require 'highlight-symbol)
