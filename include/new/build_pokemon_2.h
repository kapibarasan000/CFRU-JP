#pragma once

#include "../../src/defines.h"
#include "../../src/defines_battle.h"

/**
 * \file build_pokemon_2.h
 * \brief A file to be included only by "src/build_pokemon.c". It contains
 *		  several macros and constants for building Pokemon.
 */

#define MAKE_POKEMON(structure)																																\
{																																							\
	u16 speciesToCreate = structure[i].species;																												\
	for (j = 0; gSpeciesNames[speciesToCreate][j] != EOS; ++j)																								\
		nameHash += gSpeciesNames[speciesToCreate][j];																										\
																																							\
	personalityValue += nameHash << 8;																														\
																																							\
	u8 lvl = structure[i].lvl;																																\
	if (FlagGet(FLAG_SCALE_TRAINER_LEVELS)																													\
	|| (gBattleTypeFlags & BATTLE_TYPE_TRAINER_TOWER))																										\
		lvl = GetHighestMonLevel(gPlayerParty);																												\
																																							\
	if (levelScaling && (side == B_SIDE_OPPONENT || !firstTrainer))																							\
	{																																						\
		if (IsBossTrainerClassForLevelScaling(trainerId))																									\
			ModifySpeciesAndLevelForBossBattle(&speciesToCreate, &lvl, maxPartyLevel, highestPlayerLevel, canEvolveMon);									\
		else																																				\
			ModifySpeciesAndLevelForGenericBattle(&speciesToCreate, &lvl, minPartyLevel, highestPlayerLevel, modifiedAveragePlayerLevel, trainer->partyFlags, trainer->partySize, canEvolveMon);	\
	}																																						\
																																							\
	CreateMon(&party[i], speciesToCreate, lvl, baseIV, TRUE, personalityValue, otIdType, otid);																\
	TryFixMiniorForm(&party[i]);																															\
	party[i].metLevel = structure[i].lvl;																													\
}

#define SET_MOVES(structure)										        \
{																	        \
	for (j = 0; j < MAX_MON_MOVES; j++) {							        \
		party[i].moves[j] = structure[i].moves[j];					        \
		party[i].pp[j] = GetTrainerMonMovePP(structure[i].moves[j], j);	    \
	}																        \
	                                                                        \
	party[i].ppBonuses = GetTrainerMonMovePPBonus();                        \
}

#define SET_IVS_SINGLE_VALUE(val)					\
{													\
    party[i].hpIV = val;							\
	party[i].attackIV = val;						\
	party[i].defenseIV = val;						\
	party[i].speedIV = val;							\
	party[i].spAttackIV = val;						\
	party[i].spDefenseIV = val;						\
}

#define SET_IVS(structure)							\
{													\
    party[i].hpIV = structure->hpIv;				\
	party[i].attackIV = structure->atkIv;			\
	party[i].defenseIV = structure->defIv;			\
	party[i].speedIV = structure->spdIv;			\
	party[i].spAttackIV = structure->spAtkIv;		\
	party[i].spDefenseIV = structure->spDefIv;		\
}

#define SET_EVS(structure)							\
{													\
    party[i].hpEv = structure->hpEv;				\
	party[i].atkEv = structure->atkEv;				\
	party[i].defEv = structure->defEv;				\
	party[i].spdEv = structure->spdEv;				\
	party[i].spAtkEv = structure->spAtkEv;			\
	party[i].spDefEv = structure->spDefEv;			\
}

struct TrainersWithEvs
{
    u8 nature;
    u8 ivs;
    u8 hpEv;
	u8 atkEv;
	u8 defEv;
	u8 spdEv;
	u8 spAtkEv;
	u8 spDefEv;
	u8 ball; //0FE = Class-Based Ball, 0xFF = Random Ball
	u8 ability; //0 = Hidden, 1 = Ability_1, 2 = Ability_2, 3 = Random Ability 1 & 2, 4 = Random Any Ability
	u8 teraType;
};

enum
{
	Ability_Hidden,
	Ability_1,
	Ability_2,
	Ability_Random_1_2,
	Ability_RandomAll,
};

#define TERA_TYPE_DEFAULT  0x00
#define TERA_TYPE_NORMAL   0x01
#define TERA_TYPE_FIGHTING 0x02
#define TERA_TYPE_FLYING   0x03
#define TERA_TYPE_POISON   0x04
#define TERA_TYPE_GROUND   0x05
#define TERA_TYPE_ROCK     0x06
#define TERA_TYPE_BUG      0x07
#define TERA_TYPE_GHOST    0x08
#define TERA_TYPE_STEEL    0x09
#define TERA_TYPE_FIRE     0x0B
#define TERA_TYPE_WATER    0x0C
#define TERA_TYPE_GRASS    0x0D
#define TERA_TYPE_ELECTRIC 0x0E
#define TERA_TYPE_PSYCHIC  0x0F
#define TERA_TYPE_ICE      0x10
#define TERA_TYPE_DRAGON   0x11
#define TERA_TYPE_DARK     0x12
#define TERA_TYPE_FAIRY	   0x18
#define TERA_TYPE_STELLAR  0x19

#define TRAINER_EV_CLASS_BALL 0xFE
#define TRAINER_EV_RANDOM_BALL 0xFF
