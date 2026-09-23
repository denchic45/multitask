;;;; multitask.asd

(asdf:defsystem #:multitask
  :description "Библиотека для работы с зелеными потоками (green threads) в Common Lisp."
  :author "Multitask Team"
  :license "MIT"
  :version "0.1.0"
  :serial t
  :components ((:file "package")
               (:file "multitask")))
