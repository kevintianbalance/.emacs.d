(setq package-archives
      '(("org" . "http://orgmode.org/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

;; Fetch packages the first time
(unless (file-exists-p package-user-dir)
    (package-refresh-contents))


(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (require 'edts-start))

;; Erlang/OTP with GTE adaptations
(setq load-path (cons "/proj/ltegte/app/gte-dev-env/emacs/elisp"
                      load-path))

(setq load-path (cons "/home/echetia/KevinTian/HomeEmacsDev/.emacs.d/elisp/edts-master/"
		      load-path))
(require 'gte)
(require 'gte-edts)

(message "Successfully loaded all the files");
