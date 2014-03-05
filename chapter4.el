;; Chapter 4. Numbers Games
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;
;; Translation note:
;;    --In Lisp, zero? is zerop
;;    --In Lisp, number? is numberp
;;
(defun add1 (x) (+ x 1))
(defun sub1 (x) (- x 1))


(defun o+ (n m)
"Add n and m"
  (cond
   ((zerop m) n)
   (t (add1 (o+ n (sub1 m))))))


(defun o- (n m)
"Subtract m from n"
  (cond
   ((zerop m) n)
   (t (sub1 (o- n (sub1 m))))))


(defun addtup (tup)
"Sum the numbers in the tuple tup"
  (cond
   ((null tup) 0)
   (t (o+ (addtup (cdr tup)) (car tup)))))


(defun mult (n m)
"Multiply together m and n"
  (cond
   ((zerop m) 0)
   (t (o+ n (mult n (sub1 m))))))


(defun tup+ (tup1 tup2)
"Given two tuples of the same length, sum each element"
  (cond
   ((or (null tup1) (null tup2)) '())
   (t
      (cons (o+ (car tup1) (car tup2))
            (tup+ (cdr tup1) (cdr tup2)) ))))


(defun tup+ (tup1 tup2)
"Given two tuples of any length, sum each element"
  (cond
   ((and (null tup1) (null tup2))
      '())
   ((null tup1)
      (cons (car tup2) (tup+ tup1 (cdr tup2))))
   ((null tup2)
      (cons (car tup1) (tup+ (cdr tup1) tup2)))
   (t
      (cons (o+ (car tup1) (car tup2))
                (tup+ (cdr tup1) (cdr tup2))))))


(defun gt (n m)
"n > m?"
  (cond
   ((zerop n) nil)
   ((zerop m) t)
   (t (gt (sub1 n) (sub1 m)))))


(defun lt (n m)
"n < m"
  (cond
   ((zerop m) nil)
   ((zerop n) t)
   (t (lt (sub1 n) (sub1 m)))))


(defun == (n m)
"n == m"
  (cond
   ((or (lt n m) (gt n m)) nil)
   (t t)))


(defun pow (n m)
"n^m"
  (cond
   ((== m 0) 1)
   (t (mult n (pow n (sub1 m))))))


(defun div (n m)
"n / m"
  (cond
   ((lt n m) 0)
   (t (add1 (div (o- n m) m)))))


(defun length (lat)
"Return the number of atoms in the list lat"
  (cond
   ((null lat) 0)
   (t (add1 (length (cdr lat))))))


(defun pick (lat n)
"Return the nth element from lat"
  (cond
   ((== (sub1 n) 0) (car lat))
   (t (pick (cdr lat) (sub1 n)))))


(defun rempick (n lat)
"Remove the item from lat at position n"
  (cond
   ((null lat) '())
   ((== (sub1 n) 0) (cdr lat))
   (t (cons (car lat)
      (rempick (sub1 n) (cdr lat))))))


(defun no-nums (lat)
"Remove all numbers from a lat"
  (cond
   ((null lat) '())
   ((numberp (car lat)) (no-nums (cdr lat)))
   (t (cons (car lat) (no-nums (cdr lat))))))

(message "%s" (no-nums '(5 pears 6 prunes 9 dates)))      ; (pears prunes dates)


(defun all-nums (lat)
"Extract a tup from a lat by extracting all the numbers"
  (cond
   ((null lat) '())
   ((numberp (car lat)) (cons (car lat) (all-nums (cdr lat))))
   (t (all-nums (cdr lat)))))

(message "%s" (all-nums '(5 pears 6 prunes 9 dates)))     ; (5 6 9)


(defun eqan (a1 a2)
"true if two arguments are the same atom"
  (cond
   ((and (numberp a1) (numberp a2)) (= a1 a2))
   ((numberp a1) nil)
   ((numberp a2) nil)
   (t (eq a1 a2))))

(message "%s" (eqan 1 1))
(message "%s" (eqan 1 2))
(message "%s" (eqan 3 'r))
(message "%s" (eqan 1 '3))


(defun occur (a lat)
"count occurrences of a in lat"
  (cond
   ((null lat) 0)
   ((eq a (car lat))
      (add1 (occur a (cdr lat))))
   (t
      (occur a (cdr lat)))))




(defun one (n)
"true if n is 1, false otherwise"
  (eq n 1))

(defun rempick (n lat)
"Remove the item from lat at position n, using function one"
  (cond
   ((null lat) '())
   ((one n) (cdr lat))
   (t (cons (car lat)
      (rempick (sub1 n) (cdr lat))))))
