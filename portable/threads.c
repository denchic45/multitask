#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include "error.h"
#include "objects.h"
#include "threads.h"

// Максимальное количество потоков
#define MAX_THREADS 64

/// Индекс последнего потока
int last_thread = 0;
/// Хранилище потоков
thread_t threads[MAX_THREADS];
/// Список свободных потоков
thread_t *free_threads = NULL;

/// Количество используемых потоков
int total_threads = 0;

/**
 * Создает новый поток
 *
 * @param fun - функция потока (лямбда)
 *
 * @return идентификатор потока
 */
object_t thread_spawn(object_t fun)
{
    thread_t *thread;
    if (last_thread == MAX_THREADS)
    {
        if (free_threads == NULL)
            error("Error: out of memory: threads");
        thread = free_threads;
        free_threads = free_threads->next;
    }
    else
    {
        thread = &threads[last_thread++];
    }
    thread->id = thread - threads;
    thread->next = NULL;
    thread->free = 0;
    thread->function = fun;
    thread->result = 0;
    thread->state = THREAD_CREATED;
    total_threads++;
    return thread->id;
}

/**
 * Передает управление другому потоку
 *
 * @param thread_id - идентификатор потока
 *
 * @return идентификатор потока
 */
void thread_yield(object_t thread_id)
{
    error("thread_yield: not implemented");
}

/**
 * Ожидает завершения одного или нескольких потоков
 *
 * @param thread_id - идентификатор потока
 * @return результат выполнения (объект или массив объектов результатов)
 */
object_t thread_wait(object_t thread_id)
{
    error("thread_wait: not implemented");
    return 0;
}

/**
 * Получает указатель на поток по его идентификатору
 *
 * @param thread_id - идентификатор потока
 *
 * @return указатель на поток
 */
thread_t *get_thread(int thread_id)
{
    if (thread_id < 0 || thread_id >= MAX_THREADS)
        error("get_thread: invalid thread id");
    if (threads[thread_id].free)
        error("get_thread: thread is free");
    return &threads[thread_id];
}

/**
 * Завершает поток
 *
 * @param thread_id - идентификатор потока
 */
void thread_kill(object_t thread_id)
{
    thread_t *p = get_thread(thread_id);
    if (p == NULL)
        error("thread_kill: null pointer: obj");
    if (p->free)
        return;
    p->state = THREAD_DEAD;
    p->result = 0;
    p->next = free_threads;
    free_threads = p;
    p->free = 1;
    total_threads--;
}