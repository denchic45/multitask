# multitask

Библиотека для работы с зелеными потоками в Common Lisp.

## Основные компоненты API

* **Задачи (Tasks / Green Threads)**: легковесные потоки выполнения с собственным пользовательским стеком (`spawn`, `yield-task`, `join-task`, `kill-task`).
* **Среда выполнения (Runtime / Scheduler)**: планировщик задач (`with-runtime`, `start-runtime`, `stop-runtime`).
* **Синхронизация (Sync)**: мьютексы (`with-mutex`) и условные переменные (`condition-variable`).
* **Неблокирующий I/O и таймеры**: кооперативный сон (`task-sleep`) и ожидание готовности сокетов (`wait-fd-read`, `wait-fd-write`).

## Пример использования

```lisp
(asdf:load-system :multitask)

(multitask:with-runtime (:workers 1)
  (let ((task1 (multitask:spawn
                (lambda ()
                  (format t "Поток 1 работает~%")
                  (multitask:yield-task)
                  "готово-1")
                :name "worker-1"))
        (task2 (multitask:spawn
                (lambda ()
                  (format t "Поток 2 работает~%")
                  "готово-2")
                :name "worker-2")))
    (format t "Результаты: ~a, ~a~%"
            (multitask:join-task task1)
            (multitask:join-task task2))))
```

## Документация

Документация в формате reStructuredText (`.rst`) расположена в каталоге `docs/`:
* [docs/index.rst](docs/index.rst) — Главная страница документации
* [docs/runtime.rst](docs/runtime.rst) — Среда выполнения и планировщик
* [docs/threads.rst](docs/threads.rst) — Задачи и жизненный цикл зеленых потоков
* [docs/sync.rst](docs/sync.rst) — Примитивы синхронизации (мьютексы, условные переменные)
* [docs/io_timers.rst](docs/io_timers.rst) — Неблокирующие таймеры и операции ввода-вывода
* [docs/api_reference.rst](docs/api_reference.rst) — Справочник экспортируемых символов

## Лицензия

MIT
