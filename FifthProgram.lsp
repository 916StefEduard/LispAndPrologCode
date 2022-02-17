;L3:     Programare in LISP, folosind functii MAP
;        --------------------------------------------------

;Pb2. Sa se construiasca o functie care returneaza suma atomilor numerici
;     dintr-o lista, de pe orice nivel.

( defun sumaAtomiT( L )
  ( cond
    ( ( null L ) 0 )
    ( ( numberp L ) L )
    ( (numberp ( cdr L ) ) ( + ( cdr L ) ( apply '+ ( mapcar 'sumaAtomiT L ))))
    ( T ( apply '+ ( mapcar 'sumaAtomiT L ) ))
  )
)
