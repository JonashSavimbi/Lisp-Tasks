# Lisp Tasks
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
