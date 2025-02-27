#pragma once

/**
 * \file move_menu_battle_scripts.h
 * \brief Contains declarations for text and battle scripts used when
 *		  selecting attacks.
 */

#define BattleScript_SelectingDisabledMove (u8*) 0x81BCC16
#define BattleScript_SelectingTormentedMove (u8*) 0x81BCE73
#define BattleScript_SelectingNotAllowedMoveTaunt (u8*) 0x81BCE82
#define BattleScript_SelectingImprisionedMove (u8*) 0x81BCF5B
#define BattleScript_SelectingNotAllowedMoveChoiceItem (u8*) 0x81BD5F9
#define BattleScript_SelectingMoveWithNoPP (u8*) 0x81BCE60
#define gText_WhatWillPkmnDo (u8*) 0x83C4685

extern const u8 BattleScript_MustSelectEncoredMove[];
extern const u8 BattleScript_SelectingNotAllowedMoveChoiceAbility[];
extern const u8 BattleScript_SelectingNotAllowedMoveAssaultVest[];
extern const u8 BattleScript_SelectingNotAllowedSkyBattle[];
extern const u8 BattleScript_SelectingNotAllowedGravity[];
extern const u8 BattleScript_SelectingNotAllowedThroatChop[];
extern const u8 BattleScript_SelectingNotAllowedHealBlock[];
extern const u8 BattleScript_SelectingNotAllowedGigatonHammer[];

//Strings
extern const u8 StringNull[];
extern const u8 gText_BattleUI_SuperEffective[];
extern const u8 gText_BattleUI_NotVeryEffective[];
extern const u8 gText_BattleUI_NoEffect[];
extern const u8 gText_BattleUI_STAB[];
extern const u8 gText_PP[];
extern const u8 gText_Power[];
extern const u8 gText_Acc[];
extern const u8 gText_NoMiss[];
extern const u8 gText_OHKO[];
extern const u8 gText_Contact[];
extern const u8 gText_NoContact[];
extern const u8 gText_ResetStats[];
extern const u8 gText_StatsPlus[];
extern const u8 gText_CritHitsPlus[];
extern const u8 gText_FollowMe[];
extern const u8 gText_RecoverHP[];
extern const u8 gText_HealAllyHP[];
extern const u8 gText_ZMoveRaise1[];
extern const u8 gText_ZMoveRaise2[];
extern const u8 gText_ZMoveRaise3[];
extern const u8 gText_BattleMenu[];
extern const u8 gText_BattleMenu2[];
extern const u8 gText_UnboundBattleMenu[];
extern const u8 gText_UnboundBattleMenu2[];
extern const u8 gText_BattleMenuRaidEnd[];
extern const u8 gText_CaptureRaidMon[];

extern const u8 gText_MaxMoveProtect[];
extern const u8 gText_MaxMoveRaiseTeamStat[];
extern const u8 gText_Raise[];
extern const u8 gText_MaxMoveFoes[];
extern const u8 gText_Lower[];
extern const u8 gText_MaxMoveSet[];
extern const u8 gText_MaxMoveWeather[];
extern const u8 gText_MaxMoveTerrain[];
extern const u8 gText_MaxMoveSunny[];
extern const u8 gText_MaxMoveRainy[];
extern const u8 gText_MaxMoveSandstorm[];
extern const u8 gText_MaxMoveHail[];
extern const u8 gText_MaxMoveElectric[];
extern const u8 gText_MaxMoveGrassy[];
extern const u8 gText_MaxMoveMisty[];
extern const u8 gText_MaxMovePsychic[];
extern const u8 gText_MaxMoveLastingDamage[];
extern const u8 gText_MaxMoveTrapDamage[];
extern const u8 gText_MaxMoveEffectSpore[];
extern const u8 gText_MaxMoveParalyzeFoes[];
extern const u8 gText_MaxMoveConfusePayDay[];
extern const u8 gText_MaxMoveCritPlus[];
extern const u8 gText_MaxMoveMeanLook[];
extern const u8 gText_MaxMoveAuroraVeil[];
extern const u8 gText_MaxMoveInfatuate[];
extern const u8 gText_MaxMoveRecycleBerries[];
extern const u8 gText_MaxMovePoisonFoes[];
extern const u8 gText_MaxMoveStealthRock[];
extern const u8 gText_MaxMoveRemoveScreens[];
extern const u8 gText_MaxMovePoisonParalyzeFoes[];
extern const u8 gText_MaxMoveHealTeam[];
extern const u8 gText_MaxMoveSpite[];
extern const u8 gText_MaxMoveGravity[];
extern const u8 gText_MaxMoveYawn[];
extern const u8 gText_MaxMoveLowerEvasiveness[];
extern const u8 gText_MaxMoveAromatherapy[];
extern const u8 gText_MaxMoveSteelsurge[];
extern const u8 gText_MaxMoveConfuseFoes[];
extern const u8 gText_MaxMoveTormentFoes[];
extern const u8 gText_MaxMoveLowerSpeed2[];
extern const u8 gText_MaxMoveIgnoreAbility[];
extern const u8 gText_MaxMoveBypassProtect[];

#define TXT_PLUS 0x2E
#define TXT_MINUS 0xAE
#define gText_BattleSwitchWhich (u8*) 0x83C472F
#define gText_TypeWord (u8*) 0x83C46FA
#define gText_MoveInterfaceType (u8*) 0x83C46FF
#define Pal_PPDisplay (u16*) 0x8C2FBB4
