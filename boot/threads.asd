;;;; threads.asd

(asdf:defsystem #:threads
  :description "Библиотека для работы с зелеными потоками (green threads) в Common Lisp."
  :author "denchic45"
  :license "MIT"
  :version "0.1.0"
  :serial t
  :components ((:file "package")
               (:file "threads")))
