
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                    		("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)

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

;; 启用monokai主题
(load-theme 'monokai 1)

(require 'hungry-delete)
(global-hungry-delete-mode)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode 1)

;; 自动重载文件
(global-auto-revert-mode 1)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(require 'popwin)
(popwin-mode 1)

(abbrev-mode 1)
(define-abbrev-table 'global-abbrev-table '(
					    ("ly" "liuyao")
					    ("ns" "newshine")
					    ))



;; 单独配置中文字体
;;(dolist (charset '(kana han cjk-misc bopomofo))
;;  (set-fontset-font (frame-parameter nil 'font) charset
;;                    (font-spec :family "微软雅黑" :size 15)))

;; 配置分别配置中文和英文字体
(create-fontset-from-fontset-spec
	"-unknown-Menlo-normal-normal-normal-*-15-*-*-*-m-0-fontset-myfontset")
(set-fontset-font "fontset-myfontset" 'han "微软雅黑")
(add-to-list 'default-frame-alist '(font . "fontset-myfontset"))

;; 关闭工具栏，tool-bar-mode 即为一个Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 将open-init-file绑定到<f2>
(global-set-key (kbd "<f2>") 'open-init-file)

;; 开启全局Company补全
(global-company-mode 1)

;; 关闭自动生成备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 取消自动保存
(setq auto-save-default nil)

;; 高亮显示org-mode中的代码
(require 'org)
(setq org-src-fontify-natively t)

;; 可以激活最近打开的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 可替换选中的内容
(delete-selection-mode 1)

;; 开启是自动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 括号匹配高亮
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 高亮显示当前行
(global-hl-line-mode 1)

(setq ring-bell-function 'ignore)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-minimum-prefix-length 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


