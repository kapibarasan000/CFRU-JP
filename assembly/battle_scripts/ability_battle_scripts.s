.text
.thumb
.align 2
/*
ability_battle_scripts.s
	battle scripts for specific abilities
*/

.include "../asm_defines.s"
.include "../battle_script_macros.s"

.global BattleScript_OverworldWeatherStarts
.global BattleScript_NewWeatherAbilityActivates
.global BattleScript_NewWeatherAbilityActivatesCall
.global BattleScript_AirLock
.global BattleScript_WeatherAbilityBlockedByPrimalWeather
.global BattleScript_WeatherAbilityBlockedByPrimalWeatherRet
.global BattleScript_StrongWindsWeakenedttack
.global BattleScript_TeraShellActivate
.global BattleScript_IntimidateActivatesEnd3
.global BattleScript_TraceActivates
.global BattleScript_Frisk
.global BattleScript_FriskEnd
.global BattleScript_TerrainFromAbility
.global BattleScript_ImposterActivates
.global BattleScript_AttackerAbilityStatRaiseEnd3
.global BattleScript_EmbodyAspect
.global BattleScript_NeutralizingGas
.global BattleScript_SwitchInAbilityMsg
.global BattleScript_End3
.global BattleScript_ActivateAsOne
.global BattleScript_AbilityCuredStatus
.global BattleScript_AbilityCuredStatusEnd3
.global BattleScript_StartedSchoolingEnd3
.global BattleScript_StoppedSchoolingEnd3
.global BattleScript_ShieldsDownToCoreEnd3
.global BattleScript_ShieldsDownToMeteorEnd3
.global BattleScript_EmergencyExit
.global BattleScript_AbilityTransformed
.global BattleScript_TransformedEnd2
.global BattleScript_TransformedEnd3
.global BattleScript_HospitalityActivates
.global BattleScript_CommanderActivates
.global BattleScript_ParadoxAbilityActivates
.global BattleScript_ParadoxAbilityActivatesRet
.global BattleScript_ParadoxAbilityEnd
.global BattleScript_ParadoxAbilityEndRet
.global BattleScript_TeraShiftActivates

.global BattleScript_RainDishActivates
.global BattleScript_DrySkinDamage
.global BattleScript_SolarPowerDamage
.global BattleScript_Healer
.global BattleScript_MoodySingleStat
.global BattleScript_MoodyRegular
.global BattleScript_BadDreams
.global BattleScript_Harvest
.global BattleScript_CudChewActivates
.global BattleScript_Pickup
.global BattleScript_BallFetch
.global BattleScript_EmergencyExitEnd3
.global BattleScript_AttackerCantUseMove
.global BattleScript_FlashFireBoost_PPLoss
.global BattleScript_FlashFireBoost
.global BattleScript_MoveHPDrain_PPLoss
.global BattleScript_MoveHPDrain
.global BattleScript_MonMadeMoveUseless_PPLoss
.global BattleScript_MonMadeMoveUseless
.global BattleScript_MoveStatDrain_PPLoss
.global BattleScript_MoveStatDrain
.global BattleScript_TargetAbilityStatRaise
.global BattleScript_AbilityApplySecondaryEffect
.global BattleScript_RoughSkinActivates
.global BattleScript_CuteCharmActivates
.global BattleScript_WeakArmorActivates
.global BattleScript_CursedBodyActivates
.global BattleScript_MummyActivates
.global BattleScript_LingeringAromaActivates
.global BattleScript_WanderingSpiritActivates
.global BattleScript_GooeyActivates
.global BattleScript_IllusionBroken
.global BattleScript_IllusionBrokenFaint
.global BattleScript_AngerPointActivates
.global BattleScript_SynchronizeActivates
.global BattleScript_AngerShellActivates
.global BattleScript_ElectromorphosisActivates
.global BattleScript_ToxicDebrisActivates
.global BattleScript_GuardDogActivates
.global BattleScript_OpportunistCopyStatChange
.global BattleScript_OpportunistCopyDragonCheer
.global BattleScript_OpportunistEnd

.global BattleScript_AbilityChangedType
.global BattleScript_AbilityChangedTypeContact
.global BattleScript_DisguiseTookDamage
.global BattleScript_DisguiseTransform
.global BattleScript_IceFaceTookDamage
.global BattleScript_IceFaceTransform
.global MimikyuDisguisedTookDamageString
.global BattleScript_EnduredSturdy
.global BattleScript_Receiver
.global BattleScript_Symbiosis
.global BattleScript_DefiantCompetitive
.global BattleScript_DefiantCompetitiveCall
.global BattleScript_SoulHeart
.global BattleScript_AbilityNoStatLoss
.global BattleScript_PartnerAbilityNoStatLoss
.global BattleScript_AbilityNoSpecificStatLoss
.global BattleScript_MirrorArmorReflectsIntimidate
.global BattleScript_CastformChange
.global BattleScript_CottonDownActivates
.global BattleScript_PerishBody
.global BattleScript_SturdyPreventsOHKO
.global BattleScript_StickyHoldActivates
.global BattleScript_DampStopsExplosion
.global BattleScript_TookAttack
.global BattleScript_AvoidedMoveWithAbility
.global BattleScript_MimicryTransformed
.global BattleScript_MimicryReturnedToNormal
.global BattleScript_CramorantCatchPrey
.global BattleScript_CramorantSpitPrey

.global BattleScript_AbilityPopUp
.global BattleScript_AbilityPopUpRevert

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_OverworldWeatherStarts:
	printfromtable gWeatherContinuesStringIds
	waitmessage DELAY_1SECOND
	playanimation2 BANK_ATTACKER ANIM_ARG_1 0x0
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_NewWeatherAbilityActivates:
	call BattleScript_NewWeatherAbilityActivatesCall
	end3

BattleScript_NewWeatherAbilityActivatesCall:
	call BattleScript_AbilityPopUp
	printfromtable gWeatherAbilityStrings
	waitstateatk
	playanimation2 BANK_SCRIPTING ANIM_ARG_1 0x0
	jumpifability BANK_SCRIPTING ABILITY_ORICHALCUMPULSE OrichalcumPulseMsg

BattleScript_NewWeatherAbilityActivatesReturn:
	call BattleScript_AbilityPopUpRevert
	call 0x81BD298 @;BattleScript_WeatherFormChanges
	return

OrichalcumPulseMsg:
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto BattleScript_NewWeatherAbilityActivatesReturn

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AirLock:
	call BattleScript_AbilityPopUp
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	call 0x81BD298 @;BattleScript_WeatherFormChanges
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_WeatherAbilityBlockedByPrimalWeather:
	call BattleScript_WeatherAbilityBlockedByPrimalWeatherRet
	end3

BattleScript_WeatherAbilityBlockedByPrimalWeatherRet:
	call BattleScript_AbilityPopUp
	call BattleScript_TryBlockWeatherWithPrimalWeatherRetSkipPause
	call BattleScript_AbilityPopUpRevert
	return

BattleScript_TryBlockWeatherWithPrimalWeatherRetSkipPause:
	tryblockweatherwithprimalweather RetSkipPause
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_StrongWindsWeakenedttack:
	pause DELAY_HALFSECOND
	setword BATTLE_STRING_LOADER gText_StrongWindsWeakenedAttack
	printstring 0x184
	waitmessage DELAY_1SECOND
	return

BattleScript_TeraShellActivate:
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER gText_TeraShellActivate
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_IntimidateActivatesEnd3:
	call BattleScript_PauseIntimidateActivates
	end3

BattleScript_PauseIntimidateActivates:
	call BattleScript_AbilityPopUp
	setbyte TARGET_BANK 0x0
	jumpifability BANK_SCRIPTING ABILITY_INTIMIDATE BS_IntimidateActivatesLoop
	setword BATTLE_STRING_LOADER gText_SupersweetSyrupActivate
	printstring 0x184
	waitmessage DELAY_1SECOND

BS_IntimidateActivatesLoop:
	jumpifability BANK_SCRIPTING ABILITY_SUPERSWEETSYRUP SupersweetSyrupActivates
	setstatchanger STAT_ATK | DECREASE_1
	trygetintimidatetarget BattleScript_IntimidateActivatesReturn
	jumpifbehindsubstitute BANK_TARGET IntimidateActivatesLoopIncrement
	statbuffchange STAT_TARGET | STAT_NOT_PROTECT_AFFECTED | STAT_BS_PTR IntimidateActivatesLoopIncrement
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 BattleScript_IntimidatePrevented
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable 0x83C4554
	waitmessage DELAY_1SECOND
	jumpifhelditemeffect BANK_TARGET ITEM_EFFECT_ADRENALINE_ORB BattleScript_AdrenalineOrb
	goto IntimidateActivatesLoopIncrement
	
BattleScript_AdrenalineOrb:
	call BattleScript_AdrenalineOrbCall
	goto IntimidateActivatesLoopIncrement

BattleScript_AdrenalineOrbCall:
	setstatchanger STAT_SPD | INCREASE_1
	statbuffchange STAT_TARGET | STAT_NOT_PROTECT_AFFECTED | STAT_BS_PTR, IntimidateActivatesLoopIncrement
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 IntimidateActivatesLoopIncrement
	playanimation BANK_TARGET ANIM_ITEM_USE 0x0
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	setword BATTLE_STRING_LOADER AdrenalineOrbString
	printstring 0x184
	waitmessage DELAY_1SECOND
	removeitem BANK_TARGET
	return

BattleScript_IntimidatePrevented:
	pause DELAY_HALFSECOND
	printfromtable 0x83C4554
	waitmessage DELAY_1SECOND

IntimidateActivatesLoopIncrement:
	jumpifword NOTANDS BATTLE_TYPE BATTLE_DOUBLE BattleScript_IntimidateActivatesReturn
	addbyte TARGET_BANK 0x1
	trygetintimidatetarget BattleScript_IntimidateActivatesReturn
	callasm TryReactiveIntimidatePopUp
	goto BS_IntimidateActivatesLoop

BattleScript_IntimidateActivatesReturn:
	callasm TryRemoveIntimidateAbilityPopUp @;In case the battle scripting bank is changed
	callasm RemoveIntimidateActive
	callasm RemoveSupersweetSyrupActive
	return

SupersweetSyrupActivates:
	setstatchanger STAT_EVASION | DECREASE_1
	trygetintimidatetarget BattleScript_IntimidateActivatesReturn
	jumpifbehindsubstitute BANK_TARGET IntimidateActivatesLoopIncrement
	statbuffchange STAT_TARGET | STAT_NOT_PROTECT_AFFECTED | STAT_BS_PTR IntimidateActivatesLoopIncrement
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 BattleScript_IntimidatePrevented
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable gStatDownStringIds
	waitmessage DELAY_1SECOND
	goto IntimidateActivatesLoopIncrement

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_TraceActivates:
	callasm TransferAbilityPopUpHelperAsTrace
	playanimation BANK_SCRIPTING ANIM_LOAD_ABILITY_POP_UP 0x0
	call BattleScript_AbilityPopUpRevert
	clearspecialstatusbit BANK_SCRIPTING STATUS3_SWITCH_IN_ABILITY_DONE
	call BattleScript_AbilityPopUp
	printstring 0xD0 @;STRINGID_PKMNTRACED
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	tryactivateswitchinability BANK_SCRIPTING
	end3
	

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_Frisk:
	call BattleScript_AbilityPopUp
	printstring 0x184
	waitmessage DELAY_1SECOND
	callasm TryLoadSecondFriskTargetDoubles
	printstring 0x184
	waitmessage DELAY_1SECOND
	
BattleScript_FriskEnd:
	call BattleScript_AbilityPopUpRevert
	end3	

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.global BattleScript_PastelVeil
BattleScript_PastelVeil:
	call BattleScript_AbilityPopUp
	call BattleScript_PastelVeil_TryHeal @;Check User
	callasm SetScriptingBankPartner @;Swap banks
	call BattleScript_PastelVeil_TryHeal @;Check Partner
	callasm SetScriptingBankPartner @;Revert
	call BattleScript_AbilityPopUpRevert
	end3

BattleScript_PastelVeil_TryHeal:
	jumpiffainted BANK_SCRIPTING .LReturn
	jumpifstatus BANK_SCRIPTING STATUS_POISON_ANY BattleScript_PastelVeil_Heal
	return

BattleScript_PastelVeil_Heal:
	cureprimarystatus BANK_SCRIPTING .LReturn
	printstring 0x164 @;STRINGID_PKMNSXCUREDITSYPROBLEM
	waitmessage DELAY_1SECOND
	refreshhpbar BANK_SCRIPTING
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_TerrainFromAbility:
	call BattleScript_AbilityPopUp
	callasm TransferTerrainData
	playanimation2 BANK_SCRIPTING ANIM_ARG_1 0x0
	copyarray BATTLE_STRING_LOADER SEED_HELPER 0x4
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	setbyte SEED_HELPER 0
	callasm SeedRoomServiceLooper
	callasm TryActivateMimicry
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


BattleScript_ImposterActivates:
	callasm TransferAbilityPopUpHelperAsImposter
	playanimation BANK_SCRIPTING ANIM_LOAD_ABILITY_POP_UP 0x0
	playanimation BANK_SCRIPTING ANIM_TRANSFORM_ATTACK 0x0
	printfromtable 0x83C4580
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	clearspecialstatusbit BANK_SCRIPTING STATUS3_SWITCH_IN_ABILITY_DONE
	tryactivateswitchinability BANK_SCRIPTING
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AttackerAbilityStatRaiseEnd3:
	call BattleScript_AttackerAbilityStatRaise
	end3	
	
BattleScript_AttackerAbilityStatRaise:
	statbuffchange STAT_ATTACKER | STAT_BS_PTR BattleScript_End3
	call BattleScript_AbilityPopUp
	setgraphicalstatchangevalues
	playanimation BANK_ATTACKER ANIM_STAT_BUFF ANIM_ARG_1
	printstring 0xD5 @;STRINGID_PKMNSSTATCHANGED
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_EmbodyAspect:
	statbuffchange STAT_ATTACKER | STAT_BS_PTR BattleScript_End3
	call BattleScript_AbilityPopUp
	setgraphicalstatchangevalues
	playanimation BANK_ATTACKER ANIM_STAT_BUFF ANIM_ARG_1
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_NeutralizingGas:
	call BattleScript_AbilityPopUp
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	call BattleScript_AbilityShieldNeutralizingGas
	callasm UndoAbilityEffectsForNeutralizingGas
	call 0x81BD298 @;BattleScript_WeatherFormChanges
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_SwitchInAbilityMsg:
	call BattleScript_AbilityPopUp
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
BattleScript_End3:
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_ActivateAsOne:
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER gText_ActivateAsOne
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	callasm SetAbilityPopUpUnnerve
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER gText_UnnerveActivate
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AbilityCuredStatusEnd3:
	call BattleScript_AbilityCuredStatus
	end3
	
BattleScript_AbilityCuredStatus:
	call BattleScript_AbilityPopUp
	printstring 0x164 @;STRINGID_PKMNSXCUREDITSYPROBLEM
	waitmessage DELAY_1SECOND
	refreshhpbar BANK_SCRIPTING
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_StartedSchoolingEnd3:
	call BattleScript_StartedSchoolingRet
	end3

BattleScript_StoppedSchoolingEnd3:
	call BattleScript_StartedSchoolingRet
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_ShieldsDownToCoreEnd3:
	call BattleScript_ShieldsDownToCoreRet
	end3
	
BattleScript_ShieldsDownToMeteorEnd3:
	call BattleScript_ShieldsDownToMeteorRet
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_TransformedEnd2:
	call BattleScript_AbilityTransformed
	end2

BattleScript_TransformedEnd3:
	call BattleScript_AbilityTransformed
	end3

BattleScript_AbilityTransformed:
	call BattleScript_AbilityPopUp
	playanimation BANK_SCRIPTING ANIM_TRANSFORM 0x0
	setword BATTLE_STRING_LOADER TransformedString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_EmergencyExit:
	jumpifbattletype BATTLE_TRAINER EmergencyExitSwitchBS

EmergencyExitFleeBS:
	getifcantrunfrombattle BANK_SCRIPTING
	jumpifbyte EQUALS BATTLE_COMMUNICATION 0x1 EmergencyExitReturn
	call BattleScript_AbilityPopUp
	copyarray USER_BANK BATTLE_SCRIPTING_BANK 0x1
	printstring 0xA0 @;STRINGID_PKMNFLEDFROMBATTLE
	waitmessage DELAY_1SECOND
	setbyte BATTLE_OUTCOME 0x5 @;Teleported
	end

EmergencyExitSwitchBS:
	jumpifcannotswitch BANK_SWITCHING | ATK4F_DONT_CHECK_STATUSES EmergencyExitReturn
	call BattleScript_AbilityPopUp
	playanimation BANK_SWITCHING ANIM_CALL_BACK_POKEMON 0x0
	callasm MakeSwitchingBankInvisible
	call BattleScript_AbilityPopUpRevert
	openpartyscreen BANK_SWITCHING EmergencyExitReturn
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
	callasm WipeSwitchInEffectsState @;In case Emergency Exit activated because of hazards damage
	switchineffects BANK_SWITCHING
	callasm SetNoMoreMovingThisTurnSwitchingBank @;New Pokemon can't attack after being switched in

EmergencyExitReturn:
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_RainDishActivates:
	call BattleScript_AbilityPopUp
	playanimation BANK_SCRIPTING ANIM_HEALING_SPARKLES 0x0
	orword HIT_MARKER HITMARKER_IGNORE_SUBSTITUTE
	graphicalhpupdate BANK_SCRIPTING
	datahpupdate BANK_SCRIPTING
	printstring 0x133
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_DrySkinDamage:
BattleScript_SolarPowerDamage:
	call BattleScript_AbilityPopUp
	orword HIT_MARKER HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_NON_ATTACK_DMG
	graphicalhpupdate BANK_SCRIPTING
	datahpupdate BANK_SCRIPTING
	setword BATTLE_STRING_LOADER HurtByAbilityString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	faintpokemon BANK_SCRIPTING 0x0 0x0
	end3
	
@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_Healer:
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER, gText_HealerCuredStatusProblem
	printstring 0x184
	waitmessage DELAY_1SECOND
	refreshhpbar BANK_EFFECT
	call BattleScript_AbilityPopUpRevert
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoodySingleStat:
	call BattleScript_AbilityPopUp
MoodySkipString:	
	statbuffchange STAT_ATTACKER | STAT_NOT_PROTECT_AFFECTED | STAT_CERTAIN MoodyStatRaiseEnd
	setgraphicalstatchangevalues
	playanimation BANK_ATTACKER ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable 0x83C4548
	waitmessage DELAY_1SECOND
MoodyStatRaiseEnd:
	call BattleScript_AbilityPopUpRevert
	end3

BattleScript_MoodyRegular:
	call BattleScript_AbilityPopUp
	statbuffchange STAT_ATTACKER | STAT_NOT_PROTECT_AFFECTED | STAT_CERTAIN MoodyRegularP2
	setgraphicalstatchangevalues
	playanimation BANK_ATTACKER ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable 0x83C4548
	waitmessage DELAY_1SECOND
	
MoodyRegularP2:
	callasm LoadMoodyStatToLower
	goto MoodySkipString

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BadDreams:
	call BattleScript_AbilityPopUp
	call BattleScript_BadDreams_TryHurt
	callasm SetTargetFoePartner
	call BattleScript_BadDreams_TryHurt
	callasm TryHideActiveAbilityPopUps
	end3

BattleScript_BadDreams_TryHurt:
	jumpifstatus BANK_TARGET STATUS_SLEEP BattleScript_BadDreams_Hurt
	jumpifability BANK_TARGET ABILITY_COMATOSE BattleScript_BadDreams_Hurt
	return

BattleScript_BadDreams_Hurt:
	jumpiffainted BANK_TARGET .LReturn
	jumpifability BANK_TARGET ABILITY_MAGICGUARD .LReturn
	setdamagetobankhealthfraction BANK_TARGET 8 0x0 @;1/8 of base HP
	orword HIT_MARKER HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_NON_ATTACK_DMG
	graphicalhpupdate BANK_TARGET
	datahpupdate BANK_TARGET
	setword BATTLE_STRING_LOADER BadDreamsHurtString
	printstring 0x184
	waitmessage DELAY_1SECOND
	faintpokemon BANK_TARGET 0x0 0x0
.LReturn:
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_Harvest:
	recycleitem HarvestBSEnd
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER HarvestString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	callasm HarvestActivateBerry

HarvestBSEnd:
	setbyte FORM_COUNTER 0x0
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_CudChewActivates:
	callasm CudChewEat
	callasm TryRemoveCudChewAbilityPopUp
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_Pickup:
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER PickupString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_BallFetch:
	call BattleScript_AbilityPopUp
	playanimation BANK_SCRIPTING ANIM_SNATCH_GRAB_STAT_BOOST 0x0
	setword BATTLE_STRING_LOADER gText_BallFetchRetrievedItem
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_EmergencyExitEnd3:
	call BattleScript_EmergencyExit
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AttackerCantUseMove:
	attackstringnoprotean
	ppreduce
	pause DELAY_HALFSECOND
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER CantUseMoveString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	orword HIT_MARKER, HITMARKER_UNABLE_TO_USE_MOVE
	goto BS_MOVE_END

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_FlashFireBoost_PPLoss:
	ppreduce
BattleScript_FlashFireBoost:
	call BattleScript_AttackstringBackupScriptingBank
	pause DELAY_HALFSECOND
	call BattleScript_AbilityPopUp
	callasm ApplyFlashFireBoost
	printfromtable gFlashFireStringIds
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	orbyte OUTCOME OUTCOME_NOT_AFFECTED
	goto BS_MOVE_END

.global BattleScript_AttackstringBackupScriptingBank
BattleScript_AttackstringBackupScriptingBank:
	copybyte FORM_COUNTER, BATTLE_SCRIPTING_BANK @;Backup in case of Protean
	attackstring
	copybyte BATTLE_SCRIPTING_BANK, FORM_COUNTER
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveHPDrain_PPLoss:
	ppreduce
BattleScript_MoveHPDrain:
	call BattleScript_AttackstringBackupScriptingBank
	pause DELAY_HALFSECOND
	call BattleScript_AbilityPopUp
	playanimation BANK_TARGET ANIM_HEALING_SPARKLES 0x0
	orword HIT_MARKER HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate BANK_TARGET
	datahpupdate BANK_TARGET
	printstring 0x4B @;STRINGID_PKMNREGAINEDHEALTH
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	orbyte OUTCOME OUTCOME_NOT_AFFECTED
	goto BS_MOVE_END

BattleScript_MonMadeMoveUseless_PPLoss:
	ppreduce
BattleScript_MonMadeMoveUseless:
	call BattleScript_AttackstringBackupScriptingBank
	pause DELAY_HALFSECOND
	call BattleScript_AbilityPopUp
	printstring 0x1B @;STRINGID_ITDOESNTAFFECT
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	orbyte OUTCOME OUTCOME_NOT_AFFECTED
	goto BS_MOVE_END

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MoveStatDrain_PPLoss:
	ppreduce
BattleScript_MoveStatDrain:
	orbyte OUTCOME OUTCOME_NOT_AFFECTED
	call BattleScript_AttackstringBackupScriptingBank
	pause DELAY_HALFSECOND
	call BattleScript_TargetAbilityStatRaise
	goto BS_MOVE_END

BattleScript_TargetAbilityStatRaise:
	call BattleScript_AbilityPopUp
	statbuffchange BANK_TARGET BattleScript_TargetAbilityStatRaiseReturn
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 BattleScript_TargetAbilityStatRaiseReturn
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printstring 0xD8 @;STRINGID_PKMNSSTATCHANGED4
	waitmessage DELAY_1SECOND
	
BattleScript_TargetAbilityStatRaiseReturn:
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AbilityApplySecondaryEffect:
	waitstateatk
	copybyte FORM_COUNTER BATTLE_SCRIPTING_BANK
	call BattleScript_AbilityPopUp
	waitstateatk
	seteffectsecondary
	copybyte BATTLE_SCRIPTING_BANK FORM_COUNTER
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_RoughSkinActivates:
	call BattleScript_AbilityPopUp
	orword HIT_MARKER, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_NON_ATTACK_DMG
	healthbarupdate BANK_ATTACKER
	datahpupdate BANK_ATTACKER
	printstring 0xCF @;STRINGID_PKMNHURTSWITH
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	faintpokemon BANK_ATTACKER 0x0 0x0
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.global DestinyKnotString
BattleScript_CuteCharmActivates:
	call BattleScript_AbilityPopUp
	status2animation BANK_ATTACKER STATUS2_INLOVE
	printstring 0x136
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	jumpifsecondarystatus BANK_TARGET STATUS2_INLOVE CuteCharmActivatesReturn
	jumpifability BANK_TARGET ABILITY_OBLIVIOUS CuteCharmActivatesReturn
	jumpifabilitypresenttargetfield ABILITY_AROMAVEIL CuteCharmActivatesReturn
	jumpifhelditemeffect BANK_ATTACKER ITEM_EFFECT_DESTINY_KNOT CuteCharmDestinyKnot

CuteCharmActivatesReturn:
	return

CuteCharmDestinyKnot:
	tryinfatuatebank BANK_TARGET CuteCharmActivatesReturn
	playanimation BANK_ATTACKER ANIM_ITEM_USE 0x0
	status2animation BANK_TARGET STATUS2_INLOVE
	copyarray BATTLE_SCRIPTING_BANK TARGET_BANK 0x1
	setword BATTLE_STRING_LOADER DestinyKnotString
	printstring 0x184
	waitmessage DELAY_1SECOND
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_WeakArmorActivates:
	jumpifstat BANK_TARGET GREATERTHAN STAT_DEF STAT_MIN WeakArmorModDef
	jumpifstat BANK_TARGET EQUALS STAT_SPD STAT_MAX WeakArmorReturn

WeakArmorModDef:
	call BattleScript_AbilityPopUp
	jumpifstat BANK_TARGET EQUALS STAT_DEF STAT_MIN WeakArmorModSpd
	orword HIT_MARKER, HITMARKER_IGNORE_SUBSTITUTE @;Ignored Sheer Force
	setstatchanger STAT_DEF | DECREASE_1
	statbuffchange BANK_TARGET | STAT_CERTAIN WeakArmorModSpd
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 WeakArmorModSpd
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable gStatDownStringIds
	waitmessage DELAY_1SECOND
	
WeakArmorModSpd:
	jumpifstat BANK_TARGET EQUALS STAT_SPD STAT_MAX WeakArmorRevertPopUp
	setstatchanger STAT_SPD | INCREASE_2
	statbuffchange BANK_TARGET | STAT_CERTAIN WeakArmorRevertPopUp
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 WeakArmorRevertPopUp
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND
	
WeakArmorRevertPopUp:
	bicword HIT_MARKER, HITMARKER_IGNORE_SUBSTITUTE
	call BattleScript_AbilityPopUpRevert

WeakArmorReturn:
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_CursedBodyActivates:
	disablelastusedattack BANK_ATTACKER CursedBodyReturn
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER CursedBodyString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	
CursedBodyReturn:
	return
	
@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MummyActivates:
	call BattleScript_AbilityPopUp
	pause DELAY_HALFSECOND
	jumpifhelditemeffect BANK_ATTACKER ITEM_EFFECT_ABILITY_SHIELD MummyAbilityShield
	call BattleScript_AbilityPopUpRevert
	copyarray BATTLE_SCRIPTING_BANK USER_BANK 0x1
	call BattleScript_AbilityPopUp
	pause DELAY_HALFSECOND
	call BattleScript_AbilityPopUpRevert
	setability BANK_ATTACKER ABILITY_MUMMY
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER MummyString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

MummyAbilityShield:
	call BattleScript_AttackerAbilityShield
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_LingeringAromaActivates:
	call BattleScript_AbilityPopUp
	pause DELAY_HALFSECOND
	jumpifhelditemeffect BANK_ATTACKER ITEM_EFFECT_ABILITY_SHIELD MummyAbilityShield
	call BattleScript_AbilityPopUpRevert
	copyarray BATTLE_SCRIPTING_BANK USER_BANK 0x1
	call BattleScript_AbilityPopUp
	pause DELAY_HALFSECOND
	call BattleScript_AbilityPopUpRevert
	setability BANK_ATTACKER ABILITY_LINGERINGAROMA
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER gText_LingeringAromaActivate
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_WanderingSpiritActivates:
	swapattackerwithtarget
	abilityswap BattleScript_WanderingSpiritActivatesReturn
	callasm TransferAbilityPopUpHelperAsWanderingSpirit
	playanimation BANK_SCRIPTING ANIM_LOAD_ABILITY_POP_UP 0x0
	call BattleScript_AbilityPopUpRevert

	call BattleScript_AbilityPopUp
	pause DELAY_HALFSECOND
	call BattleScript_AbilityPopUpRevert
	copyarray BATTLE_SCRIPTING_BANK TARGET_BANK 0x1
	call BattleScript_AbilityPopUp
	pause DELAY_HALFSECOND
	call BattleScript_AbilityPopUpRevert
	printstring 0xB8
	waitmessage DELAY_1SECOND
	tryactivateswitchinability BANK_ATTACKER
	swapattackerwithtarget
	callasm RestoreOriginalAttackerAndTarget
	swapattackerwithtarget
	tryactivateswitchinability BANK_TARGET
	swapattackerwithtarget
	callasm RestoreOriginalAttackerAndTarget
	return

BattleScript_WanderingSpiritActivatesReturn:
	swapattackerwithtarget
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
BattleScript_GooeyActivates:
	call BattleScript_AbilityPopUp
	swapattackerwithtarget @;Allows for abilities like Defiant and Mirror Armor to have their proper effect
	setbyte STAT_ANIM_PLAYED 0x0
	playstatchangeanimation BANK_TARGET STAT_ANIM_SPD STAT_ANIM_DOWN
	setstatchanger STAT_SPD | DECREASE_1
	statbuffchange STAT_TARGET | STAT_BS_PTR GooeyReturn
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 GooeyReturn
	printfromtable 0x83C4554
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert

GooeyReturn:
	swapattackerwithtarget
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_IllusionBroken:
	callasm TransferIllusionBroken
	call BattleScript_AbilityPopUp
	reloadhealthbar BANK_TARGET
	playanimation BANK_TARGET ANIM_TRANSFORM 0x0
	setword BATTLE_STRING_LOADER IllusionWoreOffString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return
	
BattleScript_IllusionBrokenFaint:
	callasm TransferIllusionBroken
	call BattleScript_AbilityPopUp
	reloadhealthbar BANK_SCRIPTING
	callasm CycleScriptingBankHealthBetween0And1
	playanimation BANK_SCRIPTING ANIM_TRANSFORM 0x0
	callasm CycleScriptingBankHealthBetween0And1
	setword BATTLE_STRING_LOADER IllusionWoreOffString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AngerPointActivates:
	call BattleScript_AbilityPopUp
	setstatchanger STAT_ATK | INCREASE_1
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	setword BATTLE_STRING_LOADER AngerPointString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_SynchronizeActivates:
	pause 0x10
	call BattleScript_AbilityPopUp
	jumpifstatus BANK_TARGET STATUS_ANY SynchronizeNoEffect
	jumpifsideaffecting BANK_TARGET SIDE_SAFEGUARD SynchronizeSafeguard
	seteffectprimary
	jumpifstatus BANK_TARGET STATUS_ANY SynchronizeReturn

SynchronizeNoEffect:
	setword BATTLE_STRING_LOADER SynchronizeNoEffectString
	printstring 0x184
	waitmessage DELAY_1SECOND
	goto SynchronizeReturn
	
SynchronizeSafeguard:
	printstring 0x50
	waitmessage DELAY_1SECOND

SynchronizeReturn:
	call BattleScript_AbilityPopUpRevert
	callasm RestoreBanksFromSynchronize
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AngerShellActivates:
	jumpifstat BANK_TARGET LESSTHAN STAT_ATK STAT_MAX AngerShellRaiseAtk
	jumpifstat BANK_TARGET LESSTHAN STAT_SPATK STAT_MAX AngerShellRaiseAtk
	jumpifstat BANK_TARGET LESSTHAN STAT_SPD STAT_MAX AngerShellRaiseAtk
	jumpifstat BANK_TARGET GREATERTHAN STAT_DEF STAT_MIN AngerShellRaiseAtk
	jumpifstat BANK_TARGET EQUALS STAT_SPDEF STAT_MIN AngerShellReturn

AngerShellRaiseAtk:
	call BattleScript_AbilityPopUp
	setstatchanger STAT_ATK | INCREASE_1
	statbuffchange BANK_TARGET | STAT_CERTAIN AngerShellRaiseSpAtk
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 AngerShellRaiseSpAtk
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND

AngerShellRaiseSpAtk:
	setstatchanger STAT_SPATK | INCREASE_1
	statbuffchange BANK_TARGET | STAT_CERTAIN AngerShellRaiseSpd
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 AngerShellRaiseSpd
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND

AngerShellRaiseSpd:
	setstatchanger STAT_SPD | INCREASE_1
	statbuffchange BANK_TARGET | STAT_CERTAIN AngerShellLowerDef
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 AngerShellLowerDef
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND

AngerShellLowerDef:
	orword HIT_MARKER, HITMARKER_IGNORE_SUBSTITUTE
	setstatchanger STAT_DEF | DECREASE_1
	statbuffchange BANK_TARGET | STAT_BS_PTR | STAT_CERTAIN AngerShellLowerSpDef
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 AngerShellLowerSpDef
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND

AngerShellLowerSpDef:
	setstatchanger STAT_SPDEF | DECREASE_1
	statbuffchange BANK_TARGET | STAT_BS_PTR | STAT_CERTAIN AngerShellRevertPopUp
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 AngerShellRevertPopUp
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND
	
AngerShellRevertPopUp:
	bicword HIT_MARKER, HITMARKER_IGNORE_SUBSTITUTE
	call BattleScript_AbilityPopUpRevert

AngerShellReturn:
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_ElectromorphosisActivates:
	call BattleScript_AbilityPopUp
	setcharge BANK_SCRIPTING
	setword BATTLE_STRING_LOADER gText_ElectromorphosisActivates
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_ToxicDebrisActivates:
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER gText_ToxicSpikesLayAttacker
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_HospitalityActivates:
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER gText_HospitalityRestoration
	printstring 0x184
	waitmessage DELAY_1SECOND
	orword HIT_MARKER, HITMARKER_IGNORE_SUBSTITUTE
	healthbarupdate BANK_TARGET
	datahpupdate BANK_TARGET
	call BattleScript_AbilityPopUpRevert
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_CommanderActivates:
	call BattleScript_AbilityPopUp
	callasm MakeScriptingBankInvisible
	setword BATTLE_STRING_LOADER gText_CommanderActivate
	printstring 0x184
	waitmessage DELAY_1SECOND

BattleScript_CommanderAtk:
	setbyte STAT_ANIM_PLAYED 0x0
	playstatchangeanimation BANK_ATTACKER, STAT_ANIM_ATK | STAT_ANIM_DEF | STAT_ANIM_SPD | STAT_ANIM_SPATK | STAT_ANIM_SPDEF, STAT_ANIM_UP | STAT_ANIM_IGNORE_ABILITIES | STAT_ANIM_BY_TWO
	setstatchanger STAT_ATK | INCREASE_2
	statbuffchange STAT_ATTACKER | STAT_BS_PTR | STAT_CERTAIN BattleScript_CommanderSpAtk
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 BattleScript_CommanderSpAtk
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND

BattleScript_CommanderSpAtk:
	setstatchanger STAT_SPATK | INCREASE_2
	statbuffchange STAT_ATTACKER | STAT_BS_PTR | STAT_CERTAIN BattleScript_CommanderSpd
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 BattleScript_CommanderSpd
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND

BattleScript_CommanderSpd:
	setstatchanger STAT_SPD | INCREASE_2
	statbuffchange STAT_ATTACKER | STAT_BS_PTR | STAT_CERTAIN BattleScript_CommanderDef
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 BattleScript_CommanderDef
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND

BattleScript_CommanderDef:
	setstatchanger STAT_DEF | INCREASE_2
	statbuffchange STAT_ATTACKER | STAT_BS_PTR | STAT_CERTAIN BattleScript_CommanderSpDef
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 BattleScript_CommanderSpDef
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND

BattleScript_CommanderSpDef:
	setstatchanger STAT_SPDEF | INCREASE_2
	statbuffchange STAT_ATTACKER | STAT_BS_PTR | STAT_CERTAIN BattleScript_CommanderEnd
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 BattleScript_CommanderEnd
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND

BattleScript_CommanderEnd:
	call BattleScript_AbilityPopUpRevert
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AbilityChangedType: @;For Protean
	pause DELAY_HALFSECOND
	callasm DoProteanTypeChange
	call BattleScript_AbilityPopUp
	printstring 0x49 @;STRINGID_PKMNCHANGEDTYPE - uses ATTACKER
	waitmessage DELAY_HALFSECOND
	call BattleScript_AbilityPopUpRevert
	return
	
BattleScript_AbilityChangedTypeContact:
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER gText_AbilityChangedType
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_DisguiseTookDamage:
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER MimikyuDisguisedTookDamageString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return
	
@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_DisguiseTransform:
	playanimation BANK_TARGET ANIM_TRANSFORM 0x0
	orword HIT_MARKER, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_NON_ATTACK_DMG
	graphicalhpupdate BANK_SCRIPTING
	datahpupdate BANK_SCRIPTING
	bicword HIT_MARKER, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_NON_ATTACK_DMG
	setword BATTLE_STRING_LOADER DisguiseBustedString
	printstring 0x184
	waitmessage DELAY_1SECOND
	return
	
@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_IceFaceTookDamage:
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER gText_IceFaceTookDamage
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_IceFaceTransform:
	playanimation BANK_TARGET ANIM_TRANSFORM 0x0
	setword BATTLE_STRING_LOADER gText_IceFaceBusted
	printstring 0x184
	waitmessage DELAY_1SECOND
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_EnduredSturdy:
	pause 0x10
	call BattleScript_AbilityPopUp
	printstring 0x99 @;STRINGID_PKMNENDUREDHIT
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_Receiver:
	playanimation BANK_SCRIPTING ANIM_LOAD_ABILITY_POP_UP 0x0
	pause DELAY_HALFSECOND
	call BattleScript_AbilityPopUpRevert
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER ReceiverString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	clearspecialstatusbit BANK_SCRIPTING STATUS3_SWITCH_IN_ABILITY_DONE
	tryactivateswitchinability BANK_SCRIPTING
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_Symbiosis:
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER SymbiosisString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_DefiantCompetitive:
	statbuffchange STAT_TARGET | STAT_BS_PTR DefiantReturn
	
BattleScript_DefiantCompetitiveCall:
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 DefiantReturn
	pause DELAY_HALFSECOND
	setbyte STAT_ANIM_PLAYED 0x0
	callasm TryRemoveIntimidateAbilityPopUp
	callasm TryHideActiveAbilityPopUps @;Basically Mirror Armor
	copybyte BATTLE_SCRIPTING_BANK TARGET_BANK
	call BattleScript_AbilityPopUp
	setgraphicalstatchangevalues
	playanimation BANK_SCRIPTING ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable 0x83C4548
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert

DefiantReturn:
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_SoulHeart:
	call BattleScript_AbilityPopUp
	playanimation BANK_SCRIPTING ANIM_STAT_BUFF ANIM_ARG_1
	setword BATTLE_STRING_LOADER AbilityRaisedStatString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AbilityNoStatLoss:
	pause 0x10
	callasm TryRemoveIntimidateAbilityPopUp
	callasm TryHideActiveAbilityPopUps @;Basically Mirror Armor
	copybyte BATTLE_SCRIPTING_BANK BATTLE_COMMUNICATION
	call BattleScript_AbilityPopUp
	printstring 0xCE
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	setbyte MULTISTRING_CHOOSER 0x4
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_PartnerAbilityNoStatLoss:
	pause 0x10
	callasm TryRemoveIntimidateAbilityPopUp
	callasm TryHideActiveAbilityPopUps @;Basically Mirror Armor
	copybyte BATTLE_SCRIPTING_BANK BATTLE_COMMUNICATION
	callasm SetBattleScriptingBankForPartnerAbilityNoStatLoss
	call BattleScript_AbilityPopUp
	copybyte BATTLE_SCRIPTING_BANK BATTLE_COMMUNICATION
	printstring 0xCE
	waitmessage DELAY_1SECOND
	callasm SetBattleScriptingBankForPartnerAbilityNoStatLoss
	call BattleScript_AbilityPopUpRevert
	copybyte BATTLE_SCRIPTING_BANK BATTLE_COMMUNICATION
	setbyte MULTISTRING_CHOOSER 0x4
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AbilityNoSpecificStatLoss:
	pause 0x10
	copybyte FORM_COUNTER BATTLE_SCRIPTING_BANK
	callasm TryRemoveIntimidateAbilityPopUp
	callasm TryHideActiveAbilityPopUps @;Basically Mirror Armor
	copybyte BATTLE_SCRIPTING_BANK FORM_COUNTER
	call BattleScript_AbilityPopUp
	
BattleScript_AbilityNoSpecificStatLossPrintMessage:
	printstring 0x135
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	setbyte MULTISTRING_CHOOSER 0x3
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.global BattleScript_MirrorArmorReflectsStatLoss
BattleScript_MirrorArmorReflectsStatLoss:
	copybyte FORM_COUNTER BATTLE_SCRIPTING_BANK
	callasm TryHideActiveAbilityPopUps @;Basically hide Gooey
	copybyte BATTLE_SCRIPTING_BANK FORM_COUNTER
	call BattleScript_AbilityPopUp
	jumpifbehindsubstitute BANK_ATTACKER BattleScript_AbilityNoSpecificStatLossPrintMessage

BattleScript_MirrorArmorReflectsStatLoss_StatChange:
	statbuffchange STAT_ATTACKER | STAT_NOT_PROTECT_AFFECTED | STAT_BS_PTR BattleScript_MirrorArmorReflectsStatLossReturn
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 BattleScript_MirrorArmorReflectsStatLossAttackerStatCantGoLower
	setgraphicalstatchangevalues
	playanimation BANK_ATTACKER ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable 0x83C4554
	waitmessage DELAY_1SECOND

BattleScript_MirrorArmorReflectsStatLossReturn:
	call BattleScript_AbilityPopUpRevert
	return

BattleScript_MirrorArmorReflectsStatLossAttackerStatCantGoLower:
	printfromtable 0x83C4554
	waitmessage DELAY_1SECOND
	setbyte MULTISTRING_CHOOSER 0x3
	goto BattleScript_MirrorArmorReflectsStatLossReturn

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.global BattleScript_MirrorArmorStickyWeb
BattleScript_MirrorArmorStickyWeb:
	copybyte BATTLE_SCRIPTING_BANK TARGET_BANK
	call BattleScript_AbilityPopUp
	callasm ChooseTargetForMirrorArmorStickyWeb
	jumpifarrayequal TARGET_BANK USER_BANK 1 BattleScript_AbilityNoSpecificStatLossPrintMessage @;No target on other side of field
	setstatchanger STAT_SPD | DECREASE_1
	goto BattleScript_MirrorArmorReflectsStatLoss_StatChange

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MirrorArmorReflectsIntimidate:
	pause 0x10
	copybyte FORM_COUNTER BATTLE_SCRIPTING_BANK
	callasm TryRemoveIntimidateAbilityPopUp
	copybyte BATTLE_SCRIPTING_BANK FORM_COUNTER
	call BattleScript_AbilityPopUp
	copybyte USER_BANK BATTLE_SCRIPTING_BANK
	callasm LoadIntimidateBankIntoTarget
	swapattackerwithtarget
	bicword HIT_MARKER HITMARKER_SWAP_ATTACKER_TARGET
	jumpifbehindsubstitute BANK_ATTACKER BattleScript_AbilityNoSpecificStatLossPrintMessage
	swapattackerwithtarget
	bicword HIT_MARKER HITMARKER_SWAP_ATTACKER_TARGET
	statbuffchange STAT_TARGET | STAT_NOT_PROTECT_AFFECTED | STAT_BS_PTR BattleScript_MirrorArmorReflectsIntimidateReturn
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 BattleScript_MirrorArmorAttackerStatCantGoLower
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable 0x83C4554
	waitmessage DELAY_1SECOND
	jumpifhelditemeffect BANK_TARGET ITEM_EFFECT_ADRENALINE_ORB BattleScript_MirrorArmorAdrenalineOrb

BattleScript_MirrorArmorReflectsIntimidateReturn:
	swapattackerwithtarget @;Places the initial target in the target bank
	bicword HIT_MARKER HITMARKER_SWAP_ATTACKER_TARGET
	copybyte BATTLE_SCRIPTING_BANK FORM_COUNTER
	call BattleScript_AbilityPopUpRevert
	return
	
BattleScript_MirrorArmorAdrenalineOrb:
	call BattleScript_AdrenalineOrbCall
	goto BattleScript_MirrorArmorReflectsIntimidateReturn

BattleScript_MirrorArmorAttackerStatCantGoLower:
	printfromtable 0x83C4554
	waitmessage DELAY_1SECOND
	setbyte MULTISTRING_CHOOSER 0x3
	goto BattleScript_MirrorArmorReflectsIntimidateReturn

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_CastformChange:
	call BattleScript_CastformChangeRet
	end3

BattleScript_CastformChangeRet:
	jumpifability BANK_SCRIPTING ABILITY_FORECAST DoCastformTransform
	goto CastformChangeSkipAbilityPopUp @;Reverting back b/c no longer has ability
	
DoCastformTransform:
	call BattleScript_AbilityPopUp
	
CastformChangeSkipAbilityPopUp:
	castformtransform
	waitstateatk
	printstring 0x13A @;STRINGID_PKMNTRANSFORMED
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_CottonDownActivates:
	call BattleScript_AbilityPopUp
	setbyte TARGET_BANK 0x0

BS_CottonDownActivatesLoop:
	setstatchanger STAT_SPD | DECREASE_1
	trygetcottondowntarget BattleScript_CottonDownActivatesReturn
	statbuffchange STAT_TARGET | STAT_NOT_PROTECT_AFFECTED | STAT_BS_PTR CottonDownActivatesLoopIncrement
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 BattleScript_CottonDownPrevented
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable gStatDownStringIds
	waitmessage DELAY_1SECOND
	goto CottonDownActivatesLoopIncrement

BattleScript_CottonDownPrevented:
	pause DELAY_HALFSECOND
	printfromtable gStatDownStringIds
	waitmessage DELAY_1SECOND

CottonDownActivatesLoopIncrement:
	jumpifword NOTANDS BATTLE_TYPE BATTLE_DOUBLE BattleScript_CottonDownActivatesReturn
	addbyte TARGET_BANK 0x1
	trygetcottondowntarget BattleScript_CottonDownActivatesReturn
	callasm TryReactiveIntimidatePopUp
	goto BS_CottonDownActivatesLoop

BattleScript_CottonDownActivatesReturn:
	callasm TryRemoveIntimidateAbilityPopUp @;In case the battle scripting bank is changed
	callasm RemoveIntimidateActive
	callasm RemoveCottonDownActive
	callasm RestoreOriginalAttackerAndTarget
	callasm RestoreOriginalTargetResultFlags
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_PerishBody:
	callasm ActivatePerishBody
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER gText_PerishBodyActivated
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	jumpiffainted BANK_ATTACKER BattleScript_PerishBodyReturn

.global BattleScript_PerishBodyReturn
BattleScript_PerishBodyReturn:
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_SturdyPreventsOHKO:
	orword OUTCOME, OUTCOME_NOT_AFFECTED
	attackstring
	ppreduce
	pause 0x10
	copybyte BATTLE_SCRIPTING_BANK, TARGET_BANK
	call BattleScript_AbilityPopUp
	printstring 0x1B @;STRINGID_ITDOESNTAFFECT
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	goto BS_MOVE_END

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_StickyHoldActivates:
	pause 0x10
	call BattleScript_AbilityPopUp
	printstring 0x1B @;STRINGID_ITDOESNTAFFECT
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	goto BS_MOVE_END

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_DampStopsExplosion:
	attackstringnoprotean
	ppreduce
	pause DELAY_HALFSECOND
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER CantUseMoveString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	goto BS_MOVE_END
	
@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_TookAttack:
	call BattleScript_AttackstringBackupScriptingBank
	pause 0x10
	call BattleScript_AbilityPopUp
	printstring 0x14E @;STRINGID_PKMNSXTOOKATTACK
	waitmessage DELAY_HALFSECOND
	call BattleScript_AbilityPopUpRevert
	orword HIT_MARKER HITMARKER_ATTACKSTRING_PRINTED
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AvoidedMoveWithAbility:
	call BattleScript_AbilityPopUp
	printstring 0x1B @;STRINGID_ITDOESNTAFFECT
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_MimicryTransformed:
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER gText_AbilityChangedType
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

BattleScript_MimicryReturnedToNormal:
	call BattleScript_AbilityPopUp
	setword BATTLE_STRING_LOADER gText_MimicryReturnedToNormal
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_CramorantCatchPrey:
	call BattleScript_AbilityPopUp
	playanimation BANK_ATTACKER ANIM_TRANSFORM 0x0
	call BattleScript_AbilityPopUpRevert
	return

BattleScript_CramorantSpitPrey:
	call BattleScript_AbilityPopUp
	jumpiffainted BANK_TARGET BattleScript_CramorantSpitPrey_Fainted
	playanimation BANK_TARGET ANIM_TRANSFORM 0x0
BattleScript_CramorantSpitPrey_PostTransform:
	call BattleScript_AbilityPopUpRevert
	jumpifability BANK_ATTACKER ABILITY_MAGICGUARD BattleScript_CramorantSpitPrey_SetEffect
	orword HIT_MARKER, HITMARKER_IGNORE_SUBSTITUTE | HITMARKER_NON_ATTACK_DMG
	healthbarupdate BANK_ATTACKER
	datahpupdate BANK_ATTACKER
	printstring 0xCF @;STRINGID_PKMNHURTSWITH
	waitmessage DELAY_1SECOND
	faintpokemon BANK_ATTACKER 0x0 0x0
	jumpiffainted BANK_ATTACKER BattleScript_CramorantSpitPrey_Return

BattleScript_CramorantSpitPrey_SetEffect:
	swapattackerwithtarget
	seteffectprimary
	swapattackerwithtarget
BattleScript_CramorantSpitPrey_Return:
	return

BattleScript_CramorantSpitPrey_Fainted:
	callasm CycleScriptingBankHealthBetween0And1
	playanimation BANK_TARGET ANIM_TRANSFORM 0x0
	callasm CycleScriptingBankHealthBetween0And1
	goto BattleScript_CramorantSpitPrey_PostTransform

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_AbilityPopUp:
	callasm TransferAbilityPopUpHelper
	recordlastability BANK_SCRIPTING
	playanimation BANK_SCRIPTING ANIM_LOAD_ABILITY_POP_UP 0x0
	return

BattleScript_AbilityPopUpRevert:
	playanimation BANK_SCRIPTING ANIM_REMOVE_ABILITY_POP_UP 0x0
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_GuardDogActivates:
	pause 0x10
	copybyte FORM_COUNTER BATTLE_SCRIPTING_BANK
	callasm TryRemoveIntimidateAbilityPopUp
	callasm TryHideActiveAbilityPopUps
	copybyte BATTLE_SCRIPTING_BANK FORM_COUNTER
	call BattleScript_AbilityPopUp

BattleScript_GuardDogRaiseAtk:
	setstatchanger STAT_ATK | INCREASE_1
	statbuffchange BANK_TARGET | STAT_CERTAIN BattleScript_GuardDogRevertPopUp
	jumpifbyte EQUALS MULTISTRING_CHOOSER 0x2 BattleScript_GuardDogRevertPopUp
	setgraphicalstatchangevalues
	playanimation BANK_TARGET ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND

BattleScript_GuardDogRevertPopUp:
	call BattleScript_AbilityPopUpRevert
	jumpifhelditemeffect BANK_TARGET ITEM_EFFECT_ADRENALINE_ORB BattleScript_AdrenalineOrb
	goto IntimidateActivatesLoopIncrement

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_ParadoxAbilityActivates:
	call BattleScript_ParadoxAbilityActivatesRet
	end3

BattleScript_ParadoxAbilityActivatesRet:
	call BattleScript_AbilityPopUp
	printstring 0x184
	waitmessage DELAY_1SECOND
	setword BATTLE_STRING_LOADER gText_ParadoxStatRaise
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	return

BattleScript_ParadoxAbilityEnd:
 	call BattleScript_ParadoxAbilityEndRet
	end3

BattleScript_ParadoxAbilityEndRet:
	setword BATTLE_STRING_LOADER gText_ParadoxAbilityEnd
	printstring 0x184
	waitmessage DELAY_1SECOND
	callasm TryActivateBoosterEnergy
	return

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_TeraShiftActivates:
	call BattleScript_AbilityPopUp
	playanimation BANK_SCRIPTING ANIM_TRANSFORM 0x0
	reloadhealthbar BANK_SCRIPTING
	setword BATTLE_STRING_LOADER TransformedString
	printstring 0x184
	waitmessage DELAY_1SECOND
	call BattleScript_AbilityPopUpRevert
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

BattleScript_OpportunistCopyStatChange:
	call BattleScript_AbilityPopUp
	copyhword BACKUP_HWORD USER_BANK
	setbyte SEED_HELPER 1

BattleScript_OpportunistCopyStatChangeLoop:
	callasm SetCopyStatChange
	setgraphicalstatchangevalues
	playanimation BANK_SCRIPTING ANIM_STAT_BUFF ANIM_ARG_1
	printfromtable gStatUpStringIds
	waitmessage DELAY_1SECOND
	addbyte SEED_HELPER 1
	jumpifbyte LESSTHAN SEED_HELPER 8 BattleScript_OpportunistCopyStatChangeLoop

BattleScript_OpportunistCopyDragonCheer:
	callasm SetCopyDragonCheer
	setword BATTLE_STRING_LOADER gText_DragonCheerString
	printstring 0x184
	waitmessage DELAY_1SECOND

BattleScript_OpportunistEnd:
	setbyte SEED_HELPER 0
	copyhword USER_BANK BACKUP_HWORD
	call BattleScript_AbilityPopUpRevert
	end3

@;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.global HarvestString
AdrenalineOrbString: .byte 0xFD, 0x10, 0x1A, 0x00, 0x97, 0x97, 0x28, 0x41, 0x1F, 0x44, 0xFE, 0x0D, 0x46, 0x24, 0x0B, 0x37, 0x00, 0x01, 0x37, 0x50, 0x10, 0xAB, 0xFF
HurtByAbilityString: .byte 0xFD, 0x10, 0x1A, 0x00, 0x07, 0x3E, 0x12, 0x02, 0x10, 0xAB, 0xFF
BadDreamsHurtString: .byte 0xFD, 0x10, 0x1A, 0xFE, 0x03, 0x15, 0x0B, 0x2A, 0x13, 0x02, 0x29, 0xAB, 0xFF
HarvestString: .byte 0xFD, 0x13, 0x1A, 0xFE, 0xFD, 0x16, 0x2D, 0x00, 0x0C, 0x35, 0x03, 0x06, 0x08, 0x0C, 0x10, 0xAB, 0xFF
PickupString: .byte 0xFD, 0x13, 0x1A, 0xFE, 0xFD, 0x16, 0x2D, 0x00, 0x1B, 0x2B, 0x50, 0x13, 0x07, 0x10, 0xAB, 0xFF
DestinyKnotString: .byte 0xFD, 0x13, 0x1A, 0xFE, 0xFD, 0x16, 0x44, 0x00, 0x72, 0x7B, 0x72, 0x7B, 0x16, 0x15, 0x50, 0x10, 0xAB, 0xFF
CursedBodyString: .byte 0xFD, 0x10, 0x19, 0xFE, 0xFD, 0x14, 0x2D, 0x00, 0x1C, 0x03, 0x3D, 0x0A, 0x22, 0x10, 0xAB, 0xFF
MummyString: .byte 0xFD, 0x0F, 0x1A, 0xFE, 0x14, 0x08, 0x0E, 0x02, 0x37, 0x00, 0xFD, 0x19, 0x16, 0x15, 0x50, 0x11, 0x34, 0x50, 0x10, 0xAB, 0xFF, 0x19
AngerPointString: .byte 0xFD, 0x10, 0x1A, 0xFE, 0x0A, 0x03, 0x3A, 0x07, 0x37, 0x00, 0x0B, 0x02, 0x41, 0x02, 0x1F, 0x44, 0x00, 0x01, 0x37, 0x50, 0x10, 0xAB, 0xFF
IllusionWoreOffString: .byte 0xFD, 0x10, 0x19, 0xFE, 0x52, 0x78, 0x85, 0xAE, 0x8D, 0x86, 0x7E, 0x37, 0x00, 0x14, 0x09, 0x10, 0xAB, 0xFF
SynchronizeNoEffectString: .byte 0xFD, 0x10, 0x16, 0x1A, 0xFE, 0x0A, 0x03, 0x06, 0x37, 0x00, 0x15, 0x06, 0x50, 0x10, 0xB0, 0xFF

MimikyuDisguisedTookDamageString: .byte 0x46, 0x09, 0x19, 0x06, 0x2C, 0x37, 0x00, 0x20, 0x37, 0x2C, 0x28, 0x16, 0x00, 0x15, 0x50, 0x10, 0xAB, 0xFF
DisguiseBustedString: .byte 0xFD, 0x10, 0x19, 0xFE, 0x46, 0x09, 0x19, 0x06, 0x2C, 0x37, 0x00, 0x1A, 0x37, 0x2A, 0x10, 0xAB, 0xFF
ReceiverString: .byte 0xFD, 0x11, 0x19, 0xFE, 0xFD, 0x1A, 0x2D, 0x00, 0x1B, 0x07, 0x12, 0x02, 0x41, 0xAB, 0xFF
SymbiosisString: .byte 0xFD, 0x13, 0x1A, 0x00, 0xFD, 0x16, 0x2D, 0xFE, 0xFD, 0x11, 0x16, 0x00, 0x23, 0x10, 0x0E, 0x10, 0xAB, 0xFF
DefiantString: .byte 0xFD, 0x13, 0x19, 0xFE, 0xFD, 0x00, 0x37, 0x00, 0x39, 0xAE, 0x2E, 0x14, 0x01, 0x37, 0x50, 0x10, 0xAB, 0xFF
