(defun is-negative (x)
    (cond ((>= x 0) nil)
        (t t)))
        
(defun every-is-true (lst f) 
    (cond ((null lst) t)
        ((funcall f (car lst))  (every-is-true (cdr lst) f))
        (t nil)))
        
(print (every-is-true '(-1 -2 -3 -4 -5) 'is-negative))
(print (every-is-true '(1 -2 -3 -4 -5) 'is-negative))