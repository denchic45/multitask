/// Тип для объекта
#ifndef X32
typedef long long object_t;
#else
typedef unsigned int object_t;
#endif

//макрос, который строит указатель, состоящий из типа в младших битах и значения в остальных
#define NEW_OBJECT(type, val) ((object_t)(val) + (type))

// указатели на функции для примитивов
typedef  object_t (*func0_t)(); 
typedef  object_t (*func1_t)(object_t);
typedef  object_t (*func2_t)(object_t, object_t);
typedef  object_t (*func3_t)(object_t, object_t, object_t);
typedef  object_t (*func4_t)(object_t, object_t, object_t, object_t);
typedef  object_t (*func5_t)(object_t, object_t, object_t, object_t, object_t);