.text
.thumb
.align 2
/*
z_effect_battle_scripts.s
	handles implementing z move effects
*/

.include "../asm_defines.s"
.include "../battle_script_macros.s"

.global BattleScript_StatsResetZMove
.global BattleScript_AllStatsUpZMove
.global BattleScript_BoostCritsZMove
.global BattleScript_FollowMeZMove
.global BattleScript_RecoverHPZMove
.global BattleScript_StatUpZMove
.global BattleScript_SetUpHealReplacementZMove
.global BattleScript_HealReplacementZMove

BattleScript_StatsResetZMove:
	setword BATTLE_STRING_LOADER StatsResetZMoveString
	printstring 0x184
	waitmessage DELAY_1SECOND
	return

BattleScript_AllStatsUpZMove:
	setword BATTLE_STRING_LOADER StatsRaisedZMoveString
	printstring 0x184
	waitmessage DELAY_1SECOND
	return

BattleScript_BoostCritsZMove:
	setword BATTLE_STRING_LOADER CritBoostedZMoveString
	printstring 0x184
	waitmessage DELAY_1SECOND
	return

BattleScript_FollowMeZMove:
	printstring 0xA4
	waitmessage DELAY_1SECOND
	return

BattleScript_RecoverHPZMove:
	graphicalhpupdate 0xA
	datahpupdate 0xA
	setword BATTLE_STRING_LOADER HPRestoredZMoveString
	printstring 0x184
	waitmessage DELAY_1SECOND
	return
	
BattleScript_StatUpZMove:
	playanimation 0xA 0x1 0x2023F34
	setword BATTLE_STRING_LOADER StatRaisedZMoveString
	printstring 0x184
	waitmessage DELAY_1SECOND
	return

BattleScript_SetUpHealReplacementZMove:
	setword BATTLE_STRING_LOADER HPWillRestoreZMoveString
	printstring 0x184
	waitmessage DELAY_1SECOND
	return

BattleScript_HealReplacementZMove:
	playanimation 0xA ANIM_HEALING_WISH_HEAL 0x0
	setword BATTLE_STRING_LOADER HPSwitchInRestoredZMoveString
	printstring 0x184
	waitmessage DELAY_1SECOND
	playanimation 0xA ANIM_HEALING_SPARKLES 0x0
	graphicalhpupdate 0xA
	datahpupdate 0xA
	return


.align 2
StatsResetZMoveString: .byte 0xFD, 0x13, 0x1A, 0x00, 0xD4, 0x9B, 0x7C, 0xAE, 0x44, 0xFE, 0x5D, 0x63, 0xAE, 0x60, 0x5D, 0x2D, 0x00, 0x23, 0x14, 0x16, 0x00, 0x23, 0x45, 0x0C, 0x10, 0xAB, 0xFF
StatRaisedZMoveString: .byte 0xFD, 0x13, 0x1A, 0xFE, 0xD4, 0x9B, 0x7C, 0xAE, 0x44, 0x00, 0xFD, 0x00, 0x37, 0x00, 0xFD, 0x01, 0xFF
StatsRaisedZMoveString: .byte 0xFD, 0x13, 0x1A, 0xFE, 0xD4, 0x9B, 0x7C, 0xAE, 0x44, 0x00, 0x19, 0x03, 0x28, 0x36, 0x08, 0x37, 0x00, 0x01, 0x37, 0x50, 0x10, 0xAB, 0xFF
CritBoostedZMoveString: .byte 0xFD, 0x13, 0x1A, 0x00, 0xD4, 0x9B, 0x7C, 0xAE, 0x44, 0xFE, 0x07, 0x35, 0x03, 0x0C, 0x36, 0x16, 0x00, 0x01, 0x10, 0x28, 0x24, 0x0D, 0x08, 0x15, 0x50, 0x10, 0xAB, 0xFF
HPRestoredZMoveString: .byte 0xFD, 0x13, 0x1A, 0x00, 0xD4, 0x9B, 0x7C, 0xAE, 0x44, 0xFE, 0x10, 0x02, 0x28, 0x36, 0x08, 0x2D, 0x00, 0x06, 0x02, 0x1C, 0x08, 0x0C, 0x10, 0xAB, 0xFF
HPWillRestoreZMoveString: .byte 0xFD, 0x13, 0x1A, 0x00, 0xD4, 0x9B, 0x7C, 0xAE, 0x44, 0xFE, 0x02, 0x2A, 0x06, 0x04, 0x0B, 0x07, 0x19, 0x00, 0x20, 0x06, 0x10, 0x2D, 0x00, 0x06, 0x02, 0x1C, 0x08, 0x0D, 0x29, 0xAB, 0xFF
HPSwitchInRestoredZMoveString: .byte 0xFD, 0x13, 0x1A, 0x00, 0xD4, 0x9B, 0x7C, 0xAE, 0x44, 0xFE, 0x10, 0x02, 0x28, 0x36, 0x08, 0x37, 0x00, 0x06, 0x02, 0x1C, 0x08, 0x0C, 0x10, 0xAB, 0xFF
