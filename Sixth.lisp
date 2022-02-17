
(defun ins( e l ) 
	( cond 
		( ( null l ) 0 )
		( t ( cons ( cons e (car l ) ) ( ins e ( cdr l ) ) ) )
	)
)

(defun subm(l)
	( cond
		( ( null l ) (list nil ) )
		( t ( append ( subm ( cdr l ) ) ( ins( car l ) ( subm( cdr l) ) ) ) )
	)
)