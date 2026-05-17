#pragma once

#ifndef SCHEDULER_H
#define SCHEDULER_H

#include <stdint.h>

#define MAX_TASKS 8

typedef void (*task_fn)(void);

typedef enum {
    TASK_DEAD = 0,
    TASK_READY = 1,
    TASK_BLOCKED = 2,
} task_state_t;

typedef struct {
    task_fn fn;
    task_state_t state;
    const char* name;
    uint32_t wake_tick;
} task_t;

void sched_init(void);

int sched_add(const char* name, task_fn fn);

void sched_remove(int id);

void sched_sleep(uint32_t ticks);

void sched_tick(void);

uint32_t sched_get_tick(void);

#endif // SCHEDULER_H