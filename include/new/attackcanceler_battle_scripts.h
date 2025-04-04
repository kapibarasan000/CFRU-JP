#pragma once

#include "../global.h"

/**
 * \file attackcanceler_battle_scripts.h
 * \brief Contains declarations for battle scripts usually at the beginning of
*		  a move's execution. Many times used to stop the execution.
 */

extern const u8 BattleScript_MagicBounce[];
extern const u8 BattleScript_MoveUsedFlinched[]; //0x81D90B1
extern const u8 BattleScript_MoveUsedDevolvedForgot[];
extern const u8 BattleScript_MoveUsedIsConfused[]; //0x81D90D3
extern const u8 BattleScript_MoveUsedLoafingAround[]; //0x81D94F2
extern const u8 BattleScript_MoveUsedGravityPrevents[];
extern const u8 BattleScript_MoveUsedHealBlockPrevents[];
extern const u8 BattleScript_MoveUsedThroatChopPrevents[];
extern const u8 BattleScript_MoveUsedFailedPrimalWeather[];
extern const u8 BattleScript_MoveUsedPsychicTerrainPrevents[];
extern const u8 BattleScript_MoveUsedPowderPrevents[];
extern const u8 BattleScript_StanceChangeToBlade[];
extern const u8 BattleScript_StanceChangeToShield[];
extern const u8 BattleScript_ZMoveActivateStatus[];
extern const u8 BattleScript_ZMoveActivateDamaging[];
extern const u8 BattleScript_DarkTypePreventsPrankster[];
extern const u8 BattleScript_MoveUsedSkyBattlePrevents[];
extern const u8 BattleScript_CantUseSignatureMove[];
extern const u8 BattleScript_HoopaCantUseHyperspaceFury[];
extern const u8 BattleScript_MoveUsedDynamaxPrevents[];
extern const u8 BattleScript_MoveUsedRaidBattlePrevents[];
extern const u8 BattleScript_DampStopsExplosion[];
extern const u8 BattleScript_TookAttack[];
extern const u8 BattleScript_RaidBattleStatNullification[];

#define BattleScript_NoPPForMove (u8*) 0x81BCE64
#define BattleScript_MagicCoatBounce (u8*) 0x81BCF66
#define BattleScript_SnatchedMove (u8*) 0x81BCF7E

#define BattleScript_MoveUsedIsAsleep (u8*) 0x81BCFE5
#define BattleScript_MoveUsedWokeUp (u8*) 0x81BCFF2
#define BattleScript_MoveUsedIsFrozen (u8*) 0x81BD03C
#define BattleScript_MoveUsedUnfroze (u8*) 0x81BD049
#define BattleScript_MoveUsedMustRecharge (u8*) 0x81BB2FE
#define BattleScript_MoveUsedIsDisabled (u8*) 0x81BCC0B
#define BattleScript_MoveUsedIsTaunted (u8*) 0x81BCE86
#define BattleScript_MoveUsedIsImprisoned (u8*) 0x81BCF50
#define BattleScript_MoveUsedIsConfusedNoMore (u8*) 0x81BD0D2
#define BattleScript_MoveUsedIsParalyzed (u8*) 0x81BD05D
#define BattleScript_TooScaredToMove (u8*) 0x81BD13C
#define BattleScript_GhostGetOut (u8*) 0x81BD14E
#define BattleScript_ImmobilizedByLove (u8*) 0x81BD106
#define BattleScript_MoveUsedIsInLove (u8*) 0x81BD0F9
#define BattleScript_BideStoringEnergy (u8*) 0x81BCB65
#define BattleScript_BideAttack (u8*) 0x81BCB70
#define BattleScript_BideNoEnergyToAttack (u8*) 0x81BCBB8
#define BattleScript_IgnoresWhileAsleep (u8*) 0x81BD496
#define BattleScript_IgnoresAndUsesRandomMove (u8*) 0x81BD4A6
#define BattleScript_IgnoresAndFallsAsleep (u8*) 0x81BD4C0
#define BattleScript_IgnoresAndHitsItself (u8*) 0x81BD4D7

//Strings
extern const u8 PsychicTerrainAttackCancelString[];
