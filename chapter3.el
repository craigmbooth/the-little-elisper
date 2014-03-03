;; Chapter 3. Cons the Magnificent
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;

(defun rember (a lat)
"Given a list of atoms, lat, remove the first occurrence of a"
  (cond
   ((null lat) '())
   ((eq (car lat) a) (cdr lat))
   (t (cons (car lat) (rember a (cdr lat))))))

(message "%s" (rember 'mint
  '(lamb chops and mint jelly)))              ;(lamb chops and jelly)
(message "%s" (rember 'toast
  '(bacon lettuce and tomato)))               ;(bacon lettuce and tomato)
(message "%s" (rember 'cup
  '(coffee cup tea cup and hick cup)))        ;(coffee tea cup and hick cup)
(message "%s" (rember 'sauce
  '(soy sauce and tomato sauce)))             ;(soy and tomato sauce)


(defun firsts (ll)
  "Given list-of-lists return a list with the car of each sub-list"
  (cond
   ((null ll) '())
   (t (cons (car (car ll))
      (firsts (cdr ll))))))

(message "%s" (firsts '((apple peach pumpkin)   ;(apple plum grape bean)
          (plum pear cherry)
          (grape raisin pea)
          (bean carrot eggplant))))
(message "%s" (firsts '((a b) (c d) (e f))))    ;(a c e)


(defun insertR (new old lat)
  "Insert 'new' to the right of the first occurrence of 'old' in a list of atoms"
  (cond
   ((null lat) '())
   ((eq (car lat) old) (cons old (cons new (cdr lat))))
   (t (cons (car lat) (insertR new old (cdr lat))))))

(message "%s" (insertR 'topping 'fudge
  '(ice cream with fudge for dessert))) ;(ice cream with fudge topping for dessert)
(message "%s" (insertR 'jalapeno 'and
  '(tacos tamales and salsa)))          ;(tacos tamales and jalapeno salsa)
(message "%s" (insertR 'e 'd
  '(a b c d f g d h)))                  ;(a b c d e f g d h)


(defun insertL (new old lat)
  "Insert 'new' to the left of the first occurrence of 'old' in a list of atoms"
  (cond
   ((null lat) '())
   ((eq (car lat) old) (cons new lat))
   (t (cons (car lat) (insertL new old (cdr lat))))))

(message "%s" (insertL 'topping 'fudge
  '(ice cream with fudge for dessert))) ;(ice cream with topping fudge for dessert)
(message "%s" (insertL 'f 'g
  '(a b c d f g d h)))                  ;(a b c d f f g d h)


(defun subst (new old lat)
  "Replace the first occurence of old in lat with new"
  (cond
   ((null lat) '())
   ((eq (car lat) old) (cons new (cdr lat)))
   (t (cons (car lat) (subst new old (cdr lat))))))

(message "%s" (subst 'fudge 'topping
  '(ice cream with topping for dessert))) ;(ice cream with fudge for dessert)


(defun subst2 (new o1 o2 lat)
  "Replace the first occurrence of either o1 or o2 in lat with new"
  (cond
   ((null lat) '())
   ((or (eq (car lat) o1) (eq (car lat) o2)) (cons new (cdr lat)))
   (t (cons (car lat) (subst2 new o1 o2 (cdr lat))))))

(message "%s" (subst2 'vanilla 'chocolate 'banana
  '(banana ice cream with
    chocolate topping)))   ;(vanilla ice cream with chocolate topping)


(defun multirember (a lat)
  "Remove all occurrences of a from the list lat"
  (cond
   ((null lat) '())
   ((eq (car lat) a) (multirember a (cdr lat)))
   (t (cons (car lat) (multirember a (cdr lat))))))

(message "%s" (multirember 'cup
  '(coffee cup tea cup and hick cup))) ;coffee tea and hick


(defun multiinsertR (old new lat)
  "Insert 'new' to the right of all occurrences of 'old' in a list of atoms, lat"
  (cond
   ((null lat) '())
   ((eq (car lat) old)
      (cons old (cons new (multiinsertR old new (cdr lat)))))
   (t
      (cons (car lat) (multiinsertR old new (cdr lat))))))

(message "%s" (multiinsertR 'tea 'leaves
   '(i like tea and green tea))) ;(i like tea leaves and green tea leaves)


;;multiinsertL
(defun multiinsertL (old new lat)
"Insert 'new' to the right of all occurrences of 'old' in a list of atoms, lat"
  (cond
   ((null lat) '())
   ((eq (car lat) old)
      (cons new (cons old (multiinsertL old new (cdr lat)))))
   (t
      (cons (car lat) (multiinsertL old new (cdr lat))))))

(message "%s" (multiinsertL 'scones 'vanilla
   '(scones and more scones))) ;(vanilla scones and more vanilla scones)

;;multisubst
(defun multisubst (old new lat)
"Replace all occurrences of old with new in lat"
  (cond
   ((null lat) '())
   ((eq (car lat) old)
      (cons new (multisubst old new (cdr lat))))
   (t
      (cons (car lat) (multisubst old new (cdr lat))))))

(message "%s" (multisubst 'a 'b
   '(a b a b a b))) ;(b b b b b b)
