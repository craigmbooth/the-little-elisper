;; Chapter 5. *Oh My Gawd* It's Full of Stars (Examples)
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;
;; evalling this buffer will print the results from most of the examples
;; in the text to the *Messages* buffer in Emacs
;;
(add-to-list 'load-path ".")
(load "chapter5.el")

; ((coffee) ((tea)) (and (hick)))
(message "%s" (rember* 'cup '((coffee) cup ((tea) cup) (and (hick)) cup)))

; (((tomato)) ((bean) (and ((flying)))))
(message "%s" (rember* 'sauce '(((tomato sauce))
                                ((bean sauce)
                                (and ((flying)) sauce)))))

;; ((how much (wood)) could ((a (wood) chuck roast)) (((chuck roast)))
;; (id (a) ((wood chuck roast))) could chuck roast wood)
(message "%s" (insertR* 'chuck 'roast '((how much (wood))
                                        could
                                        ((a (wood) chuck))
                                        (((chuck)))
                                        (id (a) ((wood chuck)))
                                        could chuck wood)))

(message "%s" (occur* 'cc '(cc bb cc bb cc)))             ;3

(message "%s" (occur* 'banana '((banana)                  ;5
                                (split ((((banana ice)))
                                        (cream (banana))
                                        sherbet))
                                (banana)
                                (bread)
                                (banana brandy))))

;; ((orange) (split ((((orange ice))) (cream (orange)) sherbet))
;; (orange) (bread) (orange brandy))
(message "%s" (subst* 'orange 'banana '((banana)
                                        (split ((((banana ice)))
                                                (cream (banana))
                                                sherbet)) (banana)
                                                (bread)
                                                (banana brandy))))
