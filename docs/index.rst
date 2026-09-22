.. multitask documentation master file

Документация проекта Multitask
==============================

**Multitask** — это библиотека для языка Common Lisp, предназначенная для работы с зелеными потоками.

Обзор
-------------------------

.. code-block:: common-lisp

   ;; Использование среды выполнения и запуск зеленых потоков
   (multitask:with-runtime (:workers 1)
     ;; Запуск первой задачи
     (let ((task1 (multitask:spawn
                   (lambda ()
                     (format t "Задача 1: старт~%")
                     (multitask:yield-task)
                     (format t "Задача 1: завершение~%")
                     42)
                   :name "worker-1"))
           (task2 (multitask:spawn
                   (lambda ()
                     (format t "Задача 2: работаем~%")
                     "готово")
                   :name "worker-2")))

       ;; Ожидание результата выполнения
       (let ((res1 (multitask:join-task task1))
             (res2 (multitask:join-task task2)))
         (format t "Результаты: ~a и ~a~%" res1 res2))))
