;15.如何插入当前时间?
;   一个例子：
;; (defun my-insert-date ()
;;   (interactive)
;;   (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))

(defun my-insert-date()
  (interactive)
  (insert (format-time-string "%Y_%m_%d_%H%M%S" (current-time))))

(defun my-insert-time()
  (interactive)
  (insert (format-time-string "%H:%M" (current-time))))


;; 20090423 Function for close all buffers
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; start max windows, not take effect
(defun w32-restore-frame (&optional arg)

    "Restore a minimized frame"

     (interactive)

     (w32-send-sys-command 61728 arg))

(defun w32-maximize-frame (&optional arg)

    "Maximize the current frame"

     (interactive)

     (w32-send-sys-command 61488 arg))


(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my-remove-outline-marks()
;; Comment: remove all the outline mark
(defun my-remove-outline-marks()
  "Remove section header marks created in outline-mode."
  (interactive)
  (replace-regexp "^\\*+" ""))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my-count-word-buffer()
(defun my-count-words-buffer()
  "Count the number of words in the current buffer;
  print a message in the minibuffer with the result."
  (interactive)
  (save-excursion
	(let ((count 0))
	  (goto-char(point-min))
	  (while (< (point)(point-max))
		(forward-word 1)
		(setq count(1+ count)))
	  (message "buffer contains %d words." count))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; define func muse
(defun my-insert-anchor()
  (interactive)
  (muse-publishing-directive "anchor"))

;; ;;;;;;;;;;;;;;;;;;;;
;; ;; define insert [Kevin Tian]
;; (defun my-insert-comment()
;;   (interactive)
;;   (insert (format-time-string "[Kevin Tian]" (current-time))))

;;;;;;;;;;;;;;;;;;;;
;; define insert [Kevin Tian]
(defun my-insert-comment()
  (interactive)
  (insert (format-time-string "//Kevin Tian: " (current-time))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;
;; //Kevin Tian: my-add-code
(defun my-add-code()
  (interactive)
;;   (insert (format-time-string "    //Kevin Tian: BEGIN, Sprint16A S1 MultiRab User Plane, %Y_%m_%d" (current-time)))
;;  (insert (format-time-string "    //Kevin Tian: BEGIN, Step3 Start UP, eth configuration, %Y_%m_%d" (current-time)))
;;  (insert (format-time-string "  //MR3821 Advanced Subscriber Group Handling, BEGIN, %Y_%m_%d" (current-time)))
;;  (insert (format-time-string "  // MR4776 SP5, ASGH based RRC state handling for VoLTE, BEGIN, %Y_%m_%d" (current-time)))
 (insert (format-time-string "  //MR5632, TDD massive mimo: DMRS based DL SU-MIMO, BEGIN, %Y_%m_%d" (current-time)))
  (insert (format-time-string "\n" (current-time)))
  (insert (format-time-string "  //MR5632 SP5, END\n" (current-time)))
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; (insert (format-time-string "  // MR4286 Improved VoLTE retainability by limiting RRC signalling, BEGIN, %Y_%m_%d" (current-time))) ;;
  ;; (insert (format-time-string "\n" (current-time)))                                                                                   ;;
  ;; (insert (format-time-string "  //MR4286, END\n" (current-time)))                                                                    ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
)

;;;;;;;;;;;;;;;;;;;;
;; //Kevin Tian: my-modify-code
(defun my-modify-code()
  (interactive)
  (insert (format-time-string "    //Kevin Tian: BEGIN, modify for P3MD EUL, 3/190 24-20/FCP 121 2488/03, %Y_%m_%d" (current-time)))
  (insert (format-time-string "\n" (current-time)))
  (insert (format-time-string "    //Kevin Tian: END, modify for P3MD EUL" (current-time)))
)


;; define my-insert-subtitle 
;; "****** %Y_%m_%d "
(defun my-insert-subtitle ()
  (interactive)
  (insert (format-time-string "*** \n<%Y-%m-%d %H:%M> " (current-time))))

;; 39.7 Parsing and Formatting Times

;; These functions convert time values to text in a string, and vice versa. Time values are lists of two to four integers (see Time of Day).

;; — Function: date-to-time string
;; This function parses the time-string string and returns the corresponding time value.

;; — Function: format-time-string format-string &optional time universal
;; This function converts time (or the current time, if time is omitted) to a string according to format-string. The argument format-string may contain ‘%’-sequences which say to substitute parts of the time. Here is a table of what the ‘%’-sequences mean:

;; ‘%a’
;; This stands for the abbreviated name of the day of week. 
;; ‘%A’
;; This stands for the full name of the day of week. 
;; ‘%b’
;; This stands for the abbreviated name of the month. 
;; ‘%B’
;; This stands for the full name of the month. 
;; ‘%c’
;; This is a synonym for ‘%x %X’. 
;; ‘%C’
;; This has a locale-specific meaning. In the default locale (named C), it is equivalent to ‘%A, %B %e, %Y’. 
;; ‘%d’
;; This stands for the day of month, zero-padded. 
;; ‘%D’
;; This is a synonym for ‘%m/%d/%y’. 
;; ‘%e’
;; This stands for the day of month, blank-padded. 
;; ‘%h’
;; This is a synonym for ‘%b’. 
;; ‘%H’
;; This stands for the hour (00–23). 
;; ‘%I’
;; This stands for the hour (01–12). 
;; ‘%j’
;; This stands for the day of the year (001–366). 
;; ‘%k’
;; This stands for the hour (0–23), blank padded. 
;; ‘%l’
;; This stands for the hour (1–12), blank padded. 
;; ‘%m’
;; This stands for the month (01–12). 
;; ‘%M’
;; This stands for the minute (00–59). 
;; ‘%n’
;; This stands for a newline. 
;; ‘%N’
;; This stands for the nanoseconds (000000000–999999999). To ask for fewer digits, use ‘%3N’ for milliseconds, ‘%6N’ for microseconds, etc. Any excess digits are discarded, without rounding. 
;; ‘%p’
;; This stands for ‘AM’ or ‘PM’, as appropriate. 
;; ‘%r’
;; This is a synonym for ‘%I:%M:%S %p’. 
;; ‘%R’
;; This is a synonym for ‘%H:%M’. 
;; ‘%S’
;; This stands for the seconds (00–59). 
;; ‘%t’
;; This stands for a tab character. 
;; ‘%T’
;; This is a synonym for ‘%H:%M:%S’. 
;; ‘%U’
;; This stands for the week of the year (01–52), assuming that weeks start on Sunday. 
;; ‘%w’
;; This stands for the numeric day of week (0–6). Sunday is day 0. 
;; ‘%W’
;; This stands for the week of the year (01–52), assuming that weeks start on Monday. 
;; ‘%x’
;; This has a locale-specific meaning. In the default locale (named ‘C’), it is equivalent to ‘%D’. 
;; ‘%X’
;; This has a locale-specific meaning. In the default locale (named ‘C’), it is equivalent to ‘%T’. 
;; ‘%y’
;; This stands for the year without century (00–99). 
;; ‘%Y’
;; This stands for the year with century. 
;; ‘%Z’
;; This stands for the time zone abbreviation (e.g., ‘EST’). 
;; ‘%z’
;; This stands for the time zone numerical offset (e.g., ‘-0500’).
;; You can also specify the field width and type of padding for any of these ‘%’-sequences. This works as in printf: you write the field width as digits in the middle of a ‘%’-sequences. If you start the field width with ‘0’, it means to pad with zeros. If you start the field width with ‘_’, it means to pad with spaces.

;; For example, ‘%S’ specifies the number of seconds since the minute; ‘%03S’ means to pad this with zeros to 3 positions, ‘%_3S’ to pad with spaces to 3 positions. Plain ‘%3S’ pads with zeros, because that is how ‘%S’ normally pads to two positions.

;; The characters ‘E’ and ‘O’ act as modifiers when used between ‘%’ and one of the letters in the table above. ‘E’ specifies using the current locale's “alternative” version of the date and time. In a Japanese locale, for example, %Ex might yield a date format based on the Japanese Emperors' reigns. ‘E’ is allowed in ‘%Ec’, ‘%EC’, ‘%Ex’, ‘%EX’, ‘%Ey’, and ‘%EY’.

;; ‘O’ means to use the current locale's “alternative” representation of numbers, instead of the ordinary decimal digits. This is allowed with most letters, all the ones that output numbers.

;; If universal is non-nil, that means to describe the time as Universal Time; nil means describe it using what Emacs believes is the local time zone (see current-time-zone).

;; This function uses the C library function strftime (see Formatting Calendar Time) to do most of the work. In order to communicate with that function, it first encodes its argument using the coding system specified by locale-coding-system (see Locales); after strftime returns the resulting string, format-time-string decodes the string using that same coding system.

;; — Function: seconds-to-time seconds
;; This function converts seconds, a floating point number of seconds since the epoch, to a time value and returns that. To perform the inverse conversion, use float-time.

;; — Function: format-seconds format-string seconds
;; This function converts its argument seconds into a string of years, days, hours, etc., according to format-string. The argument format-string may contain ‘%’-sequences which control the conversion. Here is a table of what the ‘%’-sequences mean:

;; ‘%y’
;; ‘%Y’
;; The integer number of 365-day years. 
;; ‘%d’
;; ‘%D’
;; The integer number of days. 
;; ‘%h’
;; ‘%H’
;; The integer number of hours. 
;; ‘%m’
;; ‘%M’
;; The integer number of minutes. 
;; ‘%s’
;; ‘%S’
;; The integer number of seconds. 
;; ‘%z’
;; Non-printing control flag. When it is used, other specifiers must be given in the order of decreasing size, i.e., years before days, hours before minutes, etc. Nothing will be produced in the result string to the left of ‘%z’ until the first non-zero conversion is encountered. For example, the default format used by emacs-uptime (see emacs-uptime) "%Y, %D, %H, %M, %z%S" means that the number of seconds will always be produced, but years, days, hours, and minutes will only be shown if they are non-zero. 
;; ‘%%’
;; Produces a literal ‘%’.
;; Upper-case format sequences produce the units in addition to the numbers, lower-case formats produce only the numbers.

;; You can also specify the field width by following the ‘%’ with a number; shorter numbers will be padded with blanks. An optional period before the width requests zero-padding instead. For example, "%.3Y" might produce "004 years".

;; Warning: This function works only with values of seconds that don't exceed most-positive-fixnum (see most-positive-fixnum).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2010_10_11 unwrap line
(defun unwrap-line ()
      "Remove all newlines until we get to two consecutive ones.
    Or until we reach the end of the buffer.
    Great for unwrapping quotes before sending them on IRC."
      (interactive)
      (let ((start (point))
            (end (copy-marker (or (search-forward "\n\n" nil t)
                                  (point-max))))
            (fill-column (point-max)))
        (fill-region start end)
        (goto-char end)
        (newline)
        (goto-char start)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2011_01_30 remove dulplicate line
;; So for this buffer:

;; Duplicate line 1
;; Unique line 1


;; Duplicate line 1
;; Unique line 2
;; Unique line 3

;; Duplicate line 1


;; Duplicate line 2
;; Duplicate line 2
;; Unique line 4


;; Running ‘M-x uniquify-all-lines-buffer’ produces:

;; Duplicate line 1
;; Unique line 1

;; Unique line 2
;; Unique line 3
;; Duplicate line 2
;; Unique line 4


  (defun uniquify-all-lines-region (start end)
    "Find duplicate lines in region START to END keeping first occurrence."
    (interactive "*r")
    (save-excursion
      (let ((end (copy-marker end)))
        (while
            (progn
              (goto-char start)
              (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
          (replace-match "\\1\n\\2")))))
  
  (defun uniquify-all-lines-buffer ()
    "Delete duplicate lines in buffer and keep first occurrence."
    (interactive "*")
    (uniquify-all-lines-region (point-min) (point-max)))

;;;;;;;;;;;;;;;;;;;;
;; define insert [Kevin Tian]
(defun my-insert-question()
  (interactive)
  (insert (format-time-string "//Kevin Tian: ??? " (current-time))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;
;; simplified-to-traditional chinease
;; http://ar.newsmth.net/thread-94c675d539da5c.html
;; http://www.stlcls.org/s-words/Simplified_word.htm
;; Bug:
;; - last char may be eat
;; - some simplified can be mapped to more than on traditional
(defun simplified-to-traditional (arg) 
  "简体中文转换为繁体中文. 
加参数为繁体中文转换为简体中文." 
  (interactive "P") 
  (let (from to buffer char point) 
    (if arg  
        (setq arg (car arg)) 
      (setq arg 0)) 

    (if (= arg 0) 
        (progn 
          (setq from "~/simplified") 
          (setq to "~/traditional")) 
      (progn  
        (setq from "~/traditional") 
        (setq to "~/simplified"))) 
    (setq buffer (buffer-name)) 

    (find-file from) 
    (find-file to) 
    (setq point 0) 

    (set-buffer buffer) 
    (goto-char (point-min)) 
    (while (re-search-forward "\\(\\cc\\)" nil t) 
      (setq char (match-string-no-properties 1)) 
      ;; 在 from 文件中找 
      (save-match-data 
        ;; open file and save a handle to the buffer 
        (set-buffer (get-file-buffer from)) 
        (goto-char (point-min)) 
        (if (re-search-forward char nil t) 
            (setq point (match-beginning 0))) 
        (bury-buffer) 
        (if (> point 0) 
            (progn  
              ;; open file and save a handle to the buffer 
              (set-buffer (get-file-buffer to)) 
              (setq char (buffer-substring point (+ point 1))) 
              (bury-buffer)))) 
      (set-buffer buffer) 
      (replace-match char) 
      (setq point 0)) 
    (kill-buffer (get-file-buffer from)) 
    (kill-buffer (get-file-buffer to)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; horizontal recenter
;; http://stackoverflow.com/questions/1249497/command-to-center-screen-horizontally-around-cursor-on-emacs
(defun my-horizontal-recenter ()
  "make the point horizontally centered in the window"
  (interactive)
  (let ((mid (/ (window-width) 2))
        (line-len (save-excursion (end-of-line) (current-column)))
        (cur (current-column)))
    (if (< mid cur)
        (set-window-hscroll (selected-window)
                            (- cur mid)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2013_07_23
;; 
(defun my-switch-to-note-other-window ()
	"switch to my note other window"
  (interactive)
	(switch-to-buffer-other-window ".scratch_work"))

(defun my-switch-to-note-shortcut-other-window ()
  "switch to my note other window"
  (interactive)
  (switch-to-buffer-other-window "Shortcut.org"))

;; 2013_11_20_162143
;; quick enter path
;; @@@@@@
(defun my_notes ()
  "Switch to my work dir."
  (interactive)
  (find-file "c:/KevinTian/Document/")
  )

;; 2015_04_01_162929
;; fix org-pomodoro bug, when check out will change the frame to emacs@SERVERNAME
(defun my-org-pomodoro ()
  "Switch to my work dir."
  (interactive)  ;; define func should use this line
  (org-pomodoro)
  (setq frame-title-format "%f - emacs24")
  )


;;;;;;;;;;;;;;;;;;;;
;; //Kevin Tian: my-add-code
(defun my-org-time-stamp()
  (insert (format-time-string "%T"))
  )

