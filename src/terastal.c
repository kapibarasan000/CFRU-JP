#include "defines.h"
#include "defines_battle.h"
#include "../include/battle_anim.h"
#include "../include/overworld.h"
#include "../include/random.h"
#include "../include/pokemon_summary_screen.h"
#include "../include/constants/items.h"
#include "../include/constants/region_map_sections.h"

#include "../include/new/battle_indicators.h"
#include "../include/new/battle_util.h"
#include "../include/new/build_pokemon.h"
#include "../include/new/damage_calc.h"
#include "../include/new/dexnav.h"
#include "../include/new/dynamax.h"
#include "../include/new/form_change.h"
#include "../include/new/frontier.h"
#include "../include/new/general_bs_commands.h"
#include "../include/new/item.h"
#include "../include/new/mega.h"
#include "../include/new/mega_battle_scripts.h"
#include "../include/new/move_battle_scripts.h"
#include "../include/new/move_menu.h"
#include "../include/new/move_tables.h"
#include "../include/new/set_z_effect.h"
#include "../include/new/stat_buffs.h"
#include "../include/new/util.h"

#define TRAINER_ITEM_COUNT 4

//This file's functions:
static bool8 IsBannedHeldItemForTerastal(u16 item);

static const item_t sTeraOrbTable[] =
{
	ITEM_TERA_ORB,
};

static const u16 sTeraTypeColor[NUMBER_OF_MON_TYPES] =
{
	RGB(31, 31, 31),
    RGB(26, 8, 14),
    RGB(31, 26, 7),
    RGB(26, 10, 25),
    RGB(25, 23, 18),
    RGB(18, 16, 8),
    RGB(18, 24, 6),
    RGB(12, 10, 16),
    RGB(19, 19, 20),
    RGB(31, 31, 31),
    RGB(31, 20, 11),
    RGB(10, 18, 27),
    RGB(12, 24, 11),
    RGB(30, 26, 7),
    RGB(31, 14, 15),
    RGB(14, 26, 25),
    RGB(10, 18, 27),
    RGB(6, 5, 8),
    RGB(31, 31, 31),
    RGB(31, 31, 31),
    RGB(31, 31, 31),
    RGB(31, 31, 31),
    RGB(31, 31, 31),
    RGB(31, 15, 21),
	RGB(31, 31, 31),
};


static bool8 IsBannedHeldItemForTerastal(u16 item)
{
	if (IsMegaZMoveBannedBattle())
		return FALSE; //These items have no effect so don't ban them

	return IsMegaStone(item)
		|| IsZCrystal(item)
		|| IsPrimalOrb(item);
}

bool8 IsTerastal(u8 bank)
{
    if (gNewBS->terastalData.partyIndex[SIDE(bank)] & gBitTable[gBattlerPartyIndexes[bank]])
	{
		if ((SIDE(bank) == B_SIDE_PLAYER && gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
		||  (SIDE(bank) == B_SIDE_OPPONENT && gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS))
			return !gNewBS->terastalData.fainted[bank];
		else
			return !gNewBS->terastalData.fainted[bank] && !gNewBS->terastalData.fainted[PARTNER(bank)];
	}

    return FALSE;
}

bool8 IsMonTerastal(struct Pokemon* mon)
{
	u8 bank = GetBankFromPartyData(mon);

	if (bank >= PARTY_SIZE)
		return FALSE;

	return IsTerastal(bank);
}

u8 GetTeraType(u8 bank)
{
    struct Pokemon* mon = GetBankPartyData(bank);
    return mon->teratype;
}

u8 GetBattlerTeraType(u8 bank)
{
    if (IsTerastal(bank))
        return GetTeraType(bank);

    return TYPE_BLANK;
}

u16 GetTeraTypeColor(u8 teratype)
{
    return sTeraTypeColor[teratype];
}

static bool8 IsItemTeraOrb(u16 item)
{
	for (u8 i = 0; i < ARRAY_COUNT(sTeraOrbTable); ++i)
	{
		if (item == sTeraOrbTable[i])
			return TRUE;
	}

	return FALSE;
}

static item_t FindTrainerTeraOrb(u16 trainerId)
{
	if (gBattleTypeFlags & (BATTLE_TYPE_FRONTIER | BATTLE_TYPE_LINK) || IsFrontierTrainerId(trainerId))
		return ITEM_TERA_ORB;

	for (u8 i = 0; i < TRAINER_ITEM_COUNT; ++i)
	{
		if (IsItemTeraOrb(gTrainers[trainerId].items[i]))
			return gTrainers[trainerId].items[i];
	}

	return ITEM_NONE;
}

static item_t FindPlayerTeraOrb(void)
{
	if (gBattleTypeFlags & (BATTLE_TYPE_FRONTIER | BATTLE_TYPE_LINK))
		return ITEM_TERA_ORB;

	if (FlagGet(FLAG_TERASTAL_CHARGE))
	{
		for (u8 i = 0; i < ARRAY_COUNT(sTeraOrbTable); ++i)
		{
			if (CheckBagHasItem(sTeraOrbTable[i], 1))
				return sTeraOrbTable[i];
		}
	}

	#ifdef DEBUG_TERASTAL
		return ITEM_TERA_ORB; //Give player Dynamax Band if they have none
	#endif

	return ITEM_NONE;
}

static item_t FindBankTeraOrb(u8 bank)
{
	#ifdef DEBUG_TERASTAL
		if (bank + 1)
			return ITEM_TERA_ORB;
	#endif

	if (SIDE(bank) == SIDE_OPPONENT)
	{
		if (gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS)
		{
			if (GetBattlerPosition(bank) == B_POSITION_OPPONENT_LEFT)
				return FindTrainerTeraOrb(gTrainerBattleOpponent_A);
			else
				return FindTrainerTeraOrb(SECOND_OPPONENT);
		}
		else
			return FindTrainerTeraOrb(gTrainerBattleOpponent_A);
	}
	else //SIDE_PLAYER
	{
		if (gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER)
		{
			if (GetBattlerPosition(bank) == B_POSITION_PLAYER_RIGHT)
				return FindTrainerTeraOrb(VarGet(VAR_PARTNER));
			else
				return FindPlayerTeraOrb();
		}
		else
			return FindPlayerTeraOrb();
	}
}

bool8 TerastalEnabled(u8 bank)
{
	if (gBattleTypeFlags & (BATTLE_TYPE_LINK))
		return TRUE;

	if (FindBankTeraOrb(bank) == ITEM_NONE)
	{
		#ifdef DEBUG_TERASTAL
			return TRUE;
		#else
			return FALSE;
		#endif
	}

	return TRUE;
}

bool8 IsBannedTerastalSpecies(u16 species)
{
	switch (species) {
		case SPECIES_NONE:
        case SPECIES_SHEDINJA:
			return TRUE;
	}

	if (IsMegaSpecies(species)
	||  IsRedPrimalSpecies(species)
	||  IsBluePrimalSpecies(species)
	||  IsUltraNecrozmaSpecies(species))
		return TRUE;

	return FALSE;
}

bool8 CanTerastal(u8 bank)
{
	u16 species = SPECIES(bank);
	if (!gNewBS->terastalData.done[bank]
    && !IsBannedHeldItemForTerastal(ITEM(bank))
	&& !IsBannedTerastalSpecies(species))
		return TRUE;

	return FALSE;
}

bool8 MonCanTerastal(struct Pokemon* mon)
{
	u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
	u16 item = GetMonData(mon, MON_DATA_HELD_ITEM, NULL);

	if (IsBannedTerastalSpecies(species)
	|| IsBannedHeldItemForTerastal(item))
		return FALSE;

	return TRUE;
}

bool8 DoesTerastalUsageStopMegaEvolution(u8 bank)
{
	return gNewBS->terastalData.done[bank]
		&& gNewBS->terastalData.partyIndex[SIDE(bank)] & gBitTable[gBattlerPartyIndexes[bank]];
}

bool8 TeraTypeActive(u8 bank)
{
	return IsTerastal(bank) || gNewBS->terastalData.chosen[bank];
}

void SetStellarBoostFlag(u8 bank, u8 type)
{
    if (type < 32)
	{
		gNewBS->terastalData.stellarBoosted[bank] |= gBitTable[type];

		if ((SIDE(bank) == B_SIDE_PLAYER && !(gBattleTypeFlags & BATTLE_TYPE_INGAME_PARTNER))
		||  (SIDE(bank) == B_SIDE_OPPONENT && !(gBattleTypeFlags & BATTLE_TYPE_TWO_OPPONENTS)))
			gNewBS->terastalData.stellarBoosted[PARTNER(bank)] |= gBitTable[type];
	}
        
}

bool8 CanStellarBoost(u8 bank, u8 type)
{
    if (type < 32)
		return !(gNewBS->terastalData.stellarBoosted[bank] & gBitTable[type]);
    else
        return FALSE;
}
