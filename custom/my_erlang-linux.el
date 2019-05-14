;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; erlang
;; D   README                1888  Org								c:/KevinTian/Program/erl5.9.1/lib/tools-2.6.7/emacs/README

(setq load-path (cons  "/home/echetia/KevinTian/bin/otp_bin_19.3/lib/erlang/lib/tools-2.9.1/emacs/"
											 load-path))
(setq erlang-root-dir "/home/echetia/KevinTian/bin/otp_bin_19.3/lib/erlang")
(setq exec-path (cons "/home/echetia/KevinTian/bin/otp_bin_19.3/lib/erlang/bin" exec-path))
(require 'erlang-start)
;; have not been tested
;; (require 'erlang-flymake)
;; ../../bin/otp_bin_19.3/lib/erlang/lib/tools-2.9.1/emacs/erlang-flymake.el: `flet' is an obsolete macro (as of 24.3); use either ;; cl-flet' or cl-letf'.
