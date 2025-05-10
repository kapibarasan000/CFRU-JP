#include "defines.h"
#include "defines_battle.h"
#include "../include/string_util.h"
#include "../include/constants/abilities.h"
#include "../include/constants/pokedex.h"
#include "../include/constants/species.h"

#include "../include/new/ability_tables.h"
#include "../include/new/ability_util.h"
#include "../include/new/battle_util.h"
#include "../include/new/move_tables.h"
#include "../include/new/util.h"


bool8 IsTargetAbilityIgnored(u16 defAbility, u16 atkAbility, u16 move)
{
	return IS_MOLD_BREAKER(atkAbility, move) && gMoldBreakerIgnoredAbilities[defAbility];
}

bool8 IsTargetAbilityIgnoredNoMove(u16 defAbility, u16 atkAbility)
{
	return IsMoldBreakerAbility(atkAbility) && gMoldBreakerIgnoredAbilities[defAbility];
}

bool8 IsClearBodyAbility(u16 ability)
{
	return ability == ABILITY_CLEARBODY
		#ifdef ABILITY_FULLMETALBODY
		|| ability == ABILITY_FULLMETALBODY
		#endif
		#ifdef ABILITY_WHITESMOKE
		|| ability == ABILITY_WHITESMOKE
		#endif
		;
}

bool8 IsMoldBreakerAbility(u16 ability)
{
	return ability == ABILITY_MOLDBREAKER
		#ifdef ABILITY_TURBOBLAZE
		|| ability == ABILITY_TURBOBLAZE
		#endif
		#ifdef ABILITY_TERAVOLT
		|| ability == ABILITY_TERAVOLT
		#endif
		;
}

bool8 AbilityBlocksIntimidate(u16 ability)
{
	return ability == ABILITY_INNERFOCUS
		|| ability == ABILITY_OWNTEMPO
		|| ability == ABILITY_OBLIVIOUS
		|| ability == ABILITY_SCRAPPY;
}

bool8 AbilityPreventsLoweringAtk(u16 ability)
{
	return ability == ABILITY_HYPERCUTTER
		|| ability == ABILITY_MIRRORARMOR
		|| IsClearBodyAbility(ability);
}

bool8 AbilityPreventsLoweringStat(u16 ability, u8 statId)
{
	switch (ability)
	{
		case ABILITY_HYPERCUTTER:
			return statId == STAT_STAGE_ATK;
		case ABILITY_BIGPECKS:
			return statId == STAT_STAGE_DEF;
		case ABILITY_KEENEYE:
		case ABILITY_MINDSEYE:
			return statId == STAT_STAGE_ACC;
		default:
			return FALSE;
	}
}

bool8 IsAffectedBySturdy(u16 defAbility, u8 bankDef)
{
	return defAbility == ABILITY_STURDY
		&& BATTLER_MAX_HP(bankDef);
}

bool8 IsAffectedByBadDreams(u8 bank)
{
	return BATTLER_ALIVE(bank)
		&& (gBattleMons[bank].status1 & STATUS_SLEEP
		 || ABILITY(bank) == ABILITY_COMATOSE)
		&& ABILITY(bank) != ABILITY_MAGICGUARD;
}

bool8 IsTrappedByAbility(u8 bankDef, u16 trapAbility)
{
	if (!CanBeTrapped(bankDef))
		return FALSE;

	switch (trapAbility)
	{
		case ABILITY_SHADOWTAG:
			return ABILITY(bankDef) != ABILITY_SHADOWTAG; //Shadow Tag's not affected by Shadow Tag
		case ABILITY_ARENATRAP:
			return CheckGrounding(bankDef) == GROUNDED;
		case ABILITY_MAGNETPULL:
			return IsOfType(bankDef, TYPE_STEEL);
		default:
			return FALSE;
	}
}

bool8 IsPriorityBlockingAbility(u16 ability)
{
	switch (ability)
	{
		case ABILITY_DAZZLING:
		case ABILITY_QUEENLYMAJESTY:
		case ABILITY_ARMORTAIL:
			return TRUE;
		default:
			return FALSE;
	}
}

bool8 IsUnnerveAbility(u16 ability)
{
	return ability == ABILITY_UNNERVE
		#ifdef ABILITY_ASONE_GRIM
		|| ability == ABILITY_ASONE_GRIM
		#endif
		#ifdef ABILITY_ASONE_CHILLING
		|| ability == ABILITY_ASONE_CHILLING
		#endif
		;
}

bool8 UnnerveOnOpposingField(u8 bank)
{
	return ABILITY_ON_OPPOSING_FIELD(bank, ABILITY_UNNERVE)
		#ifdef ABILITY_ASONE_GRIM
		|| ABILITY_ON_OPPOSING_FIELD(bank, ABILITY_ASONE_GRIM)
		#endif
		#ifdef ABILITY_ASONE_CHILLING
		|| ABILITY_ON_OPPOSING_FIELD(bank, ABILITY_ASONE_CHILLING)
		#endif
		;
}

bool8 AbilityIncreasesWildItemChance(u16 ability)
{
	return ability == ABILITY_COMPOUNDEYES || ability == ABILITY_SUPERLUCK;
}
