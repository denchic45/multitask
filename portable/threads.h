// Получение указателя на структуру потока из объекта
#include "objects.h"

typedef enum
{
    THREAD_CREATED,
    THREAD_RUNNABLE,
    THREAD_RUNNING,
    THREAD_WAITING,
    THREAD_DEAD
} thread_state_t;

typedef struct thread_s
{
    union
    {
        object_t function; // функция потока (лямбда)
        func0_t func;      // указатель на функцию-примитив (если встроенная)
    };
    int id;                // идентификатор потока
    int state;             // текущее состояние потока (thread_state_t)
    object_t result;       // результат выполнения
    struct thread_s *next; // указатель на следующий свободный поток в пуле
    int free;              // Если 1 - слот потока свободен
#ifdef X32
    int pad; // выравнивание 28 + 4 = 32 байта
#else
    int pad[5]; // выравнивание 44 + 20 = 64 байта
#endif
} thread_t;

thread_t *get_thread(int thread_id);

object_t thread_spawn(object_t fun);

void thread_yield(object_t thread_id);

object_t thread_wait(object_t thread_id);

void thread_kill(object_t thread_id);