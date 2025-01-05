.thumb
/*
pokedex_screen_stats.s
	displaying base stats in the pokedex screen
credits to DoesntKnowHowToPlay and Squeetz	
*/


@Hook at 0x106370 with r0
PokedexScreenStats:
	mov r5, #4
	str r5, [sp]
	str r6, [sp, #4]
	mov r0, r10
	cmp r0, #0
	beq unknown_base_stats
	
hp:
	mov r0, #0
	bl print_stat
	mov r3, #0 @ y co-ord
	str r3, [sp]
	mov r3, #8 @ x co-ord
	mov r1, #0
	str r1, [sp, #4]
	ldr r5, write_method
	bl call_via_r5
	
atk:
	mov r0, #1
	bl print_stat
	mov r3, #13 @ y co-ord
	str r3, [sp]
	mov r3, #8 @ x co-ord
	mov r1, #0
	str r1, [sp, #4]
	ldr r5, write_method
	bl call_via_r5

def:
	mov r0, #2
	bl print_stat
	mov r3, #26 @ y co-ord
	str r3, [sp]
	mov r3, #8 @ x co-ord
	mov r1, #0
	str r1, [sp, #4]
	ldr r5, write_method
	bl call_via_r5

spa:
	mov r0, #4
	bl print_stat
	mov r3, #39 @ y co-ord
	str r3, [sp]
	mov r3, #8 @ x co-ord
	mov r1, #0
	str r1, [sp, #4]
	ldr r5, write_method
	bl call_via_r5

spd:
	mov r0, #5
	bl print_stat
	mov r3, #52 @ y co-ord
	str r3, [sp]
	mov r3, #8 @ x co-ord
	mov r1, #0
	str r1, [sp, #4]
	ldr r5, write_method
	bl call_via_r5

spe:
	mov r0, #3
	bl print_stat
	mov r3, #65 @ y co-ord
	str r3, [sp]
	mov r3, #8 @ x co-ord
	mov r1, #0
	str r1, [sp, #4]
	ldr r5, write_method
	bl call_via_r5
/*
print_ability_one:
	ldr r0, [sp, #0x1C]
	mov r3, #0x1C
	mul r0, r3
	ldr r1, base_stats
	ldr r1, [r1]
	mov r3, #0x16
	add r1, r1, r3
	add r1, r0, r1
	ldrb r0, [r1]
	ldrh r1, [sp, #0x1C]
	bl TryRandomizeAbility
	bl GetAbilityName
	mov r2, r0
 
	ldr r1, [r6]
	add r1, #0x53
	ldrb r1, [r1]
	mov r0, r1
	mov r1, #0
	str r1, [sp, #4]
	mov r3, #46
	str r3, [sp]
	mov r3, #0
	ldr r5, write_method
	bl call_via_r5

print_ability_two:
	ldr r0, [sp, #0x1C]
	mov r3, #0x1C
	mul r0, r3
	ldr r1, base_stats
	ldr r1, [r1]
	mov r3, #0x16
	add r1, r1, r3
	add r1, r0, r1
	ldrb r2, [r1, #1]
	ldrb r5, [r1, #0]
	cmp r2, r5
	beq return
	cmp r2, #0
	beq return
	mov r0, r2
	ldrh r1, [sp, #0x1C]
	bl TryRandomizeAbility
	bl GetAbilityName
   	mov r2, r0
	
	ldr r1, [r6]
	add r1, #0x53
	ldrb r1, [r1]
	mov r0, r1
	mov r1, #0
	str r1, [sp, #4]
	mov r3, #60
	str r3, [sp]
	mov r3, #0
	ldr r5, write_method
	bl call_via_r5

*/
	b return

unknown_base_stats:
	mov r0, r1
	mov r1, #0
	str r1, [sp, #4]
	ldr r2, str_unknown
	mov r3, #4 @ y co-ord
	str r3, [sp]
	mov r3, #0 @ x co-ord
	ldr r5, write_method
	bl call_via_r5

return:
	mov r5, #0
	ldr r0, return_loc
	bx r0

print_stat:
	push {lr}
	ldr r3, =0x0203AC68
	ldr r3, [r3]
	add r3, #0x5A
	ldrh r3, [r3]
	mov r1, #0x1C
	mul r3, r1
	ldr r2, base_stats
	ldr r2, [r2]
	add r2, r3
	add r2, r0
	ldrb r1, [r2]
	mov r4, r0
	ldr r0, =gStringVar1
	mov r3, #0
	cmp r1, #99
	bhi no_leading_zeroes
	cmp r1, #9
	bhi one_leading_zero

two_leading_zeroes:
	str r3, [r0]
	add r0, #1

one_leading_zero:
	str r3, [r0]
	add r0, #1

no_leading_zeroes:
	mov r3, #3
	ldr r5, =ConvertIntToDecimalStringN
	bl call_via_r5

	mov r2, r4
	ldr r0, =gStringVar4
	ldr r1, str_table
	lsl r2, r2, #2
	add r1, r2
	ldr r1, [r1]
	ldr r5, =StringExpandPlaceholders
	bl call_via_r5
	ldr r1, [r6]
	add r1, #0x53
	ldrb r1, [r1]
	mov r0, r1
	mov r1, #0
	ldr r2, =gStringVar4
	pop {r5}

call_via_r5:
	bx r5

.align 2
	base_stats:	.word 0x80001BC
	str_table:	.word table
	str_unknown:	.word capture
	write_method:	.word 0x08105584|1
	return_loc:	.word 0x08106F0C|1
table:
	.word stat_hp
	.word stat_atk
	.word stat_def
	.word stat_spe
	.word stat_spa
	.word stat_spd
	
stat_hp:
	.byte 0x0, 0xC2, 0xCA, 0x0, 0x0, 0xFD, 0x2, 0xFF
	
stat_atk:
	.byte 0xA, 0x3, 0x3A, 0x7, 0x0, 0xFD, 0x2, 0xFF 
	
stat_def:
	.byte 0x4A, 0x3, 0x38, 0x36, 0x0, 0xFD, 0x2, 0xFF
	
stat_spe:
	.byte 0xD, 0x46, 0x24, 0xB, 0x0, 0xFD, 0x2, 0xFF
	
stat_spa:
	.byte 0x14, 0x8, 0xA, 0x3, 0x0, 0xFD, 0x2, 0xFF
	
stat_spd:
	.byte 0x14, 0x8, 0x4A, 0x3, 0x0, 0xFD, 0x2, 0xFF
	
capture:
	.byte 0xBD, 0xD5, 0xE4, 0xE8, 0xE9, 0xE6, 0xD9, 0x0, 0xDA, 0xE3, 0xE6, 0xFE, 0xE1, 0xE3, 0xE6, 0xD9, 0x0, 0xDD, 0xE2, 0xDA, 0xE3, 0xE6, 0xE1, 0xD5, 0xE8, 0xDD, 0xE3, 0xE2, 0xAB, 0xFF
