;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; F2
;; Visible Bookmarks
;; https://github.com/joodland/bm
;; 2013_12_24_094208
;; Keep same with [[file:my_cedet.el::(enable-visual-studio-bookmarks)]]
(global-set-key [f2] 'bm-toggle)
(global-set-key (kbd "<C-f2>") 'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; F3
(defun my-switch-to-note-other-window ()
  "switch to my note other window"
  (interactive)
  (switch-to-buffer-other-window ".scratch_work"))

(global-set-key [f3] 'my-switch-to-note-other-window)

;;;;
;; C-x x | close-all-buffers
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key "\C-cx" 'close-all-buffers)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; F5
(global-set-key [f5] 'highlight-symbol-at-point);


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; F6 - F8
;; set cscope shortcut
(global-set-key [f6] 'cscope-find-this-file)
(global-set-key [f7] 'cscope-find-global-definition)
(global-set-key [f8] 'cscope-find-this-symbol)
