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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; color theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/sourcerer-theme-20161014.925")
;; (load-theme 'sourcerer t)

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

;; 2019-11-13
(global-auto-revert-mode t)

;;;;;;;;;;;;;;;;;;;;
;; markdown mode
(add-to-list 'load-path "~/.emacs.d/elisp/markdown-mode/");

;; ;; auto install
;; (require 'package)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; (package-initialize)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; buildifier
(defcustom buildifier-bin "buildifier"
  "Location of the buildifier binary."
  :type 'string
  :group 'buildifier)

(defcustom buildifier-path-regex
  "BUILD\\|WORKSPACE\\|BAZEL"
  "Regular expression describing base paths that need buildifier."
  :type 'string
  :group 'buildifier)

(defun buildifier ()
  "Run buildifier on current buffer."
  (interactive)
  (when (and (string-match buildifier-path-regex
                           (file-name-nondirectory
                            (buffer-file-name)))
             (executable-find buildifier-bin))
    (let ((p (point))
          (tmp (make-temp-file "buildifier")))
      (write-region nil nil tmp)
      (let ((result (with-temp-buffer
                      (cons (call-process buildifier-bin tmp t nil)
                            (buffer-string)))))
        (if (= (car result) 0)
            (save-excursion
              (erase-buffer)
              (insert (cdr result)))
          (warn "%s failed: %s" buildifier-bin (cdr result)))
        (goto-char p)
        (delete-file tmp nil)))))

(add-hook 'before-save-hook 'buildifier)

;; # FIX
;; # solve windows key + v make shift always on
;; type Win + d twice solve the problem

;; (setq frame-title-format (list "%b")) ;;list is needed here, could someone explain ?
;; list is needed in the last example to flatten the sub-lists, otherwise a quote is sufficient
;; (setq frame-title-format '("" "%b @ Emacs " emacs-version))
(setq-default frame-title-format '("E2C Emacs: %f [%m]"))
