;; Chapter 2. Do It, Do It Again, and Again, and Again... (Examples)
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;
;; evalling this buffer will print the results from most of the examples
;; in the text to the *Messages* buffer in Emacs
;;
(add-to-list 'load-path ".")
(load "chapter2.el")

(message "%s" (lat '()))                                        ;t
(message "%s" (lat '(bacon and eggs)))                          ;t
(message "%s" (lat '(bacon (and eggs))))                        ;nil
(message "%s" (lat '(Jack Spratt could eat no chicken fat)))    ;nil
(message "%s" (lat '(Jack (Spratt could) eat no chicken fat)))  ;nil

(message "%s" (member 'tea '(coffee tea or milk)))                    ;t
(message "%s" (member 'poached '(fried eggs and scrambled eggs)))     ;nil
(message "%s" (member 'meat '(mashed potatoes and meat gravy)))       ;t
(message "%s" (member 'liver '(bagels and lox)))                      ;nil
