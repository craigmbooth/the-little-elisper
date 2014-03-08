;; Chapter 7. Friends and Relations (Examples)
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

(message "%s" (subset
    '(5 chicken wings)
    '(5 hamburgers 2 pieces fried chicken and light duckling wings)))  ;t

(message "%s" (subset
    '(4 pounds of horseradish)
    '(four pounds chicken and 5 ounces horseradish)))                  ;nil

(message "%s" (eqset '(6 large chickens with wings)
                     '(6 chickens with large wings)))                  ;t

(message "%s" (intersectp '(stewed tomatoes and macaroni)
                          '(macaroni and cheese)))              ;t

(message "%s" (intersect '(stewed tomatoes and macaroni)
                          '(macaroni and cheese)))              ;(and macaroni)

;;(stewed tomatoes casserole macaroni and cheese)
(message "%s" (union '(stewed tomatoes and macaroni casserole)
                     '(macaroni and cheese)))
