;; Chapter 4. Numbers Games (Examples)
;;
;; Examples from the 4th Edition of The Little Schemer translated into
;; Emacs lisp.
;;
;; evalling this buffer will print the results from most of the examples
;; in the text to the *Messages* buffer in Emacs
;;
(add-to-list 'load-path ".")
(load "chapter4.el")

(message "%s" (o+ 46 12))                        ; 58

(message "%s" (o- 14 3))                         ; 11
(message "%s" (o- 17 9))                         ; 8

(message "%s" (addtup '(15 6 7 12 3)))           ; 43
(message "%s" (addtup '(3 5 2 8)))               ; 18
(message "%s" (addtup '()))                      ; 0

(message "%s" (mult 5 3))                        ; 15
(message "%s" (mult 13 4))                       ; 52

(message "%s" (tup+ '(3 6 9 11 4) '(8 5 2 0 7)))  ;(11 11 11 11 11)
(message "%s" (tup+ '(2 3) '(4 6)))               ; 6 9

(message "%s" (tup+ '(3 6 9 11 4) '(8 5 2 0 7)))  ; (11 11 11 11 11)
(message "%s" (tup+ '(2 3) '(4 6)))               ; (6 9)
(message "%s" (tup+ '(3 7 8 1) '(4 6)))           ; (7 13 8 1)

(message "%s" (gt 12 133))       ;nil
(message "%s" (gt 120 11))       ;t
(message "%s" (gt 12 12))        ;nil

(message "%s" (lt 8 3))          ;nil
(message "%s" (lt 6 6))          ;nil
(message "%s" (lt 4 6))          ;t

(message "%s" (== 8 3))          ;nil
(message "%s" (== 6 6))          ;t
(message "%s" (== 4 6))          ;nil

(message "%s" (pow 1 1))         ;1
(message "%s" (pow 2 3))         ;8
(message "%s" (pow 5 3))         ;125

(message "%s" (div 15 4))

(message "%s" (length '(hotdogs with mustard sauerkraut and pickles)))  ; 6

(message "%s" (pick '(lasagna spaghetti ravioli macaroni meatball) 4))   ; macaroni

(message "%s" (occur 'cc '(cc bb cc bb cc)))       ;3

(message "%s" (rempick 3 '(hotdogs with hot mustard)))    ; hotdogs with mustard

(message "%s" (no-nums '(5 pears 6 prunes 9 dates)))      ; (pears prunes dates)

(message "%s" (all-nums '(5 pears 6 prunes 9 dates)))     ; (5 6 9)

(message "%s" (eqan 1 1))
(message "%s" (eqan 1 2))
(message "%s" (eqan 3 'r))
(message "%s" (eqan 1 '3))
