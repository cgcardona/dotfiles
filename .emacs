(add-to-list 'load-path "~/.emacs.d/")
(global-linum-mode t)
(setq auto-save-default-nil)
(setq make-backup-files nil)
(add-hook 'ruby-mode-hook
  (lambda()
    (add-hook 'local-write-file-hooks
      '(lambda()
        (save-excursion
          (untabify (point-min) (point-max))
          (delete-trailing-whitespace)
          )))
    (set (make-local-variable 'indent-tabs-mode) 'nil)
    (imenu-add-to-menubar "IMENU")
    (define-key ruby-mode-map "\C-m" 'newline-and-indent) ;not sure if this line is 100% right!
    (require 'ruby-electric)
    (ruby-electric-mode t)
    ))
(add-to-list 'load-path "~/.emacs.d/evil") ; only without ELPA/el-get
(require 'evil)
(evil-mode 1)
