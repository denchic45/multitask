;;;; package.lisp

(defpackage #:multitask
  (:use #:cl)
  (:nicknames #:mt)
  (:export
   ;; Условия ошибок
   #:multitask-error
   #:task-error
   #:timeout-error
   #:not-implemented-error

   ;; Среда выполнения (Runtime / Scheduler)
   #:*runtime*
   #:runtime
   #:runtime-p
   #:runtime-running-p
   #:start-runtime
   #:stop-runtime
   #:with-runtime

   ;; Задачи / Зеленые потоки (Tasks / Green Threads)
   #:task
   #:task-p
   #:task-id
   #:task-name
   #:task-state
   #:task-result
   #:task-alive-p
   #:spawn
   #:yield-task
   #:current-task
   #:join-task
   #:kill-task

   ;; Примитивы синхронизации
   #:mutex
   #:mutex-p
   #:make-mutex
   #:acquire-mutex
   #:release-mutex
   #:with-mutex
   #:condition-variable
   #:condition-variable-p
   #:make-condition-variable
   #:wait-condition-variable
   #:notify-condition-variable
   #:notify-all-condition-variables

   ;; Таймеры и операции ввода-вывода
   #:task-sleep
   #:wait-fd-read
   #:wait-fd-write))