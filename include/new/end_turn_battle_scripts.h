#pragma once

#include "../global.h"

/**
 * \file end_turn_battle_scripts.h
 * \brief Contains declarations for battle scripts usually called once all
 *		  Pokemon have finished their actions for the turn.
 */

#define BattleScript_RainContinuesOrEnds (u8*) 0x81BCA20
#define BattleScript_SunlightFaded (u8*) 0x81BCAD4
#define BattleScript_SunlightContinues (u8*) 0x81BCAC6
#define BattleScript_SandStormHailEnds (u8*) 0x81BCABD
#define BattleScript_WishComesTrue ((u8*) 0x81BCE91)
#define BattleScript_ShedSkinActivates ((u8*) 0x81BD28F)
#define BattleScript_IngrainTurnHeal ((u8*) 0x81BCEC8)
#define BattleScript_PoisonTurnDmg ((u8*) 0x81BD00F)
#define BattleScript_BurnTurnDmg ((u8*) 0x81BD031)
#define BattleScript_NightmareTurnDmg ((u8*) 0x81BD111)
#define BattleScript_CurseTurnDmg ((u8*) 0x81BD122)
#define BattleScript_WrapTurnDmg ((u8*) 0x81BD0E0)
#define BattleScript_WrapEnds ((u8*) 0x81BD0F2)
#define BattleScript_EncoredNoMore ((u8*) 0x81BCC21)
#define BattleScript_DisabledNoMore ((u8*) 0x81BCC1A)
//#define BattleScript_YawnMakesAsleep ((u8*) 0x81BD183)
#define BattleScript_PerishSongHits ((u8*) 0x81BCCEF)
#define BattleScript_PerishSongTimerGoesDown ((u8*) 0x81BCD0A)
//#define BattleScript_SideStatusWoreOff ((u8*) 0x81BCAEE)
#define BattleScript_SafeguardEnds ((u8*) 0x81BCAFF)
#define BattleScript_PrintUproarOverTurns ((u8*) 0x81BD078)
#define BattleScript_GiveExp ((u8*) 0x81BC650)

extern const u8 BattleScript_MysteriousAirCurrentContinues[];
extern const u8 BattleScript_SandstormHailContinues[];
extern const u8 BattleScript_WeatherDamage[];
extern const u8 BattleScript_FogEnded[];
extern const u8 BattleScript_FogContinues[];
extern const u8 BattleScript_SeaOfFireDamage[];
extern const u8 BattleScript_GrassyTerrainHeal[];
extern const u8 BattleScript_AquaRing[];
extern const u8 BattleScript_LeechSeedTurnDrain[];
extern const u8 BattleScript_PoisonHeal[];
extern const u8 BattleScript_YawnMakesAsleep[];
extern const u8 BattleScript_MagnetRiseEnd[];
extern const u8 BattleScript_TelekinesisEnd[];
extern const u8 BattleScript_HealBlockEnd[];
extern const u8 BattleScript_EmbargoEnd[];
extern const u8 BattleScript_AuroraVeilEnd[];
extern const u8 BattleScript_TailwindEnd[];
extern const u8 BattleScript_LuckyChantEnd[];
extern const u8 BattleScript_RainbowEnd[];
extern const u8 BattleScript_SeaOfFireEnd[];
extern const u8 BattleScript_SwampEnd[];
extern const u8 BattleScript_TrickRoomEnd[];
extern const u8 BattleScript_WaterSportEnd[];
extern const u8 BattleScript_MudSportEnd[];
extern const u8 BattleScript_WonderRoomEnd[];
extern const u8 BattleScript_MagicRoomEnd[];
extern const u8 BattleScript_GravityEnd[];
extern const u8 BattleScript_TerrainEnd[];
extern const u8 BattleScript_ToxicOrb[];
extern const u8 BattleScript_FlameOrb[];
extern const u8 BattleScript_TransformedEnd2[];
extern const u8 BattleScript_PowerConstruct[];
extern const u8 BattleScript_StartedSchooling[];
extern const u8 BattleScript_StoppedSchooling[];
extern const u8 BattleScript_ShieldsDownToCore[];
extern const u8 BattleScript_ShieldsDownToMeteor[];
extern const u8 BattleScript_FlowerGift[];
extern const u8 BattleScript_FlowerGiftEnd2[];
extern const u8 BattleScript_RaiseStatsItemEnd2[];
extern const u8 BattleScript_HandleFaintedMonSingles[];
extern const u8 BattleScript_HandleFaintedMonDoublesInitial[];
extern const u8 BattleScript_HandleFaintedMonDoublesPart2[];
extern const u8 BattleScript_HandleFaintedMonDoublesSwitchInEffects[];
extern const u8 BattleScript_FaintedMonChooseAnotherRejoin[];
extern const u8 BattleScript_FaintedMonTryChooseAnother[];
extern const u8 BattleScript_PrintCustomStringEnd2[];
extern const u8 BattleScript_MonTookFutureAttack[];
extern const u8 BattleScript_OctolockTurnDmg[];
extern const u8 BattleScript_SyrupBombEndTurn[];
extern const u8 BattleScript_DynamaxEnd[];
extern const u8 BattleScript_LoseRaidBattle[];

//Strings
extern const u8 gText_SideStatusWoreOff[];
extern const u8 gText_TauntWoreOff[];
extern const u8 gText_RaidBattleKO1[];
extern const u8 gText_RaidBattleKO2[];
extern const u8 gText_RaidBattleKO3[];
extern const u8 gText_RaidBattleKO4[];

extern const u8 gText_HurtBySeaOfFire[];
extern const u8 gText_HurtByGMaxVineLash[];
extern const u8 gText_GMaxVineLashEnded[];
extern const u8 gText_HurtByGMaxWildfire[];
extern const u8 gText_GMaxWildfireEnded[];
extern const u8 gText_HurtByGMaxCannonade[];
extern const u8 gText_GMaxCannonadeEnded[];
extern const u8 gText_HurtByGMaxVolcalith[];
extern const u8 gText_GMaxVolcalithEnded[];
extern const u8 gText_HurtBySaltcure[];
