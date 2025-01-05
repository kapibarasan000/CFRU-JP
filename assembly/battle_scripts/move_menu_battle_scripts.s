.text
.thumb
.align 2
/*
move_menu_battle_scripts.s
	handles messages when trying to select a move
*/

.include "../asm_defines.s"
.include "../battle_script_macros.s"

.global BattleScript_MustSelectEncoredMove
.global BattleScript_SelectingNotAllowedMoveChoiceAbility
.global BattleScript_SelectingNotAllowedMoveAssaultVest
.global BattleScript_SelectingNotAllowedSkyBattle
.global BattleScript_SelectingNotAllowedGravity
.global BattleScript_SelectingNotAllowedThroatChop
.global BattleScript_SelectingNotAllowedHealBlock

BattleScript_MustSelectEncoredMove:
	setword BATTLE_STRING_LOADER EncoreMoveMenuString
	printselectionstring 0x184
	endselectionscript
	
BattleScript_SelectingNotAllowedMoveChoiceAbility:
	setword BATTLE_STRING_LOADER gText_GorillaTacticsMoveMenuBlockage
	printselectionstring 0x184
	endselectionscript	

BattleScript_SelectingNotAllowedMoveAssaultVest:
	setword BATTLE_STRING_LOADER AssualtVestMoveMenuString
	printselectionstring 0x184
	endselectionscript

BattleScript_SelectingNotAllowedSkyBattle:
	setword BATTLE_STRING_LOADER SkyBattleMoveMenuString
	printselectionstring 0x184
	endselectionscript

BattleScript_SelectingNotAllowedGravity:
	setword BATTLE_STRING_LOADER GravityMoveMenuString
	printselectionstring 0x184
	endselectionscript

BattleScript_SelectingNotAllowedThroatChop:
	setword BATTLE_STRING_LOADER ThroatChopMoveMenuString
	printselectionstring 0x184
	endselectionscript

BattleScript_SelectingNotAllowedHealBlock:
	setword BATTLE_STRING_LOADER HealBlockMoveMenuString
	printselectionstring 0x184
	endselectionscript

.align 2
EncoreMoveMenuString: .byte 0xFD, 0x13, 0x1A, 0xFE, 0xFD, 0x14, 0x0C, 0x06, 0x00, 0x41, 0x0E, 0x15, 0x02, 0xAB, 0xFB, 0xFF
AssualtVestMoveMenuString: .byte 0xFD, 0x16, 0x19, 0x00, 0x0A, 0x03, 0x06, 0x44, 0xFE, 0x1D, 0x2E, 0x06, 0x2C, 0x3C, 0x37, 0x00, 0x41, 0x0E, 0x15, 0x02, 0xAB, 0xFB, 0xFF
SkyBattleMoveMenuString: .byte 0x5D, 0x56, 0x52, 0x96, 0x64, 0x79, 0x44, 0x1A, 0xFE, 0xFD, 0x14, 0x37, 0x00, 0x41, 0x0E, 0x15, 0x02, 0xAB, 0xFB, 0xFF
GravityMoveMenuString: .byte 0x3D, 0x35, 0x03, 0x28, 0x36, 0x08, 0x37, 0x00, 0x12, 0x26, 0x08, 0x13, 0xFE, 0xFD, 0x14, 0x37, 0x00, 0x41, 0x0E, 0x15, 0x02, 0xAB, 0xFB, 0xFF
ThroatChopMoveMenuString: .byte 0xFD, 0x13, 0x1A, 0x00, 0x3D, 0x3B, 0x08, 0x43, 0x07, 0x19, 0xFE, 0x0A, 0x03, 0x06, 0x44, 0x00, 0x2C, 0x3C, 0x37, 0x00, 0x41, 0x0E, 0x15, 0x02, 0xAB, 0xFB, 0xFF
HealBlockMoveMenuString: .byte 0xFD, 0x13, 0x1A, 0x00, 0x06, 0x02, 0x1C, 0x08, 0x1C, 0x03, 0x3D, 0x44, 0xFE, 0xFD, 0x14, 0x37, 0x00, 0x41, 0x0E, 0x15, 0x02, 0xAB, 0xFB, 0xFF
