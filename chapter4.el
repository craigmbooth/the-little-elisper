;; Chapter 4. Numbers Games
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;

;;Functions to add and subtract 1, to match The Little Schemer
(defun add1 (x) (+ x 1))
(defun sub1 (x) (- x 1))


(defun o+ (n m)
"Add n and m"
  (cond
   ((zerop m) n)
   (t (add1 (o+ n (sub1 m))))))

(message "%s" (o- 46 12))                        ; 58


(defun o- (n m)
"Subtract m from n"
  (cond
   ((zerop m) n)
   (t (sub1 (o- n (sub1 m))))))

(message "%s" (o- 14 3))                         ; 11
(message "%s" (o- 17 9))                         ; 8


(defun addtup (tup)
"Sum the numbers in the tuple tup"
  (cond
   ((null tup) 0)
   (t (o+ (addtup (cdr tup)) (car tup)))))

(message "%s" (addtup '(15 6 7 12 3)))           ; 43
(message "%s" (addtup '(3 5 2 8)))               ; 18
(message "%s" (addtup '()))                      ; 0


(defun mult (n m)
"Multiply together m and n"
  (cond
   ((zero m) 0)
   (t (o+ n (mult n (sub1 m))))))

(message "%s" (mult 5 3))                        ; 15
(message "%s" (mult 13 4))                       ; 52


;; When recursing over two lists there are four termination conditions to
;; consider:
;;    * Both lists are null
;;    * The first list is null
;;    * The second list is null
;;    * Neither list is null
;;
;; If we can guarantee the lists are the same length then only need to do
;; two of these.

(defun tup+ (tup1 tup2)
"Given two tuples of the same length, sum each element"
  (cond
   ((or (null tup1) (null tup2)) '())
   (t
      (cons (o+ (car tup1) (car tup2))
            (tup+ (cdr tup1) (cdr tup2)) ))))

(message "%s" (tup+ '(3 6 9 11 4) '(8 5 2 0 7)))  ;(11 11 11 11 11)
(message "%s" (tup+ '(2 3) '(4 6)))               ; 6 9


(defun tup+ (tup1 tup2)
"Given two tuples of any length, sum each element"
)

(message "%s" (tup+ '(3 6 9 11 4) '(8 5 2 0 7)))  ;(11 11 11 11 11)
(message "%s" (tup+ '(2 3) '(4 6)))               ; 6 9
;;add example (3 7 8 1) (4 6) = (7 15 8 1)

(defun > (n m)
 "n > m?"
;;(recurse over two numbers, case where neither is 0, n is 0, m is 0.
;;order matters for equality)
)

;;e.g.'s are (> 12 133) = false and (> 120 11) = true

(defun < (n m)

)

;;< 8 3 and < 6 6 and < 4 6 = f f t

(defun = (n m)
  ;;Do both fundamentally and with gt and lt
)


(defun pow (n m)

)


(defun / (n m)

)

(defun length (lat)

)

(defun pick (lat)

)

(defun rempick (lat)

)

(defun number (a)

)

(defun no-nums (lat)

)

(defun all-nums (lat)

)

(defun eqan (a1 a2)

)


(defun occur (a lat)

)

(defun one (a lat)

)

(defun rempick (n lat)
"rewritten to use one"
)
