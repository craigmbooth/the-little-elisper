;; Chapter 4. Numbers Games
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;
;; zero? should be translated to zerop in Emacs lisp.

;;To match the book, just define the functions that add and subtract 1
(defun add1 (x) (+ x 1))
(defun sub1 (x) (- x 1))
