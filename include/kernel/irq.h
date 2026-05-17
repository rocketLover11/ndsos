#pragma once

#ifndef IRQ_H
#define IRQ_H

#include <stdint.h>

void irq_init(void);

volatile uint32_t irq_vblank_count;

#endif // IRQ_H