(package-initialize)

;; 单独配置中文字体
;;(dolist (charset '(kana han cjk-misc bopomofo))
;;  (set-fontset-font (frame-parameter nil 'font) charset
;;                    (font-spec :family "微软雅黑" :size 15)))

;; 配置分别配置中文和英文字体
(create-fontset-from-fontset-spec
  "-unknown-Menlo-normal-normal-normal-*-15-*-*-*-m-0-fontset-myfontset")
(set-fontset-font "fontset-myfontset" 'han "微软雅黑")
(add-to-list 'default-frame-alist '(font . "fontset-myfontset"))

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)







