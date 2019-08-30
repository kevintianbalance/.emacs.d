;; Issue: Invalid face attribute :foreground nil
;; not use it any more


(set-background-color "black")
;; (set-background-color "dark slate gray")
(set-foreground-color "white")
;; use M-x describe-font RET to query current font
(set-default-font "-adobe-courier-medium-r-normal--18-*-75-75-m-110-iso8859-1")


;; ;; 2010_09_21 delete for confilict with emacs20
;; (add-to-list 'load-path "~/elisp/color-theme-6.6.0")

;; (require 'color-theme)
;; (color-theme-jsc-dark)

;; confilict with linux
(setq load-path (append load-path (list "~/.emacs.d/elisp/color-theme-6.6.0")))
(require 'color-theme)
;; (color-theme-jsc-dark)
;; 2011_03_01
(color-theme-initialize)
;; 2011_06_23 del
;; ediff not clear
;; (color-theme-clarity)

;; (color-theme-jsc-dark)
;; @@@@@@ select for ediff
;; (color-theme-high-contrast)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color-theme-zenburn
;; @@@@@@
(setq load-path (append load-path (list "~/.emacs.d/elisp")))
(require 'color-theme-zenburn)
;; removed, 20190830
(color-theme-zenburn)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color-theme-tango
(require 'color-theme-tango)
;; (color-theme-tango)

;; ediff-buffer not clear
;; :@@@@:
;; (color-theme-jsc-dark)

;; (setq load-path (append load-path (list "~/.emacs.d/elpa/afternoon-theme-20140104.1859")))
;; (require 'afternoon-theme)
;; (load-theme 'afternoon t)

;; (color-theme-wheat)
;; (color-theme-sitaramv-nt)
