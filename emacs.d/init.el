(require 'cl)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;;; Evil Mode
(require 'evil)
(evil-mode 1)

;;; Customization

 ;; color
 (set-background-color "black")
 (set-foreground-color "wheat")

 ;; behaviour
 (blink-cursor-mode -1) ; stop blinking
 (menu-bar-mode 0)      ; hide menu bar
 (tool-bar-mode 0)      ; hide tool bar
 (show-paren-mode 1)    ; show matching parens

 ;; indentation



;;; Org mode

(global-set-key (kbd "C-c o")
		(lambda () (interactive) (find-file "~/organizer.org")))

