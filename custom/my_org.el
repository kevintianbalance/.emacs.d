
;;;;;;;;;;;;;;;;;;;;
;; set org-mode
;; //Kevin Tian: should firstly delete old version org.el in C:\emacs-22.2\lisp\textmodes
;; issue 2014_05_19_144742: org-export-generic can not use eclude
;; (setq load-path (append load-path (list "~/elisp/org-6.36c/lisp/")))
;; org-7.9.3d fn is slow!
;; (setq load-path (append load-path (list "~/elisp/org-7.9.3d/lisp/")))
;; (setq load-path (append load-path (list "~/elisp/org-8.2.6/lisp/")))
(setq load-path (append load-path (list "~/elisp/org-8.2.8/lisp/")))
;; 8.3.4 have conflict with org-export to wiki
;; (setq load-path (append load-path (list "~/elisp/org-8.3.4/lisp/")))

(require 'org-install) ;; could not load file

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-log-done t)


(global-font-lock-mode 1)

;; (defadvice org-agenda-to-appt (before wickedcool activate)
;;   "Clear the appt-time-msg-list."
;;   (setq appt-time-msg-list nil))

;; (org-agenda-to-appt)

;; 2010_08_27
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i!)" "HANGUP(h!)" "|" "DONE(d!)" "CANCEL(c!)")))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Org-Drill
;; ;; anki like sys
;; (setq load-path (append load-path (list "~/elisp/org-6.36c/contrib/lisp/")))
;; ;; (setq load-path (append load-path (list "~/elisp/org-7.9.3d/contrib/lisp/")))
;; (require 'org-drill)


;; 2013_12_23_111726
;; open abbrev
(add-hook 'org-mode-hook 'abbrev-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2014_05_19_142932
;; selective export
;; (setq org-export-select-tags "AAA");
;; ; default is :noexport:
;; (setq org-export-exclude-tags "noexclude");
;; can only hide unchanged timestamp 
;; CAN NOT: <2015-03-09 Mon 13:30> Test
;; CAN: <2015-03-09 Mon> 

(setq org-export-time-stamp-file nil)



;; ;; 2014_05_19_140718
;; ;; set export generic
;; (org-set-generic-type
;;  "really-basic-text" 
;;  '(:file-suffix     ".txt"
;; 		    :key-binding     ?R
;; 		    :title-format "=== %s ===\n"
;; 		    :body-header-section-numbers t
;; 		    :body-header-section-number-format "%s) "
;; 		    :body-section-header-prefix  "\n"
;; 		    :body-section-header-suffix "\n"
;; 		    :body-line-format "  %s\n"
;; 		    :body-line-wrap   75
;; 		    ))


;; (org-set-generic-type
;;  "really-basic-html" 
;;   :file-suffix     ".html"

;;   ;; simple html output
;;   :file-suffix                   ".html"
;;   :key-binding                   ?h

;;   :header-prefix             "<body>"

;;   :title-format              "<h1>%s</h1>\n\n"

;;   :date-export                   t
;;   :date-format               "<br /><b>Date:</b> <i>%s</i><br />\n\n"

;;   :toc-export                nil

;;   :body-header-section-numbers 3

;;   :body-section-header-prefix  ("<h1>" "<h2>" "<h3>"
;;                                 "<h4>" "<h5>" "<h6>")
;;   :body-section-header-format  "%s"
;;   :body-section-header-suffix  ("</h1>\n" "</h2>\n" "</h3>\n"
;;                                 "</h4>\n" "</h5>\n" "</h6>\n")

;;   :body-section-prefix         "<secprefix>\n"
;;   :body-section-suffix         "</secsuffix>\n"
;;   ;        :body-section-prefix         ("<sec1>\n" "<sec2>\n" "<sec3>\n")
;;   ;        :body-section-suffix         ("</sec1>\n" "</sec2>\n" "</sec3>\n")

;;   :body-line-export-preformated t
;;   :body-line-format             "%s\n"

;;   :body-text-prefix "<p>\n"
;;   :body-text-suffix "</p>\n"

;;   :body-bullet-list-prefix      (?* ?+ ?-)
;;   ;        :body-bullet-list-suffix      (?* ?+ ?-)
;;   )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Latex config conflict with org-8
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; auctex 2011_03_29
;; ;; (setq load-path (append load-path (list "~/elisp/auctex-11.85/")))
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)

;; (require 'tex-mik)

;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)
;; (setq TeX-PDF-mode t)
;; ;; probably take effect
;; (setq-default org-export-latex-sectioning-depth 12)
;; (setq-default org-export-latex-add-level 12)
;; ;; org-export-headline-levels take real effect
;; (setq-default org-export-headline-levels 12)

;; ;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq reftex-plug-into-AUCTeX t)


;; ;; setting Latex
;; (require 'org-latex)
;; (unless (boundp 'org-export-latex-classes)
;;   (setq org-export-latex-classes nil))
;; ;; (add-to-list 'org-export-latex-classes
;; ;;              '("article"
;; ;;                "\\documentclass{article}"
;; ;;                ("\\section{%s}" . "\\section*{%s}")))  

;; ;; ;; classic configuration
;; ;; (add-to-list 'org-export-latex-classes
;; ;;              '("article"
;; ;;                "\\documentclass{article}"
;; ;;                ("\\section{%s}" . "\\section*{%s}")
;; ;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;; ;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;; ;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;; ;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; ;; Kevin Tian modify for personal usage
;; ;; (add-to-list 'org-export-latex-classes
;; ;;              '("article"
;; ;;                "\\documentclass{article}"
;; ;;                ("\\section{%s}" . "\\section*{%s}")
;; ;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;; ;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;; ;;                ("\\subsubsubsection{%s}" . "\\subsubsubsection*{%s}")
;; ;;                ("\\subsubsubsubsection{%s}" . "\\subsubsubsubsection*{%s}")
;; ;;                ("\\subsubsubsubsubsection{%s}" . "\\subsubsubsubsubsection*{%s}")
;; ;;                ("\\subsubsubsubsubsubsection{%s}" . "\\subsubsubsubsubsubsection*{%s}")
;; ;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;; ;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; (add-to-list 'org-export-latex-classes
;; 			 '("koma-article"
;; 			                  "\\documentclass{article}"
;; 			                  ("\\section{%s}" . "\\section*{%s}")))  




;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; LaTex
;; ;; 2012_05_07
;; (add-hook
;;  'LaTeX-mode-hook
;;  'turn-on-reftex)
;; (setq reftex-plug-into-AUCTeX
;; 			t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org config move from my eval
;; org-export
(setq org-footnote-define-inline nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-tree-slide.el
;; (require 'org-tree-slide)
;; (org-tree-slide-simple-profile))
;; (org-tree-slide-presentation-profile)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Date: 2015_01_12_152506
;; ;; Content:  mpg123 can not used for pomodoro
;; ;; only ticking sound take effect, and not stop, halt at 00:01
;; (setq org-pomodoro-play-sounds t)
;; (setq org-pomodoro-play-ticking-sounds t)
;; (setq org-pomodoro-sound-args t)
;; (setq org-pomodoro-killed-sound t)
;; (setq org-pomodoro-short-break-sound-args t)
;; (setq org-pomodoro-long-break-sound-args t)
;; ;; bug, tick can not be stopped for mplayer, and many mplay instances

;; ;; (setq org-pomodoro-audio-player "mpg123")
;; ;; (setq org-pomodoro-audio-player "C:/TaurusEmacs/HomeEmacs24Win/bin/mpg123")
;; (setq org-pomodoro-audio-player "C:/TaurusEmacs/HomeEmacs24Win/bin/MPlayer-1.0rc2/mplayer")






;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; MobileOrg
;; ;; 2013_11_20_165807
;; ;; Set to the location of your Org files on your local system
;; ;; (setq org-directory "~/Dropbox/Apps/MobileOrg")
;; (setq org-directory "c:/KevinTian/Document/")

;; ;; Set to the name of the file where new notes will be stored
;; (setq org-mobile-inbox-for-pull "~/org/flagged.org")

;; ;; Set to <your Dropbox root directory>/MobileOrg.
;; (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; ;; (setq org-mobile-files (quote ("c:/KevinTian/Document/Job.txt" "c:/KevinTian/Document/Shopping.txt" "c:/KevinTian/Document/DocServer/MR863PdcchPowerBoast.txt" "c:/KevinTian/Document/Health.txt" "c:/KevinTian/Document/Book.txt" "c:/KevinTian/Document/ToDo.txt" "c:/KevinTian/Document/DocServer/ENC.txt" "c:/KevinTian/Document/DocServer/Tool.txt" "c:/KevinTian/Document/Living.txt")))

;; ;; (setq org-mobile-files (quote ("c:/KevinTian/Document/OrgMobile.txt" 
;; ;; 			       "c:/KevinTian/Document/DocServer/FtGit.txt"
;; ;; 			       "c:/KevinTian/Document/orgmobile2.txt")))


;; ;; from http://sachachua.com/blog/?s=MobileOrg#post-21973
;; (setq default-buffer-file-coding-system 'utf-8)
;; (setq org-mobile-agendas '("a"))

;; ;; 60 -> 120
;; ;; 15 * 60, means second 15 minutes
;; ;; (run-with-timer 0 (* 15 120) 'org-mobile-push)
;; ;; (run-with-timer 0 (* 17 120) 'org-mobile-pull)

;; ;; (run-with-timer 0 (* 120 60) 'org-mobile-push)
;; ;; (run-with-timer 0 (* 121 60) 'org-mobile-pull)


;;;;;;;; Speed up org agenda
;; 2014_10_17_085828

(setq org-agenda-dim-blocked-tasks t)

(setq org-agenda-inhibit-startup t)


;;;;;;;;;;;;;;;;;;;;;
;; Kevin Tian: org check box export
;; http://sachachua.com/blog/2014/03/emacs-tweaks-export-org-checkboxes-using-utf-8-symbols/  
(defun sacha/org-html-checkbox (checkbox)
  "Format CHECKBOX into HTML."
  (case checkbox (on "<span class=\"check\">&#x2611;</span>") ; checkbox (checked)
        (off "<span class=\"checkbox\">&#x2610;</span>")
        (trans "<code>[-]</code>")
        (t "")))
(defadvice org-html-checkbox (around sacha activate)
  (setq ad-return-value (sacha/org-html-checkbox (ad-get-arg 0))))

;;;;;;
;; avoid wrap break when export html!
(setq org-export-preserve-breaks t)
