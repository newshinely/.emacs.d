;; swiper 快捷键
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; 将open-init-file绑定到<f2>
(global-set-key (kbd "<f2>") 'open-init-file)

;; 最近打开的文件
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 查找本git仓库中的文件
(global-set-key (kbd "C-c p f") 'counsel-git)

;; 打开agenda 的快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;; 格式化快捷键
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; Hippie补全快捷键
(global-set-key (kbd "C-c C-/") 'hippie-expand)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'init-keybindings)
