(setq prelude-guru nil)
(dolist (mode
         '(cua-mode))
  (funcall mode 1))

;;(setq default-frame-alist '((font . "-*-Inconsolata-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")))

(prelude-require-package 'aggressive-indent)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)

(menu-bar-mode -1)
