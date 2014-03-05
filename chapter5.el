;; Chapter 5. *Oh My Gawd* It's Full of Stars
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;
;; Translation note:
;;     --Loads chapter4.el for access to o+ and add1
;;
(add-to-list 'load-path ".")
(load "chapter4.el")


(defun rember* (a ll)
"Recursively traverse nested lists, removing any element that equals the element a"
  (cond
   ((null ll) '())                            ;if ll is null, return '()
   ((atom (car ll))                           ;elif (car ll) is an atom
     (cond
      ((eq (car ll) a) (rember* a (cdr ll)))
      (t (cons (car ll) (rember* a (cdr ll))))
   ))
   (t                                         ;else (car ll) is not an atom
    (cons (rember* a (car ll))
          (rember* a (cdr ll)))
   )))


(defun insertR* (old new ll)
"Recursively traverse nested lists, adding new to the right of old"
  (cond
     ((null ll) '())
     ((atom (car ll))
         (cond
           ((eq (car ll) old) (cons old (cons new (insertR* old new (cdr ll)))))
           (t (cons (car ll) (insertR* old new (cdr ll))))))
     (t
         (cons (insertR* old new (car ll)) (insertR* old new (cdr ll))))))


(defun occur* (a ll)
"Recursively traverse nested lists, counting occurrences of the atom a"
  (cond
     ((null ll) 0)
     ((atom (car ll))
         (cond
          ((equal a (car ll))
             (add1 (occur* a (cdr ll))))
          (t
             (occur* a (cdr ll)))
         ))
     (t (o+ (occur* a (car ll)) (occur* a (cdr ll))))
    ))


(defun subst* (new old ll)
"Recursively traverse nested lists, replacing old with new"
  (cond
   ((null ll) '())
   ((atom (car ll))
    (cond
     ((eq (car ll) old)
         (cons new (subst* new old (cdr ll))))
     (t
         (cons (car ll) (subst* new old (cdr ll))))
    ))
   (t
    (cons (subst* new old (car ll)) (subst* new old (cdr ll))))))
