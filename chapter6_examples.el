;; Chapter 6. Shadows (Examples)
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;
(message "%s" (numbered '(3 + (4 ^ 5))))         ;t
(message "%s" (numbered '(1 + 3)))               ;t
(message "%s" (numbered '(2 * sausages)))        ;nil

(message "%s" (value '(1 + 3)))               ;4
(message "%s" (value '(5 * 9)))               ;45
(message "%s" (value '(2 pow 3)))             ;8
(message "%s" (value '(1 + (3 pow 4))))       ;82

(message "%s" (edd1 '(() ())))
(message "%s" (zub1 '(() ())))

(message "%s" (zad '(() () ()) '(() () ())))
