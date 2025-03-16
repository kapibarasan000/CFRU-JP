.text
.thumb
.align 2
/*
attackcanceler_battle_scripts.s
	battle scripts to support attackcanceler battle command
*/

.include "../asm_defines.s"
.include "../battle_script_macros.s"

.global BattleScript_PrintCustomString
.global BattleScript_QuickClaw
.global BattleScript_MagicBounce
.global BattleScript_MoveUsedFlinched
.global BattleScript_MoveUsedDevolvedForgot
.global BattleScript_MoveUsedIsConfused
.global BattleScript_MoveUsedLoafingAround
.global BattleScript_MoveUsedGravityPrevents
.global BattleScript_MoveUsedHealBlockPrevents
.global BattleScript_MoveUsedThroatChopPrevents
.global BattleScript_MoveUsedFailedPrimalWeather
.global BattleScript_MoveUsedPsychicTerrainPrevents
.global BattleScript_MoveUsedPowderPrevents
.global BattleScript_StanceChangeToBlade
.global BattleScript_StanceChangeToShield
.global BattleScript_ZMoveActivateStatus
.global BattleScript_ZMoveActivateDamaging
.global BattleScript_DarkTypePreventsPrankster
.global BattleScript_MoveUsedSkyBattlePrevents
.global BattleScript_CantUseSignatureMove
.global BattleScript_HoopaCantUseHyperspaceFury
.global BattleScript_MoveUsedDynamaxPrevents
.global BattleScript_MoveUsedRaidBattlePrevents
.global BattleScript_RaidBattleStatNullification

.global BattleScript_TryRemoveIllusion
.global AbilityRaisedStatString

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_PrintCustomString:
	printstring 0x184
	waitmessage DELAY_1SECOND
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MagicBounce:
	call BattleScript_AttackstringBackupScriptingBank
	ppreduce
	pause 0x10
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER gText_MagicBounce
	printstring 0x184
	waitmessage DELAY_1SECOND	
	call BattleScript_AbilityPopUpRevert
	orword HIT_MARKER, HITMARKER_ATTACKSTRING_PRINTED | HITMARKER_NO_PPDEDUCT | HITMARKER_x800000
	various BANK_ATTACKER 0x1
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveUsedFlinched:
	printstring 0x4A
	waitmessage DELAY_1SECOND
	jumpifability BANK_ATTACKER ABILITY_STEADFAST SteadfastBoost
	goto BS_MOVE_END

SteadfastBoost:
	jumpifstat BANK_ATTACKER EQUALS STAT_SPD STAT_MAX BS_MOVE_END
	copyarray BATTLE_SCRIPTING_BANK USER_BANK 0x1
	call BattleScript_AbilityPopUp
	setbyte 0x2023F3F 0x0
	playstatchangeanimation BANK_ATTACKER STAT_ANIM_SPD STAT_ANIM_UP
	setbyte STAT_CHANGE_BYTE STAT_SPD | INCREASE_1
	statbuffchange STAT_ATTACKER | STAT_BS_PTR BS_MOVE_END
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 BS_MOVE_END
	copyarray 0x2023F3B USER_BANK 0x1 @;gBattlescripting->bank
	printfromtable 0x83C4548
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	goto BS_MOVE_END
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveUsedDevolvedForgot:
	setword BATTLE_STRING_LOADER gText_DevolvedForgotMove
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto BS_MOVE_END

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveUsedIsConfused:
	printstring 65 @;STRINGID_PKMNISCONFUSED
	waitmessage DELAY_1SECOND
	chosenstatusanimation BANK_ATTACKER TRUE STATUS2_CONFUSION
	goto 0x81BD09B

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveUsedLoafingAround:
	call BS_FLUSH_MESSAGE_BOX
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x4 BattleScript_TruantLoafingAround
	printfromtable 0x83C45E6 @;gInobedientStringIds
	waitmessage DELAY_1SECOND
	goto BS_MOVE_END

BattleScript_TruantLoafingAround:
	setbyte MULTISTRING_CHOOSER 0x0
	call BattleScript_AbilityPopUp
	printfromtable 0x83C45E6 @;gInobedientStringIds
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	goto BS_MOVE_END

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveUsedGravityPrevents:
	orbyte OUTCOME OUTCOME_FAILED
	setword BATTLE_STRING_LOADER GravityAttackCancelString
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto 0x81BA90A

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveUsedHealBlockPrevents:
	orbyte OUTCOME OUTCOME_FAILED
	setword BATTLE_STRING_LOADER HealBlockAttackCancelString
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto BS_MOVE_END

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveUsedThroatChopPrevents:
	orbyte OUTCOME OUTCOME_FAILED
	setword BATTLE_STRING_LOADER ThroatChopAttackCancelString
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto BS_MOVE_END

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveUsedFailedPrimalWeather:
	orbyte OUTCOME OUTCOME_FAILED
	attackstring
	ppreduce
	pause DELAY_HALFSECOND
	jumpifhalfword ANDS WEATHER_FLAGS weather_harsh_sun HarshSunEvaportionBS
	setword BATTLE_STRING_LOADER MoveFizzledInHeavyRainString
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto BS_MOVE_END

HarshSunEvaportionBS:
	setword BATTLE_STRING_LOADER MoveEvaporatedInHarshSunString
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto BS_MOVE_END

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveUsedPsychicTerrainPrevents:
	orbyte OUTCOME OUTCOME_FAILED
	attackstring
	ppreduce
	pause DELAY_HALFSECOND
	setword BATTLE_STRING_LOADER PsychicTerrainAttackCancelString
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto BS_MOVE_END

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveUsedPowderPrevents:
	attackstring
	ppreduce
	pause DELAY_HALFSECOND
	playanimation BANK_ATTACKER ANIM_POWDER_EXPLOSION 0x0
	jumpifability BANK_ATTACKER ABILITY_MAGICGUARD SkipPowderDamage
	graphicalhpupdate BANK_ATTACKER
	datahpupdate BANK_ATTACKER

SkipPowderDamage:
	setword BATTLE_STRING_LOADER PowderExplosionString
	printstring 0x184
	waitmessage DELAY_1SECOND
	faintpokemon BANK_ATTACKER 0x0 0x0
	orbyte OUTCOME 0x1
	goto BS_MOVE_END

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_StanceChangeToBlade:
	call BS_FLUSH_MSGBOX
	call BattleScript_AbilityPopUp
	playanimation BANK_ATTACKER ANIM_TRANSFORM 0x0
	setword BATTLE_STRING_LOADER String_SwitchedToBladeForm
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

BattleScript_StanceChangeToShield:
	call BS_FLUSH_MSGBOX
	call BattleScript_AbilityPopUp
	playanimation BANK_ATTACKER ANIM_TRANSFORM 0x0
	setword BATTLE_STRING_LOADER String_SwitchedToShieldForm
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_ZMoveActivateStatus:
	call BattleScript_TryRemoveIllusion
	setword BATTLE_STRING_LOADER ZPowerSurroundsString
	printstring 0x184
	playanimation BANK_ATTACKER ANIM_ZMOVE_ACTIVATE 0x0
	callasm SetZEffect+1
	setword BATTLE_STRING_LOADER ZMoveUnleashedString
	printstring 0x184
	waitmessage DELAY_1SECOND
	return

BattleScript_ZMoveActivateDamaging:
	call BattleScript_TryRemoveIllusion
	setword BATTLE_STRING_LOADER ZPowerSurroundsString
	printstring 0x184
	playanimation BANK_ATTACKER ANIM_ZMOVE_ACTIVATE 0x0
	setword BATTLE_STRING_LOADER ZMoveUnleashedString
	printstring 0x184
	waitmessage DELAY_1SECOND
	return

BattleScript_TryRemoveIllusion:
	jumpifspecialstatusflag BANK_SCRIPTING STATUS3_ILLUSION 0x1 RemoveIllusionReturn
	@;remove illusion counter
	call BS_FLUSH_MESSAGE_BOX
	clearspecialstatusbit BANK_SCRIPTING STATUS3_ILLUSION
	callasm ClearScriptingBankDisguisedAs
	reloadhealthbar BANK_SCRIPTING
	playanimation BANK_SCRIPTING ANIM_TRANSFORM 0x0
	setword BATTLE_STRING_LOADER IllusionWoreOffString
	printstring 0x184
	waitmessage DELAY_1SECOND
RemoveIllusionReturn:
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_DarkTypePreventsPrankster:
	orbyte OUTCOME OUTCOME_NOT_AFFECTED
	attackstring
	ppreduce
	pause DELAY_HALFSECOND
	printstring 27 @;STRINGID_IT_DOESNT_AFFECT
	waitmessage DELAY_1SECOND
	goto BS_MOVE_END

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveUsedSkyBattlePrevents:
	orbyte OUTCOME OUTCOME_FAILED
	setword BATTLE_STRING_LOADER SkyBattleAttackCancelString
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto BS_MOVE_END

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_CantUseSignatureMove:
	attackstring
	pause DELAY_HALFSECOND
	orbyte OUTCOME OUTCOME_FAILED
	setword BATTLE_STRING_LOADER CantUseHyperspaceFuryString
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto BS_MOVE_END

BattleScript_HoopaCantUseHyperspaceFury:
	attackstring
	pause DELAY_HALFSECOND
	orbyte OUTCOME OUTCOME_FAILED
	setword BATTLE_STRING_LOADER WrongHoopaFormString
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto BS_MOVE_END

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveUsedDynamaxPrevents:
	attackstring
	ppreduce
	pause DELAY_HALFSECOND
	orbyte OUTCOME OUTCOME_FAILED
	setword BATTLE_STRING_LOADER gText_DynamaxAttackCancel
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto BS_MOVE_END

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveUsedRaidBattlePrevents:
	attackstring
	ppreduce
	pause DELAY_HALFSECOND
	orbyte OUTCOME OUTCOME_FAILED
	setword BATTLE_STRING_LOADER gText_RaidBattleAttackCancel
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto BS_MOVE_END

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_RaidBattleStatNullification:
	call BS_FLUSH_MSGBOX
	playanimation BANK_SCRIPTING ANIM_RAID_BATTLE_ENERGY_BURST 0x0
	setword BATTLE_STRING_LOADER gText_RaidBattleStatNullification
	printstring 0x184
	waitmessage DELAY_1SECOND
	refreshhpbar BANK_SCRIPTING
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.align 2
AbilityRaisedStatString: .byte 0xFD, 0x13, 0x19, 0xFE, 0xFD, 0x00, 0x37, 0x00, 0xFD, 0x01, 0xFF
GravityAttackCancelString: .byte 0xFD, 0x0F, 0x1A, 0xFE, 0x3D, 0x35, 0x03, 0x28, 0x36, 0x08, 0x37, 0x00, 0x12, 0x26, 0x08, 0x13, 0xFA, 0xFD, 0x14, 0x37, 0x00, 0x41, 0x0E, 0x15, 0x02, 0xAB, 0xFF
HealBlockAttackCancelString: .byte 0xFD, 0x0F, 0x1A, 0x00, 0x06, 0x02, 0x1C, 0x08, 0x1C, 0x03, 0x3D, 0x44, 0xFE, 0xFD, 0x14, 0x37, 0x00, 0x41, 0x0E, 0x15, 0x02, 0xAB, 0xFF
ThroatChopAttackCancelString: .byte 0xFD, 0x0F, 0x1A, 0x00, 0x3D, 0x3B, 0x08, 0x43, 0x07, 0x19, 0xFE, 0x0A, 0x03, 0x06, 0x44, 0x00, 0x2C, 0x3C, 0x37, 0x00, 0x41, 0x0E, 0x15, 0x02, 0xAB, 0xFF
MoveEvaporatedInHarshSunString: .byte 0x12, 0x26, 0x02, 0x1B, 0x3C, 0x0C, 0x19, 0x00, 0x04, 0x02, 0x07, 0x36, 0x03, 0x44, 0xFE, 0x20, 0x3E, 0x60, 0x52, 0x9D, 0x19, 0x00, 0x0A, 0x03, 0x3A, 0x07, 0x37, 0x00, 0x3D, 0x36, 0x03, 0x1A, 0x12, 0x0C, 0x10, 0xAB, 0xFF
MoveFizzledInHeavyRainString: .byte 0x12, 0x26, 0x02, 0x00, 0x01, 0x22, 0x19, 0x00, 0x04, 0x02, 0x07, 0x36, 0x03, 0x44, 0xFE, 0x1E, 0x19, 0x05, 0x60, 0x52, 0x9D, 0x19, 0x00, 0x0A, 0x03, 0x3A, 0x07, 0x37, 0x00, 0x06, 0x07, 0x09, 0x0B, 0x2A, 0x10, 0xAB, 0xFF
PsychicTerrainAttackCancelString: .byte 0xFD, 0x10, 0x1A, 0xFE, 0x5B, 0x52, 0x5A, 0x6C, 0x80, 0xAE, 0x79, 0x95, 0x16, 0x00, 0x1F, 0x23, 0x27, 0x2A, 0x13, 0x02, 0x29, 0xAB, 0xFF
PowderExplosionString: .byte 0xFD, 0x14, 0x16, 0x00, 0x1A, 0x2E, 0x19, 0x03, 0x0C, 0x13, 0xFE, 0x1C, 0x2E, 0x3D, 0x2E, 0x37, 0x00, 0x46, 0x08, 0x1A, 0x12, 0x0C, 0x10, 0xAB, 0xFF
String_SwitchedToBladeForm: .byte 0x98, 0x7A, 0xAE, 0x95, 0x6C, 0x83, 0x79, 0x71, 0x00, 0x61, 0x82, 0x7E, 0x8D, 0xAB, 0xFF
String_SwitchedToShieldForm: .byte 0x5C, 0xAE, 0x79, 0x95, 0x6C, 0x83, 0x79, 0x71, 0x00, 0x61, 0x82, 0x7E, 0x8D, 0xAB, 0xFF
ZPowerSurroundsString: .byte 0xFD, 0x0F, 0x1A, 0xFE, 0xD4, 0x9B, 0x7C, 0xAE, 0x2D, 0x00, 0x06, 0x27, 0x41, 0x16, 0x00, 0x1F, 0x14, 0x50, 0x10, 0xAB, 0xFF
ZMoveUnleashedString: .byte 0xFD, 0x0F, 0x37, 0x00, 0x14, 0x07, 0x1A, 0x15, 0x12, 0xFE, 0x3F, 0x2E, 0x28, 0x36, 0x08, 0x19, 0x00, 0xD4, 0x7C, 0x8C, 0xAB, 0xFF
IllusionWoreOffString: .byte 0xFD, 0x13, 0x19, 0xFE, 0x52, 0x78, 0x85, 0xAE, 0x8D, 0x86, 0x7E, 0x37, 0x00, 0x14, 0x09, 0x10, 0xAB, 0xFF
SkyBattleAttackCancelString: .byte 0x0A, 0x19, 0x2C, 0x3C, 0x1A, 0x00, 0x5D, 0x56, 0x52, 0x96, 0x64, 0x79, 0x44, 0xFE, 0x03, 0x1F, 0x08, 0x00, 0x41, 0x0E, 0x15, 0x02, 0xAB, 0xFF
