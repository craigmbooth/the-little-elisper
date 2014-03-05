;; Chapter 3. Cons the Magnificent
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;
;;
;; evalling this buffer will print the results from most of the examples
;; in the text to the *Messages* buffer in Emacs
;;
(add-to-list 'load-path ".")
(load "chapter3.el")

(message "%s" (rember 'mint
  '(lamb chops and mint jelly)))              ;(lamb chops and jelly)
(message "%s" (rember 'toast
  '(bacon lettuce and tomato)))               ;(bacon lettuce and tomato)
(message "%s" (rember 'cup
  '(coffee cup tea cup and hick cup)))        ;(coffee tea cup and hick cup)
(message "%s" (rember 'sauce
  '(soy sauce and tomato sauce)))             ;(soy and tomato sauce)

(message "%s" (firsts '((apple peach pumpkin)   ;(apple plum grape bean)
          (plum pear cherry)
          (grape raisin pea)
          (bean carrot eggplant))))
(message "%s" (firsts '((a b) (c d) (e f))))    ;(a c e)

(message "%s" (insertR 'topping 'fudge
  '(ice cream with fudge for dessert))) ;(ice cream with fudge topping for dessert)
(message "%s" (insertR 'jalapeno 'and
  '(tacos tamales and salsa)))          ;(tacos tamales and jalapeno salsa)
(message "%s" (insertR 'e 'd
  '(a b c d f g d h)))                  ;(a b c d e f g d h)

(message "%s" (insertL 'topping 'fudge
  '(ice cream with fudge for dessert))) ;(ice cream with topping fudge for dessert)
(message "%s" (insertL 'f 'g
  '(a b c d f g d h)))                  ;(a b c d f f g d h)

(message "%s" (subst 'fudge 'topping
  '(ice cream with topping for dessert))) ;(ice cream with fudge for dessert)

(message "%s" (subst2 'vanilla 'chocolate 'banana
  '(banana ice cream with
    chocolate topping)))   ;(vanilla ice cream with chocolate topping)

(message "%s" (multirember 'cup
  '(coffee cup tea cup and hick cup))) ;coffee tea and hick

(message "%s" (multiinsertR 'tea 'leaves
   '(i like tea and green tea))) ;(i like tea leaves and green tea leaves)

(message "%s" (multiinsertL 'scones 'vanilla
   '(scones and more scones))) ;(vanilla scones and more vanilla scones)

(message "%s" (multisubst 'a 'b
   '(a b a b a b))) ;(b b b b b b)
