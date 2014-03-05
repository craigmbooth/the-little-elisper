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


(defun member (a lat)
"If the list of atoms, lat, contains member a return t, else nil"
    (cond
     ((null lat) nil)
     ((eq a (car lat)) t)
     (t (member a (cdr lat)))))
