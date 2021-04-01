(setf (get 'annie 'age) 43)
(setf (get 'annie 'job) 'accountant)
(setf (get 'annie 'sex) 'female)
(setf (get 'annie 'children) 3)

(defun check-property (proplist property) 
    (cond ((null proplist) "THERE IS NO SUCH PROPERTY")
        ((string= property (car proplist)) "PROPERTY EXISTS")
        (t (check-property (cddr proplist) property))))

(defun has-property (symbol property) 
    (check-property (symbol-plist symbol) property))
    
(print (has-property 'annie 'husband))
(print (has-property 'annie 'age))