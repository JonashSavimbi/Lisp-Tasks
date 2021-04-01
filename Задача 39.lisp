(defun append-lists (lst1 lst2) 
	(cond ((null lst1) lst2)
		(t (cons (car lst1) (append-lists (cdr lst1) lst2)))))

(defun insert-sort (L)
	(cond ((null L) nil)
		((null (cdr L)) L)
		(T (insert (car L) (insert-sort (cdr L))))))
		
(defun insert (E L)
	(cond ((null L) (cons E nil))
		((< E (car L)) (cons E L))
		(T (cons (car L) (insert E (cdr L))))))

(defun delete-repeats (lst) 
	(cond ((null lst) nil)
        ((null (cadr lst)) lst)
		((= (car lst) (cadr lst)) (delete-repeats (cddr lst)))
		(t (cons (car lst) (delete-repeats (cdr lst))))))

(defun simmetrical-difference (lst1 lst2) 
    (delete-repeats (insert-sort(append-lists lst1 lst2)))) 

(print (simmetrical-difference '(2 3 4 5 6 7 1) '(1 2 3 4 5 10)))
