.. multitask documentation master file

Документация проекта Multitask
==============================

**Multitask** – это библиотека для языка Common Lisp, предназначенная для работы с зелеными потоками.

Введение в зеленые потоки
-------------------------

**Зеленые потоки (Green Threads)** – это потоки выполнения, управление которыми осуществляется на уровне среды исполнения программы, а не ядром операционной системы.

Основные компоненты API
-----------------------

* **Зеленые потоки (Threads)**: легковесные потоки выполнения (структура ``thread``).
* **Управление потоками**: создание (``thread-spawn``), переключение (``thread-yield``), ожидание (``thread-join``, ``thread-wait``), уведомление (``thread-notify``) и завершение (``thread-kill``).
* **Приостановка выполнения**: кооперативный неблокирующий сон потока (``thread-sleep``).

Пример использования
--------------------

.. code-block:: common-lisp

   ;; Запуск потоков и ожидание результата
   (let ((thread1 (multitask:thread-spawn
                   (lambda ()
                     (format t "Поток 1: старт~%")
                     (multitask:thread-yield)
                     (format t "Поток 1: завершение~%")
                     42)
                   :name "worker-1"))
         (thread2 (multitask:thread-spawn
                   (lambda ()
                     (format t "Поток 2: работаем~%")
                     "готово")
                   :name "worker-2")))

     ;; Ожидание результата выполнения
     (let ((res1 (multitask:thread-join thread1))
           (res2 (multitask:thread-join thread2)))
       (format t "Результаты: ~a и ~a~%" res1 res2)))

Содержание
----------

.. toctree::
   :maxdepth: 2
   :caption: Пользовательская документация

   threads
   api_reference

.. toctree::
   :maxdepth: 2
   :caption: Внутреннее устройство

   internals/index
