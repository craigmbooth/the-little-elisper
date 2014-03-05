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

;((how much (wood)) could ((a (wood) pecker chuck)) (((pecker chuck))) (if (a)
;((wood pecker chuck))) could pecker chuck wood)
(message "%s" (insertL* 'pecker 'chuck '((how much (wood)) could
                               ((a (wood) chuck))
                               (( (chuck)))
                               (if (a) ((wood chuck))) could chuck wood)))

(message "%s" (member* 'chips '((potato) (chips ((with) fish) (chips))))) ;t

(message "%s" (leftmost '(((() four)) 17 (seventeen))))              ;nil
(message "%s" (leftmost '((((hot) (tuna (and))) cheese))))           ;hot
(message "%s" (leftmost '((potato) (chips ((with) fish) (chips)))))  ;potato

(message "%s" (eqlist '(strawberry ice cream)
                      '(strawberry ice cream)))            ;t
(message "%s" (eqlist '(strawberry ice cream)
                      '(strawberry cream ice)))            ;nil
(message "%s" (eqlist '(banana ((split)))
                      '((banana) (split))))                ;nil
(message "%s" (eqlist '(beef ((sausage)) (and (soda)))
                      '(beef ((salami)) (and (soda)))))    ;nil
(message "%s" (eqlist '(beef ((sausage)) (and (soda)))
                      '(beef ((sausage)) (and (soda)))))   ;t
