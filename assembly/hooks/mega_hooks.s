.thumb
.text
.align 2

.include "../asm_defines.s"

.global MegaRetrieveDataHook

.pool
@;0x148C0 with r0
MegaRetrieveDataHook:
	push {r3}
	bl MegaRetrieveData
	pop {r3}
	ldr r0, =BATTLE_COMMUNICATION
	ldrb r1, [r3]
	ldr r2, =0x8014350 | 1
	bx r2

LoadMegaGraphicsHook:
	push {r0}
	mov r0, r5
	bl LoadMegaGraphics
	pop {r0}

	pop {r4-r6}
	pop {r1}
	bx r1

.pool
@;0x80479DE
MegaLevelStringHook:
	@ Get owner of the health bar
	ldr r1, objects
	mov r0, r9
	lsl r2, r0, #4
	add r0, r2, r0
	lsl r0, r0, #2
	add r0, r0, r1
	ldrh r0, [r0, #0x3A]
	bl HasMegaSymbol
	cmp r0, #0
	bne LoadSpecialMegaSymbol
	ldr r1, objects
	mov r0, r9
	lsl r2, r0, #4
	add r0, r2, r0
	lsl r0, r0, #2
	add r0, r0, r1
	ldrh r0, [r0, #0x3A]
	bl HasDynamaxSymbol
	cmp r0, #0
	bne LoadSpecialMegaSymbol

	ldr r1, level_string
	add r0, sp, #0x10
	mov r2, #0x1E
	bl MemCopy
	b LevelStringReturn

LoadSpecialMegaSymbol:
	adr r1, special_string
	add r0, sp, #0x10
	mov r2, #0x1E
	bl MemCopy

LevelStringReturn:
	ldr r1, =0x08047942 | 1
	bx r1

MemCopy:
	ldr r3, =Memcpy
	bx r3

	.align 2
level_string: .word 0x0821CF90
objects: .word 0x020205B8

special_string:
.byte 0xFC, 0x01, 0x01, 0xFC, 0x02, 0x02
.rept 24
.byte 0
.endr

.align 2
.pool
@;0804BE80 with r3
CreateShakerHook:
	lsl r0, #0x18
	lsr r0, #0x18

	@;Save Index
	ldr r3, .ShakerData
	strb r0, [r3, #1]

	@ Set boolean to true
	mov r2, #1
	strb r2, [r3]

	@ Return
	ldr r2, =0x020205B8
	lsl r1, r0, #4
	ldr r3, =0x0804B640 | 1
	bx r3

.pool
@;0x804BEDC with r2
ObjcShakerHook:
	mov r2, #0
	asr r0, #0x10
	cmp r0, #0x15
	bne ObjcShakerHookReturn

	strh r2, [r1, #0x24]
	strh r2, [r1, #0x26]

	@;Set boolean to false
	ldr r1, .ShakerData
	strb r2, [r1]

	ldr r2, =(0x0804B69E + 1)
	bx r2

ObjcShakerHookReturn:
	pop {pc}

.align 2
.ShakerData: .word SHAKER_HELPER

.pool
@;0x803301C with r1
PlayerHandleStatusIconUpdateHook:
	ldr r0, [r0, #0x4]
	lsl r1, r2, #0x1
	add r1, r2
	lsl r1, #0x2
	add r1, r0
	push {r1}
	bl CreateMegaIndicatorAfterAnim
	pop {r1}
	ldr r0, =0x803279A | 1
	bx r0

.pool
@;0x8038974 with r1
OpponentHandleStatusIconUpdateHook:
	ldr r0, [r0, #0x4]
	lsl r1, r2, #0x1
	add r1, r2
	lsl r1, #0x2
	add r1, r0
	push {r1}
	bl CreateMegaIndicatorAfterAnim
	pop {r1}
	ldr r0, =0x80380EA | 1
	bx r0

.pool
@;0x802F858 with r0
LoadHealthBoxesIndicatorHook:
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, #0x34
	lsl r0, #0x18
	lsr r0, #0x18
	mov r9, r0
	lsl r1, #0x18
	lsr r1, #0x18
	mov r8, r1
	bl CreateMegaIndicatorAfterAnim
	ldr r1, =0x8047938 | 1
	bx r1

@;Dynamax Hooks///////////////////////////////////////////////////////////////
.pool
@;0x0803443C with r0
DynamaxPalFadeHook1_LoadOpponentGfx:
	mov r0, r8
	mov r1, r7
	bl TryFadeBankPaletteForDynamax
	ldr r0, =0x8033BDC | 1
	bx r0

.pool
@;0x080345FC with r0
DynamaxPalFadeHook2_LoadPlayerGfx:
	mov r0, r8
	mov r1, r7
	bl TryFadeBankPaletteForDynamax
	ldr r0, =0x8033D9A | 1
	bx r0

.pool
@;0x080744B0 with r0
RaidBattleCoordHook1:
	mov r0, r5
	bl GetBattlerXCoord
	ldr r1, =0x08073D2C | 1
	bx r1

.pool
@;0x080744D8 with r0
RaidBattleCoordHook2:
	mov r0, r5
	bl GetBattlerYCoord
	ldr r1, =0x08073D2C | 1
	bx r1

.pool
@;0x08077CC4 with r1
DeadRaidMonSpriteHook:
	add r0, r9
	bl ShouldShowOpponentBattlerSprite
	ldr r1, =0x8077464 | 1
	bx r1

.pool
@;0x0807524C with r2
DeadRaidMonSpriteHook2:
	mul r0, r1
	ldr r1, =PARTY_OPPONENT
	add r0, r1
	bl ShouldShowOpponentBattlerSprite
	ldr r1, =0x8074A1A | 1
	bx r1

.pool
@;0x804A116 with r1
RaidBossHPColourHook:
	mov r7, r5
	mov r1, r6 @Bank
	bl GetBattleHealthbarColour
	mov r9, r0
	ldr r0, =0x8049A08 | 1
	bx r0

.pool
@;0x80D84F6 with r0
BufferMaxMoveNameBattle:
	mov r0, r1
	mov r1, r6 
	bl BufferMoveNameBattle
	ldr r0, =0x80D96FE | 1
	bx r0

.pool
@;0x8139D2C with r3
CreateSummaryScreenGigantamaxIconHook:
	mov r0, #0xD
	neg r0, r0
	and r0, r2
	strb r0, [r1, #0x5]
	bl CreateSummaryScreenGigantamaxIcon
	ldr r0, =0x813A50C | 1
	bx r0
