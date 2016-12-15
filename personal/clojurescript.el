(defun figwheel-repl ()
  (interactive)
  (run-clojure "lein figwheel"))

(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)

;; Install code completion and enable it globally

;; Must go into Terminal Key Profile and setup:
;; C-S-Left ESC [1;6D
;; C-S-Right ESC [1;6C    ]]
(when (eq system-type 'darwin)
  (eval-after-load 'paredit
    '(progn
       ;; C-left
       (define-key paredit-mode-map (kbd "M-[ 5 d")
         'paredit-forward-barf-sexp)
       ;; C-right
       (define-key paredit-mode-map (kbd "M-[ 5 c")
         'paredit-forward-slurp-sexp)
       ;; ESC-C-left
       (define-key paredit-mode-map (kbd "ESC M-[ 5 d")
         'paredit-backward-slurp-sexp)
       ;; ESC-C-right
       (define-key paredit-mode-map (kbd "ESC M-[ 5 c")
         'paredit-backward-barf-sexp)
       )))

(require 'cider)
(setq cider-cljs-lein-repl
      "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")
