;; Chapter 2. Do It, Do It Again, and Again, and Again...
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;

(defun lat (l)
"If a list, l, consists entirely of atoms return t, else nil"
   (cond
    ((null l) t)
    ((atom (car l)) (lat (cdr l)))
    (t nil)))

(message "%s" (lat '()))                                        ;t
(message "%s" (lat '(bacon and eggs)))                          ;t
(message "%s" (lat '(bacon (and eggs))))                        ;nil
(message "%s" (lat '(Jack Spratt could eat no chicken fat)))    ;nil
(message "%s" (lat '(Jack (Spratt could) eat no chicken fat)))  ;nil


(defun member (a lat)
"If the list of atoms, lat, contains member a return t, else nil"
    (cond
     ((null lat) nil)
     ((eq a (car lat)) t)
     (t (member a (cdr lat)))))

(message "%s" (member 'tea '(coffee tea or milk)))                    ;t
(message "%s" (member 'poached '(fried eggs and scrambled eggs)))     ;nil
(message "%s" (member 'meat '(mashed potatoes and meat gravy)))       ;t
(message "%s" (member 'liver '(bagels and lox)))                      ;nil
