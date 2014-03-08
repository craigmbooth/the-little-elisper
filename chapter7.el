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


(defun subset (set1 set2)
"Return t if set1 is a subset of set2, else nil"
  (cond
   ((null set1) t)
   ((member (car set1) set2)
        (subset (cdr set1) set2))
   (t nil)))


(defun eqset (set1 set2)
"Return t if both sets contain all of the same elements, else f"
    (and (subset set1 set2) (subset set2 set1)) t)


(defun intersectp (set1 set2)
"Return t if there is any overlap between the sets, otherwise nil"
  (cond
   ((null set1) nil)
   ((member (car set1) set2) t)
   (t (intersectp (cdr set1) set2))))


(defun intersect (set1 set2)
"Return the intersection of the sets"
  (cond
   ((null set1) '())
   ((member (car set1) set2)
        (cons (car set1) (intersect (cdr set1) set2)))
   (t (intersect (cdr set1) set2))))


(defun union (set1 set2)
"Return the union of the sets"
   (cond
    ((null set1) set2)
    ((member (car set1) set2)
         (union (cdr set1) set2))
    (t (cons (car set1) (union (cdr set1) set2)))))


(defun diff (set1 set2)
"Return all the members of set1 that are not in set2"
   (cond
     ((null set1) '())
     ((member (car set1) set2) (diff (cdr set1) set2))
     (t (cons (car set1) (diff (cdr set1) set2)))))


(defun intersectall (l-set)
"Take a list of sets as an argument, return values that exist in all of the sets"
  (cond
   ((null (cdr l-set)) (car l-set))
   (t (intersect (car l-set)
                 (intersectall (cdr l-set))))))


(defun a-pair (l)
  (cond
   ((null l) nil)
   ((atom l) nil)
   ((null (cdr l)) nil)
   ((null (cdr (cdr l))) t)
   (t nil)))


(defun first (l)
"Extract the first element of a list"
  (car l))


(defun second (l)
"Extract the second element of a list"
  (car (cdr l)))


(defun third (l)
"Extract the third element of a list"
  (car (cdr (cdr l))))


(defun build (s1 s2)
"Make a pair from two S-expressions"
  (cons s1 (cons s2 '())))


(defun fun (rel)
"a finite function is a list of pairs where the first elements are a set"
  (setp (firsts rel)))

;;(defun revrel (rel)
;;"reverse the order of the pairs in a relation"
;;)

;;revpair

;;fullfun

;;one-to-one
