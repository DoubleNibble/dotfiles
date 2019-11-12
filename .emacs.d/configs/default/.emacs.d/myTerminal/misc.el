(defun mt/misc/change-line-endings-to-unix ()
  "Change line-endings of current file to utf-8-unix."
  (interactive)
  (set-buffer-file-coding-system
    'utf-8-unix))

(defun mt/misc/move-line-up ()
  "Move the current line up by one step."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun mt/misc/move-line-down ()
  "Move the current line down by one step."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(defun mt/misc/delete-word-backward ()
  "Deletes the word on the left of the cursor."
  (interactive)
  (set-mark-command nil)
  (backward-word)
  (backward-delete-char-untabify 1))

(defun mt/misc/eval-and-replace ()
  "Replace expression to the left with it's value in the current buffer."
  (interactive)
  (backward-kill-sexp)
  (prin1 (eval (read (current-kill 0)))
         (current-buffer)))

(defun mt/misc/reload-current-file ()
  "Reloads the file loaded in current buffer from the disk."
  (interactive)
  (cond (buffer-file-name (progn (find-alternate-file buffer-file-name)
                                 (message "File reloaded")))
        (t (message "You're not editing a file!"))))

(defun mt/misc/remove-formatting (text)
  "Removes formatting of the supplied text."
  (interactive "sEnter text: ")
  (kill-new text)
  (message "Formatting removed, text copied to clipboard!"))

(defun mt/misc/print-welcome-message ()
  (princ (concat "Welcome myTerminal!\n\n"
                 "Today's "
                 (format-time-string "%B %d %Y")
                 ", let's make it a productive day!"
                 "\n\n"
                 "(Started in "
                 (number-to-string (cadr (time-subtract (current-time)
                                                        mt/invokation-time)))
                 " seconds)")
         (get-buffer-create (current-buffer))))
