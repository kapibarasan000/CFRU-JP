.text
.thumb
.align 2

.include "../asm_defines.s"

.global MultiInitPokemonOrderHook
.global MultiEnemyPokeballReadoutHook
.global MultiBattleAddSecondOpponentHook
.global MultiMoneyCalcHook
.global MultiTrainerSendOutHook
.global MultiTrainersSendOutHook3
.global PartnerSetupHook

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

MultiInitPokemonOrderHook:
	bl MultiInitPokemonOrder
	mov r9, r4
        mov r10, r5
        pop {r4-r7,pc}

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

MultiEnemyPokeballReadoutHook:
        bl IsMultiBattle
        cmp r0, #0
        bne RenderBallReadoutSplit
        mov r1, r10
        ldr r0, [r1]
        ldr r1, .TwoOpponents
        and r0, r1
        cmp r0, #0
        bne RenderBallReadoutSplit

RenderBallReadoutNormally:
        ldr r0, =0x080486C8|1
        bx r0

RenderBallReadoutSplit:
        ldr r0, =0x08048694|1
        bx r0

.align 2
.TwoOpponents: .word BATTLE_TWO_OPPONENTS

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

MultiBattleAddSecondOpponentHook:
        bl MultiBattleAddSecondOpponent

        @@ Increment battle bank
        mov r2, r8
        ldrb r0, [r2]
        add r0, #1
        strb r0, [r2]
        ldr r1, =0x08012B30|1
        bx r1

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

MultiMoneyCalcHook:
        bl MultiMoneyCalc
        mov r4, r0
        ldr r1, =0x3005048 @saveblock1
        mov r8, r1
        ldr r1, =0x080251C8|1
        bx r1

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

MultiTrainerSendOutHook:
	ldr r0, [r0] @Battle Type Flags
	ldr r1, =BATTLE_MULTI | BATTLE_TWO_OPPONENTS
	and r0, r1
	cmp r0, #0x0
	beq NoSecondOpponentSendOut
	ldr r0, =0x8012DFC | 1
	bx r0

NoSecondOpponentSendOut:
	ldr r0, =0x8012E20 | 1
	bx r0

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

PartnerSetupHook:
        bl ChooseProperPartnerController
        ldr r0, =0x800CE9C | 1
        bx r0
