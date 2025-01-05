#ifndef GUARD_FIELD_SCREEN_H
#define GUARD_FIELD_SCREEN_H

#include "global.h"

// Exported type declarations

// Exported RAM declarations

// Exported ROM declarations
void pal_fill_black(void);
bool8 sub_80AD0BC(void);
void sub_80B0428(void);
void UpdateWeatherPerDay(u16 days);

#endif //GUARD_FIELD_SCREEN_H
