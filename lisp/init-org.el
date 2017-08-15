(require 'org)

;; 高亮显示org-mode中的代码
(setq org-src-fontify-natively t)

;;; begin  GTD 配置

;; 配置agenda
(setq org-agenda-files '("~/.emacs.d/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; 配置capture
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/org/todo.org" "Tasks")
	 "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/.emacs.d/org/journal.org")
	 "* %?\nEntered on %U\n  %i\n  %a")))

;;;end  GTD 配置

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

(provide 'init-org)
