(defvar myTerminal/key-bindings
  '(("C-~" myTerminal/set-zoning nil)
    ("C-!" zone-leave-me-alone nil)
    ("C-x C-b" ibuffer nil)
    ("C-:" nlinum-mode nil)
    ("C-}" mc/mark-next-like-this nil)
    ("C-{" mc/mark-previous-like-this nil)
    ("C-|" mc/mark-all-like-this nil)
    ("C->" ace-jump-mode nil)
    ("C-<" ace-jump-mode-pop-mark nil)
    ("M-/" undo-tree-visualize nil)
    ("C-\," neotree-toggle nil)
    ("C-x p" projectile-mode nil)
    ("C-c p s f" projectile-find-all-occurrences nil)
    ("C-c p s r" projectile-find-all-references nil)
    ("C-\\" wg-switch-to-previous-workgroup nil)
    ("C-\"" theme-looper-enable-next-theme nil)
    ("C-M-'" myterminal-controls-open-controls nil)
    ("C-c C-SPC" outer-spaces-mode nil)
    ("C-*" eagle-eye-mode nil)
    ("M-<down>" myTerminal/move-line-down nil)
    ("M-<up>" myTerminal/move-line-up nil)
    ("C-=" myTerminal/eval-and-replace nil)
    ("C-c c M-x" execute-extended-command nil)
    ("C-S-<up>" buf-move-up nil)
    ("C-S-<down>" buf-move-down nil)
    ("C-S-<left>" buf-move-left nil)
    ("C-S-<right>" buf-move-right nil)
    ("<f5>" myTerminal/reload-current-file nil)
    ("C-x C-/" halal-mode nil)
    ("C-x C-\\" myTerminal/progress-to-full-mode nil)
    ("C-;" emacs-home-show t)
    ("C-M-)" transparency-increase t)
    ("C-M-(" transparency-decrease t)
    ("C-c M-x" smex t)
    ("M-x" counsel-M-x t)
    ("C-x b" ivy-switch-buffer t)
    ("C-x C-r" counsel-recentf t)
    ("C-x C-f" counsel-find-file t)
    ("M-S" swiper t)
    ("M-y" counsel-yank-pop)
    ("C-M-z" switch-window t)
    ("C-x C-|" indent-guide-mode t)
    ("C-x C-g" myTerminal/dismiss-jabber-notification t)))

(defvar myTerminal/temp-bindings
  '(("M-x" execute-extended-command nil)
    ("C-x b" switch-to-buffer nil)
    ("C-x C-f" find-file nil)))

(defun myTerminal/define-basic-mode-keyboard-bindings ()
  (mapc (lambda (item)
          (if (nth 2 item)
              (myTerminal/apply-keyboard-bindings (cons (car item)
                                                        'myTerminal/prompt-for-full-mode))
            (myTerminal/apply-keyboard-bindings (cons (car item)
                                                      (nth 1 item)))))
        (append myTerminal/key-bindings
                myTerminal/temp-bindings)))

(defun myTerminal/define-full-mode-keyboard-bindings ()
  (mapc (lambda (item)
          (myTerminal/apply-keyboard-bindings (cons (car item)
                                                        (nth 1 item))))
        myTerminal/key-bindings))

(defun myTerminal/apply-keyboard-bindings (pair)
    (global-set-key (kbd (car pair))
                    (cdr pair)))
