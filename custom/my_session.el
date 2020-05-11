
;;;;;;;;;;;;Add session;;;;;;;;;;;;;;;;;
;; The position of the last change. A new command (bound to C-x C-/) 
;; can be used to jump to that position. 
(add-to-list 'load-path "~/.emacs.d/elisp/session/lisp")
(require 'session)
(add-hook 'after-init-hook 'session-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 让Emacs保存你退出文件时的当前位置
(require 'saveplace)
(setq-default save-place t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 让Emacs自动打开本次退出时已经打开的文件
(desktop-save-mode 1)
