# Lisp Tasks
### _Содержание_ ###
#### _Основы языка Lisp_ ####
[1) Задача 5](#Задача-5)  
[2) Задача 8](#Задача-8)  
[3) Задача 10](#Задача-10)  
[4) Задача 13](#Задача-13)  
[5) Задача 25](#Задача-25)  
[6) Задача 39](#Задача-39)  
[8) Задача 42](#Задача-42)  
[9) Задача 48](#Задача-48)    
#### _Функции высших порядков_ ####


<a name="Задача-5"></a> 
### _Задача 5_ ###
Определите функцию, которая увеличивает каждый элемент заданного списка на единицу.  
### _Решение_ ###
````common-lisp
(defun lst-plus (lst)
    (cond ((null lst) nil)
        (t (cons(+ 1 (car lst)) (lst-plus (cdr lst))))))
        
(print (lst-plus '(5 -1 2 -3 -10 2)))
````
Определяем функцию `lst-plus`, которой в качестве аргумента передаем список. 
Далее, в теле функции с помощью `cond` сначала проверяем, является ли список пустым.
Если да, то возвращаем `nil`. Если нет, то создаем с помощью `cons` список из инкрементированной головы списка `lst` и результата рекурсивного вызова функции `lst-plus` для хвоста списка `lst`.

### _Тесты_ ###

| Тест              | Результат          | 
| :----------------:|:------------------:| 
| (5 -1 2 -3 -10 2) | (6 0 3 -2 -9 3)    | 
| (1 1 1 1 1)       | (2 2 2 2 2)        |
| (0)               | (1)                |
| ()                | (NIL)              |

<a name="Задача-8"></a> 
### _Задача 8_ ###
Определите функцию, которая разделит исходный список из целых чисел на два списка: список положительных чисел и список отрицательных чисел.  
### _Решение_ ###
````common-lisp
(defun pos (lst)
    (cond ((null lst) nil)
        (t (cons (cond ((> (car lst) 0) (car lst))) (pos (cdr lst))))))

(defun neg (lst)
    (cond ((null lst) nil)
        (t (cons (cond ((< (car lst) 0) (car lst))) (neg (cdr lst))))))

(defun pos-neg (lst) (list (remove nil (pos lst)) (remove nil (neg lst))))

(print (pos-neg '(5 -1 2 -3 -10 2)))
````
Определяем вспомогательную функцию `pos`, которой в качестве аргумента передаем список. Данная функция будет возвращать нам список из положительных чисел.   
В теле функции с помощью `cond` сначала проверяем, является ли список пустым. Если да, то возвращаем `nil`. Если нет, то создаем с помощью `cons` список из результата работы еще одного оператора `cond`, который возвращает голову списка, если та является положительной, и результата рекурсивного вызова функции `pos` для хвоста списка `lst`.  
Аналогичным образом определяется функция `neg`, которая возвращает список из отрицательных чисел заданного в качестве аргумента списка.  
Затем определяется функция `pos-neg`, которая с помощью команды `list` возвращает нам объединение результатов работы `pos` и ` neg`.  

### _Тесты_ ###

| Тест              | Результат          | 
| :----------------:|:------------------:|
| (5 -1 2 -3 -10 2) | ((5 2 2) (-1 -3 -10)) |    | 
| (-1 -1 -1 -1 -1) | (NIL (-1 -1 -1 -1 -1))    | 
| (1 1 1 1 1)       | ((1 1 1 1 1) NIL)        |
| (0)               | (NIL NIL)                |
| ()                | (NIL NIL)              |

<a name="Задача-10"></a> 
### _Задача 10_ ###
Определите функцию, осуществляющую удаление указанного количества последних элементов исходного списка. 
### _Решение_ ###
````common-lisp
(defun len (lst) 
    (cond((null lst) 0)
        (t (+ 1 (len (cdr lst))))
    )
)

(defun del-few-el (lst n) 
    (cond((= (len lst) n) nil)
        (t (cons (car lst) (del-few-el (cdr lst) n)))
    )
)

(print (del-few-el '(3 4 5 1 2 3 0 2) 5))
````
Определяем вспомогательную функцию `len`, которой в качестве аргумента передаем список. Данная функция будет возвращать нам длину переданного списка. 
Затем определяется функция `del-few-el`, которой передаются два аргумента: список и число, характеризующее количество элементов списка, которые нужно удалить.  
С помощью оператора `cond` проверяем, совпала ли длина списка с указанным числом. Если да, то возвращаем `NIL`, если нет, то создаем список `cons` в который передаем в качестве аргументов голову списка `lst` и результат рекурсивного вызова функции `del-few-el` для хвоста списка `lst` и числа `n`.

### _Тесты_ ###

| Тест              | Результат          | 
| :----------------:|:------------------:|
| (5 -1 2 -3 -10 2) 2 | (5 -1 2 -3) |    
| (3 4 5 1 2 3 0 2) 5 | (3 4 5)     | 
| (1 1 1 1 1) 5     | NIL    |

<a name="Задача-13"></a> 
### _Задача 13_ ###
Определите функцию, удаляющую в исходном списке все повторные вхождения элементов. 
### _Решение_ ###
````common-lisp
(defun delete-number (lst n) 
    (cond ((null lst) nil)
        ((= n (car lst)) (delete-number (cdr lst) n))
        (t (cons (car lst) (delete-number (cdr lst) n)))))

(defun delete-all-repeats (lst)
    (cond ((null lst) nil)
        (t (cons (car lst) (delete-all-repeats (delete-number (cdr lst) (car lst)))))))

(print (delete-all-repeats '(4 4 4 4 4 4 2)))
````
Определяем вспомогательную функцию `delete-number`, которой в качестве аргументов передаем список и число, которое нужно удалить из списка. Данная функция будет возвращать нам список без указанного числа.  
С помощью оператора `cond` мы проверяем, является ли список пустым. Если да, то возвращаем `NIL`.  
Если нет, то, в том случае, если голова списка совпадает с указанным числом `n`, возвращаем результат рекурсивного вызова функции `delete-number` для хвоста списка и указанного числа `n`.  
Если и это условие не выполняется, т.е, голова списка не совпадает с указанным числом `n`, то возвращаем список из головы исходного списка и результата рекурсивного вызова функции `delete-number` для хвоста исходного списка и указанного числа `n`.  
Затем определяется функция `delete-all-repeats`, которой в качестве аргумента передается список, в котором нужно удалить все повторные вхождения элементов.
С помощью оператора `cond` проверяем, является ли список пустым.  
Если да, то возвращаем `NIL`. Если нет, то создаем список с помощью оператора `cons`, в который передаем голову исходного списка и результат рекурсивного вызова функции `delete-all-repeats`, в которую передается результат работы функции `delete-number` для хвоста исходного списка и его головы.  
Т.е., мы создаем список из первого вхождения числа в исходный список, а затем из хвоста удаляем все его повторные вхождения.

### _Тесты_ ###

| Тест              | Результат          | 
| :----------------:|:------------------:|
| (1 2 3 3 4 5 6 7 5) | (1 2 3 4 5 6 7) |
| (4 4 4 4 4 4 2) | (4 2) |    
| (1 2 3 4) | (1 2 3 4)     | 
| (1 1 1 1 1) | (1)    |

<a name="Задача-25"></a> 
### _Задача 25_ ###
Определите функцию, удаляющую из списка каждый четный элемент. 
### _Решение_ ###
````common-lisp
(defun delete-even-numbers (lst) 
    (cond ((null lst) nil)
        ((= (rem (car lst) 2) 0) (delete-even-numbers (cdr lst)))
        (t (cons (car lst) (delete-even-numbers (cdr lst))))))

(print (delete-even-numbers '(4 4 1 5 4 7 2)))
````
Определяем функцию `delete-even-numbers`, которой в качестве аргумента передаем список.  
Далее, с помощью оператора `cond` проверяем, является ли список пустым.  
Если да, то возвращаем `NIL`. 
Иначе, если остаток от деления головы исходного списка на два равен нулю, то возвращаем результат рекурсивного вызова функции `delete-even-numbers` для хвоста исходного списка.  
Иначе, с помощью оператора `cons` создаем список из головы исходного списка и результата рекурисвного вызова функции `delete-even-numbers` для хвоста исходного списка.

### _Тесты_ ###

| Тест              | Результат          | 
| :----------------:|:------------------:|
| (4 4 1 5 4 7 2) | (1 5 7) |
| (4 4 4 4 4 4 2) | NIL |    
| (1 2 3 4) | (1 3 4)     | 
| (1 1 1 1 1) | (1 1 1 1)    |

<a name="Задача-39"></a> 
### _Задача 39_ ###
Определите функцию СИММЕТРИЧЕСКАЯ-РАЗНОСТЬ, формирующую множество из элементов, не входящих в оба множества. 
### _Решение_ ###
````common-lisp
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
````
Идея реализации заключается в том, что при объединении двух множеств каждый элемент может повториться не более двух раз, а значит, чтобы добиться желаемого результата, нам достаточно объединить два множества, отсортировать полученный список и, если соседние элементы списка равны, удалить их.  
Функция `append-lists` объединяет два списка.
Функции `insert-sort` и `insert` позволяют сортировать массивы.  
Функция `delete-repeats` позволяет нам удалить два соседних элемента списка, если они равны. С помощью оператора `cond` проверяем, пустой ли список.  
Если нет, то проверяем, существует ли следующий после головы списка элемент (проверка на выход из границ списка). Если не существует, возвращаем результирующий список.  
Если и предыдущее условие не выполняется, то с помощью оператора `cons` создаем список из головы исходного списка и результата рекурсивного вызова функции `delete-repeats` для хвоста исходного списка.  
Результирующей же функцией будет `simmetrical-difference`, в которую передаются два множества. Затем вызыватся функция `delete-repeats` для результата работы функции `insert-sort`, которая в свою очередь сортирует список, полученный с помощью функции `append-lists`.

### _Тесты_ ###

| Тест              | Результат          | 
| :----------------:|:------------------:|
| '(2 3 4 5 6 7 1) '(1 2 3 4 5 10) | (6 7 10) |    
| '(1 2) '(2 1) | NIL     | 
| '(1 2 3) '(4 5 6)     | (1 2 3 4 5 6)    |

<a name="Задача-42"></a> 
### _Задача 42_ ###
Определите функцию, находящую максимальное из значений, находящихся в вершинах дерева. 
### _Решение_ ###
````common-lisp
(defun tree-max-val (maximum lst) 
    (cond ((null lst) maximum)
        ((atom (car lst)) 
            (cond ((> (car lst) maximum) 
                (tree-max-val (car lst) (cdr lst)))
            (t (tree-max-val maximum (cdr lst)))))
        (t (tree-max-val (tree-max-val maximum (car lst)) (cdr lst)))))

(defun max-val (lst) 
    (tree-max-val (car lst) lst))
        
(print (max-val '(52 (2 (1 3 4 58) 41 (2 (2 6))))))
````



<a name="Задача-48"></a> 
### _Задача 48_ ###
Функция GET возвращает в качестве результата NIL в том случае, если у символа нет данного свойства, либо если значением этого свойства является NIL. Следовательно, функцией GET нельзя проверить, есть ли некоторое свойство в списке свойств. Напишите предикат (ИМЕЕТ-СВОЙСТВО символ свойство), который проверяет, обладает ли символ данным свойством 
### _Решение_ ###
````common-lisp
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
````
Определяем вспомогательную функцию `check-property`, в которую передаются список свойств и свойство, которое нужно проверить. Эта функция будет проверять, содержится ли указанное свойство в указанном списке свойств.  
С помощью `cond` проверяем, является ли список пустым.  
Если да, то данного свойства в списке нет, значит возвращаем "THERE IS NO SUCH PROPERTY". 
Если нет, то проверяем, равно ли значение головы списка свойств с указанным свойством. Если равно, то свойство есть в списке свойств, значит возвращаем "PROPERTY EXISTS".  
Если условие выше не выполняется, то рекурсивно вызываем функцию `check-property` для хвоста хвоста указанного списка свойств (в списке свойств сразу же после свойства идет его значение, поэтому один элемент можно пропустить).  
Далее объявляется функция `has-property`, которой передается символ и свойство, которое нужно проверить. В теле функции запускается вспомогательная функция `check-property` для списка свойств `symbol-plist` указанного `symbol` и указанного свойства `property`.
