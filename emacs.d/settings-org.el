;; Org-mode
(eval-after-load "org" '(add-to-list 'org-agenda-files "~/notes/"))
(setq org-refile-targets '(("~/notes/main.org" :maxlevel . 3)))
(setq org-log-done 'time)
(setq org-tag-persistent-alist
      '(("@phone" . ?p)
        ("@computer" . ?c)
        ("school" . ?s)
        ("french" . ?f)
        ("english" . ?e)
        ("african" . ?a)
        ("internship" . ?i)
        ("scholarships")
        ("someday")))
