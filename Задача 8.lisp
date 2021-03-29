(defun pos (lst)
    (cond ((null lst) nil)
        (t (cons (cond ((> (car lst) 0) (car lst))) (pos (cdr lst))))))

(defun neg (lst)
    (cond ((null lst) nil)
        (t (cons (cond ((< (car lst) 0) (car lst))) (neg (cdr lst))))))

(defun pos-neg (lst) (list (remove nil (pos lst)) (remove nil (neg lst))))

(print (pos-neg '(5 -1 2 -3 -10 2)))