#pragma once

#include "global.h"

#include "constants/flags.h"
#include "constants/vars.h"

u8 __attribute__((long_call)) FlagSet(u16 id);
u8 __attribute__((long_call)) FlagClear(u16 id);
bool8 __attribute__((long_call)) FlagGet(u16 id);
u8* __attribute__((long_call)) GetFlagPointer(u16 id);
u16 __attribute__((long_call)) VarGet(u16 var);
u16* __attribute__((long_call)) GetVarPointer(u16 var);
bool8 __attribute__((long_call)) VarSet(u16 var, u16 value);
u16 __attribute__((long_call)) VarGetEventObjectGraphicsId(u8 Id);

/*
void InitEventData(void);
void ClearTempFieldEventData(void);
void ClearUpperFlags(void);
void DisableNationalPokedex(void);
void EnableNationalPokedex(void);
bool32 IsNationalPokedexEnabled(void);
void DisableMysteryEvent(void);
void EnableMysteryEvent(void);
bool32 IsMysteryEventEnabled(void);
void DisableMysteryGift(void);
void EnableMysteryGift(void);
bool32 IsMysteryGiftEnabled(void);
void sub_809D4D8(void);
void sub_809D570(void);
void DisableResetRTC(void);
void EnableResetRTC(void);
bool32 CanResetRTC(void);
u8 VarGetFieldObjectGraphicsId(u8 id);
u16 * GetVarPointer(u16 id);
bool32 sub_806E2BC(void);
void sub_806E6FC(void);
*/

#define Var8000 (*((u16*) 0x2036FEC))
#define Var8001 (*((u16*) 0x2036FEE))
#define Var8002 (*((u16*) 0x2036FF0))
#define Var8003 (*((u16*) 0x2036FF2))
#define Var8004 (*((u16*) 0x2036FF4))
#define Var8005 (*((u16*) 0x2036FF6))
#define Var8006 (*((u16*) 0x2036FF8))
#define Var8007 (*((u16*) 0x2036FFA))
#define Var8008 (*((u16*) 0x2036FFC))
#define Var8009 (*((u16*) 0x2036FFE))
#define Var800A (*((u16*) 0x2037000))
#define Var800B (*((u16*) 0x2037002))
#define Var800D (*((u16*) 0x2037004))
#define Var8010 (*((u16*) 0x203700A))
#define Var800F (*((u16*) 0x2037006))
#define Var800E (*((u16*) 0x203ACA8))
#define Var8014 (*((u16*) 0x2037012))


#define gSpecialVar_LastResult (*((u16*) 0x2037004)) //extern u16 gSpecialVar_Result; //Var800D
#define gSpecialVar_LastTalked (*((u16*) 0x2037006)) //extern u16 gSpecialVar_LastTalked;
#define gSpecialVar_ItemId (*((u16*) 0x203ACA8)) //extern u16 gSpecialVar_ItemId; //Var800E
#define gSpecialVar_PlayerFacing (*((u16*) 0x2037008)) //extern u16 gSpecialVar_PlayerFacing;
#define gSpecialVar_MonBoxId (*((u16*) 0x203700A)) //extern u16 gSpecialVar_MonBoxId;
#define gSpecialVar_MonBoxPos (*((u16*) 0x203700C)) //extern u16 gSpecialVar_MonBoxPos;

/*
extern u16 gSpecialVar_0x8000;
extern u16 gSpecialVar_0x8001;
extern u16 gSpecialVar_0x8002;
extern u16 gSpecialVar_0x8003;
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;
extern u16 gSpecialVar_0x8007;
extern u16 gSpecialVar_0x8008;
extern u16 gSpecialVar_0x8009;
extern u16 gSpecialVar_0x800A;
extern u16 gSpecialVar_0x800B;
extern u16 gSpecialVar_Facing;
extern u16 gSpecialVar_0x8014;

extern u16 gUnknown_2037004;
extern u16 gUnknown_20370C0;
*/
