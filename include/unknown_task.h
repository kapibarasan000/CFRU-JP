#ifndef GUARD_unknown_task_H
#define GUARD_unknown_task_H

#include "global.h"

// Exported type declarations
struct UnknownTaskStruct
{
    volatile void *dest;
    u32 control;
    u8 unk8;
    u8 unk9;
};

extern struct UnknownTaskStruct gUnknown_082DED20;

// Exported RAM declarations

// Exported ROM declarations
void remove_some_task(void);
void sub_80BB2F8(struct UnknownTaskStruct arg0);
void sub_80BB368(void);

#endif // GUARD_unknown_task_H
