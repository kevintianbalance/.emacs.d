;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set cscope
(add-to-list 'load-path
						 "~/.emacs.d/elisp/cscope-15.7a/contrib/xcscope")

;; (add-to-list 'load-path
;;              "~/elisp/cscope-15.7a")

(require 'xcscope) ;;加xcscope

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set etag
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for etag copy from efengzh 2009_12_08
;; For etags or name ctags
;; use this to notify emacs:
;; M-x visit-tags-table
;; (setq tags-file-name "C:/KevinTian/Project/ENC_/Merlin_Sprint14B_S1MultiRabUserPlane_SH5.0_V007/TAGS")
;; (setq tags-file-name "C:/KevinTian/Project/ENC_/Step3MultiUe_SH4.2_V003/TAGS")

;; 依次在当前目录，上级目录，上上级目录中查找 TAGS 文件
;; Kevin Tian: conflict with tags-file-name
(setq tags-table-list '("./TAGS" "../TAGS" "../../TAGS" "../../../TAGS"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; from https://groups.google.com/forum/#!msg/cn.bbs.comp.emacs/LJE5Ve4CbLc/X1SFym6IB3cJ
;; 在 cscope-pop-mark 的基础上做了些小改动
;; 下面这个 my-cscope-preivous-marker 和 my-cscope-next-marker
;; 应该就是你要的 pop/push mark 不过要注意
;; 不要再用 cscope-pop-mark 了
;; 它每次都会删除mark-ring里面的最新一个元素

;; ----------------------------------
(defvar my-cscope-marker-pos 0
  "used for backward-mark and forward-mark")

(setq my-cscope-marker-pos 0)

(defun my-cscope-previous-marker ()
  "goto the previous(older) visited mark"
  (interactive)

  ;; This function is based on pop-tag-mark, which can be found in
  ;; lisp/progmodes/etags.el.
  
  (if (ring-empty-p cscope-marker-ring)
      (error "There are No marked buffers in the cscope-marker-ring yet"))

  (if (= my-cscope-marker-pos (ring-length cscope-marker-ring))
      (error "The oldest marked position reached"))

  (let* ( (marker (ring-ref cscope-marker-ring my-cscope-marker-pos))
          (old-buffer (current-buffer))
          (marker-buffer (marker-buffer marker))
          marker-window
          (marker-point (marker-position marker))
          (cscope-buffer (get-buffer cscope-output-buffer-name)) )

    ;; After the following both cscope-marker-ring and cscope-marker will be
    ;; in the state they were immediately after the last search.  This way if
    ;; the user now makes a selection in the previously generated *cscope*
    ;; buffer things will behave the same way as if that selection had been
    ;; made immediately after the last search.
    (setq cscope-marker marker)


    (incf my-cscope-marker-pos)

    (if marker-buffer
        (if (eq old-buffer cscope-buffer)
            (progn ;; In the *cscope* buffer.
              (set-buffer marker-buffer)
              (setq marker-window (display-buffer marker-buffer))
              (set-window-point marker-window marker-point)
              (select-window marker-window))
          (switch-to-buffer marker-buffer))
      (error "The marked buffer has been deleted"))
    (goto-char marker-point)
    (set-buffer old-buffer)))


(defun my-cscope-next-marker ()
  "go to the next(newer) visited mark"
  (interactive)

  ;; This function is based on pop-tag-mark, which can be found in
  ;; lisp/progmodes/etags.el.

  (if (ring-empty-p cscope-marker-ring)
      (error "There are No marked buffers in the cscope-marker-ring yet"))

  (if (zerop my-cscope-marker-pos)
      (error "Most recent marker reached. Can't forward."))

  (if (= my-cscope-marker-pos (ring-length cscope-marker-ring))
      (setq my-cscope-marker-pos (- my-cscope-marker-pos 2))
    (setq my-cscope-marker-pos (1- my-cscope-marker-pos)))

  (let* ( (marker (ring-ref cscope-marker-ring my-cscope-marker-pos))
          (old-buffer (current-buffer))
          (marker-buffer (marker-buffer marker))
          marker-window
          (marker-point (marker-position marker))
          (cscope-buffer (get-buffer cscope-output-buffer-name)) )

    ;; After the following both cscope-marker-ring and cscope-marker will be
    ;; in the state they were immediately after the last search.  This way if
    ;; the user now makes a selection in the previously generated *cscope*
    ;; buffer things will behave the same way as if that selection had been
    ;; made immediately after the last search.
    (setq cscope-marker marker)
    (if marker-buffer
        (if (eq old-buffer cscope-buffer)
            (progn ;; In the *cscope* buffer.
              (set-buffer marker-buffer)
              (setq marker-window (display-buffer marker-buffer))
              (set-window-point marker-window marker-point)
              (select-window marker-window))
          (switch-to-buffer marker-buffer))
      (error "The marked buffer has been deleted"))
    (goto-char marker-point)
    (set-buffer old-buffer)))

;;这个可以自己设置
;; (global-set-key (kbd "<f6>") 'my-cscope-previous-marker)
;; (global-set-key (kbd "<f7>") 'my-cscope-next-marker)
