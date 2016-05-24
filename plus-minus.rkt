;================================================
; About
;================================================
;Author: Camron Khan
;Course: CSC 388
;Assignment: Homework 3
;Date: 5-1-2016


;================================================
; Algorithm
;================================================

(define plus-minus(lambda(list sum target)
                    (cond
                      ;===base case===
                      ((null? list) (= sum target))  ;if list is empty, test if sum equals target
                      ; ===recursive cases===
                      ((= target 0) (plus-minus list sum (car list)))  ;if target equals zero, initialize target with (car list) to prevent false positives
                      ((plus-minus (cdr list) (+ sum (car list)) target) #t)  ;add (car list) to sum but do not use (car list) as target
                      ((plus-minus (cdr list) (- sum (car list)) target) #t)  ;subtract (car list) from sum but do not use (car list) as target
                      ((plus-minus (cdr list) (+ sum (car list)) (car list)) #t)  ;add (car list) to sum and use (car list) as target
                      (else (plus-minus (cdr list) (- sum (car list)) (car list))))))  ;subtract (car list) from sum and use (car list) as target


;================================================
; Testing
;================================================
;(#%require racket/trace)
;(trace plus-minus)

;(define list1 (list 1))
;(define list2 (list 1 2))
;(define list3 (list 1 2 3))
;(define list4 (list 7 1 5 2))
;(define list5 (list 27 6 12 11))
;(define list6 (list 34 15 17 25 35))

;(plus-minus list5 0 0)