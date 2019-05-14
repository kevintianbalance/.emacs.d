

;; set second mode auto-fill
(add-hook 'outline-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)






;; kevin: set mode combined with file type
(mapcar
(function (lambda (setting)
             (setq auto-mode-alist
                   (cons setting auto-mode-alist))))
'(("\\.xml$".  sgml-mode)
   ("\\\.bash" . sh-mode)
   ("\\.rdf$".  sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.idl$" . idl-mode)
;;   ("\\.txt$" . outline-mode) ;;kevin: added
   ("\\.txt$" .  text-mode) ;;kevin: added
   ("\\.muse$" . org-mode) ;;kevin: added
   ("\\.log$" . text-mode) ;;kevin: added
   ("\\.org$" . org-mode) ;;kevin: added
))


;; shell 中打开 ansi-color 支持。
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook 'abbrev-mode)
(add-hook 'term-mode-hook 'abbrev-mode)

;; 2012_06_12
;; for support chinese in shell
(defun my-shell-mode-hook () (set-buffer-process-coding-system 'mule-utf-8 'mule-utf-8) )

(add-hook 'shell-mode-hook 'my-shell-mode-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flyspell-mode hook
;; Emacs Tip #17: flyspell and flyspell-prog-mode
;; Being in front of the computer hasn't helped my spelling because it's so
;; easy to let the computer catch and fix the spelling errors for me. Of
;; course Emacs has spell checking (M-x spell-
;; 									 {buffer,region,string,word}), but what is really handy is spellchecking
;; as you type.
;; Enter flyspell.
;; flyspell is a minor-mode, so enabling it only causes spell-checking in
;; that buffer, so it's handy to add the hooks to turn it on for the modes
;; you deem appropriate (mail messages, text files, etc.). But wait, you do
;; most of your work programming, right? Just turn on flyspell-progmode,
;; and only your comments and strings will be checked for spelling
;; errors.
;; It has the standard installation - only the major entry point is the
;; routine 'flyspell-mode where the filename is "flyspell.el", so you
;; need to tell Emacs to look for that appropriately. Here's what I use to
;; enable flyspell and turn it on for a couple of different modes.

;; (autoload 'flyspell-mode "flyspell" "On-the-flyspelling checker." t)
;; (add-hook 'message-mode-hook 'turn-on-flyspell)
;; (add-hook 'text-mode-hook 'turn-on-flyspell)
;; (add-hook 'c-mode-common-hook 'flyspell-prog-mode)
;; (add-hook 'tcl-mode-hook 'flyspell-prog-mode)
;; (defun turn-on-flyspell ()
;;   "Force flyspell-mode on using a positive arg. For
;; use in hooks."
;;   (interactive)
;;   (flyspell-mode 1))

;; //Kevin Tian: old config just keep

(add-hook 'org-mode-hook 'outline-minor-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'c++-mode-hook 'flyspell-mode)



;; truncate-lines
;; (setq truncate-lines t) ;; should use scroll bar to see the long string
(setq truncate-lines nil) ;; wrapper the lines to show in the window
;; (toggle-truncate-lines)

(add-hook 'emacs-lisp-mode-hook 'abbrev-mode)

;; font copy from Zhao Fengyang
(global-font-lock-mode t)

(setq auto-save-mode nil)

;; hs-minor mode setting
;; hs-hide-block
;; hs-show-block
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'erlang-mode-hook 'hs-minor-mode)

(setq auto-save-interval 7200)
