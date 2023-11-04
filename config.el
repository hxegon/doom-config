;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; you do not need to run 'doom sync' after modifying this file!

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

(defun set-font-size (font-size)
  "set the global font size"
  (interactive "new text size: ")
  (setq doom-font (font-spec :family "Fira Code" :size font-size :weight 'normal)
        doom-variable-pitch-font (font-spec :family "Fira Sans" :size font-size))
  (doom/reload-font))

;; Map change-font-size to space h r F
(map! :leader :desc "Set font size" :n "hrF" #'set-font-size)

;; By default, adjust font size to something suitable for my laptop screen
(setq doom-font (font-spec :family "Fira Code" :size 24 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 24))

(setq doom-theme 'doom-zenburn)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Ergonomic remappings

;; Quick jumping  to beginning / end of line
(map! :nv "H" #'evil-first-non-blank)
(map! :nv "L" #'evil-last-non-blank)

(map! :leader :desc "Window jump" :n "W" #'ace-window)

(map! :leader :desc "2 char jump" :n "-" #'avy-goto-char-2)

(map! :leader :desc "Toggle zoom mode" :n "z" #'zoom-mode)

(after! zoom (setq zoom-size '(0.618 . 0.618)))
