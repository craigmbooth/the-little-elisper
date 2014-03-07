;; Chapter 7. Friends and Relations
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;
(add-to-list 'load-path ".")
(load "chapter7.el")

(message "%s" (setp '(apple peaches apple plum)))      ;nil
(message "%s" (setp '(apples peaches pears plums)))    ;t
(message "%s" (setp '()))                              ;t
(message "%s" (setp '(apple 3 pear 4 9 apple 3 4)))    ;nil

;(pear plum apple lemon peach)
(message "%s"
    (makeset_nr '(apple peach pear peach plum apple lemon peach)))

;(apple peach pear plum lemon)
(message "%s"
    (makeset '(apple peach pear peach plum apple lemon peach)))
