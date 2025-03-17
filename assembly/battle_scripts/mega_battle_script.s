.text
.thumb
.align 2
/*
mega_battle_scripts.s
	handles mega evolution
*/

.include "../asm_defines.s"
.include "../battle_script_macros.s"

.global BattleScript_MegaEvolution
.global BattleScript_MegaWish
.global BattleScript_UltraBurst
.global BattleScript_Dynamax
.global BattleScript_Terastal
.global BattleScript_TerastalBoost

BattleScript_MegaEvolution:
	setword BATTLE_STRING_LOADER MegaReactingString
	printstring 0x184
	waitmessage DELAY_HALFSECOND

MegaAnimBS:
	playanimation BANK_SCRIPTING ANIM_MEGA_EVOLUTION 0x0
	reloadhealthbar BANK_SCRIPTING
	setword BATTLE_STRING_LOADER MegaEvolutionCompleteString
	printstring 0x184
	waitmessage DELAY_1SECOND
	callasm TryRemovePrimalWeatherAfterTransformation
	end3

BattleScript_MegaWish:
	setword BATTLE_STRING_LOADER FerventWishString
	printstring 0x184
	waitmessage DELAY_HALFSECOND
	goto MegaAnimBS

BattleScript_UltraBurst:
	setword BATTLE_STRING_LOADER UltraBurstGlowingString
	printstring 0x184
	waitmessage DELAY_HALFSECOND
	playanimation BANK_SCRIPTING ANIM_ULTRA_BURST 0x0
	reloadhealthbar BANK_SCRIPTING
	setword BATTLE_STRING_LOADER UltraBurstCompleteString
	printstring 0x184
	waitmessage DELAY_1SECOND
	callasm TryRemovePrimalWeatherAfterTransformation
	end3

BattleScript_Dynamax:
	call BS_FLUSH_MESSAGE_BOX
	callasm UpdateHPForDynamax
	playanimation BANK_SCRIPTING ANIM_CALL_BACK_POKEMON
	waitanimation
	pause DELAY_1SECOND
	pause DELAY_HALFSECOND
	returntoball BANK_SCRIPTING
	call BattleScript_TryRevertCramorant

BattleScript_Dynamax_Rejoin:
	waitstateatk
	callasm TryDoDynamaxTrainerSlide
	callasm SetAndTransferDontRemoveTransformSpecies
	callasm BackupScriptingBankMoveSelectionCursor @;Prevents the move selection cursor from being reset by the switch-in anim
	switchinanim BANK_SCRIPTING 0x1 @;Play the switch-in animation
	waitanimation
	callasm RestoreScriptingBankMoveSelectionCursor
	callasm ClearAndTransferDontRemoveTransformSpecies
	playanimation BANK_SCRIPTING ANIM_DYNAMAX_START 0x0
	orword HIT_MARKER, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BANK_SCRIPTING
	datahpupdate BANK_SCRIPTING
	bicword HIT_MARKER, HITMARKER_IGNORE_SUBSTITUTE
	setword BATTLE_STRING_LOADER gText_MonDynamaxed
	printstring 0x184
	waitmessage DELAY_1SECOND
	end3

BattleScript_TryRevertCramorant:
	formchange BANK_SCRIPTING SPECIES_CRAMORANT_GULPING SPECIES_CRAMORANT TRUE TRUE FALSE BattleScript_TryRevertGorgingCramorant
BattleScript_TryRevertGorgingCramorant:
	formchange BANK_SCRIPTING SPECIES_CRAMORANT_GORGING SPECIES_CRAMORANT TRUE TRUE FALSE BattleScript_Dynamax_Rejoin
	goto BattleScript_Dynamax_Rejoin

BattleScript_Terastal:
	call BS_FLUSH_MESSAGE_BOX
	playanimation BANK_SCRIPTING ANIM_TERASTAL 0x0
	reloadhealthbar BANK_SCRIPTING
	setword BATTLE_STRING_LOADER gText_MonTerastal
	printstring 0x184
	waitmessage DELAY_1SECOND
	end3

BattleScript_TerastalBoost:
	playanimation BANK_SCRIPTING ANIM_TOTEM_BOOST 0x0
	waitanimation
	return

.align 2
@;FD 00's FD 16 is reacting\nto FD 04's FD 01!
MegaReactingString: .byte 0xFD, 0x00, 0x19, 0x00, 0xFD, 0x16, 0x14, 0xFE, 0xFD, 0x39, 0x19, 0x00, 0xFD, 0x01, 0x37, 0x00, 0x1A, 0x2E, 0x19, 0x03, 0x0C, 0x10, 0xAB, 0xFF
MegaEvolutionCompleteString: .byte 0xFD, 0x13, 0x1A, 0xFE, 0x72, 0x87, 0xFD, 0x34, 0x16, 0x00, 0x72, 0x87, 0x5C, 0x7E, 0x56, 0x0C, 0x10, 0xAB, 0xFF
FerventWishString: .byte 0xFD, 0x39, 0x19, 0x00, 0x12, 0x26, 0x02, 0x00, 0x02, 0x19, 0x28, 0x37, 0xFE, 0xFD, 0x00, 0x16, 0x00, 0x14, 0x45, 0x08, 0xAE, 0xAE, 0xAB, 0xFF
UltraBurstGlowingString: .byte 0xFD, 0x13, 0x06, 0x27, 0xFE, 0x1F, 0x46, 0x25, 0x02, 0x00, 0x1B, 0x06, 0x28, 0x37, 0x00, 0x01, 0x1C, 0x2A, 0x41, 0x0D, 0xAB, 0xFF
UltraBurstCompleteString: .byte 0xFD, 0x13, 0x37, 0x00, 0x53, 0x79, 0x64, 0x77, 0x96, 0xAE, 0x5D, 0x64, 0x44, 0xFE, 0x01, 0x27, 0x10, 0x15, 0x00, 0x0D, 0x37, 0x10, 0x2D, 0x00, 0x01, 0x27, 0x2C, 0x0C, 0x10, 0xAB, 0xFF
