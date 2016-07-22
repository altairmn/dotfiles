;; GROUP Editing -> Editing Basics
(setq global-mark-ring-max 5000
      mark-ring-max 5000
      mode-require-final-newline t
      )

;; default to 4 visible spaces to display tab
(setq-default tab-width 4)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq-default indent-tabs-mode t)
(delete-selection-mode)

;; newline and indent
(global-set-key (kbd "RET") 'newline-and-indent)
;(define-key 'org-mode-map (kbd "RET") 'newline-and-indent)   ; org needs special treatment

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: Org-Mode          ;;
;;                            ;;
;; GROUP: Editing -> Org-Mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun org-add-keymap()
  (define-key org-mode-map (kbd "RET") 'newline-and-indent))

(add-hook 'org-mode-hook 'org-add-keymap)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: volatile-highlights          ;;
;;                                       ;;
;; GROUP: Editing -> Volatile Highlights ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'volatile-highlights)
(volatile-highlights-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: smartparens          ;;
;;                               ;;
;; GROUP: Editing -> Smartparens ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)


(provide 'setup-editing)
