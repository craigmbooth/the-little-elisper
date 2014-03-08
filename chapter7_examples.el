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

(message "%s" (diff '(stewed tomatoes and macaroni casserole)
                     '(macaroni and cheese))) ;;(stewed tomatoes casserole)

(message "%s" (intersectall '((a b c) (c a de) (e f g h a b))))      ;(a)

(message "%s" (intersectall '((6 pears and)
                              (3 peaches and 6 peppers)
                              (8 pears and 6 plums)
                              (and 6 prunes with some apples))))     ;(6 and)

(message "%s" (a-pair '(pair pear)))    ;t
(message "%s" (a-pair '(3 7)))          ;t
(message "%s" (a-pair '(a (pair))))     ;t

(message "%s" (fun '((4 3) (4 2) (7 6) (6 2) (3 4))))     ;nil
(message "%s" (fun '((8 3) (4 2) (7 6) (6 2) (3 4))))     ;f
(message "%s" (fun '((d 4) (b 0) (b 9) (e 5) (g 4))))     ;nil

;;((a 8) (pie pumpkin) (sick got))
(message "%s" (revrel '((8 a) (pumpkin pie) (got sick))))

(message "%s" (one-to-onep '((8 3) (4 8) (7 6) (6 2) (3 4))))                 ;t
(message "%s" (one-to-onep '((grape raisin) (plum prune) (stewed prune))))  ;nil
