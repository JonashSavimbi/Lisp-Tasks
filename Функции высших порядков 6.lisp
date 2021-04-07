(defun is-negative (x)
    (cond ((>= x 0) nil)
        (t t)))
        
(defun delete-if-true (lst f) 
    (cond ((null lst) nil)
        ((funcall f (car lst)) (delete-if-true (cdr lst) f))
        (t (cons (car lst) (delete-if-true (cdr lst) f)))))
        
(print (delete-if-true '(-1 -2 -3 -4 -5) 'is-negative))
(print (delete-if-true '(1 2 3 -4 -5) 'is-negative))