#pragma once

#include "../global.h"
#include "../pokemon.h"

/**
 * \file anility_util.h
 * \brief Contains utility functions pertaining to Abilities.
 */

 bool8 IsTargetAbilityIgnored(u16 defAbility, u16 atkAbility, u16 move);
 bool8 IsTargetAbilityIgnoredNoMove(u16 defAbility, u16 atkAbility);

bool8 IsClearBodyAbility(u16 ability);
bool8 IsMoldBreakerAbility(u16 ability);
bool8 AbilityBlocksIntimidate(u16 ability);
bool8 AbilityPreventsLoweringAtk(u16 ability);
bool8 AbilityPreventsLoweringStat(u16 ability, u8 statId);
bool8 IsAffectedBySturdy(u16 defAbility, u8 bankDef);
bool8 IsAffectedByBadDreams(u8 bank);
bool8 IsTrappedByAbility(u8 bankDef, u16 trapAbility);
bool8 IsPriorityBlockingAbility(u16 ability);
bool8 IsUnnerveAbility(u16 ability);
bool8 UnnerveOnOpposingField(u8 bank);
bool8 AbilityIncreasesWildItemChance(u16 ability);
bool8 AngerShellStatsCheck(u8 bank);
bool8 SwitchInAbilityBlock2(u16 ability);
bool8 SwitchInAbilityBlock3(u16 ability);
