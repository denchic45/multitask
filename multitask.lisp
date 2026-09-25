;;;; API для библиотеки зеленых потоков

(in-package #:multitask)

;;; Условия ошибок (Conditions)

(define-condition base-error (error)
  ((message :initarg :message :reader base-error-message :initform nil))
  (:report (lambda (condition stream)
             (format stream "Multitask error: ~a"
                     (or (base-error-message condition) "unspecified error"))))
  (:documentation "Базовое условие для всех ошибок библиотеки multitask."))

(define-condition not-implemented-error (base-error)
  ((feature-name :initarg :feature-name :reader not-implemented-feature-name :initform "Операция"))
  (:report (lambda (condition stream)
             (format stream "Операция '~a' еще не реализована."
                     (not-implemented-feature-name condition))))
  (:documentation "Сигнализируется при вызове нереализованных функций API."))

(define-condition thread-error (base-error)
  ((thread :initarg :thread :reader thread-error-thread :initform nil))
  (:report (lambda (condition stream)
             (format stream "Ошибка выполнения потока ~a: ~a"
                     (thread-error-thread condition)
                     (or (base-error-message condition) "сбой"))))
  (:documentation "Сигнализируется при сбое или аварийном завершении потока."))

(define-condition timeout-error (base-error)
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream "Истекло время ожидания операции (таймаут).")))
  (:documentation "Сигнализируется при превышении таймаута ожидания."))

(defun %not-implemented (feature-name)
  "Вспомогательная функция для генерации ошибки нереализованного функционала."
  (error 'not-implemented-error :feature-name feature-name))

;;; Структура зеленого потока (Green Thread)

(defstruct (thread
            (:constructor %make-thread))
  "Зеленый поток"
  (id 0 :type integer)
  (name nil :type (or null string symbol))
  (state :created :type symbol) ; :created, :runnable, :running, :waiting, :dead
  (result nil :type t)
  (function nil :type (or null function))
  (notified-p nil :type boolean))

;;; Динамические переменные контекста

(defvar *current-thread* nil
  "Зеленый поток, выполняющийся в данный момент.")

;;; Управление потоками (Green Threads API)

(defun thread-spawn (function &key name)
  "Создает и запускает новый зеленый поток.
Параметры:
  - FUNCTION: функция без аргументов, исполняемая в зеленом потоке.
  - NAME: опциональное имя или идентификатор для отладки.
Возвращает объект THREAD."
  (declare (ignorable function name))
  (%not-implemented "thread-spawn"))

(defun thread-yield ()
  "Добровольно уступает процессор, позволяя другим готовым потокам возобновить работу."
  (%not-implemented "thread-yield"))

(defun current-thread ()
  "Возвращает текущий исполняемый зеленый поток или NIL, если вызов происходит вне потока."
  *current-thread*)

(defun thread-join (thread &key timeout)
  "Блокирует текущий зеленый поток до тех пор, пока целевой поток THREAD не завершится.
Параметры:
  - THREAD: объект целевого потока.
  - TIMEOUT: опциональное максимальное время ожидания в секундах.
Возвращает результат вычисления потока (thread-result).
Сигнализирует TIMEOUT-ERROR при превышении времени ожидания."
  (declare (ignorable thread timeout))
  (%not-implemented "thread-join"))

(defun thread-wait (&key timeout)
  "Приостанавливает выполнение текущего зеленого потока до явного уведомления
через THREAD-NOTIFY или до истечения времени TIMEOUT в секундах.
Если TIMEOUT не задан (NIL), ожидание длится бесконечно.
При наступлении таймаута поток продолжает работу (не завершается).
Возвращает T, если поток был разбужен уведомлением, или NIL, если истек таймаут."
  (declare (ignorable timeout))
  (%not-implemented "thread-wait"))

(defun thread-notify (thread)
  "Будит указанный зеленый поток THREAD, переводя его из состояния ожидания :WAITING
обратно в состояние готовности :RUNNABLE. Если целевой поток еще выполняется,
ему выставляется токен готовности, предотвращающий потерю уведомления (lost wakeup).
Возвращает T."
  (declare (ignorable thread))
  (%not-implemented "thread-notify"))

(defun thread-kill (thread)
  "Принудительно переводит зеленый поток THREAD в состояние :DEAD."
  (declare (ignorable thread))
  (%not-implemented "thread-kill"))

(defun thread-alive-p (thread)
  "Возвращает T, если поток THREAD существует и еще не завершил выполнение (:RUNNABLE, :RUNNING, :WAITING)."
  (and (thread-p thread)
       (member (thread-state thread) '(:created :runnable :running :waiting) :test #'eq)))

;;; Приостановка потока (Sleep API)

(defun thread-sleep (seconds)
  "Приостанавливает выполнение текущего зеленого потока на SECONDS секунд без
блокировки нативного потока ОС. По истечении таймера поток становится :RUNNABLE."
  (declare (ignorable seconds))
  (%not-implemented "thread-sleep"))
