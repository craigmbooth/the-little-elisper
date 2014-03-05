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


(defun insertL* (new old ll)
"Recursively traverse nested lists, adding new to the left of old"
  (cond
   ((null ll) nil)
   ((atom (car ll))
    (cond
     ((eq (car ll) old) (cons new (cons old (insertL* new old (cdr ll)))))
     (t (cons (car ll) (insertL* new old (cdr ll))))
    ))
   (t (cons (insertL* new old (car ll)) (insertL* new old (cdr ll))))))


(defun member* (a ll)
"Recursively traverse nested lists and return t if a is a member of any of them"
  (cond
   ((null ll) nil)
   ((atom (car ll))
     (or (eq a (car ll)) (member* a (cdr ll))))
   (t (or (member* a (car ll)) (member* a (cdr ll))))))


(defun leftmost (ll)
"Traverse the left-most elements of nested lists, return the first non-nil member"
  (cond
   ((null ll) '())
   ((atom ll) ll)
   (t (leftmost (car ll)))))


(defun eqlist (l1 l2)

)

(message "%s" (eqlist '(strawberry ice cream)
                      '(strawberry ice cream)))            ;t
(message "%s" (eqlist '(strawberry ice cream)
                      '(strawberry cream ice)))            ;nil
(message "%s" (eqlist '(banana ((split)))
                      '((banana) (split))))                ;nil
(message "%s" (eqlist '(beef ((sausage)) (and (soda)))
                      '(beef ((salami)) (and (soda)))))    ;nil
(message "%s" (eqlist '(beef ((sausage)) (and (soda)))
                      '(beef ((sausage)) (and (soda)))))   ;nil
;;equal
