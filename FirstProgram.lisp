;9. Definiti o functie care determina numarul nodurilor de pe nivelul k
; dintr-un arbore n-ar reprezentat sub forma (radacina lista_noduri_subarb1
; ... lista_noduri_subarbn) Ex: arborelele este (a (b (c)) (d) (e (f))) si
; k=1 => 3 noduri 

; (nr_nodk '(a (b (c)) (d) (e (f))) 1)   ->   3 
; (nr_nodk '(a (b (c)) (d) (e (f))) 2)   ->   2

(defun nr_nodk(l k)
	(cond
		( (null l ) 0 )
		( (= k 0 ) 1 )
		( t ( apply #'+ ( mapcar #'( lambda (l) ( nr_nodk l (- k 1 ) ) ) ( cdr l ) ) ) )
	)
)