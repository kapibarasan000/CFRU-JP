#ifndef GUARD_HALL_OF_FAME_H
#define GUARD_HALL_OF_FAME_H

#include "global.h"
#include "pokemon.h"

#define HALL_OF_FAME_MAX_TEAMS 40
#define GAME_STAT_ENTERED_HOF 10

#define tDontSaveData       data[0]
#define tDisplayedMonId     data[1]
#define tMonNumber          data[2]
#define tFrameCount         data[3]
#define tPlayerSpriteID     data[4]
#define tMonSpriteId(i)     data[i + 5]

#define tDestinationX  data[1]
#define tDestinationY  data[2]
#define tSpecies       data[7]

#define tCurrTeamNo     data[0]
#define tCurrPageNo     data[1]
#define tCurrMonId      data[2]
#define tMonNo          data[4]
// #define tMonSpriteId(i) data[i + 5]

#define CpuCopy16(src, dest, size) CPU_COPY(src, dest, size, 16)
#define CPU_COPY(src, dest, size, bit) CpuSet(src, dest, CPU_SET_##bit##BIT | ((size)/(bit/8) & 0x1FFFFF))
#define CPU_SET_16BIT     0x00000000

/*
struct __attribute__((packed, aligned(4))) HallofFameMon {
    u32 tid;
    u32 personality;
    u16 species;
    u8 lvl;
    u8 nick[POKEMON_NAME_LENGTH];
};

struct __attribute__((packed)) HallofFameTeam {
    struct HallofFameMon mon[PARTY_SIZE];
};

//_Static_assert(sizeof(struct HallofFameTeam) * HALL_OF_FAME_MAX_TEAMS <= 0x1770, "");
*/



#define gText_PickCancel ((void*)  0x083DD4B0)
#define gText_PickNextCancel ((void*) 0x083DD49C)
#define gText_HOFNumber ((void*) 0x083DD71C)
#define gText_Number ((void*) 0x083DD740)
#define gText_Level ((void*) 0x083DD744)
#define gText_IDNumber ((void*) 0x083DD74C)
#define gText_SavingDontTurnOffPower ((void*) 0x083E04B6)
#define sUnknown_083D2414 ((void*) 0x083D2414)

extern const s16 sHallOfFame_MonFullTeamPositions[6][4];
extern const s16 sHallOfFame_MonHalfTeamPositions[3][4];

struct HallofFameMon {
    u32 tid;
    u32 personality;
    u16 species;
    u8 lvl;
    u8 nick[POKEMON_NAME_LENGTH];
};

struct HallofFameTeam {
	struct HallofFameMon mon[PARTY_SIZE];
};

extern struct HallofFameTeam* sHofMonPtr;


void CB2_DoHallOfFameScreen(void);
void CB2_DoHallOfFameScreenDontSaveData(void);
void CB2_DoHallOfFamePC(void);
void sub_8166530(void);

void __attribute__((long_call)) sub_8112F98(void);
bool8 __attribute__((long_call)) InitHallOfFameScreen(void);
void __attribute__((long_call)) Task_Hof_SetMonDisplayTask(u8 taskId);
void __attribute__((long_call)) Task_Hof_TrySaveData(u8 taskId);
void __attribute__((long_call)) Task_Hof_PaletteFadeAndPrintWelcomeText(u8 taskId);
u8 __attribute__((long_call)) HofPC_CreateWindow(u8 bg, u8 xPos, u8 yPos, u8 palette, u16 baseTile);
void __attribute__((long_call)) Task_HofPC_PrintDataIsCorrupted(u8 taskId);
void __attribute__((long_call)) HofPC_PutText(const u8 *string, const u8 *string2, u8 a3, u8 a4, bool8 copyToVram);
void __attribute__((long_call)) Task_HofPC_HandleInput(u8 taskId);
void __attribute__((long_call)) SpriteCB_GetOnScreenAndAnimate(struct Sprite *sprite);
void __attribute__((long_call)) NewMenuHelpers_DrawDialogueFrame(u8, u8);
u8 __attribute__((long_call)) Save_LoadGameData(u8 a1);


#endif // GUARD_HALL_OF_FAME_H
