#pragma once

#include "global.h"

void __attribute__((long_call)) SetUpItemUseCallback(u8 taskId);
void __attribute__((long_call)) SetUpItemUseOnFieldCallback(u8 taskId);
void __attribute__((long_call)) PrintNotTheTimeToUseThat(u8 taskId, bool8 inField);

extern void (*sItemUseOnFieldCB)(u8 taskId);
