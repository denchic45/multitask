;;;; package.lisp

(defpackage #:threads
  (:use #:cl)
  (:nicknames #:th)
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
   #:thread-kill
   #:current-thread))