#pragma once

#ifndef MEMORY_H
#define MEMORY_H

#include <stddef.h>

void mem_init(void);

void* kmalloc(size_t size);
void kfree(void* ptr);

size_t mem_free_bytes(void);
size_t mem_used_bytes(void);

#endif // MEMORY_H