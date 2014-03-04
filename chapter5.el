;; Chapter 5. *Oh My Gawd* It's Full of Stars
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;

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
