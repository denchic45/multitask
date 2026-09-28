.. threads documentation master file

Документация проекта Threads
============================

**Threads** – это библиотека для языка Common Lisp, предназначенная для работы с зелеными потоками.

Введение в зеленые потоки
-------------------------

**Зеленые потоки (Green Threads)** – это потоки выполнения, управление которыми осуществляется на уровне среды исполнения программы, а не ядром операционной системы.

Основные компоненты API
-----------------------

* **Зеленые потоки (Threads)**: легковесные потоки выполнения (структура ``thread``).
* **Управление потоками**: создание (``thread-spawn``), переключение (``thread-yield``), ожидание (``thread-wait``) и завершение (``thread-kill``).

Пример использования
--------------------

.. code-block:: common-lisp

   ;; Запуск потоков и ожидание результата
   (let ((thread1 (threads:thread-spawn
                   (lambda ()
                     (format t "Поток 1: старт~%")
                     (threads:thread-yield)
                     (format t "Поток 1: завершение~%")
                     42)
                   :name "worker-1"))
         (thread2 (threads:thread-spawn
                   (lambda ()
                     (format t "Поток 2: работаем~%")
                     "готово")
                   :name "worker-2")))

     ;; Ожидание результата выполнения
     (let ((res1 (threads:thread-wait thread1))
           (res2 (threads:thread-wait thread2)))
       (format t "Результаты: ~a и ~a~%" res1 res2)))