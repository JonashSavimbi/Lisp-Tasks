(defun delete-number (lst n) 
    (cond ((null lst) nil)
        ((= n (car lst)) (delete-number (cdr lst) n))
        (t (cons (car lst) (delete-number (cdr lst) n)))))

(defun delete-all-repeats (lst)
    (cond ((null lst) nil)
        (t (cons (car lst) (delete-all-repeats (delete-number (cdr lst) (car lst)))))))

(print (delete-all-repeats '(4 4 4 4 4 4 2)))