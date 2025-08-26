.text
.align 2
.thumb
.thumb_func

.include "../asm_defines.s"

@@ Direct PC Selection (credit to ghoulslash)
.global pcSelect_ClosingCheck
.global pcSelect_HackWithdrawBRM
.global pcSelect_ForceMulti
.global pcSelect_ChooseSelect
.global pcSelect_newBrmTable
.global pcSelect_NoPartyString
.global pcSelect_OperationsMsg
.global pcSelect_OperationsTable
.global pcSelect_SkipMultiGen
.global pcSelect_SkipWithdrawCount
.global pcSelect_SwapDecision


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@Swap Yes/No Outcomes
@	hook at 8ed8c via r1
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
pcSelect_SwapDecision:
	push {r4}
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
	ldr r4, =pcSelect_StateTracker
	ldrb r4, [r4]
	cmp r4, #0x3
	bne RegularChecks
SwapChecks:
	pop {r4}
	cmp r1, #0x0	@'yes'
	beq StoreAndCancel
	cmp r1, #0x0
	bgt CheckSwapNo
	mov r0, #0x1
	neg r0, r0
	cmp r1, r0
	beq ResetSwapandContinue
CheckSwapNo:
	cmp r1, #0x1	@'no'
	beq ResetSwapandContinue
DefaultCase:
	ldr r0, =(0x0808E840 +1)	@do nothing
	bx r0

StoreAndCancel:
	ldr r0, =BoxDMA
	ldr r0, [r0]
	ldrb r0, [r0]	@ current box
	ldr r1, =var8000
	strh r0, [r1]	@ store current box to var8000
	ldr r0, =(0x0203976D)	@box pos
	ldrb r0, [r0]
	strh r0, [r1, #0x2]		@store box pos to var8001
	bl StoreSpeciesID
	ldr r0, =pcSelect_StateTracker
	mov r1, #0xFE
	strb r1, [r0]	@ force exit from multichoice
	ldr r1, =var800d
	mov r0, #0x0
	strh r0, [r1]	@ set lastresult to 0
CancelOperations:
	ldr r0, =(0x0808E7F4 +1)
	bx r0

ResetSwapandContinue:
	ldr r0, =pcSelect_StateTracker
	mov r1, #0x2
	strb r1, [r0]	@ undo yes/no swap
	b ContinueOperations

RegularChecks:
	pop {r4}
	cmp r1, #0x0	@yes
	beq ContinueOperations
	cmp r1, #0x0
	bgt CheckNo
	mov r0, #0x1
	neg r0, r0
	cmp r1, r0
	beq CancelRegular
	b DefaultCase

CheckNo:
	cmp r1, #0x1	@'no'
	beq CancelRegular
	b DefaultCase

ContinueOperations:
	ldr r0, =(0x0808E7E4 +1)	@ remove yes/no box
	bx r0

CancelRegular:
	ldr r1, =pcSelect_StateTracker
	ldrb r0, [r1]
	cmp r0, #0x0
	beq CancelOperations	@ if not in hack, just cancel
@ else, set relevant ram
	mov r0, #0x7F
	ldr r1, =var800d	@ set lastresult 0x7f if cancelling out
	strh r0, [r1]
	ldr r1, =pcSelect_StateTracker
	mov r0, #0xFE
	strb r0, [r1]
	b CancelOperations

StoreSpeciesID:
	push {r2,lr}
	ldr r2, =var8000
	ldrh r0, [r2]
	ldrh r1, [r2, #0x2]
	mov r2, #11 @REQ_SPECIES
	bl GetBoxMonDataAt
	ldr r2, =var8000
	strh r0, [r2, #0x4]		@species to var8002
	pop {r2,pc}


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@Discern between closing box and Selection
@	hook at 8ebb2 via r0
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.align 2
.pool
pcSelect_ClosingCheck:
	ldr r1, =pcSelect_StateTracker
	ldrb r0, [r1]
	cmp r0, #0x0
	beq ProceedCloseBox
IndicateCloseBox:
	mov r0, #0xFE	@ force exit from multichoice
	strb r0, [r1]
	mov r0, #0x7F
	ldr r1, =var800d
	strh r0, [r1]	@ store 0x7f into lastresult if closing without selecting
ProceedCloseBox:
	ldr r0, =(0x020396FC)
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, #0x4
	bls LoadTable
	pop {r4}
	pop {r0}
	bx r0
LoadTable:
	ldr r1, =(0x0808E5FA +1)
	bx r1


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@Hack Withdraw Box Options
@	hook via r0 at 94982
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.align 2
.pool
pcSelect_HackWithdrawBRM:
	cmp r1, #0x0
	beq NoPokeSelected
CheckHack:
	ldr r0, =pcSelect_StateTracker
	ldrb r0, [r0]
	cmp r0, #0x0
	beq WithdrawBRM
CustomBRM:
	mov r0, #0x26	@select
	bl BRMAdd
	mov r0, #0x6	@summary
	bl BRMAdd
	ldr r0, =(0x08094432 +1)
	bx r0

WithdrawBRM:
	mov r0, #0x2	@withdraw
	bl BRMAdd
	ldr r0, =(0x080943F4 +1)
	bx r0

NoPokeSelected:
	ldr r0, =(0x080943F0 +1)
	bx r0

BRMAdd:
	ldr r1, =(0x08094820 +1)
	bx r1


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@Change 'Party' String
@	hook via r0 at 8d3b8
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.align 2
.pool
pcSelect_NoPartyString:
	ldr r0, =pcSelect_StateTracker
	ldrb r0, [r0]
	cmp r0, #0x0
	beq RegularPartyMsg
BetterPartyMsg:
	mov r0, #0x1F
	b LoadPartyMsg
RegularPartyMsg:
	mov r0, #0x10
LoadPartyMsg:
	bl LoadFromTable
	ldr r1, [r4]
	ldr r0, =(0x0808CDFC +1)
	bx r0

LoadFromTable:
	ldr r1, =(0x0808F5E0 +1)
	bx r1


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Replace Box Cancel Msg
@	hook at 8ed54 via r0
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.align 2
.pool
pcSelect_OperationsMsg:
	mov r0, #0x5
	bl play_audio
	ldr r0, =pcSelect_StateTracker
	ldrb r0, [r0]
	cmp r0, #0x3	@ selected poke -> ask to select
	beq AskTradeOp
	mov r0, #0x12	@'continue box operations?' -> else, hit 'B' in menu as normal
	b LoadOperation
AskTradeOp:
	mov r0, #0x20	@ask select
LoadOperation:
	ldr r1, =(0x0808E798 +1)
	bx r1

play_audio:
	ldr r1, =(0x08071A70 +1)
	bx r1


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Skip Multichoice box Generation
@	hook at 8c3e0 via r0
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.align 2
.pool
pcSelect_SkipMultiGen:
	mov r0, #0x1c
	bl help_system_set_context
	ldrb r0, [r5, #0xa]
	mov r1, r5
	add r1, #0x26
	ldr r2, =pcSelect_StateTracker
	ldrb r2, [r2]
	cmp r2, #0x0
	beq CreateMultiBoxes
SkipMultiBoxes:
	ldr r0, =(0x0808BE38 +1)
	bx r0

CreateMultiBoxes:
	ldr r2, =(0x0808BE28 +1)
	bx r2

help_system_set_context:
	ldr r1, =(0x0812B9F4 +1)
	bx r1


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Remove Pokemon Limit from Withdraw
@	hook at 8c53c via r1
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.align 2
.pool
pcSelect_SkipWithdrawCount:
	ldr r1, =pcSelect_StateTracker
	ldrb r1, [r1]
	cmp r1, #0x0
	beq CheckWithdrawLimit
	mov r0, #0xFF	@ remove limit
CheckWithdrawLimit:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bne SpaceAvailable
	ldr r0, =(0x0808BF80 +1)
	bx r0
SpaceAvailable:
	ldr r1, =(0x0808BFA0 +1)
	bx r1

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Force Multichoice Selections
@	hook at 10f99c via r1
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.align 2
.pool
pcSelect_ForceMulti:
	ldr r1, =pcSelect_StateTracker
	ldrb r1, [r1]
	cmp r1, #0x0
	beq RegularButtonChecks
	cmp r1, #0x1		@ activate withdraw
	beq ForceWithdraw
	cmp r1, #0xFE
	bne RegularButtonChecks
ForceExit:
	ldr r0, =(0x08110500 +1)
	bx r0
ForceWithdraw:
	ldr r0, =pcSelect_StateTracker
	mov r1, #0x2
	strb r1, [r0]
	ldr r0, .choice_curr
	mov r4, #0x0
	strb r4, [r0]	@force first choice (withdraw)
	ldr r4, =(0x0203AD5C)	@choice_x
	ldr r0, =(0x081104E8 +1)
	bx r0

RegularButtonChecks:
	ldrh r1, [r0, #0x2e]	@button pressed
	mov r0, #0x1	@'a'
	and r0, r1
	cmp r0, #0x0
	beq CheckB
PressA:
	ldr r4, =(0x081104DA +1)
	bx r4
CheckB:
	ldr r0, =(0x081104F8 +1)
	bx r0

.align 2
.choice_curr: .word 0x0203AD5E


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@Choose 'Select'
@	hook at 8d934 via r1
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.align 2
.pool
pcSelect_ChooseSelect:
	bl CheckButtons	@ check buttons and return index
	add r0, #0x1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	cmp r0, #0x27	@ select index+1
	bge DoSelectFunc
	ldr r1, =(0x0808D37A +1)
	bx r1

DoSelectFunc:
	ldr r0, =pcSelectionFunc
	mov pc, r0

CheckButtons:
	ldr r1, =(0x080949BC +1)
	bx r1

.align 2
pcSelectionFunc:
	bl BoxClosing
	ldr r0, =pcSelect_StateTracker
	mov r1, #0x3
	strb r1, [r0]
	ldr r0, =(0x0808E720 +1)	@ cancel box func
	bl dp17_task_set_function
	pop {r4}
	pop {r0}
	bx r0

BoxClosing:
	ldr r0, =(0x0808F75C +1)
	bx r0

dp17_task_set_function:
	ldr r1, =(0x0808CA34 +1)
	bx r1

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Physical Special Split Icon Loading Routine
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.equ SUMMARY_SCREEN_DATA, 0x203B0B4

.align 2
.pool
PhysicalSpecialSplitIconRoutine:
	push {r0-r4}
	ldr r0, =0x203B0E1
	ldrb r1, [r0]
	lsl r1, #0x1
	ldr r0, =SUMMARY_SCREEN_DATA
	ldr r0, [r0]
	ldr r3, .3204
	add r0, r3
	add r0, r1
	ldrh r3, [r0]
	cmp r3, #0x0
	beq PSSIconRoutineEnd
	lsl r0, r3, #0x1
	add r0, r3
	lsl r0, #0x2
	ldr r1, =gBattleMoves
	add r0, r1
	ldrb r4, [r0, #0xA]
	lsl r0, r4, #0x1
	add r4, r0
	lsl r4, #0x6
	ldr r0, =PSSIconsTiles
	add r0, r4
	ldr r1, =0x6001800
	mov r2, #0x30
	swi 0xB
	ldr r0, =PSSIconsTiles
	add r0, r4
	add r0, #0x60
	ldr r1, =0x6001800
	mov r2, #0x1E
	lsl r2, #0x4
	add r1, r2
	mov r2, #0x30
	swi 0xB

PSSIconRoutineEnd:
	pop {r0-r4}
	ldr r4, =0x203B0BC
	ldr r0, [r4]
	ldr r1, =0x813A954 | 1
	bx r1

.align 2
.3204: .word 0x3204

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Expanded PC BRM Table
@	pointer 94e48
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.align 2
.pool
pcSelect_newBrmTable:
.word 0x083DF09F
.word 0x083DF0A6
.word 0x083DF0AD
.word 0x083DF0BB
.word 0x083DF0B4
.word 0x083DF0C2
.word 0x083DF0C9
.word 0x083DF0D0
.word 0x083DF0D7
.word 0x083DF0E5
.word 0x083DF0EA
.word 0x083DF0DE
.word 0x083DF0F1
.word 0x083DF0F6
.word 0x083DF0F6
.word 0x083DF0FB
.word 0x083DF101
.word 0x083DF106
.word 0x083DF10B
.word 0x083DF111
.word 0x083DF117
.word 0x083DF11D
.word 0x083DF123
.word 0x083DF126
.word 0x083DF12A
.word 0x083DF12E
.word 0x083DF133
.word 0x083DF138
.word 0x083DF13C
.word 0x083DF141
.word 0x083DF146
.word 0x083DF14A
.word 0x083DF14F
.word 0x083DF152
.word 0x083DF155
.word 0x083DF158
.word 0x083DF15D
.word 0x083DF161
.word select_str	@0x26

select_str: .byte S_, e_, l_, e_, c_, t_, 0xff

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ New Operations String Table
@	pointers 8fbc8, 8fce4
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.align 2
.pool
pcSelect_OperationsTable:
.word 0x083DEEEB,0x0
.word 0x083DEEFE,0x0
.word 0x083DEF0E,0x0
.word 0x083DEF1B,0x0
.word 0x083DEF29,0x1
.word 0x083DEF35,0x0
.word 0x083DEF48,0x0
.word 0x083DEF59,0x1
.word 0x083DEF64,0x0
.word 0x083DEF73,0x0
.word 0x083DEF81,0x4
.word 0x083DEF91,0x6
.word 0x083DEF9A,0x0
.word 0x083DEFA6,0x0
.word 0x083DEFB9,0x0
.word 0x083DEFC6,0x0
.word 0x083DEFD7,0x0
.word 0x083DEFE9,0x0
.word 0x083DEFFC,0x0
.word 0x083DF00D,0x1
.word 0x083DF019,0x0
.word 0x083DF027,0x0
.word 0x083DF02E,0x0
.word 0x083DEF29,0x7
.word 0x083DF03E,0x0
.word 0x083DF04B,0x7
.word 0x083DF058,0x0
.word 0x083DF065,0x0
.word 0x083DF076,0x7
.word 0x083DF080,0x7
.word 0x083DF08B,0x0
.word selectPoke_str, 0x0	@ 0x1F
.word askSelect_str, 0x1		@ 0x20

askSelect_str: .byte S_, e_, l_, e_, c_, t_, Space, 0xf7, 0x0, Interro, 0xff
selectPoke_str: .byte S_, e_, l_, e_, c_, t_, Space, a_, Space, P_, o_, k_, e_, m_, o_, n_, Dot, 0xff

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Add Font
@	pointer 9F456
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.align 2
.pool
AddFontHook:
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsr r2, r0, #0x18
	cmp r2, #0x53
	beq ChangeVu
	mov r3, #0xFA
	lsl r3, r3, #0x18
	add r0, r0, r3
	lsr r0, r0, #0x18
	cmp r0, #0x4
	bhi NotKaGyou
	ldr r0, =(0x0809F46A +1)
	bx r0

ChangeVu:
	add r0, r2, #0x0
	add r0, #0x9E
	ldr r3, =(0x0809F50A +1)
	bx r3

NotKaGyou:
	ldr r0, =(0x0809F470 +1)
	bx r0

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Dakuten Check
@	pointer 9F3BE
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.align 2
.pool
DakutenCheck:
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #0x53
	beq DakutenOK
	mov r2, #0xFA
	lsl r2, r2, #0x18
	add r0, r0, r2
	lsr r0, r0, #0x18
	cmp r0, #0xE
	bls DakutenOK
	ldr r0, =(0x0809F3CE +1)
	bx r0

DakutenOK:
	ldr r0, =(0x0809F40A +1)
	bx r0

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Dakuten HealthBar
@	pointer 48E36
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.align 2
.pool
DakutenHealthBar:
	ldr r0, =0x20228FC
	add r0, r5, r0
	ldrb r1, [r0]
	cmp r1, #0xF1
	beq DakutenHealthBarReturn
	add r0, r1, #0
	sub r0, #0x37
	ldr r2, =(0x08048E40 +1)
	bx r2

DakutenHealthBarReturn:
	ldr r0, =(0x08048E54 +1)
	bx r0
	