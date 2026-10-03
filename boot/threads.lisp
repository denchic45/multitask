;;;; API для библиотеки зеленых потоков

(in-package #:threads)

;;; Функции-заглушки

(defun not-implemented (&optional (feature-name "Функция"))
  "Функция-заглушка, выводящая сообщение о том, что функционал пока не реализован."
  (format t "Функция '~a' пока не реализована.~%" feature-name))

;;; Структура зеленого потока (Green Thread)

(defstruct (thread
            (:constructor %make-thread))
  "Зеленый поток"
  (id 0 :type integer)
  (name nil :type (or null string symbol))
  (state :created :type symbol) ; :created, :runnable, :running, :waiting, :dead
  (result nil :type t)
  (function nil :type (or null function)))

;;; Динамические переменные контекста

(defvar *current-thread* nil
  "Зеленый поток, выполняющийся в данный момент.")

;;; Управление потоками

(defun thread-spawn (function &key name)
  "Создает и запускает новый зеленый поток.
Параметры:
  - FUNCTION: функция без аргументов, исполняемая в зеленом потоке.
  - NAME: опциональное имя или идентификатор для отладки.
Возвращает объект THREAD."
  (declare (ignorable function name))
  (not-implemented "thread-spawn"))

(defun thread-yield ()
  "Уступает место другим потокам для выполнения работы."
  (not-implemented "thread-yield"))

(defun current-thread ()
  "Возвращает текущий исполняемый зеленый поток или NIL, если вызов происходит вне потока."
  *current-thread*)

(defun thread-wait (thread)
  "Блокирует текущий зеленый поток до тех пор, пока целевой поток THREAD не завершится.
Параметры:
  - THREAD: объект целевого потока.
Возвращает результат вычисления потока (thread-result)."
  (declare (ignorable thread))
  (not-implemented "thread-wait"))

(defun thread-kill (thread)
  "Принудительно переводит зеленый поток THREAD в состояние :DEAD."
  (declare (ignorable thread))
  (not-implemented "thread-kill"))

(defun thread-alive-p (thread)
  "Возвращает T, если поток THREAD существует и еще не завершил выполнение (:RUNNABLE, :RUNNING, :WAITING)."
  (and (thread-p thread)
       (member (thread-state thread) '(:created :runnable :running :waiting) :test #'eq)))
