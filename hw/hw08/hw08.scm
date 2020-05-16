; Macros

(define-macro (list-of map-expr for var in lst if filter-expr)
	;(list 'map (list 'lambda (list var) map-expr) lst)
	;`(map (lambda (,var) ,map-expr) ,lst)
	;`(map (lambda (,var) ,map-expr) `(filter (lambda (,var) ,filter-expr) ,lst))
	`(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst))
	;`(filter (lambda (,var) ,filter-expr) ,lst)
)