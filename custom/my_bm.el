;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Visible Bookmarks
;; https://github.com/joodland/bm
;; 2013_12_24_094208
(add-to-list 'load-path "~/.emacs.d/elisp/bm-master/")
(require 'bm)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Visible Bookmarks
;; https://github.com/joodland/bm
;; 2013_12_24_094208
;; Keep same with [[file:my_cedet.el::(enable-visual-studio-bookmarks)]]
(global-set-key [f2] 'bm-toggle)
;; (global-set-key (kbd "<C-f2>") 'bm-next)
;; Putty transfer control f2 to:
;; "M-[1;5q" is undefined
(global-set-key "\M-[1;5q" 'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
