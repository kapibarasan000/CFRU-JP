.text
.thumb
.align 2

.include "../asm_defines.s"

.global BuildTrainerPartyHook

.pool
BuildTrainerPartyHook:
	bl BuildTrainerPartySetup
	ldr r0, =0x800F954 | 1
	bx r0

.pool
@0x800D2CC with r0
AIHandleItemUseHook:
	bl HandleNewBattleRamClearBeforeBattle
	mov r0, #0xF
	bl BattleAI_HandleItemUseBeforeAISetup
	ldr r0, =0x2022AB4
	str r4, [r0]
	ldr r0, =0x800CCF8 | 1
	bx r0

EmitChooseMoveHook:
	mov r3, r5
	bl EmitChooseMove
	pop {r4-r6,pc}

.pool
@0x802EF90 with r0
SwitchMoveDataHook:
	bl HandleMoveSwitchingUpdate
	ldr r0, =0x802EAA4 | 1
	bx r0

.pool
@0x8015438 with r0
TurnValuesCleanUpAdditionHook:
	bl CleanUpExtraTurnValues
	pop {r4-r7, pc}

.pool
@0x80992E4 with r0
SlideMonToOffsetHook:
	mov r0, #0x0
	bl LoadBattleAnimTarget
	mov r2, r0
	ldr r0, =0x8098D08 | 1
	bx r0

.pool
@0x80991BA with r0
SlideMonToOriginalPosHook:
	mov r0, #0x0
	bl LoadBattleAnimTarget
	ldr r1, =0x2023CA4 @BattlerSpriteIds
	ldr r2, =0x8098BE6 | 1
	bx r2

.pool
@0x0804AA1E with r1
GetProperBallIdHook1:
	lsl r0, #0x18
	lsr r0, #0x18
	mov r5, r0
	ldr r1, =0x804A1E0 | 1
	bx r1

.pool
@0x080EF3A8 with r1
GetProperBallIdHook2:
	lsl r0, #0x18
	lsr r0, #0x18
	ldr r1, =0x80F0310 | 1
	bx r1

.pool
@0x801645E with r0
GetPokeBallBattleScriptHook:
	push {r3}
	bl TryGetPokeBallBattleScript
	cmp r0, #0x0
	pop {r3}
	bne SuccessfullBallBattleScript
	mov r1, r3
	ldr r0, =0x8015CB0 | 1 @Check Poke Doll
	bx r0

SuccessfullBallBattleScript:
	ldr r0, =0x8015D10 | 1
	bx r0

.pool
@0x804B946 with r0
OakIntroPokeballFixHook:
	bl OakIntroPokeballFix
	ldr r1, =0x804B10C | 1
	bx r1

.pool
@0x804BBD8 with r0
TradePokeballFixHook:
	bl OakIntroPokeballFix
	ldr r1, =0x804B39E | 1
	bx r1

.pool
@0x80F187C with r2
ShinyAnimFixHook:
	ldr r2, =GetBattlerSpriteCoord
	bl bxr2
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	push {r2}
	bl LoadShinyStarsSpriteTiles
	pop {r2}
	ldr r0, =0x80F27E4 | 1
	bx r0

.pool
@0x8014450 with r0
PartyMenuSwitchingHook:
	bl PartyMenuSwitchingUpdate
	ldr r0, =0x8013ECC | 1
	bx r0

.pool
@0x80EFEE4 with r0
CriticalCaptureAnimHook:
	push {r1}
	bl IsCriticalCapture
	pop {r1}
	cmp r0, #0x0
	beq NormalBallThrowReturn
	bl IsCriticalCaptureSuccess
	cmp r0, #0x0
	beq BallThrowFailureReturn
	ldr r0, =0x80F0E74 | 1 @Success
	bx r0

BallThrowFailureReturn:
	ldr r0, =0x80F0E50 | 1 @Break out
	bx r0

NormalBallThrowReturn:
	ldr r0, =0x2023F78 @gBattleSpritesDataPtr
	ldr r0, [r0]
	ldr r0, [r0, #0x8]
	ldrb r0, [r0, #0x8]
	ldr r2, =0x80F0E4C | 1
	bx r2

.pool
@0x80A1E2C with r0
DoubleWildPokeBallItemUseFixHook:
	mov r0, r4
	bl DoubleWildPokeBallItemUseFix
	cmp r0, #0x0
	bne DoubleWildPokeBallItemUseFixEnd

	ldr r0, =0x203ACA8 @Var 0x800E
	ldrh r0, [r0]
	mov r1, #0x1
	bl RemoveBagItem
	ldr r0, =0x80A30F6 | 1
	bx r0

DoubleWildPokeBallItemUseFixEnd:
	pop {r4, pc}

RemoveBagItem:
	ldr r3, =0x8099BE0 | 1
bxr3:
	bx r3

.pool
@0x802D9D8 with r0
DoubleWildDexHook1:
	push {r4-r5,lr}
	sub sp, #0x14
	bl LoadTargetPartyData
	mov r1, #0xB
	ldr r2, =0x802D1F0 | 1
	bx r2

.pool
@0x802DAEC with r0
DoubleWildDexHook2:
	mov r0, r5
	bl CreateCapturedMonDexPic
	ldr r0, =0x802D31E | 1
	bx r0

.pool
@0x0802DE4E with r0
CaptureExperienceEvolutionHook:
	ldrb r0, [r0]
	cmp r0, #0x0
	beq NoEvolutionPostBattle
	ldr r0, =BATTLE_OUTCOME
	ldrb r0, [r0]
	cmp r0, #0x1 @Won battle
	beq EvolutionPostBattle
	cmp r0, #0x7 @Caught
	beq EvolutionPostBattle

NoEvolutionPostBattle:
	ldr r0, =0x801526A | 1
	bx r0

EvolutionPostBattle:
	ldr r0, =0x8015284 | 1
	bx r0	

.pool
@0x8013D14 with r1
TrainerSlidingEndTurnHook:
	mov r1, r10
	str r0, [r1]
	bl CheckLastMonLowHPSlide
	bl HandleDeadRaidMonAndDeadPlayer
	ldr r2, =Random
	bl bxr2
	ldr r1, =0x801353C | 1
	bx r1

.pool
@0x80813B8 with r0
LoadProperMusicForLinkBattlesHook:
	bl LoadProperMusicForLinkBattles
	ldr r1, =0x8080AA6 | 1
	bx r1

.pool
@0x806E454 with r1
ExpandedVarsHook:
	push {r4-r6, lr}
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r6, r4
	mov r0, r4
	bl GetExpandedVarPointer
	cmp r0, #0x1
	beq VarReturn0
	cmp r0, #0x0
	bne ExpandedVarsPop
	ldr r0, =0x806DC50 | 1
	bx r0

ExpandedVarsPop:
	pop {r4-r6,pc}

VarReturn0:
	ldr r0, =0x806DC56 | 1
	bx r0

.pool
@0x806E5C0 with r1
ExpandedFlagsHook:
	push {r4-r6, lr}
	lsl r5, r0, #0x10
	lsr r4, r5, #0x10
	mov r6, r4
	mov r0, r4
	bl GetExpandedFlagPointer
	cmp r0, #0x0
	bne ExpandedVarsPop
	ldr r0, =0x806DDBC | 1
	bx r0

.pool
@0x80142D8 with r0
DoubleWildUseItemRunFixHook:
	ldr r5, =ACTIVE_BATTLER
	ldrb r4, [r5]
	bl CheckCantMoveThisTurn
	cmp r0, #0x0
	beq SkipEncoreReturn
	ldr r0, =0x8013E2E | 1
	bx r0

SkipEncoreReturn:
	ldr r0, =0x8013B4C | 1
	bx r0

.pool
@0x806FC84 with r0
LinkBattleSaveHook:
	bl SaveDataAfterLinkBattle
	ldr r1, =0x806F476 | 1
	bx r1

.pool
@0x8054A60 with r0
NewGameSaveClearHook:
	push {r4-r6, lr}
	mov r6, r8
	push {r6}
	sub sp, sp, #0x8
	bl NewGameWipeNewSaveData
	ldr r0, =0x805432C | 1
	bx r0

.pool
@0x80CEDD4 with r1
EvolutionMovesHook:
	ldrb r1, [r5, #0x10]
	mov r0, r9
	bl MonTryLearningNewMoveAfterEvolution
	ldr r1, =0x80CFEF8 | 1
	bx r1

.pool
@0x81058DC with r0
PokedexLoadAlternateHeightHook:
	lsr r7, r2, #0x18
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	mov r8, r3
	mov r5, r1 @Save species
	mov r0, r1
	mov r1, #0x0 @PKDX_GET_HEIGHT
	bl TryGetAlternateSpeciesSize
	cmp r0, #0x0
	bne ReturnPokedexHeight
	mov r0, r5
	ldr r1, =0x81058E6 | 1
	bx r1

ReturnPokedexHeight:
	mov r4, r0 @Store height in r4
	mov r0, r5 @Store species in r0
	ldr r1, =SpeciesToNationalPokedexNum
	bl bxr1
	ldr r1, =0x81058F6 | 1
	bx r1

.pool
@@0x8105A58 with r0
PokedexLoadAlternateWeightHook:
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	mov r9, r3
	mov r5, r1 @Save species
	mov r0, r1
	mov r1, #0x1 @PKDX_GET_WEIGHT
	bl TryGetAlternateSpeciesSize
	cmp r0, #0x0
	bne ReturnPokedexWeight
	mov r0, r5
	ldr r1, =0x8105A60 | 1
	bx r1

ReturnPokedexWeight:
	mov r4, r0 @Store weight in r4
	mov r0, r5 @Store species in r0
	ldr r1, =SpeciesToNationalPokedexNum
	bl bxr1
	ldr r1, =0x8105A70 | 1
bxr1:
	bx r1


.pool
@0x80A0774 with r2
SizeMinigameLoadAlternateHeightHook:
	lsl r0, #0x10
	lsr r0, #0x10
	lsl r1, r1, #0x10
	lsr r6, r1, #0x10
	mov r5, r0 @;Backup species
	mov r1, #0x0 @PKDX_GET_HEIGHT
	bl TryGetAlternateSpeciesSize
	cmp r0, #0x0
	bne ReturnAlternatWeightMinigame
	mov r0, r5
	ldr r1, =0x80A077E | 1
	bx r1

ReturnAlternatWeightMinigame:
	ldr r1, =0x80A078C | 1
	bx r1

.pool
@0x8013ECC with r0
ForfeitBattleTowerHook:
	bl HandleRunActionFrontier
	cmp r0, #0x0
	bne ReturnPrintForfeitBattleTower
	ldr r0, =BATTLE_TYPE
	ldr r0, [r0]
	mov r1, #BATTLE_TRAINER | BATTLE_WIRELESS
	and r0, r1
	ldr r1, =0x8013ED4 | 1
	bx r1

ReturnPrintForfeitBattleTower:
	ldr r0, =0x801446E | 1
	bx r0

.pool
@0x811F3C8 with r2
LoadMaxNumPokemonDisplaySelection:
	and r0, r1
	cmp r0, #0x80
	bne LoadMaxNumPokemonDisplaySelectionMax
	mov r3, #0x2
	b LoadMaxNumPokemonDisplaySelectionReturn

LoadMaxNumPokemonDisplaySelectionMax:
	mov r1, #0x0
	bl ChoosePokemon_LoadMaxPKMNStr
	mov r3, r0

LoadMaxNumPokemonDisplaySelectionReturn:
	ldr r0, =0x811FBDA | 1
	bx r0

.pool
@0x8124184 with r0
LoadMaxNumPokemonChooseBattleTowerStringHook:
	mov r0, sp
	mov r1, #0x1
	bl ChoosePokemon_LoadMaxPKMNStr
	mov r8, r0
	ldr r0, =0x8124968 | 1
	bx r0

.pool
@0x805B2EC with r0
AutoRunHook:
	mov r0, #0x2 @B-Button
	and r5, r0
	cmp r5, #0x0
	bne CheckIfRunningAllowed
	bl IsAutoRunEnabled
	cmp r0, #0x0
	beq NoRunning

CheckIfRunningAllowed:
	ldr r2, =gEventObjects
	ldrb r1, [r6, #0x5] @NPC Id
	lsl r0, r1, #0x3
	add r0, r1
	lsl r0, #0x2
	add r0, r2
	ldrb r0, [r0, #0x1E]
	bl IsRunningDisallowed
	cmp r0, #0x0
	bne NoRunning
	ldr r0, =0x805B316 | 1
	bx r0

NoRunning:
	ldr r0, =0x805B348 | 1
	bx r0

.pool
@0x80BD338 with r0
BikeTurboBoostHook:
	mov r0, r4
	bl MoveOnBike
	ldr r0, =0x80BE610 | 1
	bx r0

.pool
@0x8046390 with r1
FlameBodyMagmaArmorEggHook:
	mov r1, r4
	bl SubtractEggSteps
	cmp r0, #0x0
	beq TimeToHatchEgg @A change implemented in Gen 5
	ldr r0, =0x8045932 | 1
	bx r0

TimeToHatchEgg:
	mov r0, r6
	mov r1, r5
	bl TryDecrementingDaycareStepCounterIfMoreEggsToHatch
	ldr r0, =0x8045914 | 1
	bx r0

.pool
@0x8046314 with r1
OvalCharmHook:
	bl ModifyBreedingScoreForOvalCharm
	mov r4, r0
	lsl r4, #0x18
	lsr r4, #0x18
	ldr r2, =Random
	bl bxr2
	ldr r1, =0x80458B2 | 1
	bx r1

.pool
@0x808BA60 with r2
SetBoxMonDataAtHook:
	mov r2, r5
	bl SetBoxMonDataAt
	pop {r4-r6,pc}

.pool
@0x808BB70 with r2
GetAndCopyBoxMonDataAtHook:
	mov r2, r5
	bl GetAndCopyBoxMonDataAt
	pop {r4-r6, pc}

.pool
@0x808BDF0 with r0
sub_808B884Hook:
	mov r0, r8
	bl sub_808B884
	pop {r3}
	mov r8, r3
	pop {r4-r7,pc}

.pool
@0x8093768 with r1
CompressedStorageSummaryScreenUpdate1:
	lsl r0, #0x18
	lsr r0, #0x18
	mov r1, #0x0
	bl GetCompressedMonPtr
	ldr r1, =0x80931A6 | 1
	bx r1

.pool
@0x8138BD2 with r1
CompressedStorageSummaryScreenUpdate2:
	bl SummaryScreenBoxMonMultiplier
	add r0, r4
	mov r1, r5
	bl CompressedMonToMon
	pop {r4-r5,pc}


.pool
@0x8139208 with r1
SwapBoxMonMovesUpdate1:
	lsr r0, #0x18
	bl SummaryScreenBoxMonMultiplier
	add r6, r0
	ldr r0, =DAMAGE_LOC
	str r6, [r0] @Use the damage loc as temporary storage

	ldr r0, =BATTLE_DATA @Battle data is being used as a temporary mon
	mov r1, r6
	bl CreateBoxMonFromCompressedMon
	ldr r6, =BATTLE_DATA
	ldr r0, =0x81399E6 | 1
	bx r0

.pool
@0x8139304 with r0
SwapBoxMonMovesUpdate2:
	ldr r0, =BATTLE_DATA
	ldr r1, =DAMAGE_LOC
	ldr r1, [r1]
	bl CreateCompressedMonFromBoxMon @Update the mon in the PC
	add sp, #0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7,pc}

.pool
@0x8093F58 with r3
ExpandedItemNameFixPokemonStorageSystemHook:
	bl FixItemNameInPokemonStorageSystem
	ldr r0, =0x80939B9 | 1
	bx r0

.pool
@0x80D860C with r0
ExpandedAbilityNamesBattle2:
	add r0, r5, r7
	ldrb r0, [r0, #0x1]
	bl GetAbilityName
	mov r1, r0
	ldr r0, =0x80D966A | 1
	bx r0

@.pool
@0x8136714 with r1
ExpandedAbilityNamesSummaryScreen:
	mov r1, r4
	bl CopyAbilityName
	ldr r0, =0x8136F04 | 1
	bx r0

.pool
@0x8013144 with r0
LoadProperAbilityBattleDataHook:
	bl LoadProperAbilityBattleData
	ldr r0, =0x80129AC | 1
	bx r0

.pool
@0x8012850 with r0
BatonPassEffects:
	ldrb r1, [r3]
	lsl r1, #0x2
	add r1, r10
	ldr r0, [r1]
	ldr r2, =(STATUS3_SEEDED_RECOVERY | STATUS3_SEEDED | STATUS3_LOCKON | STATUS3_PERISH_SONG | STATUS3_ROOTED | STATUS3_LEVITATING | STATUS3_AQUA_RING | STATUS3_POWER_TRICK | STATUS3_ABILITY_SUPRESS)
	and r0, r2
	str r0, [r1]
BatonPassReturnReturn:
	ldr r0, =0x80120AE | 1
	bx r0

.pool
@x80D8486 with r0
DisplayStatStageMessage:
	ldr r0, .SeverelyIndex
	cmp r0, r1
	beq BufferSeverely
	add r0, #0x1
	cmp r0, r1
	bne DisplayStatStageMessageNormal
	ldr r1, .DrasticallyStringPtr
	b DisplayStatStageMessageReturn

BufferSeverely:
	ldr r1, .SeverelyStringPtr
	b DisplayStatStageMessageReturn

DisplayStatStageMessageNormal:
	ldr r0, .gBattleStringsTable
	sub r1, #0xC
	lsl r1, r1, #0x2
	add r1, r1, r0
	ldr r1, [r1]

DisplayStatStageMessageReturn:
	ldr r0, =0x080D96DE | 1
	bx r0

.align 2
.SeverelyIndex: .word 0x185
.gBattleStringsTable: .word 0x83C3F08
.DrasticallyStringPtr: .word DrasticallyString
.SeverelyStringPtr: .word SeverelyString

.pool
@0x810BD64 with r1
CharacterCustomizationUpdateTrainerFrontPic2:
	mov r1, r4
	bl TryUpdateTrainerPicPalTrainerCard
	pop {r4-r5, pc}

.pool
@0x81090B8 with r0
SelectItemFromBagCheck:
	bl ShouldSelectItemFromBag
	cmp r0, #0x0
	bne SelectItemFromBagReturn
	ldr r1, =0x30050D0 @;Tasks
	lsl r0, r6, #0x2
	add r0, r6
	lsl r0, #0x3
	ldr r2, =0x8109BB8 | 1
	bx r2

SelectItemFromBagReturn:
	ldr r1, =0x8109B1C | 1
	bx r1

@0x81323B0 with r0
SelectItemFromTMCaseCheck:
	bl ShouldSelectItemFromTMCase
	cmp r0, #0x0
	bne SelectItemFromTMCaseReturn
	ldr r0, =0x30050D0 @;Tasks
	lsl r1, r7, #0x2
	add r1, r7
	lsl r1, #0x3
	ldr r2, =0x8132BAC | 1
bxr2:
	bx r2

SelectItemFromTMCaseReturn:
	ldr r0, =0x8132B64 | 1
	bx r0

/*
.pool
@0x80DB3C8 with r1
GrassFootstepNoiseHook:
	cmp r0, #0x0
	beq DoGrassFootstepNoise
	mov r0, r3
	mov r1, #0x4
*/
DoSeekSpriteAnim:
	ldr r2, =SeekSpriteAnim
	bl bxr2
	b EndGrassFootstepNoiseCheck

DoGrassFootstepNoise:
	bl PlayGrassFootstepNoise
EndGrassFootstepNoiseCheck:
	mov r0, #0x0
	add sp, sp, #0x4
	pop {r4-r5, pc}

.pool
@0x80DB678 with r1
VeryTallGrassFootstepNoiseHook:
	cmp r0, #0x0
	beq DoGrassFootstepNoise
	mov r0, r3
	mov r1, #0x6
	b DoSeekSpriteAnim

.pool
@0x80DB9C4 with r1
SandFootstepNoiseHook:
	lsr r5, r0, #0x18
	bl PlaySandFootstepNoise
	mov r1, r5
	cmp r1, #0x40
	beq EndSandFootstepFieldEffect
	lsl r0, r1, #0x4
	ldr r3, =0x080DC9B4 | 1
	bx r3

EndSandFootstepFieldEffect:
	ldr r0, =0x080DC9E6 | 1
	bx r0

.pool
@0x807F542 with r0
WhiteoutScreenFix:
	mov r0, r1
	bl LoadProperWhiteoutString
	mov r1, r0
	mov r0, r6
	mov r2, #0x2
	mov r3, #0x8
	bl PrintWhiteoutTextScreen
	ldr r1, =0x807EC74 | 1
	bx r1

PrintWhiteoutTextScreen:
	ldr r4, =0x807EAD4 | 1
	bx r4

.pool
@0x803401E with r4
TryHandleLaunchBattleTableAnimationHook:
	bl TryHandleLaunchBattleTableAnimation
	pop {r4-r7,pc}

.pool
@0x8077CD2 with r0
ReshowBattleScreenMonSpriteHook1:
	mov r0, r7
	bl IsInMiddleOfEndTurnSwitchIn
	cmp r0, #0x0
	bne ReshowBattleScreenNoSprite
	ldrh r0, [r6]
	mov r1, r10
	mul r0, r1
	add r0, r9
	ldr r1, =0x8077474 | 1
	bx r1

.pool
@0x08077ECA with r0
ReshowBattleScreenMonSpriteHook2:
	mov r0, r7
	bl IsInMiddleOfEndTurnSwitchIn
	cmp r0, #0x0
	bne ReshowBattleScreenNoSprite
	ldrh r0, [r6]
	mov r1, r10
	mul r0, r1
	add r0, r9
	ldr r1, =0x807766C | 1
	bx r1

ReshowBattleScreenNoSprite:
	mov r0, #0x0
	ldr r1, =0x807774C | 1
	bx r1

.pool
@0x8078104 with r0
ReshowBattleScreenHealthboxSpriteHook:
	mov r0, r5
	bl IsInMiddleOfEndTurnSwitchIn
	cmp r0, #0x0
	bne ReshowBattleScreenNoHealthboxSprite
	mov r0, r5
	ldr r1, =GetBattlerSide
	bl bxr1
	lsl r0, #0x18
	ldr r1, =0x80778A4 | 1
	bx r1

ReshowBattleScreenNoHealthboxSprite:
	ldr r0, =0x80778C0 | 1
	bx r0

.pool
@0x8022400 with r0
FrontierCheckBattleOverHook:
	ldr r0, =0x2023B28 @BattleControllerExecFlags
	ldr r0, [r0]
	cmp r0, #0x0
	bne Atk24Return
	bl TryUpdateOutcomeForFrontierBattle
	cmp r0, #0x0
	bne Atk24Return @Is Frontier Battle
	ldr r0, =0x8021C0A | 1
	bx r0

Atk24Return:
	ldr r0, =0x8021D8A | 1
	bx r0

.pool
@0x8126E6C with r0
DracoMeteorMoveTutorHook:
	mov r0, r5
	bl TryHandleExcuseForDracoMeteorTutor
	cmp r0, #0x0
	beq LoadCantLearnMoveString

DracoMeteorSkipPrintString:
	mov r0, r6
	bl CancelPartyMenuLearnTutor
	ldr r0, =0x81277D0 | 1 @Print messages in overworld instead
	bx r0

LoadCantLearnMoveString:
	ldr r1, =0x83DE09D
	b PrintCantLearnMoveExcuseString

@0x8126E74 with r0
DracoMeteorMoveTutorHook2:
	mov r0, r5
	bl TryHandleExcuseForDracoMeteorTutorAlreadyKnow
	cmp r0, #0x0
	beq LoadAlreadyKnowsMoveString
	b DracoMeteorSkipPrintString

LoadAlreadyKnowsMoveString:
	ldr r1, =0x83DE19A

PrintCantLearnMoveExcuseString:
	mov r0, r6
	ldr r2, =0x8126460 | 1
	bl bxr2
	ldr r1, =0x81277D0 | 1
	bx r1

@0x8071F8E with r1
ModifyMegaCryHook:
	lsl r2, #0x18
	lsr r2, #0x18
	lsl r3, #0x18
	lsr r3, #0x18
	str r3, [sp]
	push {r0,r2}
	lsr r0, #0x10 @species
	mov r1, r4 @mode
	bl ModifyMegaCries
	mov r4, r0
	pop {r0,r2}
	ldr r3, =0x807173C | 1
	bx r3

@0x8136168 with r0
CamomonsSummaryScreenHook:
	ldr r5, .hword323C
	add r0, r2, r5
	push {r0}
	mov r1, #0xB @;Species
	ldr r2, =GetMonData
	bl bxr2
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [r7]
	ldr r2, .hword3028
	add r0, r2
	mov r1, r4
	ldr r2, =GetSpeciesName
	bl bxr2
	bl ShouldReplaceTypesWithCamomons
	cmp r0, #0x0
	beq SummaryScreenLoadRegularTypes

SummaryScreenLoadCamomonsTypes:
	pop {r0}
	push {r0}
	mov r1, #0x0
	bl GetCamomonsTypeByMon
	ldr r1, [r7]
	ldr r3, .hword31CC
	add r1, r3
	strb r0, [r1]
	pop {r0}
	mov r1, #0x1
	bl GetCamomonsTypeByMon
	ldr r1, [r7]
	ldr r3, .hword31CC
	add r1, r3
	strb r0, [r1, #0x1]
	ldr r0, =0x81369BC | 1
	bx r0

SummaryScreenLoadRegularTypes:
	pop {r0}
	ldr r0, =0x813699E | 1
	bx r0

.align 2
.hword31CC: .word 0x31CC
.hword323C: .word 0x323C
.hword3028: .word 0x3028

.pool
@0x812461C with r0
FieldMoveBadgeHook:
	mov r0, r4
	bl HasBadgeToUseFieldMove
	cmp r0, #0x0
	beq NoBadgeForFieldMove
	ldr r0, =0x8124FBC | 1
	bx r0

NoBadgeForFieldMove:
	ldr r0, =0x8124F96 | 1
	bx r0

.pool
@0x806CB30 with r0
DiveCheckEmergeHook:
	mov r0, #0x80 @;B button pressed
	and r0, r1
	cmp r0, #0
	beq CheckPlayerMovement
	bl TrySetupDiveEmergeScript
	cmp r0, #0x0
	bne DiveChosen

CheckPlayerMovement:
	ldrb r1, [r5]
	mov r0, #0x40
	and r0, r1
	cmp r0, #0x0
	beq DidntTakeStepReturn
	ldr r0, =0x806C32C | 1
	bx r0

DidntTakeStepReturn:
	ldr r0, =0x806C368 | 1
	bx r0

DiveChosen:
	ldr r0, =0x806C360 | 1
	bx r0

.pool
@0x806CCCC with r0
DiveCheckDownHook:
	ldrb r1, [r5]
	mov r0, #1 @;A button pressed
	and r0, r1
	cmp r0, #0
	beq CheckPlayerPressedStartButton
	bl TrySetupDiveDownScript
	cmp r0, #0x0
	bne DiveChosen

CheckPlayerPressedStartButton:
	ldrb r1, [r5]
	mov r0, #4 @;Start button pressed
	and r0, r1
	cmp r0, #0
	beq CheckSelectButtonReturn
	ldr r2, =0x0806C4CA | 1
	bx r2

CheckSelectButtonReturn:
	ldr r2, =0x0806C4F0 | 1
	bx r2

.pool
@0x805BA1C with r0
DiveSpeedHook:
	mov r0, #0x8 @;Surfing
	and r0, r1
	cmp r0, #0x0
	bne MoveFasterOnWater
	bl IsUnderwater
	cmp r0, #0x0
	bne MoveFasterOnWater
	ldr r0, =0x805B2EC | 1
	bx r0

MoveFasterOnWater:
	ldr r0, =0x805B2E0 | 1
	bx r0

.pool
@0x80570D0 with r3
InitPlayerAvatarHook:
	ldr r3, =0x300504C @SaveBlock2
	ldr r3, [r3]
	ldrb r3, [r3, #0x8]
	bl InitPlayerAvatar
	ldrb r0, [r5]
	ldr r1, =0x8056998 | 1
	bx r1

.pool
@0x809AC84 with r0
DNSCreateBuyMenuHook:
	ldr r0, =gInShop
	mov r1, #0x1
	strb r1, [r0]
	pop {r4, pc}

.pool
@0x809C078 with r1
DNSEndBuyMenuHook:
	ldr r1, =SetMainCallback2
	bl bxr1
	mov r0, r4
	ldr r1, =DestroyTask
	bl bxr1
	ldr r0, =gInShop
	mov r1, #0x0
	strb r1, [r0]
	ldr r0, =0x809BA72 | 1
	bx r0

.pool
@0x804A00C with r4
HealthBarChangeAmountHook:
	mov r4, #0x6
	str r4, [sp]
	push {r0-r3}
	mov r0, r8
	bl CalcHealthBarPixelChange
	mov r4, r0
	pop {r0-r3}
	str r4, [sp, #0x4]
	ldr r4, =0x80498F0 | 1
	bx r4

.pool
@0x81E381C with r0
ActivateMGBAPrint:
	add sp, #0x10
	bl mgba_open
	pop {r4, r7, pc}

.pool
@0x80C48AC with r0
CreateRoamerIconTownMapHook:
	bl CreateTownMapRoamerSprites
	pop {r4-r7, pc}

.pool
.align 2
@0x80C120C with r0
CreateRoamerIconTownMapPostSwitchMapHook:
	bl CreateTownMapRoamerSprites
	mov r0, #0x0 @Not invisible
	bl HideOrShowTownMapRoamerSprites
	ldr r1, [r5]
	ldr r0, =0x80001CC8
	lsl r0, #0x1
	lsr r0, #0x1 @Dumb compiler thing
	add r1, r0
	ldr r0, =0x80C2446 | 1
	bx r0

.pool
@0x80C111C with r0
DestroyRoamerIconTownMapSwitchHook:
	bl DestroyTownMapRoamerSprites
	ldr r1, [r4]
	mov r2, #0x80
	lsl r2, #0x5
	mov r0, #2
	ldr r3, =0x80C2308 | 1
	bx r3

.pool
@0x80C2D44 with r0
DestroyRoamerIconTownMapCloseHook:
	bl DestroyTownMapRoamerSprites
	ldr r1, =sMapOpenCloseAnim
	ldr r0, [r1]
	ldr r4, .CCE
	add r0, r4
	ldr r2, =0x080C3F30 | 1
	bx r2

.align 2
.CCE: .word 0xCCE

.pool
@0x80C49F8 with r0
HideOrShowRoamerIconTownMapHook:
	mov r0, r5
	bl HideOrShowTownMapRoamerSprites
	pop {r4-r7, pc}

.pool
@0x811E950 with r4
DrawLevelUpWindowPg2Hook:
	ldr r4, [sp, #0x4C] @Shadow Colour
	str r4, [sp] @Param Shadow Colour
	bl DrawLevelUpWindowPg2
	ldr r0, =0x811F236 | 1
	bx r0

.pool
@0x8024C16 with r0
OpenPartyScreenBatonPassExplosionFix:
	cmp r1, #0x0
	beq OpenPartyScreenBatonPassExplosionFixReturn
	ldr r1, =IsDoubleBattle
	bl bxr1
	ldrb r3, [r4]
	cmp r0, #0x0 @Not doubles so no partner exists
	beq OpenPartyScreenBatonPassExplosionFixReturn
	mov r0, #0x2
	eor r3, r0
	strb r3, [r4]

OpenPartyScreenBatonPassExplosionFixReturn:
	ldr r0, =0x8024414 | 1
	bx r0

.pool
@0x800C61C with r0
MainMenuBadSaveTypeMsgHook:
	strh r6, [r1, #0x8]
	mov r0, r5
	ldr r1, =gText_ChangeSaveType
	bl PrintChangeSaveTypeErrorStatus
	pop {r4-r6, pc}

.pool
@0x0800C718 with r1
MainMenuRTCWarningHook1:
	mov r0, r4
	bl TryDisplayMainMenuRTCWarning
	cmp r0, #0x0
	bne MainMenuRTCWarningHook_WaitMsg
	mov r0, #0x40
	mov r1, #0x0
	ldr r2, =SetGpuReg
	bl bxr2
	mov r0, #0x44
	ldr r1, =0x800C110 | 1
	bx r1

MainMenuRTCWarningHook_WaitMsg:
	ldr r0, =0x800C154 | 1
	bx r0

.pool
@0x0800C7A4 with r1
MainMenuRTCWarningHook2:
	push {r7}
	sub sp, #0x10
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	bl TryDisplayMainMenuRTCWarning
	cmp r0, #0x0
	bne MainMenuRTCWarningHook_WaitMsg2
	ldr r0, =0x800C1AC | 1
	bx r0

MainMenuRTCWarningHook_WaitMsg2:
	ldr r0, =0x0800C3E2 | 1
	bx r0

.pool
@0x0805D524 with r0
SuctionCupsHook:
	bl DoesFishBite
	cmp r0, #0x0
	beq NoFishBiting
	ldr r0, =0x805CE08 | 1
	bx r0

NoFishBiting:
	ldr r0, =0x805CDFA | 1
	bx r0

.pool
@0x809D2FC with r3
RandomizerShowPokepicHook:
	lsl r1, r1, #0x18
	lsr r7, r1, #0x18
	lsl r2, r2, #0x18
	lsr r6, r2, #0x18
	mov r0, r8
	bl GetRandomizedSpecies
	mov r8, r0
	ldr r0, =0x809CD3C | 1
	bx r0

.pool
@0x806C9AC with r0
FieldGetPlayerInputLButtonHook:
	mov r0, r5
	ldrh r1, [sp]
	bl FieldCheckIfPlayerPressedLButton
	ldr r0, =0x0806C1AE | 1
	bx r0

.pool
@0x806C4F0 with r0
UseRegisteredItemHook:
	mov r0, r5
	bl ProcessNewFieldPlayerInput
	ldr r1, =0x0806C516 | 1
	bx r1

.pool
@0x8041798 with r0
XSpDefStatBoostHook:
	ldr r0, [sp, #0x8] @Item
	mov r1, r3 @Boost amount
	bl NewXSpecialBoost
	mov r1, r0 @retVal
	ldr r0, =0x8040EBA | 1
	bx r0

.pool
@0x8016650 with r0
AIXItemStringHook:
	bl PrepareStringForAIUsingXItem
	ldr r0, =gBattlescriptCurrInstr
	mov r9, r0
	ldr r0, =gCurrentActionFuncId
	mov r10, r0
	ldr r6, =0x81BD9A0
	ldr r0, =0x8015F1A | 1
	bx r0

.pool
@0x8032CEC with r0
LastUsedBallOverrideHook:
	push {r4-r5, lr}
	sub sp, #0x4
	bl DidPlayerUseLastBallAndTryUpdateControllerFunc
	cmp r0, #0x0
	bne LastUsedBallOverrideHook_SkipBag
	mov r0, #0x1
	neg r0, r0
	ldr r1, =0x8032468 | 1
	bx r1

LastUsedBallOverrideHook_SkipBag: @Skips the palette fade to bag
	ldr r0, =0x80324A4 | 1
	bx r0

.pool
MoveSelectionWindowCursorPos:
	mov r1, #0x1
	add r2, r3, #0x0
	and r2, r1
	mov r0, #0x9
	mul r2, r0
	add r2, #0x1
	ldr r0, =0x803015C | 1
	bx r0

.pool
MoveSelectionWindowCursorPos2:
	mov r1, #0x1
	add r2, r3, #0x0
	and r2, r1
	mov r0, #0x9
	mul r2, r0
	add r2, #0x1
	ldr r0, =0x803019C | 1
	bx r0
	