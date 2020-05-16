;;;;;;;;;;;;;;;
;; Questions ;;
;;;;;;;;;;;;;;;

; Scheme

(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
  (car (cdr s))
)

(define (caddr s)
  'YOUR-CODE-HERE
  (car (cddr s))
)

(define (sign x)
  'YOUR-CODE-HERE
  (cond ((> x 0)
  	1)
  	(else (cond ((< x 0)
  		(- 1))
  		(else 0))))
)

(define (square x) (* x x))

(define (pow b n)
  'YOUR-CODE-HERE
  (if (= n 0)
  	1
  	(if (= 0 (modulo n 2))
  		(square (pow b (/ n 2)))
  		(* b (pow b (- n 1))))
  	)
)

(define (unique s)
  'YOUR-CODE-HERE
  (if (null? s)
    s
    (cons (car s) 
    	(unique
    		(filter
    			(lambda (x) (not (eq? x (car s))))
    				(cdr s)))))
)