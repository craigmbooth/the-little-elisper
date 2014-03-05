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

; ((coffee) ((tea)) (and (hick)))
(message "%s" (rember* 'cup '((coffee) cup ((tea) cup) (and (hick)) cup)))

; (((tomato)) ((bean) (and ((flying)))))
(message "%s" (rember* 'sauce '(((tomato sauce))
                                ((bean sauce)
                                (and ((flying)) sauce)))))


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

;; ((how much (wood)) could ((a (wood) chuck roast)) (((chuck roast)))
;; (id (a) ((wood chuck roast))) could chuck roast wood)
(message "%s" (insertR* 'chuck 'roast '((how much (wood))
                                        could
                                        ((a (wood) chuck))
                                        (((chuck)))
                                        (id (a) ((wood chuck)))
                                        could chuck wood)))


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

(message "%s" (occur* 'cc '(cc bb cc bb cc)))             ;3

(message "%s" (occur* 'banana '((banana)                  ;5
                                (split ((((banana ice)))
                                        (cream (banana))
                                        sherbet))
                                (banana)
                                (bread)
                                (banana brandy))))
