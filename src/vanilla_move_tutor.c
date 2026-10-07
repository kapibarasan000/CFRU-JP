#include "defines.h"
#include "../include/item.h"
#include "../include/pokemon.h"
#include "../include/constants/items.h"
#include "../include/constants/moves.h"
#include "../include/new/item.h"

/*
vanilla_move_tutor.c
	The vanilla move tutor scripts pass the vanilla tutor ids (0-17) in Var8005.
	With EXPANDED_MOVE_TUTORS these ids were looked up in the expanded tutor table, so the vanilla tutors
	taught other moves. These replace the vanilla entry points only; CFRU's own code still calls
	GetExpandedTutorMove and CanMonLearnTMTutor directly.
*/

#ifdef EXPANDED_MOVE_TUTORS
#include "Tables/vanilla_tutor_compat.h"

#define NUM_VANILLA_TUTORS 18

static const u16 sVanillaTutorMoves[NUM_VANILLA_TUTORS] =
{
	MOVE_MEGAPUNCH, MOVE_SWORDSDANCE, MOVE_MEGAKICK, MOVE_BODYSLAM, MOVE_DOUBLEEDGE,
	MOVE_COUNTER, MOVE_SEISMICTOSS, MOVE_MIMIC, MOVE_METRONOME, MOVE_SOFTBOILED,
	MOVE_DREAMEATER, MOVE_THUNDERWAVE, MOVE_EXPLOSION, MOVE_ROCKSLIDE, MOVE_SUBSTITUTE,
	MOVE_FRENZYPLANT, MOVE_BLASTBURN, MOVE_HYDROCANNON,
};

static u8 FindExpandedTutorId(u16 move)
{
	u32 i;

	for (i = 0; i < NUM_MOVE_TUTORS; ++i)
	{
		if (gTutorMoves[i] == move)
			return i;
	}
	return 0xFF;
}

u16 GetVanillaTutorMove(u8 tutor)
{
	if (tutor < NUM_VANILLA_TUTORS)
		return sVanillaTutorMoves[tutor];
	return GetExpandedTutorMove(tutor);
}
#endif

u8 CanMonLearnVanillaTMTutor(struct Pokemon* mon, u16 item, u8 tutor)
{
	#ifndef EXPANDED_MOVE_TUTORS
	return CanMonLearnTMTutor(mon, item, tutor);
	#else
	u16 move, species, nat;
	u8 expanded;
	bool8 canLearn;

	if (GetPocketByItemId(item) == POCKET_TM_HM || tutor >= NUM_VANILLA_TUTORS)
		return CanMonLearnTMTutor(mon, item, tutor);

	if (GetMonData(mon, MON_DATA_IS_EGG, NULL))
		return CANNOT_LEARN_MOVE_IS_EGG;

	move = GetVanillaTutorMove(tutor);
	expanded = FindExpandedTutorId(move);
	if (expanded != 0xFF)
		canLearn = CanMonLearnTutorMove(mon, expanded);
	else
	{
		species = GetMonData(mon, MON_DATA_SPECIES, NULL);
		nat = SpeciesToNationalPokedexNum(species);
		canLearn = nat >= 1 && nat < ARRAY_COUNT(sVanillaTutorCompat)
		        && (sVanillaTutorCompat[nat] & (1 << tutor)) != 0;
	}

	if (!canLearn)
		return CANNOT_LEARN_MOVE;
	if (MonKnowsMove(mon, move))
		return ALREADY_KNOWS_MOVE;
	return CAN_LEARN_MOVE;
	#endif
}
