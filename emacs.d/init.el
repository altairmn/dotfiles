;; Add and enable MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; add your modules path
(add-to-list 'load-path "~/.emacs.d/custom/")

;; load your modules
(require 'setup-applications)
(require 'setup-communication)
(require 'setup-convenience)
(require 'setup-data)
(require 'setup-development)
(require 'setup-editing)
(require 'setup-environment)
(require 'setup-external)
(require 'setup-faces-and-ui)
(require 'setup-files)
(require 'setup-helm)
(require 'setup-help)
(require 'setup-programming)
(require 'setup-text)
(require 'setup-local)

;; modalka
(require 'modalka)
(require 'setup-modalka)

(mapc 'load (directory-files "~/.emacs.d/custom" t ".*\.el"))
