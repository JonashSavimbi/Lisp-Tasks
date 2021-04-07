(defun increase (lst)
    (cond ((null lst) nil)
        (t (cons (* (car lst) (car lst)) (increase (cdr lst))))))
        
(defun my-maplist (lst f) 
    (cond ((null lst) nil)
        (t (cons (funcall f lst) (my-maplist (cdr lst) f)))))
        
(print (my-maplist '(1 2 3 4 5) 'increase))