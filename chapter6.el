;; Chapter 6. Shadows
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;
(add-to-list 'load-path ".")
(load "chapter4.el")

(defun numbered (aexp)
"First version: Return t if aexp is an arithmetic expression, else nil"
  (cond
   ((atom aexp) (numberp aexp))
   ((eq (car (cdr aexp)) '+)
     (and (numbered (car aexp))
          (numbered (car (cdr (cdr aexp)))) t))
   ((eq (car (cdr aexp)) '*)
     (and (numbered (car aexp))
          (numbered (car (cdr (cdr aexp)))) t))
   ((eq (car (cdr aexp)) '^)
     (and (numbered (car aexp))
          (numbered (car (cdr (cdr aexp)))) t))
))


(defun first_subexp (aexp)
  (car aexp))

(defun operator (aexp)
  (car (cdr aexp)))

(defun second_subexp (aexp)
  (car (cdr (cdr aexp))))

(defun value (aexp)
"Given an arithmetic expression, return its value"
   (cond
    ((atom aexp) aexp)
    ((eq (operator aexp) '+)
         (o+ (value (first_subexp aexp))
             (value (second_subexp aexp))))
    ((eq (operator aexp) '*)
         (mult (value (first_subexp aexp))
               (value (second_subexp aexp))))
    (t            ;since this is an arithmetic expression, all that's left is pow
         (pow (value (first_subexp aexp))
              (value (second_subexp aexp))))
))

;; Now, define a new representation of numbers, where:
;; () = 0; (()) = 1; (() ()) = 2; (() () ()) = 3, etc.
(defun sero (n) (null n))
(defun edd1 (n) (cons '() n))
(defun zub1 (n) (cdr n))

(defun zad (n m)
"Add n to m with numbers represented by empty lists. Not this function is pretty much
the same as add, regardless of the representation"
  (cond
   ((sero m) n)
   (t (edd1 (zad n (zub1 m))))))
