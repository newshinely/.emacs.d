;; cl - Common Lisp Extension
(require 'cl)

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像
(when (>= emacs-major-version 24)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; Add Packages
(defvar newshine/packages '(
			    ;; --- Auto-completion ---
			    company
			    ;; --- Better Editor ---
			    hungry-delete
			    swiper
			    counsel
			    smartparens
			    popwin
			    ;; --- Themes ---
			    monokai-theme
			    ;; solarized-theme
			    ) "Default packages")

(setq package-selected-packages newshine/packages)

(defun newshine/packages-installed-p ()
  (loop for pkg in newshine/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (newshine/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg newshine/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; (require 'hungry-delete)
(global-hungry-delete-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; 启用monokai主题
(load-theme 'monokai 1)

;; 开启全局Company补全
(global-company-mode 1)

;; 匹配括号
(smartparens-global-mode 1)

;; 列表中的mode不会配对单引号
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)
