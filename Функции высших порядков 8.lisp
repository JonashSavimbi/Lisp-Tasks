(defun make-natural-numbers-counter ()
    (let ( (x 0) )
        (lambda () (setq x (+ x 1)))
    )
)
 
(setq c1 (make-natural-numbers-counter))

(defun natural-numbers-generator (n) 
    (cond ((/= n 0) 
        (print (funcall c1)) (natural-numbers-generator (- n 1)))))
        
(print (natural-numbers-generator 8))