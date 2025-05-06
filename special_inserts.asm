.text
.align 2
.thumb

.include "../asm_defines.s"
.include "../battle_script_macros.s"

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Game Speed Up
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

/*
.org 0x890, 0xFF
main:
	ldr r2, .SuperBits
	ldrh r3, [r2]
	mov r0, #1	
	bic r3, r0
	strh r3, [r2]
loop_label:
	swi #2
	ldrh r3, [r2]
	tst r3, r0
	beq loop_label
	bx lr

.align 2
.SuperBits: .word 0x0300314C
*/

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Dynamic Overworld Palette - part of hook at 0x779c
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x7316, 0xff
	.byte 0x0, 0x0

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x11DFA, 0xFF
	lsl r1, r0, #0x5
	mov r8, r8
	mov r8, r8

.org 0x11E1E, 0xFF
	lsl r1, r0, #0x5
	mov r8, r8
	mov r8, r8

.org 0x1278E, 0xFF
	lsl r0, r2, #0x5
	mov r8, r8
	mov r8, r8

.org 0x12964, 0xFF
	lsl r0, r1, #0x5
	mov r8, r8
	mov r8, r8

.org 0x1297E, 0xFF
	lsl r0, r1, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Pokedex Flags Banned Battle Types
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.org 0x12A88, 0xFF
.word BATTLE_WIRELESS | BATTLE_OLD_MAN | BATTLE_E_READER | BATTLE_GHOST | BATTLE_TRAINER_TOWER | BATTLE_FRONTIER

.org 0x12B50, 0xFF
.word BATTLE_WIRELESS | BATTLE_OLD_MAN | BATTLE_E_READER | BATTLE_GHOST | BATTLE_TRAINER_TOWER | BATTLE_FRONTIER

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion gBattleMons Fix
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x13D28, 0xFF
	add r0, #0x38
	ldrh r0, [r0]

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion gLastUsedAbility Fix
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x13D76, 0xFF
	ldrh r3, [r0]

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Vanilla Roamer Bug Fix
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

/*
.org 0x153CE, 0xFF
	cmp r0, #0x1
	beq SetRoamerInactiveCall

.org 0x153D6, 0xFF
SetRoamerInactiveCall:	
*/

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x1623C, 0xFF
	lsl r1, r0, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Safari Zone Ball Count
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x162EA, 0xFF
	ldrh r0, [r1]
	sub r0, #0x1
	strh r0, [r1]

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion gBattleMons Fix
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x166F0, 0xFF
	add r0, #0x38
	ldrh r0, [r0]

.org 0x167F2, 0xFF
	add r1, #0x38
	ldrh r1, [r1]

.org 0x1690C, 0xFF
	add r0, #0x38
	ldrh r0, [r0]

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Max Level Limiters
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x1CF70, 0xFF @Replaced Attackcanceler
GetEventObjectGraphicsInfoByEventObj:

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x1E7FE, 0xFF
	lsl r0, r1, #0x5
	mov r8, r8
	mov r8, r8

.org 0x213E8, 0xFF
	lsl r0, r2, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Max Level Limiters
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x2150A, 0xFF
MaxLevelChange2:
	.byte MAX_LEVEL

.org 0x217B6, 0xFF
MaxLevelChange3:
	.byte MAX_LEVEL

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x237AA, 0xFF
	lsl r0, r1, #0x5
	mov r8, r8
	mov r8, r8

.org 0x237C2, 0xFF
	lsl r0, r2, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Pokedex Flags Banned Battle Types
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.org 0x2396C, 0xFF
.word BATTLE_WIRELESS | BATTLE_OLD_MAN | BATTLE_E_READER | BATTLE_GHOST | BATTLE_TRAINER_TOWER | BATTLE_FRONTIER

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion gBattleMons Fix
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x26598, 0xFF
	add r6, #0x38
	mov r5, #0x0
	ldrh r0, [r6]

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Hidden Abilities - Various Something
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x026610, 0xFF
HiddenAbilityChange2:
	mov r8, r8
	mov r0, r4 @mon
	bl HiddenAbilityChange2 + 0x19E1C @0x0804042C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Hidden Abilities - Various Something
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x0266A8, 0xFF
HiddenAbilityChange3:
	and r0, r1
	cmp r0, #0x0
	beq HiddenAbilityChange3 + 0x20
	mov r8, r8
	mov r0, r4 @mon
	bl HiddenAbilityChange3 + 0x19D84 @0x0804042C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #ABILITY_SOUNDPROOF
	beq HiddenAbilityChange3 + 0x20
	mov r0, #0x1

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Hidden Abilities - Player
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x029FD8, 0xFF
HiddenAbilityChange4_1:
	mov r1, #0x41 @species2
	bl HiddenAbilityChange4_1 + 0x1537C @get_attr
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	mov r8, r8
	mov r8, r8
	mov r8, r8
	mov r8, r8
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Hidden Abilities - Opponent
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x02A068, 0xFF
HiddenAbilityChange4_2:
	mov r8, r8
	mov r0, r4
	bl HiddenAbilityChange4_2 + 0x163C4 @0x0804042C
	lsl r0, #0x10
	lsr r0, #0x10

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x2B1E6, 0xFF
	lsl r1, r0, #0x5
	mov r8, r8
	mov r8, r8

.org 0x2B238, 0xFF
	lsl r1, r2, #0x5
	mov r8, r8
	mov r8, r8

.org 0x2C65A, 0xFF
	lsl r0, r5, #0x5
	mov r8, r8
	mov r8, r8
	add r0, r8
	ldrh r0, [r0, #0x1A]

.org 0x2C670, 0xFF
	lsl r0, r5, #0x5
	mov r8, r8
	mov r8, r8
	add r0, r8
	ldrh r0, [r0, #0x16]

.org 0x2CCEE, 0xFF
	lsl r0, r1, #0x5
	mov r8, r8
	mov r8, r8

.org 0x2F6AA, 0xFF
	lsl r1, r5, #0x5
	mov r8, r8
	mov r8, r8

.org 0x2F80A, 0xFF
	lsl r0, r5, #0x5
	mov r8, r8
	mov r8, r8

.org 0x2F912, 0xFF
	lsl r1, r0, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Max Level Limiter
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x326E2, 0xFF
MaxLevelChange14:
	.byte MAX_LEVEL - 1

.org 0x33B48, 0xFF
TransformedPersonalityOpponentFix:
	mov r2, r6 @Use current personality

.org 0x33D08, 0xFF
TransformedPersonalityPlayerFix:
	mov r2, r4 @Use current personality

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x38CB8, 0xFF
	lsl r0, r4, #0x5
	mov r8, r8
	mov r8, r8
	add r0, r9
	ldrh r0, [r0, #0x1A]

.org 0x38CD4, 0xFF
	lsl r0, r4, #0x5
	mov r8, r8
	mov r8, r8
	add r0, r9
	ldrh r0, [r0, #0x16]

.org 0x3910E, 0xFF
	lsl r0, r4, #0x5
	mov r8, r8
	mov r8, r8

.org 0x39118, 0xFF
	ldrh r2, [r0, #0x1A]

.org 0x3912C, 0xFF
	lsl r0, r4, #0x5
	mov r8, r8
	mov r8, r8

.org 0x39136, 0xFF
	ldrh r2, [r0, #0x16]

.org 0x396F2, 0xFF
	lsl r0, r5, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ AI Vanilla Item Use Bug Fix
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.org 0x39908, 0xFF
AIVanillaItemUseBugFix:
	lsl r0, #0x10
	lsr r0, #0x10

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x3D35A, 0xFF
	lsl r0, r1, #0x5
	mov r8, r8
	mov r8, r8

.org 0x3D384, 0xFF
	lsl r0, r1, #0x5
	mov r8, r8
	mov r8, r8

.org 0x3D4CA, 0xFF
	lsl r0, r1, #0x5
	mov r8, r8
	mov r8, r8
	add r0, r0, r2
	ldrh r0, [r0, #0x1A]

.org 0x3DF54, 0xFF
	lsl r0, r4, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Max Level Limiters
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x3DF72, 0xFF
MaxLevelChange4:
	.byte MAX_LEVEL

.org 0x3DFC0, 0xFF
	lsl r0, r4, #0x5
	mov r8, r8
	mov r8, r8

.org 0x3DFDE, 0xFF
MaxLevelChange5:
	.byte MAX_LEVEL

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x3EEBA, 0xFF
	lsl r0, r5, #0x5
	mov r8, r8
	mov r8, r8

.org 0x3EED6, 0xFF
	lsl r0, r5, #0x5
	mov r8, r8
	mov r8, r8

.org 0x3EF02, 0xFF
	lsl r0, r2, #0x5
	mov r8, r8
	mov r8, r8

.org 0x3EF1C, 0xFF
	lsl r0, r2, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Roamer IVs Fix
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x40186, 0xFF
RoamerIVsFix:
	ldr r1, [r4]
	str r1, [r5, #0x4]
	b RoamerIVsFixEnd

.org 0x401D1, 0xFF
RoamerIVsFixEnd:

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x409E6, 0xFF
	lsl r0, r1, #0x5
	mov r8, r8
	mov r8, r8

.org 0x409F8, 0xFF
	lsl r0, r1, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Hidden Abilities - Summary Screen
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x040A08, 0xFF
@poke summary info
HiddenAbilityChange5:
	mov r8, r8
	mov r8, r8
	mov r0, r4 @mon
	bl HiddenAbilityChange5 - 0x5DC @0x0804042C
	mov r1, r7
	add r1, #0x38
	strh r0, [r1]

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Max Level Limiters
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x40F24, 0xFF
MaxLevelChange6:
	.byte MAX_LEVEL

.org 0x40F46, 0xFF
	lsl r1, r0, #0x5
	mov r8, r8
	mov r8, r8

.org 0x411FE, 0xFF
VitaminChange1:
	.byte EV_CAP - 1

.org 0x4120E, 0xFF
VitaminChange2:
	.byte EV_CAP, 0x29, 0x6, 0xD9, EV_CAP

.org 0x417C8, 0xFF
VitaminChange3:
	.byte EV_CAP - 1

.org 0x417D8, 0xFF
VitaminChange4:
	.byte EV_CAP, 0x29, 0x7, 0xD9, EV_CAP

.org 0x41E3E, 0xFF
MaxLevelChange11:
	.byte MAX_LEVEL
	
.org 0x42014, 0xFF
VitaminChange5:
	.byte EV_CAP - 1

.org 0x421D0, 0xFF
VitaminChange6:
	.byte EV_CAP - 1

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x43842, 0xFF
	lsl r1, r0, #0x5
	mov r8, r8
	mov r8, r8

.org 0x43A6E, 0xFF
	lsl r3, r0, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Max Level - Limiter
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x44C48, 0xFF
MaxLevelChange12:
	.byte MAX_LEVEL

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x497A6, 0xFF
	lsl r0, r5, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Max Level Hack - Limiter
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x49AF2, 0xFF
MaxLevelChange1:
	.byte MAX_LEVEL	

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x4F440, 0xFF
	lsl r1, r7, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Fix Slow Camera Update
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

/*
In bytereplacement
.org 0x56578, 0xFF
OverworldBasic:
	push {LR}
	bl 0x69AA8 @ScriptContext2_RunScript
	bl 0x77578 @RunTasks
	bl 0x6B5C @AnimateSprites
	bl 0x5ABB0 @CameraUpdate
	bl 0x5AE28 @UpdateCameraPanning
	bl 0x704D0 @UpdatePaletteFade
	bl 0x6FFBC @UpdateTilesetAnimations
	bl 0xF67B8 @DoScheduledBgTilemapCopiesToVram
	bl 0x6BA8 @BuildOamBuffer
	pop {pc}

.org 0x59F20, 0xFF
VeryTallGrassFix:
	mov r8, r8
	lsl r0, #0x18
	lsr r0, #0x18
	cmp r0, #0x16
	beq 0x59F2E
	mov r0, #0x0
	b 0x59F30
	mov r0, #0x1
	bx lr
	mov r8, r8

	mov r8, r8
	lsl r0, #0x18
	lsr r0, #0x18
	cmp r0, #0x2
	beq 0x59F42
	cmp r0, #0xD1
	bne 0x59F46
	mov r0, #0x1
	b 0x59F48
	mov r0, #0x0
	bx lr
	mov r8, r8

	cmp r0, #0x3
	b 0x59F28
*/

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Character Customization
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.org 0x58186, 0xFF	@16 bit sprite ids
	lsl r0, #0x10
	lsr r0, #0x10

.org 0x5C092, 0xFF	@16 bit sprite ids
	lsl r0, #0x10
	lsr r0, #0x10 

.org 0x5C444, 0xFF	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x5C488, 0xFF	@16 bit sprite ids
	lsl r0, #0x10
	lsr r0, #0x10

.org 0x5C4BA, 0xFF	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x5CB24, 0xFF	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x5CFD6, 0xFF	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x5D1D6, 0xFF	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x5DDD0, 0xFF @RemoveEventObjectInternal
	push {r4, lr}
	sub sp, #0x8
	mov r4, r0
	mov r0, r4
	bl GetEventObjectGraphicsInfoByEventObj

.org 0x5DE94, 0xff
	.byte 0x8, 0x47		@ routine_ptr+1 at 5e5f4
	
.org 0x5E004, 0xff		@ fix size
	lsl r4, r4, #0x10
	lsr r4, r4, #0x10
	lsl r5, r5, #0x10
	lsr r5, r5, #0x10
	mov r0, #0x0
	str r0, [sp, #0x20]
	mov r1, r9
	ldrb r0, [r1, #0x1]
	ldrb r1, [r1, #0x3]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x10
	orr r0, r1	

.org 0x5E1B0, 0xff		@ change size
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	
.org 0x5E222, 0xff
	mov r8, r8

.org 0x5E2CA, 0xff		@ fix createsprite
	lsl r5, #0x10
	lsr r5, #0x10	

.org 0x5E744, 0xff		@ fix link npcs
	.byte 0x8, 0x47

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Dynamic Overworld Palettes & More OW Sprites
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.org 0x5E92E, 0xFF	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x5E953, 0xff	@don't auto-load NPC palettes into slot 0 or 0xA
	.byte 0xE0

.org 0x5E9D4, 0xff	@don't reset pal slot during player animation or reflection
	.hword 0x0

.org 0x5ED7A, 0xff	@remove byte casts for NPC palette number
	.byte 0x1, 0x0, 0x0, 0x0

.org 0x5EE08, 0xff	@remove byte casts for NPC palette number
	.byte 0xc0, 0x0, 0x9, 0x49
	
.org 0x5EE0C, 0xff	@remove byte casts for NPC palette number
	.byte 0x0, 0x0
	
.org 0x5EE92, 0xff	@remove byte casts for NPC palette number
	.byte 0x2, 0x0, 0x0, 0x0

.org 0x5EEA8, 0xff	@don't auto-load NPC palettes into slot 0 or 0xA
	bx lr
		
.org 0x5EF18, 0xff	@don't auto-load NPC palettes into slot 0 or 0xA
	bx lr

/*.org 0x5F004, 0xFF @MoveEventObjectToMapCoords
	mov r0, r6
	bl GetEventObjectGraphicsInfoByEventObj*/

.org 0x6619A, 0xFF @MovementAction_RestoreAnimation_Step0
	mov r0, r4
	bl GetEventObjectGraphicsInfoByEventObj

.org 0x672D2, 0xFF @npc_offscreen_culling
	mov r5, r0
	mov r4, r1
	ldrb r1, [r5, #0x1]
	mov r0, #0x41
	neg r0, r0
	and r0, r1
	strb r0, [r5, #0x1]
	mov r0, r5
	bl GetEventObjectGraphicsInfoByEventObj

.org 0x67852, 0xFF @EventObjectCheckForReflectiveSurface
	mov r5, r0
	mov r0, r5
	bl GetEventObjectGraphicsInfoByEventObj
	mov r4, #0x0
	mov r0, #0x1
	mov r10, r0

.org 0x67D9A, 0xFF @GroundEffect_SandTracks
	mov r0, r4
	bl GetEventObjectGraphicsInfoByEventObj

.org 0x67DC6, 0xFF @GroundEffect_DeepSandTracks
	mov r0, r4
	bl GetEventObjectGraphicsInfoByEventObj

.org 0x68BD0, 0xFF @DoRippleFieldEffect
	mov r0, r0
	bl GetEventObjectGraphicsInfoByEventObj

.org 0x79378, 0xff	@don't load rain palette on entering map
	.byte 0x0, 0x25, 0xe, 0xe0

.org 0x79A7F, 0xff	@don't treat slot 0xC as weather palette
	.byte 0xe0
	
.org 0x79FBE, 0xff	@make it compatible with daniilS' snowflakes routine
	.byte 0x80, 0x18
	
.org 0x79FD2, 0xff	@make it compatible with daniilS' snowflakes routine
	.byte 0x1, 0x22, 0x5, 0xe0
		
.org 0x7A247, 0xff	@don't record brightened slots
	.byte 0xe0

.org 0x866BE, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x86898, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x868AC, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x86C08, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x87106, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x873A0, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ GetBagItemQuanity
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x997A8, 0xFF
	ldrh r0, [r0]
	bx lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Triple Layer Blocks
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x9B258, 0xFF
	.byte 0x2
	
.org 0x9B25E, 0xFF
	.byte 0x2f, 0xd0

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ More OW Sprites
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x9E9B4, 0xFF
	lsl r0, #0x10
	lsr r0, #0x10 

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Safari Zone Ball Count
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0xA21CA, 0xFF
	strh r0, [r1]
	
.org 0xA2224, 0xFF
	ldrh r0, [r0]

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion gBattleMons Fix
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0xC9656, 0xFF
	add r0, #0x38
	ldrh r0, [r0]

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0xC9688, 0xFF
	lsl r1, r0, #0x5
	mov r8, r8
	mov r8, r8
	add r2, r1, r4
	ldrh r0, [r2, #0x16]

.org 0xC9696, 0xFF
	ldrh r0, [r2, #0x1A]

.org 0xC96AE, 0xFF
	lsl r0, r1, #0x5
	mov r8, r8
	mov r8, r8
	add r0, r0, r4
	ldrh r0, [r0, #0x16]

.org 0xC96C6, 0xFF
	lsl r0, r1, #0x5
	mov r8, r8
	mov r8, r8
	add r0, r0, r4
	ldrh r0, [r0, #0x1A]

.org 0xC96D4, 0xFF
	ldrh r0, [r2, #0x16]

.org 0xC96DC, 0xFF
	ldrh r0, [r2, #0x1A]

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion gBattleMons Fix
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0xC96F0, 0xFF
	add r0, #0x38
	ldrh r0, [r0]

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Dynamic Overworld Palettes & More OW Sprites: Field Effects
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0xCA978, 0xFF	@16 bit sprite ids
	lsl r5, #0x10
	lsr r5, #0x10

.org 0xCAB1C, 0xFF	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0xCBA04, 0xFF
	lsl r1, r0, #0x5
	mov r8, r8
	mov r8, r8

.org 0xDBE2A, 0xFF
	mov r0, r0
	bl GetEventObjectGraphicsInfoByEventObj

.org 0xDBE52, 0xFF
	mov r0, r5
	bl GetEventObjectGraphicsInfoByEventObj

.org 0xDBEAC, 0xff @don't auto-load NPC palettes into slot 0 or 0xA
	bx lr

/*.org 0xDAECC, 0xFF
	mov r0, r0
	bl GetEventObjectGraphicsInfoByEventObj*/
	
.org 0xDBF08, 0xff @don't auto-load NPC palettes into slot 0 or 0xA
	bx lr

/*.org 0xDAF28, 0xFF
	mov r0, r0
	bl GetEventObjectGraphicsInfoByEventObj*/

.org 0xDBFA0, 0xff @don't reset pal slot during player animation or reflection
	mov r8, r8

.org 0xDC1E0, 0xFF @FldEff_Shadow
	mov r0, r1
	bl GetEventObjectGraphicsInfoByEventObj

.org 0xDC8E0, 0xFF @UpdateShortGrassFieldEffect
	mov r0, r1
	bl GetEventObjectGraphicsInfoByEventObj
	mov r8, r0 @;Necessary for no compile error - The FF won't get copied otherwise

.org 0xDCBA2, 0xFF @FldEff_Splash
	mov r0, r5
	bl GetEventObjectGraphicsInfoByEventObj

.org 0xDCDB2, 0xFF @FldEff_FeetInFlowingWater
	mov r0, r6
	bl GetEventObjectGraphicsInfoByEventObj

.org 0xDD024, 0xFF @UpdateHotSpringsWaterFieldEffect
	mov r0, r1
	bl GetEventObjectGraphicsInfoByEventObj

.org 0xDD7CA, 0xFF @FldEff_SandPile
	mov r0, r6
	bl GetEventObjectGraphicsInfoByEventObj
	mov r5, r0 @;Necessary for no compile error - The FF won't get copied otherwise

.org 0xDDAEE, 0xFF @UpdateDisguiseFieldEffect
	mov r0, r0
	bl GetEventObjectGraphicsInfoByEventObj

/*.org 0xDDD58, 0xFF
	mov r0, r4
	bl GetEventObjectGraphicsInfoByEventObj*/

.org 0xDDD58, 0xff  @remove time wasting useless function call
	mov r8, r8
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0xE8E2E, 0xFF
	lsl r1, r5, #0x5
	mov r8, r8
	mov r8, r8

.org 0xE8F8E, 0xFF
	lsl r0, r5, #0x5
	mov r8, r8
	mov r8, r8

.org 0xE9096, 0xFF
	lsl r1, r0, #0x5
	mov r8, r8
	mov r8, r8

.org 0x10483A, 0xFF
	lsl r4, r5, #0x5
	mov r8, r8
	mov r8, r8

.org 0x107044, 0xFF
	lsl r4, r2, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Remove Caught Mon Pokedex 151 Limiter
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x107386, 0xFF
	mov r8, r8

.org 0x1076D8, 0xFF
RemoveCaughtMonPokedex151Limiter:
	b RemoveCaughtMonPokedex151Limiter + 0x24 @0x106BA4

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x11B674, 0xFF
	lsl r0, r1, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Remove TM Animation
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x11D264, 0xFF
	.byte 0x00, 0xF0, 0x0A, 0xFA
	
.org 0x11D5CE, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0xE0

.org 0x11D69E, 0xFF
	.byte 0x0, 0x0

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Stay On Item Screen - Medicine
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.org 0x125CF2, 0xFF
MedicinePostUseFix:
	mov r1, r8
	bl MedicinePostUseFix + 0x22 @0x81253B0 ItemUseCB_MedicineStep
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Stay On Item Screen - PP Up
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x1261DC, 0xFF
PPUpPostUseFix:
	mov r0, r5
	bl PPUpPostUseFix + 0x1C @ItemUseCB_PPUpStep
	mov r8, r8
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Max Level Hack - Rare Candies
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x126C16, 0xFF
MaxLevelRareCandies:
	.byte MAX_LEVEL

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Stay On Item Screen - Rare Candies
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.org 0x126C76, 0xFF
RareCandiesPostUseFix:
	mov r1, r8
	bl RareCandiesPostUseFix + 0x1E @ItemUseCB_RareCandyStep
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x1369A2, 0xFF
	lsl r0, r4, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Max Level Hack - Summary Screen
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x136E6C, 0xFF
SummaryScreenExpDisplay1:
	.byte MAX_LEVEL - 1

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x136E88, 0xFF
	lsl r1, r0, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Hidden Abilities - Ability Names
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x136ED2, 0xFF
HiddenAbilityChange5_SummaryScreen:
	ldr r0, [r6]
	add r0, r8
	bl HiddenAbilityChange5_SummaryScreen - 0xF6AA6 @0x0804042C
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [r6]
	b HiddenAbilityChange5_SummaryScreen + 0x24 @0x08136710
.hword 0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA, 0xAAAA

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Max Level Hack - Summary Screen Exp Display
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x13B1BA, 0xFF
SummaryScreenExpDisplay2:
	.byte MAX_LEVEL - 1, 0x2D, 0x0, 0xD9

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x13B1C8, 0xFF
	lsl r0, r4, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Dynamic Overworld Palettes & More OW Sprites
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x153584, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x1535C4, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x153660, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x153700, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x153788, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x15379C, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x1537EE, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

.org 0x153882, 0xff	@16 bit sprite ids
	lsl r1, #0x10
	lsr r1, #0x10

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Ability Expansion Base Stats
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x159C66, 0xFF
	lsl r1, r5, #0x5
	mov r8, r8
	mov r8, r8

.org 0x159DC6, 0xFF
	lsl r0, r5, #0x5
	mov r8, r8
	mov r8, r8

.org 0x159ECE, 0xFF
	lsl r1, r0, #0x5
	mov r8, r8
	mov r8, r8

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Losing Trainer Battle 9
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.org 0x1BC846, 0xFF
	printstring 31 @;STRINGID_PLAYERWHITEOUT
	waitmessage 0x40
	end2

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Dynamic Overworld Palettes
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.org 0x1BD851, 0xff		@don't load sand palette on healing
	.byte 0x7, 0x18, 0x2D, 0x39, 0x8, 0x79, 0x37, 0x8, 0x8, 0x4
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Triple Layer Blocks
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x316FBB, 0xFF
	.byte 0x70
	
.org 0x316FC6, 0xFF
	.byte 0x1C
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Multichoice Pointers
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x3A567C, 0xFF
.word MULTICHOICE_STRING_LOADER
.word 0x2
.word MULTICHOICE_STRING_LOADER
.word 0x3
.word MULTICHOICE_STRING_LOADER
.word 0x4
.word MULTICHOICE_STRING_LOADER
.word 0x5
.word MULTICHOICE_STRING_LOADER
.word 0x6
.word MULTICHOICE_STRING_LOADER
.word 0x7

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Multichoice Width
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x3A579C, 0xFF
.byte MULTICHOICE_WIDTH
.byte MULTICHOICE_WIDTH
.byte MULTICHOICE_WIDTH
.byte MULTICHOICE_WIDTH
.byte MULTICHOICE_WIDTH
.byte MULTICHOICE_WIDTH

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Dynamic Overworld Palettes
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.org 0x422066, 0xff		@pal slot of scroll arrow in Fame Checker
	.byte 0x9
