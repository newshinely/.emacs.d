;; 去掉警告提示音
(setq ring-bell-function 'ignore)

;; 显示行号
(global-linum-mode 1)

;; 自动重载文件
(global-auto-revert-mode 1)

;; 关闭自动生成备份文件
(setq make-backup-files nil)

;; 取消自动保存
(setq auto-save-default nil)

;; 可以激活最近打开的文件
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; 括号匹配高亮
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 自定义缩写
(setq-default abbrev-mode 1)
(define-abbrev-table 'global-abbrev-table '(
					    ("ly" "liuyao")
					    ("ns" "newshine")
					    ))

;; 可替换选中的内容
(delete-selection-mode 1)

;; 格式化选中的代码或者格式化整个buffer
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

;; 用Hippie Expand来补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

(fset 'yes-or-no-p 'y-or-n-p)

;; 总是递归删除和复制，不再询问
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 总是只有一个dired buffer
(put 'dired-find-alternate-file 'disabled nil)

;; 可以打开当前文件的dired mode
(require 'dired-x)

;; 两个dired mode快捷copy
(setq dired-dwim-target t)

(provide 'init-better-defaults)
