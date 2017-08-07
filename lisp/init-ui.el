;; 关闭工具栏，tool-bar-mode 即为一个Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 更改光标的样式
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 开启是自动全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 高亮显示当前行
(global-hl-line-mode 1)

(provide 'init-ui)