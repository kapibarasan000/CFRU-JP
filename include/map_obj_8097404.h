//
// Created by scott on 9/7/2017.
//

#ifndef GUARD_MAP_OBJ_8097404_H
#define GUARD_MAP_OBJ_8097404_H

#include "global.h"

// Exported type declarations

// Exported RAM declarations
extern void *gUnknown_020374EC;

// Exported ROM declarations
void sub_80974F4(struct Sprite *);
void npc_sync_anim_pause_bits(struct MapObject *);
void oamt_npc_ministep_reset(struct Sprite *, u8, u8);
u8 sub_8097968(struct MapObject *);
bool8 obj_npc_ministep(struct Sprite *sprite);
bool8 sub_8097118(struct Sprite *sprite);
void sub_8097108(struct Sprite *, u8);
void sub_8097268(struct Sprite *, u8, u8, u8);
void DoShadowFieldEffect(struct MapObject *);
u8 sub_8097288(struct Sprite *);
u8 sub_8097310(struct Sprite *);
void obj_anim_image_set_and_seek(struct Sprite *, u8, u8);
bool8 sub_80973E8(struct Sprite *);
void sub_809717C(struct Sprite *);
bool8 sub_8097184(struct Sprite *);
void sub_8097994(struct MapObject *);
void sub_8097A34(u8);

#endif //GUARD_MAP_OBJ_8097404_H
