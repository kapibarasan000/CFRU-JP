#pragma once

#include "../global.h"
#include "../pokemon.h"

/**
 * \file anility_util.h
 * \brief Contains utility functions pertaining to Abilities.
 */

 bool8 IsTargetAbilityIgnored(u8 defAbility, u8 atkAbility, u16 move);
 bool8 IsTargetAbilityIgnoredNoMove(u8 defAbility, u8 atkAbility);

bool8 IsClearBodyAbility(u8 ability);
bool8 IsMoldBreakerAbility(u8 ability);
bool8 AbilityBlocksIntimidate(u8 ability);
bool8 AbilityPreventsLoweringAtk(u8 ability);
bool8 AbilityPreventsLoweringStat(u8 ability, u8 statId);
bool8 IsAffectedBySturdy(u8 defAbility, u8 bankDef);
bool8 IsAffectedByBadDreams(u8 bank);
bool8 IsTrappedByAbility(u8 bankDef, u8 trapAbility);
bool8 IsPriorityBlockingAbility(u8 ability);
bool8 IsUnnerveAbility(u8 ability);
bool8 UnnerveOnOpposingField(u8 bank);
bool8 AbilityIncreasesWildItemChance(u8 ability);
