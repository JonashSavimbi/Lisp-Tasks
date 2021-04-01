(defun delete-even-numbers (lst) 
    (cond ((null lst) nil)
        ((= (rem (car lst) 2) 0) (delete-even-numbers (cdr lst)))
        (t (cons (car lst) (delete-even-numbers (cdr lst))))))

(print (delete-even-numbers '(4 4 1 5 4 7 2)))
