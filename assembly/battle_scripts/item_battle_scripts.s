.text
.thumb
.align 2
/*
item_battle_scripts.s
	handles in-battle item usage
*/

.include "../asm_defines.s"
.include "../battle_script_macros.s"

.global BattleScript_BerryConfuseHealRet
.global BattleScript_BerryConfuseHealEnd2
.global BattleScript_ItemHealHP_Ret
.global BattleScript_ItemHealHP_End2
.global BattleScript_BerryHealHP_RemoveBerryRet
.global BattleScript_BerryHealHP_RemoveBerryEnd2
.global BattleScript_ItemHealHP_RemoveItemRet
.global BattleScript_ItemHealHP_RemoveItemEnd2
.global BattleScript_BerryPPHealRet
.global BattleScript_BerryPPHealEnd2
.global BattleScript_BerryFocusEnergyRet
.global BattleScript_BerryFocusEnergyEnd2
.global BattleScript_BerryStatRaiseRet
.global BattleScript_BerryStatRaiseEnd2
.global BattleScript_BerryCureParRet
.global BattleScript_BerryCurePrlzEnd2
.global BattleScript_BerryCurePsnRet
.global BattleScript_BerryCurePsnEnd2
.global BattleScript_BerryCureBrnRet
.global BattleScript_BerryCureBrnEnd2
.global BattleScript_BerryCureFrzRet
.global BattleScript_BerryCureFrzEnd2
.global BattleScript_BerryCureSlpRet
.global BattleScript_BerryCureSlpEnd2
.global BattleScript_BerryCureConfusionRet
.global BattleScript_BerryCureConfusionEnd2
.global BattleScript_BerryCureChosenStatusRet
.global BattleScript_BerryCureChosenStatusEnd2
.global BattleScript_HerbCureChosenStatusRet
.global BattleScript_HerbCureChosenStatusEnd2
.global BattleScript_HerbCureChosenStatusFling
.global BattleScript_RaiseStatsItem
.global BattleScript_ItemStatChangeEnd2
.global BattleScript_ItemStatChangeRet
.global BattleScript_RoomServiceEnd2
.global BattleScript_RoomServiceRet
.global BattleScript_WhiteHerbFling

.global BattleScript_AirBallooonPop
.global BattleScript_WeaknessPolicy
.global BattleScript_RockyHelmetDamage
.global BattleScript_JabocaRowapBerry
.global BattleScript_BlackSludgeHurt
.global BattleScript_MicleBerryRet
.global BattleScript_MicleBerryEnd2
.global BattleScript_StickyBarbTransfer
.global BattleScript_EjectButton
.global BattleScript_EjectPackEnd2
.global BattleScript_EjectPackRet
.global BattleScript_EjectPackCMD49
.global BattleScript_RedCard
.global BattleScript_HangedOnFocusSash
.global BattleScript_Gems
.global BattleScript_WeaknessBerryActivate
.global BattleScript_ClearAmulet

.global BattleScript_CheekPouch

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BerryConfuseHealRet:
	call BattleScript_TryPrintRipenAbilityPopUp
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	printstring 0x12A
	waitmessage DELAY_1SECOND
	orword HIT_MARKER HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_NON_ATTACK_DMG @;NON_ATTACK_DMG is needed in case of Jump Kick missing
	graphicalhpupdate BANK_SCRIPTING
	datahpupdate BANK_SCRIPTING
	printstring 0x144
	waitmessage DELAY_1SECOND
	setmoveeffect MOVE_EFFECT_CONFUSION
	copyhword BACKUP_HWORD BATTLE_SCRIPTING_BANK @;Backup scripting bank
	seteffectprimaryscriptingbank
	copyhword BATTLE_SCRIPTING_BANK BACKUP_HWORD @;Restore scripting bank
	call BattleScript_CheekPouch
	return

BattleScript_BerryConfuseHealEnd2:
	call BattleScript_BerryConfuseHealRet
	end2

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BerryHealHP_RemoveBerryRet:
	call BattleScript_TryPrintRipenAbilityPopUp
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	
BattleScript_ItemHealHP_RemoveItem_SkipAnim:
	playanimation BANK_SCRIPTING ANIM_HEALING_SPARKLES 0x0
	orword HIT_MARKER HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_NON_ATTACK_DMG @;NON_ATTACK_DMG is needed in case of Jump Kick missing
	graphicalhpupdate BANK_SCRIPTING
	datahpupdate BANK_SCRIPTING
	printstring 0x12A
	waitmessage DELAY_1SECOND
	call BattleScript_CheekPouch
	return

BattleScript_BerryHealHP_RemoveBerryEnd2:
	call BattleScript_BerryHealHP_RemoveBerryRet
	end2
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_ItemHealHP_RemoveItemRet:
	playanimation BANK_SCRIPTING ANIM_ITEM_USE 0x0
	goto BattleScript_ItemHealHP_RemoveItem_SkipAnim

BattleScript_ItemHealHP_RemoveItemEnd2:
	call BattleScript_ItemHealHP_RemoveItemRet
	end2

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BerryPPHealRet:
	waitstateatk
	call BattleScript_TryPrintRipenAbilityPopUp
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	printstring 0x12B
	waitmessage DELAY_1SECOND
	call BattleScript_CheekPouch
	return
	
BattleScript_BerryPPHealEnd2:
	call BattleScript_BerryPPHealRet
	end2

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BerryFocusEnergyRet:
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	printstring 0x146
	waitmessage DELAY_1SECOND
	call BattleScript_CheekPouch
	return
	
BattleScript_BerryFocusEnergyEnd2:
	call BattleScript_BerryFocusEnergyRet
	end2

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BerryStatRaiseRet:
	call BattleScript_TryPrintRipenAbilityPopUp
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	setbyte MULTISTRING_CHOOSER 0x4
	call 0x81BAB8D
	call BattleScript_CheekPouch
	return

BattleScript_BerryStatRaiseEnd2:
	call BattleScript_BerryStatRaiseRet
	end2

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BerryCureParRet:
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	refreshhpbar BANK_SCRIPTING
	printstring 0x123
	waitmessage DELAY_1SECOND
	call BattleScript_CheekPouch
	return

BattleScript_BerryCurePrlzEnd2:
	call BattleScript_BerryCureParRet
	end2
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


BattleScript_BerryCurePsnRet:
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	refreshhpbar BANK_SCRIPTING
	printstring 0x124
	waitmessage DELAY_1SECOND
	call BattleScript_CheekPouch
	return

BattleScript_BerryCurePsnEnd2:
	call BattleScript_BerryCurePsnRet
	end2

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BerryCureBrnRet:
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	refreshhpbar BANK_SCRIPTING
	printstring 0x125
	waitmessage DELAY_1SECOND
	call BattleScript_CheekPouch
	return

BattleScript_BerryCureBrnEnd2:
	call BattleScript_BerryCureBrnRet
	end2

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BerryCureFrzRet:
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	refreshhpbar BANK_SCRIPTING
	printstring 0x126
	waitmessage DELAY_1SECOND
	call BattleScript_CheekPouch
	return

BattleScript_BerryCureFrzEnd2:
	call BattleScript_BerryCureFrzRet
	end2

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BerryCureSlpRet:
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	refreshhpbar BANK_SCRIPTING
	printstring 0x127
	waitmessage DELAY_1SECOND
	call BattleScript_CheekPouch
	return

BattleScript_BerryCureSlpEnd2:
	call BattleScript_BerryCureSlpRet
	end2

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BerryCureConfusionRet:
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	printstring 0x128
	waitmessage DELAY_1SECOND
	call BattleScript_CheekPouch
	return

BattleScript_BerryCureConfusionEnd2:
	call BattleScript_BerryCureConfusionRet
	end2

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BerryCureChosenStatusRet:
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	refreshhpbar BANK_SCRIPTING
	printfromtable 0x83C4600
	waitmessage DELAY_1SECOND
	call BattleScript_CheekPouch
	return

BattleScript_BerryCureChosenStatusEnd2:
	call BattleScript_BerryCureChosenStatusRet
	end2

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_CheekPouch:
	callasm CheeckPouchFunc
	jumpifbyte EQUALS FORM_COUNTER 0x0 CheeckPouchRet
	setbyte FORM_COUNTER 0x0
	call BattleScript_AbilityPopUp
	playanimation BANK_SCRIPTING ANIM_HEALING_SPARKLES 0x0
	orword HIT_MARKER HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_NON_ATTACK_DMG @;NON_ATTACK_DMG is needed in case of Jump Kick missing
	graphicalhpupdate BANK_SCRIPTING
	datahpupdate BANK_SCRIPTING
	setword BATTLE_STRING_LOADER CheekPouchString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
CheeckPouchRet:
	removeitem BANK_SCRIPTING
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_TryPrintRipenAbilityPopUp:
	jumpifability BANK_SCRIPTING ABILITY_RIPEN BattleScript_PrintRipenAbilityPopUp
	return

BattleScript_PrintRipenAbilityPopUp:
	call BattleScript_AbilityPopUp
	pause DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert	
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_HerbCureChosenStatusRet:
	playanimation BANK_SCRIPTING ANIM_ITEM_USE 0x0
	refreshhpbar BANK_SCRIPTING
	printfromtable 0x83C4600
	waitmessage DELAY_1SECOND
	removeitem BANK_SCRIPTING
	return

BattleScript_HerbCureChosenStatusEnd2:
	call BattleScript_HerbCureChosenStatusRet
	end2
	
BattleScript_HerbCureChosenStatusFling:
	playanimation BANK_SCRIPTING ANIM_ITEM_USE 0x0
	refreshhpbar BANK_SCRIPTING
	printfromtable 0x83C4600
	waitmessage DELAY_1SECOND
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_RaiseStatsItem:
	playanimation BANK_SCRIPTING ANIM_ITEM_USE 0x0
	setbyte MULTISTRING_CHOOSER 0x4
	call 0x81BAB8D
	removeitem BANK_SCRIPTING
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_ItemStatChangeEnd2:
	call BattleScript_ItemStatChangeRet
	end2

BattleScript_ItemStatChangeRet:
	statbuffchange STAT_TARGET | STAT_BS_PTR | STAT_CERTAIN ItemStatChangeReturn
	playanimation BANK_TARGET ANIM_ITEM_USE 0x0
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	setbyte MULTISTRING_CHOOSER 0x4
	printfromtable 0x83C4548
	waitmessage DELAY_1SECOND
	removeitem BANK_TARGET
ItemStatChangeReturn:
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_WhiteHerbFling:
	playanimation BANK_SCRIPTING ANIM_ITEM_USE 0x0
	setword BATTLE_STRING_LOADER gText_WhiteHerbFling
	printstring 0x184
	waitmessage DELAY_1SECOND
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AirBallooonPop:
	setword BATTLE_STRING_LOADER AirBalloonPopString
	printstring 0x184
	waitmessage DELAY_1SECOND
	setcounter BANK_TARGET INCINERATE_COUNTERS 0x1 @;Air Balloons can't be recycled
	removeitem BANK_TARGET
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_WeaknessPolicy:
	playanimation BANK_TARGET ANIM_ITEM_USE 0x0
	setword BATTLE_STRING_LOADER WeaknessPolicyString
	printstring 0x184
	
WP_Atk:
	setbyte 0x2023F3F 0x0
	playstatchangeanimation BANK_TARGET STAT_ANIM_ATK | STAT_ANIM_SPATK  STAT_ANIM_UP | STAT_ANIM_IGNORE_ABILITIES | STAT_ANIM_BY_TWO
	setstatchanger STAT_ATK | INCREASE_2
	statbuffchange STAT_TARGET | STAT_BS_PTR WP_SpAtk
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 WP_SpAtk
	printfromtable 0x83C4548
	waitmessage DELAY_1SECOND

WP_SpAtk:
	setstatchanger STAT_SP_ATK | INCREASE_2
	statbuffchange STAT_TARGET | STAT_BS_PTR WP_Ret
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 WP_Ret
	printfromtable 0x83C4548
	waitmessage DELAY_1SECOND

WP_Ret:
	removeitem BANK_TARGET
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_RockyHelmetDamage:
	orword HIT_MARKER HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_NON_ATTACK_DMG
	graphicalhpupdate BANK_ATTACKER
	datahpupdate BANK_ATTACKER
	setword BATTLE_STRING_LOADER RockyHelmetString
	printstring 0x184
	waitmessage DELAY_1SECOND
	faintpokemon BANK_ATTACKER 0x0 0x0
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_JabocaRowapBerry:
	call BattleScript_TryPrintRipenAbilityPopUp
	playanimation BANK_TARGET ANIM_BERRY_EAT 0x0
	orword HIT_MARKER HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_NON_ATTACK_DMG
	graphicalhpupdate BANK_ATTACKER
	datahpupdate BANK_ATTACKER
	setword BATTLE_STRING_LOADER RockyHelmetString
	printstring 0x184
	waitmessage DELAY_1SECOND
	faintpokemon BANK_ATTACKER 0x0 0x0
	call BattleScript_CheekPouch
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BlackSludgeHurt:
	playanimation BANK_SCRIPTING ANIM_WAITING_WAGGLE 0x0
	orword HIT_MARKER HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_NON_ATTACK_DMG
	graphicalhpupdate BANK_SCRIPTING
	datahpupdate BANK_SCRIPTING
	setword BATTLE_STRING_LOADER BlackSludgeHurtString
	printstring 0x184
	waitmessage DELAY_1SECOND
	faintpokemon BANK_SCRIPTING 0x0 0x0
	end2
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MicleBerryRet:
	call BattleScript_TryPrintRipenAbilityPopUp
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	setword BATTLE_STRING_LOADER MicleBerryString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_CheekPouch
	return

BattleScript_MicleBerryEnd2:
	call BattleScript_MicleBerryRet
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_StickyBarbTransfer:
	callasm TransferLastUsedItem
	playanimation BANK_SCRIPTING ANIM_STEAL_ITEM 0x0
	setword BATTLE_STRING_LOADER StickyBarbString
	printstring 0x184
	waitmessage DELAY_1SECOND
	removeitem BANK_SCRIPTING
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_EjectButton:
	jumpifcannotswitch BANK_SWITCHING | ATK4F_DONT_CHECK_STATUSES EjectButtonEnd
	playanimation BANK_SWITCHING ANIM_ITEM_USE 0x0
	setword BATTLE_STRING_LOADER EjectButtonString
	printstring 0x184
	waitmessage DELAY_1SECOND
	removeitem BANK_SWITCHING
	playanimation BANK_SWITCHING ANIM_CALL_BACK_POKEMON 0x0
	callasm MakeSwitchingBankInvisible
	openpartyscreen BANK_SWITCHING EjectButtonEnd
	switchoutabilities BANK_SWITCHING
	waitstateatk
	switchhandleorder BANK_SWITCHING 0x2
	returntoball BANK_SWITCHING
	getswitchedmondata BANK_SWITCHING
	switchindataupdate BANK_SWITCHING
	hpthresholds BANK_SWITCHING
	printstring 0x3
	switchinanim BANK_SWITCHING 0x1
	waitstateatk
	switchineffects BANK_SWITCHING
	callasm SetNoMoreMovingThisTurnSwitchingBank @;New Pokemon can't attack after being switched in

EjectButtonEnd:
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_EjectPackEnd2:
	call BattleScript_EjectPackRet
	end2
	
BattleScript_EjectPackRet:
	goto BattleScript_EjectButton

BattleScript_EjectPackCMD49:
	jumpifcannotswitch BANK_SWITCHING | ATK4F_DONT_CHECK_STATUSES EjectButtonEnd
	jumpiffainted BANK_TARGET BattleScript_EjectPackGiveEXP
	goto BattleScript_EjectPackRet
	
BattleScript_EjectPackGiveEXP:
	setbyte EXP_STATE 0x0
	getexp 0x0
	callasm SetSkipCertainSwitchInAbilities
	goto BattleScript_EjectPackRet
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_RedCard:
	jumpifcannotswitch BANK_ATTACKER | ATK4F_DONT_CHECK_STATUSES RedCardRet
	playanimation BANK_SCRIPTING ANIM_ITEM_USE 0x0
	setword BATTLE_STRING_LOADER RedCardString
	printstring 0x184
	waitmessage DELAY_1SECOND
	jumpifdynamaxed BANK_ATTACKER RedCard_Dynamax
	jumpifspecialstatusflag BANK_ATTACKER STATUS3_ROOTED 0x0 RedCard_Ingrain
	jumpifability BANK_ATTACKER ABILITY_SUCTIONCUPS RedCard_SuctionCups
	forcerandomswitch BANK_ATTACKER BANK_TARGET RedCardEnd

RedCardEnd:
	removeitem BANK_SCRIPTING
	
RedCardRet:
	return

RedCard_Dynamax:
	setword BATTLE_STRING_LOADER gText_DynamaxItemBlock
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto RedCardEnd	

RedCard_Ingrain:
	setword BATTLE_STRING_LOADER RedCardIngrainString
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto RedCardEnd

RedCard_SuctionCups:
	setword BATTLE_STRING_LOADER RedCardSuctionCupsString
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto RedCardEnd

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_HangedOnFocusSash:
	playanimation BANK_TARGET ANIM_ITEM_USE 0x0
	printstring 0x12F
	waitmessage DELAY_1SECOND
	removeitem BANK_TARGET
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_Gems:
	callasm BufferAttackerItem
	pause DELAY_HALFSECOND
	playanimation BANK_ATTACKER ANIM_ITEM_USE 0x0
	setword BATTLE_STRING_LOADER GemString
	printstring 0x184
	waitmessage DELAY_1SECOND
	removeitem BANK_ATTACKER
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_WeaknessBerryActivate:
	pause DELAY_HALFSECOND
	call BattleScript_TryPrintRipenAbilityPopUp
	playanimation BANK_SCRIPTING ANIM_BERRY_EAT 0x0
	setword BATTLE_STRING_LOADER WeaknessBerryString
	printstring 0x184
	waitmessage DELAY_HALFSECOND
	call BattleScript_CheekPouch
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AIUseFullRestoreOrHpHeal:
	printstring 304 @;STRINGID_EMPTYSTRING3
	pause DELAY_HALFSECOND
	playse 0x1 @;SE_USE_ITEM
	printstring 343 @;STRINGID_TRAINER1USEDITEM
	waitmessage DELAY_1SECOND
	useitemonopponent
	playanimation BANK_ATTACKER, ANIM_HEALING_SPARKLES, 0x0 @Purposely before ignore Substitute
	orword HIT_MARKER, HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BANK_ATTACKER
	datahpupdate BANK_ATTACKER
	printstring 298 @;STRINGID_PKMNSITEMRESTOREDHEALTH
	waitmessage DELAY_1SECOND
	reloadhealthbar BANK_ATTACKER
	finishaction

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AIUseStatRestore:
	printstring 304 @;STRINGID_EMPTYSTRING3
	pause DELAY_HALFSECOND
	playse 0x1 @;SE_USE_ITEM
	printstring 343 @;STRINGID_TRAINER1USEDITEM
	waitmessage DELAY_1SECOND
	useitemonopponent
	playanimation BANK_ATTACKER, ANIM_AI_ITEM_HEAL, 0x0
	printfromtable 0x83C45F4 @;gTrainerItemCuredStatusStringIds
	waitmessage DELAY_1SECOND
	reloadhealthbar BANK_ATTACKER
	finishaction

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AIUseXstat:
	printstring 304 @;STRINGID_EMPTYSTRING3
	pause DELAY_HALFSECOND
	playse 0x1 @;SE_USE_ITEM
	printstring 343 @;STRINGID_TRAINER1USEDITEM
	waitmessage DELAY_1SECOND
	useitemonopponent
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND
	finishaction

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AIUseGuardSpec:
	printstring 304 @;STRINGID_EMPTYSTRING3
	pause DELAY_HALFSECOND
	playse 0x1 @;SE_USE_ITEM
	printstring 343 @;STRINGID_TRAINER1USEDITEM
	waitmessage DELAY_1SECOND
	useitemonopponent
	playanimation BANK_ATTACKER, ANIM_AI_ITEM_HEAL, 0x0
	printfromtable 0x83C4578 @;gMistUsedStringIds
	waitmessage DELAY_1SECOND
	finishaction

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_ClearAmulet:
	setword BATTLE_STRING_LOADER ClearAmuletString
	printstring 0x184
	waitmessage DELAY_1SECOND
	return

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.align 2
CheekPouchString: .byte 0xFD, 0x13, 0x19, 0xFE, 0x10, 0x02, 0x28, 0x36, 0x08, 0x37, 0x00, 0x06, 0x02, 0x1C, 0x08, 0x0C, 0x10, 0xAB, 0xFF
AirBalloonPopString: .byte 0xFD, 0x10, 0x19, 0xFE, 0xFD, 0x16, 0x37, 0x00, 0x2C, 0x2A, 0x10, 0xAB, 0xFF
WeaknessPolicyString: .byte 0xFD, 0x10, 0x19, 0xFE, 0xFD, 0x16, 0x37, 0x00, 0x1A, 0x12, 0x45, 0x03, 0x0C, 0x10, 0xAB, 0xFF
RockyHelmetString: .byte 0xFD, 0x0F, 0x1A, 0xFE, 0xFD, 0x16, 0x44, 0x00, 0x91, 0x72, 0xAE, 0x8D, 0x2D, 0x03, 0x09, 0x10, 0xAB, 0xFF
BlackSludgeHurtString: .byte 0xFD, 0x13, 0x1A, 0xFE, 0xFD, 0x16, 0x44, 0x00, 0x91, 0x72, 0xAE, 0x8D, 0x2D, 0x03, 0x09, 0x10, 0xAB, 0xFF
MicleBerryString: .byte 0xFD, 0x13, 0x1A, 0x00, 0xFD, 0x16, 0x44, 0xFE, 0x12, 0x38, 0x16, 0x08, 0x28, 0x41, 0x0D, 0x00, 0x2C, 0x3C, 0x37, 0x00, 0x01, 0x10, 0x28, 0x24, 0x0D, 0x08, 0x15, 0x50, 0x10, 0xAB, 0xFF
StickyBarbString: .byte 0xFD, 0x13, 0x1A, 0xFE, 0xFD, 0x16, 0x44, 0x00, 0x91, 0x72, 0xAE, 0x8D, 0x2D, 0x03, 0x09, 0x10, 0xAB, 0xFF
EjectButtonString: .byte 0xFD, 0x13, 0x1A, 0xFE, 0xFD, 0x16, 0x44, 0x00, 0x23, 0x45, 0x50, 0x13, 0x02, 0x08, 0xAB, 0xFF
RedCardString: .byte 0xFD, 0x13, 0x1A, 0x00, 0xFD, 0x16, 0x2D, 0xFE, 0xFD, 0x0F, 0x16, 0x00, 0x10, 0x10, 0x07, 0x12, 0x09, 0x10, 0xAB, 0xFF
RedCardIngrainString: .byte 0xFD, 0x0F, 0x1A, 0xFE, 0x18, 0x2D, 0x00, 0x1A, 0x50, 0x13, 0x00, 0x03, 0x3B, 0x06, 0x15, 0x02, 0xAB, 0xFF
RedCardSuctionCupsString: .byte 0xFD, 0x0F, 0x1A, 0xFE, 0xFD, 0x18, 0x44, 0x00, 0x1A, 0x28, 0x12, 0x02, 0x13, 0x02, 0x29, 0xAB, 0xFF
TypeResistBerryString: .byte 0xFD, 0x13, 0x1D, 0x19, 0x00, 0x91, 0x72, 0xAE, 0x8D, 0x2D, 0xFE, 0xFD, 0x16, 0x37, 0x00, 0x26, 0x2C, 0x22, 0x10, 0xAB, 0xFF
GemString: .byte 0xFD, 0x16, 0x1A, 0x00, 0xFD, 0x14, 0x19, 0xFE, 0x02, 0x28, 0x36, 0x08, 0x2D, 0x00, 0x12, 0x26, 0x22, 0x10, 0xAB, 0xFF
WeaknessBerryString: .byte 0xFD, 0x13, 0x1D, 0x19, 0x00, 0x91, 0x72, 0xAE, 0x8D, 0x2D, 0xFE, 0xFD, 0x16, 0x37, 0x00, 0x26, 0x2C, 0x22, 0x10, 0xAB, 0xFF
ClearAmuletString: .byte 0xFD, 0x13, 0x1A, 0x00, 0xFD, 0x16, 0x19, 0xFE, 0x0A, 0x03, 0x06, 0x44, 0x00, 0x19, 0x03, 0x28, 0x36, 0x08, 0x37, 0x00, 0x0B, 0x37, 0x27, 0x15, 0x02, 0xAB, 0xFF
