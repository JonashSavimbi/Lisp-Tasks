(defun len (lst) 
    (cond((null lst) 0)
        (t (+ 1 (len (cdr lst))))
    )
)

(defun del-few-el (lst n) 
    (cond((= (len lst) n) nil)
        (t (cons (car lst) (del-few-el (cdr lst) n)))
    )
)

(print (del-few-el '(5 -1 2 -3 -10 2) 6))