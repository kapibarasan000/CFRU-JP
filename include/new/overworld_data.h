#pragma once

#include "../global.h"

/**
 * \file overworld_data.h
 * \brief A file to be included only by "src/overworld.c". Contains data relevant
 *		  to initializing trainer battles and walking scripts.
 */

#define SCRCMD_TRAINERBATTLE 0x5C

#define sOrdinaryBattleParams (struct TrainerBattleParameter*) 0x838D68C //Battle Type 0 & 5
#define sContinueScriptBattleParams (struct TrainerBattleParameter*) 0x838D6D4 //Battle Type 1 & 2
#define sOrdinaryNoIntroBattleParams (struct TrainerBattleParameter*) 0x838D764 //Battle Type 3
#define sDoubleBattleParams (struct TrainerBattleParameter*) 0x838D71C //Battle Type 4 & 7
#define sContinueScriptDoubleBattleParams (struct TrainerBattleParameter*) 0x838D7F4 //Batttle Type 6 & 8
#define sOakTutorialParams (struct TrainerBattleParameter*) 0x838D7AC //Batttle Type 9

#define EventScript_TryDoNormalTrainerBattle (u8*) 0x8192E03
#define EventScript_DoTrainerBattle (u8*) 0x8192E63
#define EventScript_TryDoDoubleTrainerBattle (u8*) 0x8192E2B
#define EventScript_TryDoRematchBattle (u8*) 0x8192E80
#define EventScript_TryDoDoubleRematchBattle (u8*) 0x8192EB5

#define EventScript_VSSeeker (const u8*) 0x8196297
#define EventScript_Poison (const u8*) 0x81963A4
#define EventScript_EggHatch (const u8*) 0x81A59C4
#define EventScript_BagItemCanBeRegistered (const u8*) 0x8194D4A

extern const u8 EventScript_SetUpNPCSpotting[];
extern const u8 Script_TrainerSpottedMulti[];
extern const u8 EventScript_DoTwoOpponentBattle[];
extern const u8 EventScript_TryDoTwoOpponentBattle[];
extern const u8 EventScript_TryDoTwoOpponentRematchBattle[];
extern const u8 SystemScript_PoisonSurvial[];
extern const u8 EventScript_RepelWoreOff[];
extern const u8 EventScript_BwRepelWoreOff[];
extern const u8 SystemScript_DexNavDetector[];
extern const u8 EventScript_ShowSelectItems[];
extern const u8 EventScript_TVSwarm[];
extern const u8 EventScript_LockedDoor[];
extern const u8 EventScript_PsychicBarrier[];
extern const u8 EventScript_Ladder[];
extern const u8 EventScript_HiddenGrottoForest[];
extern const u8 EventScript_HeadbuttTree[];
extern const u8 EventScript_UndergroundMining[];

#define EventScript_CurrentTooFast (const u8*) 0x81943D9
#define EventScript_CannotUseWaterfall (const u8*) 0x81A4A14
extern const u8 EventScript_UseSurf[];
extern const u8 EventScript_WaterDyedBlue[];
extern const u8 EventScript_WaterMurkyBrown[];
extern const u8 EventScript_UseLavaSurf[];
extern const u8 EventScript_MagmaGlistens[];
extern const u8 EventScript_UseWaterfall[];
extern const u8 EventScript_WallOfWater[];
extern const u8 EventScript_UseRockClimb[];
extern const u8 EventScript_JustRockWall[];
extern const u8 EventScript_UseFlash[];
extern const u8 EventScript_UseDive[];
extern const u8 EventScript_CantDive[];
extern const u8 EventScript_UseDiveUnderwater[];
extern const u8 EventScript_CantSurface[];

extern const u8 gText_RegisteredItemSelectButton[];
extern const u8 gText_RegisteredItemLButton[];
extern const u8 gText_RegisteredItemRButton[];
extern const u8 gText_RegisteredItemStartButton[];
extern const u8 gText_RegisteredItemLeftButton[];
extern const u8 gText_RegisteredItemRightButton[];
