#pragma once

#ifndef KERNEL_H
#define KERNEL_H

void kernel_init(void);
void kernel_panic(const char* msg);

#endif // KERNEL_H