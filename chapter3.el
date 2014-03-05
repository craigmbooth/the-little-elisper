;; Chapter 3. Cons the Magnificent
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;
(defun rember (a lat)
"Given a list of atoms, lat, remove the first occurrence of a"
  (cond
   ((null lat) '())
   ((eq (car lat) a) (cdr lat))
   (t (cons (car lat) (rember a (cdr lat))))))


(defun firsts (ll)
  "Given list-of-lists return a list with the car of each sub-list"
  (cond
   ((null ll) '())
   (t (cons (car (car ll))
      (firsts (cdr ll))))))


(defun insertR (new old lat)
  "Insert 'new' to the right of the first occurrence of 'old' in a list of atoms"
  (cond
   ((null lat) '())
   ((eq (car lat) old) (cons old (cons new (cdr lat))))
   (t (cons (car lat) (insertR new old (cdr lat))))))


(defun insertL (new old lat)
  "Insert 'new' to the left of the first occurrence of 'old' in a list of atoms"
  (cond
   ((null lat) '())
   ((eq (car lat) old) (cons new lat))
   (t (cons (car lat) (insertL new old (cdr lat))))))


(defun subst (new old lat)
  "Replace the first occurence of old in lat with new"
  (cond
   ((null lat) '())
   ((eq (car lat) old) (cons new (cdr lat)))
   (t (cons (car lat) (subst new old (cdr lat))))))


(defun subst2 (new o1 o2 lat)
  "Replace the first occurrence of either o1 or o2 in lat with new"
  (cond
   ((null lat) '())
   ((or (eq (car lat) o1) (eq (car lat) o2)) (cons new (cdr lat)))
   (t (cons (car lat) (subst2 new o1 o2 (cdr lat))))))


(defun multirember (a lat)
  "Remove all occurrences of a from the list lat"
  (cond
   ((null lat) '())
   ((eq (car lat) a) (multirember a (cdr lat)))
   (t (cons (car lat) (multirember a (cdr lat))))))


(defun multiinsertR (old new lat)
  "Insert 'new' to the right of all occurrences of 'old' in a list of atoms, lat"
  (cond
   ((null lat) '())
   ((eq (car lat) old)
      (cons old (cons new (multiinsertR old new (cdr lat)))))
   (t
      (cons (car lat) (multiinsertR old new (cdr lat))))))


(defun multiinsertL (old new lat)
"Insert 'new' to the right of all occurrences of 'old' in a list of atoms, lat"
  (cond
   ((null lat) '())
   ((eq (car lat) old)
      (cons new (cons old (multiinsertL old new (cdr lat)))))
   (t
      (cons (car lat) (multiinsertL old new (cdr lat))))))


(defun multisubst (old new lat)
"Replace all occurrences of old with new in lat"
  (cond
   ((null lat) '())
   ((eq (car lat) old)
      (cons new (multisubst old new (cdr lat))))
   (t
      (cons (car lat) (multisubst old new (cdr lat))))))
