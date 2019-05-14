

;;=========================== ·½±ã±à³Ì²Ù×÷µÄÉèÖÃ=====================================
(setq compile-command "make")
;;emacsµÄÄ¬ÈÏcompileÃüÁîÊÇµ÷ÓÃmake -k£¬ÎÒ°ÑËü¸Ä³ÉÁËmake¡£ÄãÒ²¿ÉÒÔ°ÑËü¸Ä³ÉÆäËûµÄ£¬±ÈÈçgccÖ®ÀàµÄ.
;;°ÑcÓïÑÔ·ç¸ñÉèÖÃÎªk&r·ç¸ñ
;; Kevin Tian: this is conflict with 
;; (defun my-c++-mode-hook ()   (setq c-basic-offset 2)   (c-set-offset 'substatement-open 0)) (add-hook 'c++-mode-hook 'my-c++-mode-hook) 


;; Kevin Tian: set tab width 2
(defun my-c++-mode-hook ()   (setq c-basic-offset 2)   (c-set-offset 'substatement-open 0)) 

;; Kevin Tian: conflict with tab indent setting
;; (add-hook 'c-mode-hook
;; '(lambda ()
;; (c-set-style "k&r")))

;; Kevin Tian set tab width 2
(add-hook 'c-mode-hook
					'my-c++-mode-hook
)

;;°ÑC++ÓïÑÔ·ç¸ñÉèÖÃÎªstroustrup·ç¸ñ
(add-hook 'c++-mode-hook
;; Kevin Tian: conflict with tab indent setting
;;					'(lambda()
;;						 (c-set-style "stroustrup"))
					'my-c++-mode-hook
)
;========================================================================
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;;ÄÜ°ÑÒ»¸ö´úÂë¿éËõÆðÀ´£¬ÐèÒªµÄÊ±ºòÔÙÕ¹¿ª
;; M-x hs-minor-mode
;; C-c @ ESC C-s show all
;; C-c @ ESC C-h hide all
;; C-c @ C-s show block
;; C-c @ C-h hide block
;; C-c @ C-c toggle hide/show
;========================================================================


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; java
;; IndentingJava
;; Contents

;;     Annotations
;;     Tab width

;; Annotations

;; java-mode does not indent Java 1.5 @-style annotations correctly. A quick fix is to define them as comments:[1]

    (add-hook 'java-mode-hook
              (lambda ()
                "Treat Java 1.5 @-style annotations as comments."
                (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
                (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

;; A more complete solution is provided by Lisp:java-mode-indent-annotations.el.
;; Tab width

;; The most important thing to remember is that Java files use a different style. Therefore, to customize Java indentation, use the java-mode-hook:

    (add-hook 'java-mode-hook (lambda ()
                                (setq c-basic-offset 2)))

;; The ‘c-basic-offset’ variable controls the basic “unit” of the indentation engine. When you hit the TAB key, you tell the indentation engine to indent to “the right place”. This will insert tabs and spaces as required. Therefore, hitting TAB will usually advance point by 4 when indenting Java source.

;; When you read other people’s Java source, however, tab characters will still be 8 wide.

;; Here is how to fix it:

;; This says that hitting TAB should advance point by 4, that tab characters in source files should display 4 wide, and that Emacs should use tab characters when it can. Therefore, the TAB key will insert tab characters, and they will display 4 wide.

;; If you set ‘indent-tabs-mode’ to nil, then Emacs will insert 4 spaces instead.

;; See also IndentingC and SmartTabs for more info.
;; Kevin Tian: take effect for fix java index error
(setq c-default-style "linux"
			c-basic-offset 2)
