;; Chapter 7. Friends and Relations
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;
(add-to-list 'load-path ".")
(load "chapter2.el")
(load "chapter3.el")


(defun setp (lat)
"Return t if list is s set, otherwise nil"
  (cond
   ((null lat) t)
   ((member (car lat) (cdr lat)) nil)
   (t (setp (cdr lat)))))


(defun makeset_nr (lat)
"Given a list of atoms, remove duplicates"
  (cond
   ((null lat) '())
   ((member (car lat) (cdr lat)) (makeset_nr (cdr lat)))
   (t (cons (car lat) (makeset_nr (cdr lat))))))


(defun makeset (lat)
"Given a list of atoms, remove duplicates (using multirember)"
  (cond
   ((null lat) '())
   (t (cons (car lat) (makeset (multirember (car lat) (cdr lat)))))))


;;subset set1 set2

;;eqset

;;intersectp

;;intersect

;;union
