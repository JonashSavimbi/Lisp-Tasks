(defun lst-plus (lst)
    (cond ((null lst) nil)
        (t (cons(+ 1 (car lst)) (lst-plus (cdr lst))))))
        
(print (lst-plus '(5 -1 2 -3 -10 2)))