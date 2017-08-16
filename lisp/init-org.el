(require 'org)

;; 高亮显示org-mode中的代码
(setq org-src-fontify-natively t)

;;; begin  GTD 配置

;; 配置agenda
(setq org-agenda-files '("~/.emacs.d/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; 配置 capture 
(global-set-key (kbd "C-c c") 'org-capture)
;; 配置 capture 的文件
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/org/todo.org" "Tasks")
	 "* TODO %?\n SCHEDULED: <%<%Y-%m-%d %a %H:%M>>")
        ("j" "Journal" entry (file+datetree "~/.emacs.d/org/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")))

;; 配置 TODO 关键字
(setq org-todo-keywords
           '((sequence "TODO(t)" "|" "DONE(d!)")
             (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
             (sequence "|" "CANCELED(c@/!)")))

(setq org-tag-alist '((:startgroup . nil)
                      ("@Office" . ?o)
		      ("@Home" . ?h)
                      (:endgroup . nil)
                      ("Call" . ?c)
		      ("Email" . ?e)))
;;; end  GTD 配置

;; test code
;; (org-remember-insinuate)
;; (setq org-directory "~/Documents/Dropbox/0.GTD/")
;; (setq org-remember-templates
;;       '(("New" ?n "* %? %t \n %i\n %a" "~/Documents/Dropbox/0.GTD/inbox.org" )
;;	("Task" ?t "** TODO %?\n %i\n %a" "~/Documents/Dropbox/0.GTD/task.org" "Tasks")
;;	("Calendar" ?c "** TODO %?\n %i\n %a" "~/Documents/Dropbox/0.GTD/task.org" "Tasks")
;;	("Idea" ?i "** %?\n %i\n %a" "~/Documents/Dropbox/0.GTD/task.org" "Ideas")
;;	("Note" ?r "* %?\n %i\n %a" "~/Documents/Dropbox/0.GTD/note.org" )
;;	("Project" ?p "** %?\n %i\n %a" "~/Documents/Dropbox/0.GTD/project.org" %g) ))
;; (setq org-default-notes-file (concat org-directory "/inbox.org"))

;; 配置 TODO 关键字的样式
;; (setq org-todo-keyword-faces
;;       '(("word" . (:background "red" :foreground "white" :weight bold))
;; 	("stady" . (:background "white" :foreground "red" :weight bold))
;; 	("xiuxian" . (:foreground "MediumBlue" :weight bold))
;; 	("PENDING" . (:background "LightGreen" :foreground "gray" :weight bold))
;; 	("TODO" . (:background "DarkOrange" :foreground "black" :weight bold))
;; 	("DONE" . (:background "azure" :foreground "Darkgreen" :weight bold))
;; 	("ABORT" . (:background "gray" :foreground "black")) ))

(provide 'init-org)
