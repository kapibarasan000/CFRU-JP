#pragma once

#include "../global.h"
#include "../pokemon.h"

//Exported Functions
bool8 CanTerastal(u8 bank);
bool8 IsTerastal(u8 bank);
u8 GetTeraType(u8 bank);
u8 GetBattlerTeraType(u8 bank);
u16 GetTeraTypeColor(u8 teratype);
bool8 TerastalEnabled(u8 bank);
bool8 MonCanTerastal(struct Pokemon* mon);
bool8 DoesTerastalUsageStopMegaEvolution(u8 bank);
bool8 IsBannedTerastalSpecies(u16 species);
bool8 CanTeraBlastTypeChange(u8 bank);
