
; Tail recursion

(define (replicate x n)
  'YOUR-CODE-HERE
  (define (rep-helper x n lst)
    (if (= n 0) 
      lst
      (rep-helper x (- n 1) (cons x lst))
  ))
  (rep-helper x n nil)
)

(define (accumulate combiner start n term)
  'YOUR-CODE-HERE
  (if (= 0 n)
    start
    (combiner (term n) (accumulate combiner start (- n 1) term))
  )
)

(define (accumulate-tail combiner start n term)
  'YOUR-CODE-HERE
  (define (accumulate-helper combiner start n term combination)
    (if (= 1 n)
      (combiner combination start)
      (accumulate-helper combiner start (- n 1) term (combiner (term (- n 1)) combination))
    )
  )
  (accumulate-helper combiner start n term (term n))
) 

; Streams

(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define multiples-of-three
  (cons-stream 3 (map-stream (lambda (x) (+ 3 x)) multiples-of-three))
  ;(map-stream (lambda (x) (* 3 x)) (cons-stream ))
)

(define (make-lst s)
  (cond ((null? (cdr-stream s)) 
          (cons-stream (cons (car s) nil) nil))
        ((> (car s) (car (cdr-stream s))) 
          (cons (car s) nil))
        (else (cons (car s) (make-lst (cdr-stream s))))
  )
)

(define (cut-stream s n)
  (if (= n 0)
    s
    (cut-stream (cdr-stream s) (- n 1)))
)

(define (nondecreastream s)
  (cond ((null? (cdr-stream s)) (make-lst s))
        (else
        (cons-stream (make-lst s) (nondecreastream (cut-stream s (length (make-lst s)))))
        )
  )
)

(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))