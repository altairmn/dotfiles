(provide 'setup-modalka)

;; modalka-mode hook
(defun disable-modalka-mode ()
  (modalka-mode -1))
(defun enable-modalka-mode ()
  (modalka-mode +1))

(defun modalka-text-mode ()
  (enable-modalka-mode)
  (define-key 'text-mode-map (kbd "ESC") 'disable-modalka-mode))
(defun modalka-prog-mode ()
  (enable-modalka-mode)
  (define-key 'prog-mode-map (kbd "ESC") 'disable-modalka-mode))

;; enabled modes
(add-hook 'text-mode-hook 'modalka-text-mode)
(add-hook 'prog-mode'hook 'modalka-prog-mode)

;; cursor type
(setq-default cursor-type '(bar . 1))
(setq modalka-cursor-type 'box)

;; keybindings
(modalka-define-kbd "h" "C-b") ; backward
(modalka-define-kbd "l" "C-f") ; forward
(modalka-define-kbd "j" "C-n") ; down
(modalka-define-kbd "k" "C-p") ; up
(modalka-define-kbd "SPC" "C-SPC")
(modalka-define-kbd "D" "C-k") ; kill till end


(defun modalka-end-of-line-edit ()
  (call-interactively move-end-of-line)
  (modalka-mode -1))
(modalka-define-key (kbd "A") 'modalka-end-of-line-edit)
(modalka-define-key (kbd "i") 'disable-modalka-mode)

