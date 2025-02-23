#pragma once

#include "../global.h"

/**
 * \file end_battle_battle_scripts.h
 * \brief Contains declarations for battle scripts called when a battle
 *		  is ended.
 */

#define BattleScript_LinkBattleWonOrLost (const u8*) 0x81BC888
#define BattleScript_PayDayMoneyAndPickUpItems (const u8*) 0x81BC7BF
#define BattleScript_LocalBattleLost (const u8*) 0x81BC7C2
#define BattleScript_GotAwaySafely (const u8*) 0x81BC8D2
#define BattleScript_SmokeBallEscape (const u8*) 0x81BC8BD

extern const u8 BattleScript_Victory[];
extern const u8 BattleScript_PrintPlayerForfeited[];
extern const u8 BattleScript_PrintPlayerForfeitedLinkBattle[];
extern const u8 BattleScript_LostMultiBattleTower[];
extern const u8 BattleScript_LostBattleTower[];
extern const u8 BattleScript_LoseFrontierRaidBattle[];
extern const u8 BattleScript_AskIfWantsToForfeitMatch[];
extern const u8 BattleScript_RanAwayUsingMonAbility[];
extern const u8 BattleScript_RaidMonRanAway[];
