(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(defun forward-window (count)
  "Moves cursor to the next window according to next-window."
  (interactive "p")
  (other-window count))

(defun backward-window (count)
  "Moves cursor to the previous window according to next-window"
  (interactive "p")
  (other-window (- count)))


;; Behave like vi's o command
(defun open-next-line (arg)
  "Move to the next line and then opens a line."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (forward-line 1)
  (indent-according-to-mode))

;; Behave like vi's O command
(defun open-previous-line (arg)
  "Open a new line before the current one. "
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (indent-according-to-mode))

(defun my-javadoc-return ()
    "Advanced `newline' command for Javadoc multiline comments.   
Insert a `*' at the beggining of the new line if inside of a comment."
    (interactive "*")
    (let* ((last (point))
           (is-inside
            (if (search-backward "*/" nil t)
                ;; there are some comment endings - search forward
                (search-forward "/*" last t)
              ;; it's the only comment - search backward
              (goto-char last)
              (search-backward "/*" nil t))))

      ;; go to last char position
      (goto-char last)

      ;; the point is inside some comment, insert `*'
      (if is-inside
          (progn
            (newline-and-indent)
            (insert "*"))
        ;; else insert only new-line
        (newline-and-indent))))

(defun comment-eclipse ()
  (interactive)
  (let ((start (line-beginning-position))
        (end (line-end-position)))
    (when (region-active-p)
      (setq start (save-excursion
                    (goto-char (region-beginning))
                    (beginning-of-line)
                    (point))
            end (save-excursion
                  (goto-char (region-end))
                  (end-of-line)
                  (point))))
    (comment-or-uncomment-region start end)))


(provide 'erreina-fns)
