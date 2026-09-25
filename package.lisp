;;;; package.lisp

(defpackage #:multitask
  (:use #:cl)
  (:nicknames #:mt)
  (:export
   ;; Условия ошибок
   #:base-error
   #:thread-error
   #:timeout-error
   #:not-implemented-error

   ;; Зеленые потоки (Green Threads)
   #:*current-thread*
   #:thread
   #:thread-p
   #:thread-id
   #:thread-name
   #:thread-state
   #:thread-result
   #:thread-alive-p
   #:thread-spawn
   #:thread-yield
   #:thread-wait
   #:thread-notify
   #:thread-join
   #:thread-kill
   #:thread-sleep
   #:current-thread))