.thumb
.text
.align 2

.include "../anim_defines.s"
/*.include "../asm_defines.s" Don't Uncomment This!*/

/*
playanimation_table.s
	table of extra animations
*/

.equ FALSE, 0
.equ TRUE, 1

.global gBattleAnims_General

gBattleAnims_General:
.word 0x81B9B44	@ ANIM_NOTHING		original 0x1c6ea8
.word 0x81B9B7A	@ ANIM_STAT_BUFF
.word 0x81B9B83	@ ANIM_SUBSTITUTE_REMOVAL
.word 0x81B9BC0	@ ANIM_CREATE_SUBSTITUTE
.word 0x81B9BC8	@ ANIM_POKEBLOCK_TRANSFORM
.word ANIM_KNOCK_OFF_ITEM
.word ANIM_WRAPPED_END_TURN	@ ANIM_WRAP
.word ANIM_USEITEM	@ ANIM_ITEM_USE
.word 0x81B9E22	@ ANIM_SMOKE_BALL
.word 0x81B9EFE	@ ANIM_CHARGE
.word 0x81B9F4B	@ ANIM_RAIN
.word 0x81B9F94	@ ANIM_SUN
.word 0x81B9F99	@ ANIM_SANDSTORM
.word 0x81B9F9E	@ ANIM_HAIL
.word 0x81B9FA3	@ ANIM_LEECH_SEED_HEAL
.word 0x81B9FB1	@ ANIM_HIT
.word ANIM_STEAL_ITEM
.word 0x81BA007	@ ANIM_SNATCH_GRAB_STAT_BOOST
.word 0x81BA065	@ ANIM_FUTURE_SIGHT_HIT
.word 0x81BA0C4	@ ANIM_DOOM_DESIRE_HIT
.word 0x81BA189	@ ANIM_FOCUS_PUNCH_PUMP
.word 0x81BA1C9	@ ANIM_INGRAIN_RECOVER
.word 0x81BA20C	@ ANIM_DARK_SCREEN_RECOVER
.word 0x81BA246	@ ANIM_ASTONISH_DROPS
.word 0x81BA2BD	@ ANIM_SCARY_FACE_ASTONISH
.word 0x81BA337	@ ANIM_TRANSFORM_FRONT
.word 0x81BA350	@ ANIM_TURN_INTO_ROCK
.word 0x81BA398	@ ANIM_WAITING_WAGGLE
.word 0x81BA472	@ ANIM_LEVEL_UP_SHINE
.word 0x81BA493	@ ANIM_CALL_BACK_POKEMON
.word 0x81BA4A4	@ ANIM_CALL_BACK_POKEMON_2
.word 0x81BA4B5	@ ANIM_CAPTURE_POKEMON
.word 0x81BA537	@ ANIM_TURN_INTO_POKEBALL
.word 0x81BA550	@ ANIM_SWITCH
.word 0x81BA55A	@ ANIM_CREATE_SUBSTITUTE_2
.word ANIM_TRANSFORM
.word ANIM_WISHIWASHI_FISH
.word ANIM_ZYGARDE_CELL_SWIRL
.word ANIM_DELTA_STREAM
.word ANIM_ELECTRIC_SURGE
.word ANIM_GRASSY_SURGE
.word ANIM_MISTY_SURGE
.word ANIM_PSYCHIC_SURGE
.word ANIM_SEA_OF_FIRE
.word ANIM_HEALING_SPARKLES
.word ANIM_LUNAR_DANCE_HEAL
.word ANIM_HEALING_WISH_HEAL
.word ANIM_RED_PRIMAL_REVERSION
.word ANIM_BLUE_PRIMAL_REVERSION
.word ANIM_GRASSY_TERRAIN_HEAL
.word ANIM_POWDER_EXPLOSION
.word ANIM_BEAK_BLAST_WARM_UP
.word ANIM_SHELL_TRAP_SET
.word ANIM_BERRY_EATING
.word ANIM_FOG_CONTINUES
.word ANIM_AQUA_RING_HEAL
.word ELECTRIC_TERRAIN_ACTIVE_ANIM
.word GRASSY_TERRAIN_ACTIVE_ANIM
.word MISTY_TERRAIN_ACTIVE_ANIM
.word PSYCHIC_TERRAIN_ACTIVE_ANIM
.word BATON_PASS_ANIM
.word DRAGON_TAIL_BLOW_AWAY_ANIM
.word ANIM_ZMOVE_ACTIVATE
.word ANIM_MEGA_EVOLUTION
.word ANIM_ULTRA_BURST
.word ANIM_LOAD_DEFAULT_BG
.word ANIM_LOAD_ABILITY_POP_UP
.word ANIM_REMOVE_ABILITY_POP_UP
.word ANIM_TOTEM_BOOST
.word ANIM_DYNAMAX_START
.word ANIM_DYNAMAX_ENERGY_SWIRL
.word ANIM_RAID_BATTLE_STORM
.word ANIM_RAID_BATTLE_ENERGY_BURST
.word ANIM_G_MAX_VINE_LASH
.word ANIM_G_MAX_WILDFIRE
.word ANIM_G_MAX_CANNONADE
.word ANIM_G_MAX_VOLCALITH
.word ANIM_TERASTAL
.word ANIM_SUBSTITUTE2
.word ANIM_SALTCURE_END_TURN
.word ANIM_SYRUPBOMB_END_TURN
.word ANIM_AI_ITEM_HEAL

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_USEITEM:
	loadparticle ANIM_TAG_THIN_RING
	loadparticle ANIM_TAG_SPARKLE_2
	pause 0x0
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_DEF 0x2 0x0 0x9 0x7FFF
	playsound2 0x91 SOUND_PAN_ATTACKER
	launchtask AnimTask_RotateMonToSideAndRestore 0x2 0x4 0x10 0x80 bank_attacker 0x2
	waitanimation
	playsound2 0x91 SOUND_PAN_ATTACKER
	launchtask AnimTask_RotateMonToSideAndRestore 0x2 0x4 0x10 0x80 bank_attacker 0x2
	waitanimation
	playsound2 0x5F SOUND_PAN_ATTACKER
	launchtask AnimTask_pal_fade 0xa 0x5 0x2 0x3 0x7 0x0 0x67f1
	launchtemplate Template_Ring 0x3 0x4 0x0 0x0 0x0 0x0
	waitanimation
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_STEAL_ITEM:
	launchtask AnimTask_SetAnimAttackerAndTargetForEffectAtk 0x2 0x0
	launchtask AnimTask_TargetToEffectBattler 0x2 0x0
	pause 0x1
	launchtask AnimTask_CreateStealItem 0x2 0x5 0x0 0xFFFB 0xA 0x2 0xFFFF
	waitanimation
	unloadparticle ANIM_TAG_ITEM_BAG @;The generated item sprite uses this tag
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_KNOCK_OFF_ITEM:
	launchtask AnimTask_CreateKnockOffItem 0x2 0x0
	waitanimation
	unloadparticle ANIM_TAG_ITEM_BAG @;The generated item sprite uses this tag
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_WRAPPED_END_TURN:
	launchtask AnimTask_GetTrappedMoveAnimId 0x5 0x0
	jumpifargmatches 0x0 0x1 0x81B9C8F 	@Fire Spin
	jumpifargmatches 0x0 0x2 0x81B9CB4 	@Whirlpool
	jumpifargmatches 0x0 0x3 ANIM_CLAMP 	@Clamp
	jumpifargmatches 0x0 0x4 0x81B9D65 	@Sand Tomb
	jumpifargmatches 0x0 0x5 0x81B9C8F 	@Magma Storm
	jumpifargmatches 0x0 0x6 ANIM_INFESTATION
	jumpifargmatches 0x0 0x7 ANIM_SNAP_TRAP
	jumpifargmatches 0x0 0x8 ANIM_OCTOLOCK
	jumpifargmatches 0x0 0x9 ANIM_THUNDER_CAGE
	goto 0x81B9C47

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_TRANSFORM:
	pokespritetoBG bank_attacker 
	playsound2 0xc4 SOUND_PAN_ATTACKER 
	playsoundwait 0xc5 SOUND_PAN_ATTACKER 0x30 
	launchtask AnimTask_sprite_transform 0x2 0x1 0xFE
	waitanimation 
	pokespritefromBG bank_attacker 
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_WISHIWASHI_FISH:
	loadparticle ANIM_TAG_WISHIWASHI_FISH @Fish
	loadparticle ANIM_TAG_SMALL_BUBBLES @Bubbles
	soundcomplex 0x75 SOUND_PAN_ATTACKER 0x3 0x10
	pokespritetoBG bank_attacker
	leftbankBG_over_partnerBG bank_attacker
	call WISHIWASHI_SWIRL_PARTICLES
	launchtask AnimTask_sprite_transform 0x2 0x1 0xFE
	call WISHIWASHI_SWIRL_PARTICLES
	call WISHIWASHI_SWIRL_PARTICLES
	waitanimation
	launchtask AnimTask_PlayAttackerCry 0x1 0x2 0x0 0xff
	waitanimation
	pokespritefromBG bank_attacker
	endanimation

WISHIWASHI_SWIRL_PARTICLES:
	launchtemplate WISHIWASHI_FISH 0x82 0x7 0x0 0x1c 0x210 0x1e 0xd 0x32 0x1
	pause 0x2
	launchtemplate WISHIWASHI_BUBBLES 0x82 0x7 0x0 0x20 0x1e0 0x14 0x10 0xffd2 0x1
	pause 0x2
	launchtemplate WISHIWASHI_FISH 0x82 0x7 0x0 0x21 0x240 0x14 0x8 0x2a 0x1
	pause 0x2
	launchtemplate WISHIWASHI_BUBBLES 0x82 0x7 0x0 0x1f 0x190 0x19 0xb 0xffd6 0x1
	pause 0x2
	launchtemplate WISHIWASHI_FISH 0x82 0x7 0x0 0x1c 0x200 0x19 0x10 0x2e 0x1
	pause 0x2
	launchtemplate WISHIWASHI_BUBBLES 0x82 0x7 0x0 0x21 0x1d0 0x1e 0xf 0xffce 0x1
	pause 0x2
	return

.align 2
WISHIWASHI_FISH: objtemplate ANIM_TAG_WISHIWASHI_FISH ANIM_TAG_WISHIWASHI_FISH 0x8370A00 0x83AA144 0x0 gDummySpriteAffineAnimTable 0x80B5A3D
WISHIWASHI_BUBBLES: objtemplate ANIM_TAG_SMALL_BUBBLES ANIM_TAG_SMALL_BUBBLES 0x8370B80 0x83ACFBC 0x0 0x83ADFF8 0x80B5A3D

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_ZYGARDE_CELL_SWIRL:
	loadparticle ANIM_TAG_ZYGARDE_HEXES
	loadparticle ANIM_TAG_BUBBLE
	loadparticle ANIM_TAG_IMPACT
	loadparticle ANIM_TAG_ROCKS
	pokespritetoBG bank_target
	leftbankBG_over_partnerBG bank_target
	launchtask AnimTask_pal_fade 0xa 0x5 0x1 0x0 0x0 0xf 0xc0
	pause 0xa
	playsound2 0xe3 SOUND_PAN_ATTACKER
	launchtemplate ZYGARDE_CELL 0x82 0x5 0x78 0x46 0x5 0x46 0x1e
	pause 0x1
	playsound2 0xe3 SOUND_PAN_ATTACKER
	launchtemplate ZYGARDE_CELL 0x82 0x5 0x73 0x37 0x6 0x3c 0x19
	pause 0x1
	playsound2 0xe3 SOUND_PAN_ATTACKER
	launchtemplate ZYGARDE_CELL 0x82 0x5 0x73 0x3c 0x7 0x3c 0x1e
	launchtemplate ZYGARDE_CELL 0x82 0x5 0x73 0x37 0xa 0x3c 0x1e
	pause 0x3
	playsound2 0xe3 SOUND_PAN_ATTACKER
	launchtemplate ZYGARDE_CELL 0x82 0x5 0x64 0x32 0x4 0x32 0x1a
	pause 0x1
	playsound2 0xe3 SOUND_PAN_ATTACKER
	launchtemplate ZYGARDE_CELL 0x82 0x5 0x69 0x19 0x8 0x3c 0x14
	pause 0x1
	playsound2 0xe3 SOUND_PAN_ATTACKER
	launchtemplate ZYGARDE_CELL 0x82 0x5 0x73 0x28 0xa 0x30 0x1e
	pause 0x3
	playsound2 0xe3 SOUND_PAN_ATTACKER
	launchtask AnimTask_sprite_transform 0x2 0x1 0xFE
	launchtemplate ZYGARDE_CELL 0x82 0x5 0x78 0x1e 0x6 0x2d 0x19
	launchtemplate ZYGARDE_CELL 0x82 0x5 0x73 0x23 0xa 0x3c 0x1e
	pause 0x3
	launchtemplate ZYGARDE_CELL 0x82 0x5 0x69 0x14 0x8 0x28 0x0
	pause 0x3
	playsound2 0xe3 SOUND_PAN_ATTACKER
	launchtemplate ZYGARDE_CELL 0x82 0x5 0x14 0xff 0xf 0x20 0x0
	launchtemplate ZYGARDE_CELL 0x82 0x5 0x6e 0xa 0x8 0x20 0x14
	waitanimation
	launchtask AnimTask_pal_fade 0xa 0x5 0x1 0x1 0xf 0x0 0xc0
	waitanimation
	pokespritefromBG bank_target
	launchtask AnimTask_PlayAttackerCry 0x1 0x2 0x0 0xff
	waitanimation
	resetblends
	endanimation

.align 2
ZYGARDE_CELL: objtemplate ANIM_TAG_ZYGARDE_HEXES ANIM_TAG_ZYGARDE_HEXES 0x8370A00 0x83AA144 0x0 gDummySpriteAffineAnimTable 0x80A3FD1

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_DELTA_STREAM:
	loadparticle ANIM_TAG_FLYING_DIRT
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_FLYING_DIRT 0x0 0x6 0x6 0x7fff
	launchtask AnimTask_LoadSandstormBackground 0x5 0x1 0x1
	launchtask AnimTask_BlendBackground 0x6 0x2 0x6 0x7fff
	playsound2 0x7d SOUND_PAN_ABOVE
	pause 0x44
	playsound2 0x7e SOUND_PAN_ABOVE
	pause 0x38
	waitanimation
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_ELECTRIC_SURGE:
	loadparticle ANIM_TAG_ELECTRIC_ORBS
	playsound2 0xce SOUND_PAN_ATTACKER
	launchtemplate ELECTRIC_SURGE_1 0x2 0x2 0x1a 0x0
	launchtemplate ELECTRIC_SURGE_1 0x2 0x2 0x1a 0x2a
	launchtemplate ELECTRIC_SURGE_1 0x2 0x2 0x1a 0x54
	launchtemplate ELECTRIC_SURGE_1 0x2 0x2 0x1a 0x7e
	launchtemplate ELECTRIC_SURGE_1 0x2 0x2 0x1a 0xa8
	launchtemplate ELECTRIC_SURGE_1 0x2 0x2 0x1a 0xd2
	pause 0x34
	setarg 0x7 0xffff
	playsound2 0xdb SOUND_PAN_ATTACKER
	launchtask AnimTask_ScaleMonAndRestore 0x5 0x5 0xfff9 0xfff9 0xb 0x0 0x0
	launchtemplate ELECTRIC_SURGE_2 0x82 0x1 0x0
	launchtemplate ELECTRIC_SURGE_2 0x82 0x1 0x20
	launchtemplate ELECTRIC_SURGE_2 0x82 0x1 0x40
	launchtemplate ELECTRIC_SURGE_2 0x82 0x1 0x60
	launchtemplate ELECTRIC_SURGE_2 0x82 0x1 0x80
	launchtemplate ELECTRIC_SURGE_2 0x82 0x1 0xa0
	launchtemplate ELECTRIC_SURGE_2 0x82 0x1 0xc0
	launchtemplate ELECTRIC_SURGE_2 0x82 0x1 0xe0
	waitanimation
ELECTRIC_TERRAIN_ACTIVE_ANIM:
	loaddefaultBG @At this point the new BG is in effect
	waitbgfadein
	playsound2 0x70 SOUND_PAN_ABOVE
	pause 0x40
	playsound2 0x70 SOUND_PAN_ABOVE
	pause 0x40
	endanimation

.align 2
ELECTRIC_SURGE_1: objtemplate ANIM_TAG_ELECTRIC_ORBS ANIM_TAG_ELECTRIC_ORBS 0x83709F8 0x83AD65C 0x0 gDummySpriteAffineAnimTable 0x80AB435
ELECTRIC_SURGE_2: objtemplate ANIM_TAG_ELECTRIC_ORBS ANIM_TAG_ELECTRIC_ORBS 0x83709F8 0x83AD65C 0x0 gDummySpriteAffineAnimTable 0x80AB571

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_GRASSY_SURGE:
	loadparticle ANIM_TAG_ORBS
	loadparticle ANIM_TAG_GREEN_SPARKLE
	playsound2 0x91 SOUND_PAN_ATTACKER
	launchtemplate GRASSY_TERRAIN_2 0x2 0x2 0x1a 0x0
	launchtemplate GRASSY_TERRAIN_2 0x2 0x2 0x1a 0x2a
	launchtemplate GRASSY_TERRAIN_2 0x2 0x2 0x1a 0x54
	launchtemplate GRASSY_TERRAIN_2 0x2 0x2 0x1a 0x7e
	launchtemplate GRASSY_TERRAIN_2 0x2 0x2 0x1a 0xa8
	launchtemplate GRASSY_TERRAIN_2 0x2 0x2 0x1a 0xd2
	pause 0x34
	setarg 0x7 0xffff
	playsound2 0xbc SOUND_PAN_ATTACKER
	launchtask AnimTask_ScaleMonAndRestore 0x5 0x5 0xfff9 0xfff9 0xb 0x0 0x0
	launchtemplate GRASSY_TERRAIN_1 0x82 0x1 0x0
	launchtemplate GRASSY_TERRAIN_1 0x82 0x1 0x20
	launchtemplate GRASSY_TERRAIN_1 0x82 0x1 0x40
	launchtemplate GRASSY_TERRAIN_1 0x82 0x1 0x60
	launchtemplate GRASSY_TERRAIN_1 0x82 0x1 0x80
	launchtemplate GRASSY_TERRAIN_1 0x82 0x1 0xa0
	launchtemplate GRASSY_TERRAIN_1 0x82 0x1 0xc0
	launchtemplate GRASSY_TERRAIN_1 0x82 0x1 0xe0
	waitanimation
GRASSY_TERRAIN_ACTIVE_ANIM:
	loaddefaultBG @At this point the new BG is in effect
	waitbgfadein
	playsound2 0xC3 SOUND_PAN_ABOVE
	waitforsound
	endanimation

.align 2
GRASSY_TERRAIN_1: objtemplate ANIM_TAG_GREEN_SPARKLE ANIM_TAG_GREEN_SPARKLE 0x8370A00 0x83AACA4 0x0 gDummySpriteAffineAnimTable 0x80AB571
GRASSY_TERRAIN_2: objtemplate ANIM_TAG_ORBS ANIM_TAG_ORBS 0x8370B80 0x83A9F84 0x0 0x83A9F98 0x80AB435

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_MISTY_SURGE:
	loadparticle ANIM_TAG_ORBS
	loadparticle ANIM_TAG_GREEN_SPARKLE
	loadparticle ANIM_TAG_WATER_GUN
	playsound2 0xbc SOUND_PAN_ATTACKER
	launchtemplate MISTY_TERRAIN_2 0x2 0x2 0x1a 0x0
	launchtemplate MISTY_TERRAIN_2 0x2 0x2 0x1a 0x2a
	launchtemplate MISTY_TERRAIN_2 0x2 0x2 0x1a 0x54
	launchtemplate MISTY_TERRAIN_2 0x2 0x2 0x1a 0x7e
	launchtemplate MISTY_TERRAIN_2 0x2 0x2 0x1a 0xa8
	launchtemplate MISTY_TERRAIN_2 0x2 0x2 0x1a 0xd2
	pause 0x34
	setarg 0x7 0xffff
	playsound2 0xdb SOUND_PAN_ATTACKER
	launchtask AnimTask_ScaleMonAndRestore 0x5 0x5 0xfff9 0xfff9 0xb 0x0 0x0
	launchtemplate MISTY_TERRAIN_1 0x82 0x1 0x0
	launchtemplate MISTY_TERRAIN_1 0x82 0x1 0x20
	launchtemplate MISTY_TERRAIN_1 0x82 0x1 0x40
	launchtemplate MISTY_TERRAIN_1 0x82 0x1 0x60
	launchtemplate MISTY_TERRAIN_1 0x82 0x1 0x80
	launchtemplate MISTY_TERRAIN_1 0x82 0x1 0xa0
	launchtemplate MISTY_TERRAIN_1 0x82 0x1 0xc0
	launchtemplate MISTY_TERRAIN_1 0x82 0x1 0xe0
	waitanimation
MISTY_TERRAIN_ACTIVE_ANIM:
	loaddefaultBG @At this point the new BG is in effect
	waitbgfadein
	playsound2 0xec SOUND_PAN_ABOVE
	pause 0x40
	pause 0x40
	endanimation

.align 2
MISTY_TERRAIN_1: objtemplate ANIM_TAG_GREEN_SPARKLE ANIM_TAG_WATER_GUN 0x8370A00 0x83AACA4 0x0 gDummySpriteAffineAnimTable 0x80AB571
MISTY_TERRAIN_2: objtemplate ANIM_TAG_ORBS ANIM_TAG_WATER_GUN 0x8370B80 0x83A9F84 0x0 0x83A9F98 0x80AB435

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_PSYCHIC_SURGE:
	loadparticle ANIM_TAG_ORBS
	loadparticle ANIM_TAG_GREEN_SPARKLE
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_ORBS 0x0 0xC 0xC 0x680F @;Purple
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_GREEN_SPARKLE 0x0 0xC 0xC 0x680F @;Purple
	playsound2 0xbc SOUND_PAN_ATTACKER
	launchtemplate PSYCHIC_TERRAIN_2 0x2 0x2 0x1a 0x0
	launchtemplate PSYCHIC_TERRAIN_2 0x2 0x2 0x1a 0x2a
	launchtemplate PSYCHIC_TERRAIN_2 0x2 0x2 0x1a 0x54
	launchtemplate PSYCHIC_TERRAIN_2 0x2 0x2 0x1a 0x7e
	launchtemplate PSYCHIC_TERRAIN_2 0x2 0x2 0x1a 0xa8
	launchtemplate PSYCHIC_TERRAIN_2 0x2 0x2 0x1a 0xd2
	pause 0x34
	setarg 0x7 0xffff
	playsound2 0xdb SOUND_PAN_ATTACKER
	launchtask AnimTask_ScaleMonAndRestore 0x5 0x5 0xfff9 0xfff9 0xb 0x0 0x0
	launchtemplate PSYCHIC_TERRAIN_1 0x82 0x1 0x0
	launchtemplate PSYCHIC_TERRAIN_1 0x82 0x1 0x20
	launchtemplate PSYCHIC_TERRAIN_1 0x82 0x1 0x40
	launchtemplate PSYCHIC_TERRAIN_1 0x82 0x1 0x60
	launchtemplate PSYCHIC_TERRAIN_1 0x82 0x1 0x80
	launchtemplate PSYCHIC_TERRAIN_1 0x82 0x1 0xa0
	launchtemplate PSYCHIC_TERRAIN_1 0x82 0x1 0xc0
	launchtemplate PSYCHIC_TERRAIN_1 0x82 0x1 0xe0
	waitanimation
PSYCHIC_TERRAIN_ACTIVE_ANIM:
	loaddefaultBG @At this point the new BG is in effect
	waitbgfadein
	soundcomplex 0xb1 SOUND_PAN_ABOVE 0xa 0x3
	waitforsound
	endanimation

.align 2
PSYCHIC_TERRAIN_1: objtemplate ANIM_TAG_GREEN_SPARKLE ANIM_TAG_GREEN_SPARKLE 0x8370A00 0x83AACA4 0x0 gDummySpriteAffineAnimTable 0x80AB571
PSYCHIC_TERRAIN_2: objtemplate ANIM_TAG_ORBS ANIM_TAG_ORBS 0x8370B80 0x83A9F84 0x0 0x83A9F98 0x80AB435

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_SEA_OF_FIRE:
	loadparticle ANIM_TAG_SMALL_EMBER
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x1 0x0 0x7 0x043D
	pause 0x20
	pokespritetoBG bank_target
	setblends 0x80c
	launchtemplate Template_FireSpread 0x81 0x5 0x0 0xa 0xF0 0x10 0x28
	launchtemplate Template_FireSpread 0x81 0x5 0x0 0xa 0xC0 0x10 0x28
	launchtemplate Template_FireSpread 0x81 0x5 0x0 0xa 0x90 0x10 0x28
	launchtemplate Template_FireSpread 0x81 0x5 0x0 0xa 0x60 0x10 0x28
	launchtemplate Template_FireSpread 0x81 0x5 0x0 0xa 0x30 0x10 0x28
	launchtemplate Template_FireSpread 0x81 0x5 0x0 0xa 0x0 0x10 0x28
	launchtemplate Template_FireSpread 0x81 0x5 0x0 0xa 0xffD0 0x10 0x28
	launchtemplate Template_FireSpread 0x81 0x5 0x0 0xa 0xffA0 0x10 0x28
	launchtemplate Template_FireSpread 0x81 0x5 0x0 0xa 0xff70 0x10 0x28
	launchtemplate Template_FireSpread 0x81 0x5 0x0 0xa 0xff40 0x10 0x28
	launchtemplate Template_FireSpread 0x81 0x5 0x0 0xa 0xff10 0x10 0x28
	pause 0x4
	playsound2 0x8C SOUND_PAN_TARGET
	waitanimation
	pokespritefromBG bank_target
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x1 0x7 0x0 0x043D
	waitanimation
	resetblends
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_HEALING_SPARKLES:
	loadparticle ANIM_TAG_BLUE_STAR
	call HEALING_ANIM
	waitanimation
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_LUNAR_DANCE_HEAL:
	loadparticle ANIM_TAG_SPARKLE_2
	loadparticle ANIM_TAG_GUARD_RING
	loadparticle ANIM_TAG_SMALL_EMBER
	pokespritetoBG side_attacker
	setblends 0x808
	soundcomplex 0xbc SOUND_PAN_ATTACKER 0x10 0x3
	call HEALING_STARS
	launchtemplate LUNARDANCE_RING 0x2 0x0
	pause 0x4
	launchtemplate LUNARDANCE_RING 0x2 0x0
	pause 0x4
	launchtemplate LUNARDANCE_RING 0x2 0x0
	pause 0x40
	waitanimation
	pokespritefromBG side_attacker
	resetblends
	endanimation

.align 2
.global LUNARDANCE_RING
LUNARDANCE_RING: objtemplate ANIM_TAG_GUARD_RING ANIM_TAG_SMALL_EMBER 0x8370C10 gDummySpriteAnimTable 0x0 0x83ABA18 0x80ABDA5

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_HEALING_WISH_HEAL:
	loadparticle ANIM_TAG_GOLD_STARS
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x0 0x0 0x10 0x0
	waitanimation
	playsoundpanchange3 0xc8 SOUND_PAN_TARGET SOUND_PAN_ATTACKER 0xfd 0x0
	launchtemplate Template_WishStar 0x28 0x0
	waitanimation
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x0 0x10 0x0 0x0
	waitanimation
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_RED_PRIMAL_REVERSION:
	loadparticle ANIM_TAG_OMEGA_STONE
	loadparticle ANIM_TAG_OMEGA_SYMBOL
	loadparticle ANIM_TAG_SMALL_EMBER
	pokespritetoBG bank_attacker
	setblends 0x80c
	playsound2 0xc2 SOUND_PAN_ATTACKER
	launchtemplate RED_PRIMAL_OMEGA TEMPLATE_ATTACKER | TEMPLATE_ABOVE, 0x4 0x0 0x0 0x0 0x0
	pause 0x14
	launchtask AnimTask_BlendExcept 0x5 0x5 0x5 0x2 0x0 0x10 0x7fff
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_OMEGA_STONE 0x4 0x0 0x10 0x7fff
	waitanimation @;Wait until screen is white
	call PRIMAL_REVERSION_FADE_IN
	launchtask AnimTask_FadeOutParticles 0x2 0x1 2
	launchtemplate OMEGA_SYMBOL TEMPLATE_ATTACKER | TEMPLATE_ABOVE, 0x3, 0, 0, bank_attacker
	call RED_PRIMAL_REVERSION_FIRE_GEYSER
	call RED_PRIMAL_REVERSION_FIRE_GEYSER
	waitanimation
	pokespritefromBG side_attacker
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0x0 0x0 0x7FFF
	waitanimation
	resetblends
	endanimation

PRIMAL_REVERSION_FADE_IN:
	pokespritefromBG side_attacker @AnimTask_ReloadAttackerSprite removes it anyway
	launchtask AnimTask_ReloadAttackerSprite 0x2 0x0
	launchtask AnimTask_BlendExcept 0x5 0x5 0x5 0x2 0x10 0x10 0x7fff
	pause 0x1
	pokespritetoBG bank_attacker
	leftbankBG_over_partnerBG bank_attacker
	launchtask AnimTask_BlendExcept 0x5 0x5 0x5 0x2 0x10 0x0 0x7fff
	launchtask AnimTask_screen_shake 0x5 0x3 0x1 0x5 0xe
	launchtask AnimTask_PlayAttackerCry 0x1 0x2 0x0 0xff
	pause 0x10
	return

.global RED_PRIMAL_REVERSION_FIRE_GEYSER
RED_PRIMAL_REVERSION_FIRE_GEYSER:
	launchtemplate FIRE_GEYSER TEMPLATE_ATTACKER | 2, 0x3 bank_attacker 0xfffc 0x18
	pause 0x1
	launchtemplate FIRE_GEYSER TEMPLATE_ATTACKER | 2, 0x3 bank_attacker 0x100D 0x18
	pause 0x1
	launchtemplate FIRE_GEYSER TEMPLATE_ATTACKER | 2, 0x3 bank_attacker 0x4 0x18
	pause 0x1
	launchtemplate FIRE_GEYSER TEMPLATE_ATTACKER | 2, 0x3 bank_attacker 0xfff0 0x18
	pause 0x1
	return

.align 2
.global FIRE_GEYSER
RED_PRIMAL_OMEGA: objtemplate ANIM_TAG_OMEGA_STONE ANIM_TAG_OMEGA_STONE OAM_DOUBLE_BLEND_64x64 gDummySpriteAnimTable 0x0 0x83AE688 0x8075541
OMEGA_SYMBOL: objtemplate ANIM_TAG_OMEGA_SYMBOL ANIM_TAG_OMEGA_SYMBOL OAM_DOUBLE_BLEND_32x32 gDummySpriteAnimTable 0x0 gSpriteAffineAnimTable_PrimalSymbol SpriteCB_AnimSpriteOnSelectedMonPos
FIRE_GEYSER: objtemplate ANIM_TAG_SMALL_EMBER ANIM_TAG_SMALL_EMBER OAM_OFF_32x32 0x83ACF10 0x0 gDummySpriteAffineAnimTable SpriteCB_Geyser

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_BLUE_PRIMAL_REVERSION:
	loadparticle ANIM_TAG_ALPHA_STONE
	loadparticle ANIM_TAG_ALPHA_SYMBOL
	loadparticle ANIM_TAG_HYDRO_PUMP
	pokespritetoBG side_attacker
	setblends 0x80c
	playsound2 0xc2 SOUND_PAN_ATTACKER
	launchtemplate BLUE_PRIMAL_ALPHA TEMPLATE_ATTACKER | TEMPLATE_ABOVE, 0x4 0x0 0x0 0x0 0x0
	pause 0x14
	launchtask AnimTask_BlendExcept 0x5 0x5 0x5 0x2 0x0 0x10 0x7fff
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_ALPHA_STONE 0x4 0x0 0x10 0x7fff
	waitanimation @;Wait until screen is white
	call PRIMAL_REVERSION_FADE_IN
	launchtask AnimTask_FadeOutParticles 0x2 0x1 2
	launchtemplate ALPHA_SYMBOL TEMPLATE_ATTACKER | TEMPLATE_ABOVE, 0x3, 0, 0, bank_attacker
	call BLUE_PRIMAL_REVERSION_WATER_GEYSER
	call BLUE_PRIMAL_REVERSION_WATER_GEYSER
	waitanimation
	pokespritefromBG side_attacker
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0x0 0x0 0x7FFF
	waitanimation
	resetblends
	endanimation

BLUE_PRIMAL_REVERSION_WATER_GEYSER:
	launchtemplate WATER_GEYSER TEMPLATE_ATTACKER | 2, 0x3 bank_attacker 0xfffc 0x18
	pause 0x1
	launchtemplate WATER_GEYSER TEMPLATE_ATTACKER | 2, 0x3 bank_attacker 0x100D 0x18
	pause 0x1
	launchtemplate WATER_GEYSER TEMPLATE_ATTACKER | 2, 0x3 bank_attacker 0x4 0x18
	pause 0x1
	launchtemplate WATER_GEYSER TEMPLATE_ATTACKER | 2, 0x3 bank_attacker 0xfff0 0x18
	pause 0x1
	return

.align 2
BLUE_PRIMAL_ALPHA: objtemplate ANIM_TAG_ALPHA_STONE ANIM_TAG_ALPHA_STONE OAM_DOUBLE_BLEND_64x64 gDummySpriteAnimTable 0x0 0x83AE688 0x8075541
ALPHA_SYMBOL: objtemplate ANIM_TAG_ALPHA_SYMBOL ANIM_TAG_ALPHA_SYMBOL OAM_DOUBLE_BLEND_32x32 gDummySpriteAnimTable 0x0 gSpriteAffineAnimTable_PrimalSymbol SpriteCB_AnimSpriteOnSelectedMonPos
WATER_GEYSER: objtemplate ANIM_TAG_HYDRO_PUMP ANIM_TAG_HYDRO_PUMP OAM_OFF_16x16 gDummySpriteAnimTable 0x0 gDummySpriteAffineAnimTable SpriteCB_Geyser

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_GRASSY_TERRAIN_HEAL:
	loadparticle ANIM_TAG_ORBS
	loadparticle ANIM_TAG_BLUE_STAR
	pokespritetoBG side_target
	setblends 0x80c
	waitanimation
	pause 0x3
	call SMALL_ABSORB_ANIM
	waitanimation
	pause 0xf
	call HEALING_ANIM
	waitanimation
	pokespritefromBG side_target
	resetblends
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_POWDER_EXPLOSION:
	loadparticle ANIM_TAG_EXPLOSION
	launchtask AnimTask_move_bank 0x2 0x5 bank_target 0x0 0x5 0x20 0x1
	call EXPLODING_ATTACKER2
	waitanimation
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_BEAK_BLAST_WARM_UP:
	loadparticle ANIM_TAG_SMALL_EMBER
	playsound2 0xa4 SOUND_PAN_ATTACKER
	pause 0x3
	launchtask AnimTask_pal_fade_complex 0x2 0x6 PAL_ATK 0x2 0x2 0x0 0xb 0x1f
	launchtemplate Template_FireSpiralOutward 0x3 0x4 0x0 0x0 0x38 0x0
	waitanimation
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_SHELL_TRAP_SET:
	loadparticle ANIM_TAG_SMALL_EMBER
	loadparticle ANIM_TAG_IMPACT
	pokespritetoBG bank_target
	setblends 0x80c
	call BURN_CHANCE_ANIM
	pause 0x4
	playsound2 0x8c SOUND_PAN_ATTACKER
	pause 0x15
	launchtemplate Template_Hit 0x2 0x4 0x0 0x0 0x1 0x2
	launchtemplate Template_Hit 0x2 0x4 0x0 0xa 0x1 0x2
	launchtemplate Template_Hit 0x2 0x4 0xa 0x0 0x1 0x2
	launchtemplate Template_Hit 0x2 0x4 0xa 0xa 0x1 0x2
	waitanimation
	pokespritefromBG bank_target
	resetblends
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
.global ANIM_BERRY_EATING
ANIM_BERRY_EATING:
	loadparticle ANIM_TAG_BERRY_NORMAL
	loadparticle ANIM_TAG_SHARP_TEETH
	loadparticle ANIM_TAG_THIN_RING
	loadparticle ANIM_TAG_SPARKLE_2
	playsound2 0xb3 SOUND_PAN_ATTACKER
	launchtemplate BERRYFLOAT TEMPLATE_ATTACKER | 1 0x1 0x0
	pause 0x45
	launchtask AnimTask_IsTargetPlayerSide 0x2 0x0
	jumpifargmatches 0x7 0x1 BERRYEAT_ON_PLAYER
BERRYEAT_ON_OPPONENT:
	call BITE_FOE
	pause 0x10
	call BITE_FOE
	pause 0xA
	goto POST_BERRY_EAT
BERRYEAT_ON_PLAYER:
	call BITE_PLAYER
	pause 0x10
	call BITE_PLAYER
	pause 0xA
POST_BERRY_EAT:
	playsound2 0x5F 0xc0
	launchtask AnimTask_pal_fade 0xa 0x5 0x2 0x3 0x7 0x0 0x67f1
	launchtemplate Template_Ring TEMPLATE_ATTACKER | 3 0x4 0x0 0x0 0x0 0x0
	waitanimation
	endanimation

BITE_PLAYER:
	playsound2 0x9a SOUND_PAN_ATTACKER
	launchtemplate Template_Teeth TEMPLATE_ATTACKER | 2 0x6 0x27 0xffD0 0x0 0x0 0x333 0xa
	launchtemplate Template_Teeth TEMPLATE_ATTACKER | 2 0x6 0x27 0x10 0x4 0x0 0xfccd 0xa
	return

BITE_FOE:
	playsound2 0x9a SOUND_PAN_ATTACKER
	launchtemplate Template_Teeth TEMPLATE_ATTACKER | 2 0x6 0xffDF 0xffD0 0x0 0x0 0x333 0xa
	launchtemplate Template_Teeth TEMPLATE_ATTACKER | 2 0x6 0xffDF 0x10 0x4 0x0 0xfccd 0xa
	return

.align 2
BERRYFLOAT: objtemplate ANIM_TAG_BERRY_NORMAL ANIM_TAG_BERRY_NORMAL 0x8370AC8 gAnimCmdBerryChomp 0x0 0x83AAF70 0x80A7EC9

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_FOG_CONTINUES:
	waitanimation
	playsound2 0xef SOUND_PAN_ABOVE
	launchtask AnimTask_create_haze 0x5 0x0
	pause 0x1e
	launchtask AnimTask_pal_fade 0xa 0x5 0x780 0x2 0x0 0xc 0xff7f
	pause 0x5a
	launchtask AnimTask_pal_fade 0xa 0x5 0x780 0x1 0xc 0x0 0xff7f
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_AQUA_RING_HEAL:
	loadparticle ANIM_TAG_GUARD_RING
	loadparticle ANIM_TAG_WATER_ORB
	loadparticle ANIM_TAG_SMALL_BUBBLES
	loadparticle ANIM_TAG_BLUE_STAR
	pokespritetoBG bank_attacker
	setblends 0x808
	playsound2 0xda SOUND_PAN_ATTACKER
	launchtask AnimTask_pal_fade_complex 0x2 0x6 0x2 0x0 0x2 0x0 0xa 0x7f6e
	launchtemplate AQUARING_RING 0x2 0x0
	launchtemplate AQUA_RING_BUBBLES 0x2 0x4 0x0 0xfff6 0x19 0x0
	pause 0x4
	launchtemplate AQUARING_RING 0x2 0x0
	launchtemplate AQUA_RING_BUBBLES 0x2 0x4 0xfff1 0x0 0x19 0x0
	pause 0x4
	launchtemplate AQUARING_RING 0x2 0x0
	launchtemplate AQUA_RING_BUBBLES 0x2 0x4 0x14 0xa 0x19 0x0
	waitanimation
	call HEALING_ANIM
	pokespritefromBG bank_attacker
	resetblends
	endanimation

.align 2
AQUARING_RING: objtemplate ANIM_TAG_GUARD_RING ANIM_TAG_WATER_ORB 0x8370C10 gDummySpriteAnimTable 0x0 0x83ABA18 0x80ABDA5
AQUA_RING_BUBBLES: objtemplate ANIM_TAG_SMALL_BUBBLES ANIM_TAG_SMALL_BUBBLES 0x8370B80 0x83ACFBC 0x0 gDummySpriteAffineAnimTable 0x80AC5C9

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
BATON_PASS_ANIM:
	loadparticle ANIM_TAG_POKEBALL
	playsound2 0xd9 SOUND_PAN_ATTACKER
	launchtask AnimTask_pal_fade_complex 0x2 0x6 0x1f 0x1 0x2 0x0 0xb 0x7adf
	launchtemplate 0x83C4FE4 0x2 0x0
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
DRAGON_TAIL_BLOW_AWAY_ANIM:
	playsound2 0x7a SOUND_PAN_TARGET
	launchtask AnimTask_SlideOffScreen 0x5 0x2 0x1 0x8
	waitanimation
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_ZMOVE_ACTIVATE:
	loadparticle ANIM_TAG_FOCUS_ENERGY @focus energy
	loadparticle ANIM_TAG_Z_MOVE_SYMBOL @Z-Move Symbol
	loadparticle ANIM_TAG_WHIP_HIT @green color
	loadparticle ANIM_TAG_SWEAT_BEAD @blue color
	loadparticle ANIM_TAG_PAW_PRINT @yellow color
	pokespritetoBG bank_attacker
	setblends 0x80c
	loadBG1 BG_ZMOVE_ACTIVATE
	waitbgfadein
	launchtask AnimTask_scroll_background 0x5 0x4 0x0 0x0 0x0 0xFFFF
	playsound2 0xC2 SOUND_PAN_ATTACKER
	launchtask AnimTask_pal_fade_complex 0x2 0x6 PAL_ATK 0x0 0x6 0x0 0xb 0x76BC
	call RAINBOW_BUFF
	call RAINBOW_BUFF
	call RAINBOW_BUFF
	launchtemplate ZSYMBOL 0x29 0x4 0x0 0x0 0x0 0x0
	call RAINBOW_BUFF
	call RAINBOW_BUFF
	waitanimation
	call UNSET_SCROLLING_BG
	resetblends
	pokespritefrombg bank_attacker
	endanimation

RAINBOW_BUFF:
	launchtemplate BLUEBUFF 0x2 0x4 0x0 0xffe8 0x1a 0x2
	pause 0x3
	launchtemplate Template_EndureEnergy 0x2 0x4 0x0 0xe 0x1c 0x1 @Red Buff
	pause 0x3
	launchtemplate GREENBUFF 0x2 0x4 0x0 0xfffb 0xa 0x2
	pause 0x3
	launchtemplate YELLOWBUFF 0x2 0x4 0x0 0x1c 0x1a 0x3
	pause 0x3
	return

.align 2
BLUEBUFF: objtemplate ANIM_TAG_FOCUS_ENERGY ANIM_TAG_SWEAT_BEAD 0x8370A48 0x83AAB44 0x0 gDummySpriteAffineAnimTable 0x80A6D99
GREENBUFF: objtemplate ANIM_TAG_FOCUS_ENERGY ANIM_TAG_WHIP_HIT 0x8370A48 0x83AAB44 0x0 gDummySpriteAffineAnimTable 0x80A6D99
YELLOWBUFF: objtemplate ANIM_TAG_FOCUS_ENERGY ANIM_TAG_PAW_PRINT 0x8370A48 0x83AAB44 0x0 gDummySpriteAffineAnimTable 0x80A6D99
ZSYMBOL: objtemplate ANIM_TAG_Z_MOVE_SYMBOL ANIM_TAG_Z_MOVE_SYMBOL 0x8370BF0 gDummySpriteAnimTable 0x0 0x83AE688 0x8075541

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_MEGA_EVOLUTION:
	loadparticle ANIM_TAG_MEGA_RAINBOW
	loadparticle ANIM_TAG_MEGA_STONE
	loadparticle ANIM_TAG_MEGA_SYMBOL
	loadparticle ANIM_TAG_ELECTRICITY
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_ELECTRICITY 0x0 0xC 0xC 0x74DB @Reddish Purple
	pokespritetoBG side_attacker
	setblends 0x80c
	soundcomplex 0x85 SOUND_PAN_ATTACKER 0xd 0x3
	launchtask AnimTask_pal_fade_complex 0x2 0x6 0x2 0x0 0x6 0x0 0xb 0x2fff
	call BRING_IN_RAINBOWS_BALLS
	call BRING_IN_RAINBOWS_BALLS
	call BRING_IN_RAINBOWS_BALLS
	waitanimation
	playsound2 0xc2 0xc0
	launchtemplate MEGA_STONE 0x29 0x4 0x0 0x0 0x0 0x0
	pause 0x14
	launchtask AnimTask_BlendExcept 0x5 0x5 0x5 0x2 0x0 0x10 0x7fff
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_MEGA_STONE 0x4 0x0 0x10 0x7fff
	waitanimation @;Wait until screen is white
	call PRIMAL_REVERSION_FADE_IN
	resetblends
	pokespritefromBG side_attacker
	launchtemplate MEGA_SYMBOL TEMPLATE_ATTACKER | 3, 0x3, 0, 0, bank_attacker
	pause 0x2
	call MEGA_EVO_SMOKE_UP
	waitanimation
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0x0 0x0 0x7FFF
	waitanimation
	endanimation

BRING_IN_RAINBOWS_BALLS:
	launchtemplate RAINBOW_BALL TEMPLATE_ATTACKER | 2, 0x3 0x28 0xfff6 0xd
	pause 0x3
	launchtemplate RAINBOW_BALL TEMPLATE_ATTACKER | 2, 0x3 0xffdd 0xfff6 0xd
	pause 0x3
	launchtemplate RAINBOW_BALL TEMPLATE_ATTACKER | 2, 0x3 0xf 0xffd8 0xd
	pause 0x3
	launchtemplate RAINBOW_BALL TEMPLATE_ATTACKER | 2, 0x3 0xfff6 0xffe0 0xd
	pause 0x3
	launchtemplate RAINBOW_BALL TEMPLATE_ATTACKER | 2, 0x3 0x19 0xffec 0xd
	pause 0x3
	launchtemplate RAINBOW_BALL TEMPLATE_ATTACKER | 2, 0x3 0xffd8 0xffec 0xd
	pause 0x3
	launchtemplate RAINBOW_BALL TEMPLATE_ATTACKER | 2, 0x3 0x5 0xffd8 0xd
	pause 0x3
	return

MEGA_EVO_SMOKE_UP:
	launchtemplate MEGA_EVO_SMOKE TEMPLATE_ATTACKER | 2, 0x7 0x0 0xc 0x210 0x1e 0xd 0x32 0x0
	pause 0x2
	launchtemplate MEGA_EVO_SMOKE TEMPLATE_ATTACKER | 2, 0x7 0x0 0x0 0x1e0 0x14 0x10 0xffd2 0x0
	pause 0x2
	launchtemplate MEGA_EVO_SMOKE TEMPLATE_ATTACKER | 2, 0x7 0x0 0x1 0x240 0x14 0x8 0x2a 0x0
	pause 0x2
	launchtemplate MEGA_EVO_SMOKE TEMPLATE_ATTACKER | 2, 0x7 0x0 0xf 0x190 0x19 0xb 0xffd6 0x0
	pause 0x2
	launchtemplate MEGA_EVO_SMOKE TEMPLATE_ATTACKER | 2, 0x7 0x0 0xc 0x200 0x19 0x10 0x2e 0x0
	pause 0x2
	launchtemplate MEGA_EVO_SMOKE TEMPLATE_ATTACKER | 2, 0x7 0x0 0x1 0x1d0 0x1e 0xf 0xffce 0x0
	pause 0x2
	return

.align 2
RAINBOW_BALL: objtemplate ANIM_TAG_MEGA_RAINBOW ANIM_TAG_MEGA_RAINBOW OAM_NORMAL_BLEND_16x16 0x83A9F84 0x0 0x83A9F98 0x80A3649
MEGA_STONE: objtemplate ANIM_TAG_MEGA_STONE ANIM_TAG_MEGA_STONE OAM_DOUBLE_BLEND_64x64 gDummySpriteAnimTable 0x0 0x83AE688 0x8075541
MEGA_SYMBOL: objtemplate ANIM_TAG_MEGA_SYMBOL ANIM_TAG_MEGA_SYMBOL OAM_DOUBLE_BLEND_32x32 gDummySpriteAnimTable 0x0 gSpriteAffineAnimTable_MegaSymbol SpriteCB_AnimSpriteOnSelectedMonPos
MEGA_EVO_SMOKE: objtemplate ANIM_TAG_ELECTRICITY ANIM_TAG_ELECTRICITY OAM_OFF_32x32 0x83AD744 0x0 gDummySpriteAffineAnimTable 0x80B5A3D

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_ULTRA_BURST:
	loadparticle ANIM_TAG_ULTRA_BURST_SYMBOL
	loadparticle ANIM_TAG_WHITE_CIRCLE_OF_LIGHT
	loadparticle ANIM_TAG_ORBS @Recover
	pokespritetoBG side_attacker
	setblends 0x80c

@Recover:
	soundcomplex 0x85 SOUND_PAN_ATTACKER 0xD 0x3
	launchtask AnimTask_pal_fade_complex 0x2 0x6 PAL_ATK 0x0 0x6 0x0 0xb 0x7fff
	call RECOVER_LOAD_PARTICLES
	call RECOVER_LOAD_PARTICLES
	call RECOVER_LOAD_PARTICLES
	waitanimation

@CircleThing:
	playsound2 0xc2 SOUND_PAN_ATTACKER
	launchtemplate Template_LusterPurgeCircle 0x29 0x4 0x0 0x0 0x0 0x0
	pause 0x14

@WhiteOutScreen:
	launchtask AnimTask_BlendExcept 0x5 0x5 0x5 0x2 0x0 0x10 0x7FFF
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_WHITE_CIRCLE_OF_LIGHT 0x2 0x0 0x10 0x7FFF
	waitanimation @;Wait until screen is white
	pokespritefromBG side_attacker @AnimTask_ReloadAttackerSprite removes it anyway
	launchtask AnimTask_ReloadAttackerSprite 0x2 0x0
	launchtask AnimTask_BlendExcept 0x5 0x5 0x5 0x2 0x10 0x10 0x7fff
	pause 0x1
	pokespritetoBG bank_attacker
	leftbankBG_over_partnerBG bank_attacker
	launchtask AnimTask_FadeOutParticles 0x2 0x1 4
	launchtemplate ULTRA_BURST_SYMBOL TEMPLATE_ATTACKER | 3, 0x3, 0, 0, bank_attacker
	pause 0x10
	launchtask AnimTask_BlendExcept 0x5 0x5 0x5 0x2 0x10 0x0 0x7FFF
	launchtask AnimTask_screen_shake 0x5 0x3 0x1 0x5 0xe
	launchtask AnimTask_PlayAttackerCry 0x1 0x2 0x0 0xff
	pause 0x10
	waitanimation
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x0 0x0 0x0 0x7FFF
	waitanimation
	pokespritefromBG side_attacker
	resetblends
	endanimation

.align 2
ULTRA_BURST_SYMBOL: objtemplate ANIM_TAG_ULTRA_BURST_SYMBOL ANIM_TAG_ULTRA_BURST_SYMBOL OAM_DOUBLE_BLEND_32x32 gDummySpriteAnimTable 0x0 gSpriteAffineAnimTable_UltraBurstSymbol SpriteCB_AnimSpriteOnSelectedMonPos

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_LOAD_DEFAULT_BG:
	loaddefaultBG
	waitbgfadein
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_LOAD_ABILITY_POP_UP:
	@loadparticle ANIM_TAG_ABILITY_POP_UP @;Done by the task b\c not compressed
	pokespritetoBG side_attacker
	launchtask AnimTask_LoadAbilityPopUp 0x5 0x0
	waitanimation
	pause 0x20
	pokespritefromBG side_attacker
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_REMOVE_ABILITY_POP_UP:
	launchtask AnimTask_DestroyAbilityPopUp 0x5 0x0
	pause 0x20
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_TOTEM_BOOST:
	loadparticle ANIM_TAG_FOCUS_ENERGY @focus energy
	loadparticle ANIM_TAG_WHIP_HIT @green color
	loadparticle ANIM_TAG_SWEAT_BEAD @blue color
	loadparticle ANIM_TAG_PAW_PRINT @yellow color
	pokespritetoBG bank_attacker
	setblends 0x80c
	playsound2 0xa4 SOUND_PAN_ATTACKER
	launchtask AnimTask_pal_fade_complex 0x2 0x6 PAL_ATK 0x0 0x6 0x0 0xb 0x1f
	call RAINBOW_BUFF
	call RAINBOW_BUFF
	call RAINBOW_BUFF
	call RAINBOW_BUFF
	call RAINBOW_BUFF
	waitanimation
	resetblends
	pokespritefrombg bank_attacker
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_DYNAMAX_START:
	launchtask AnimTask_PlayAttackerCry 0x1 0x2 0x0 0xff
	launchtask AnimTask_move_bank 0x2 0x5 bank_attacker 0x3 0x0 0x18 0x2
	launchtask AnimTask_DynamaxGrowth 0x5 0x1 0x0
	waitanimation
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_DYNAMAX_ENERGY_SWIRL:
	loadparticle ANIM_TAG_MIST_CLOUD 
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_MIST_CLOUD 0x0 0xC 0xC 0x74DB
	pokespritetoBG side_attacker 
	soundcomplex 0xCE SOUND_PAN_ATTACKER 0x13 0x3
	setblends 0x80c 
	call DYNAMAX_ENERGY_LOAD_PARTICLE 
	call DYNAMAX_ENERGY_LOAD_PARTICLE
	call DYNAMAX_ENERGY_LOAD_PARTICLE
	launchtask AnimTask_pal_fade_complex 0x2 0x6 PAL_ATK | PAL_ATK_PARTNER 0x4 0x2 0x0 0xe 0x301F  
	call DYNAMAX_ENERGY_LOAD_PARTICLE
	call DYNAMAX_ENERGY_LOAD_PARTICLE
	call DYNAMAX_ENERGY_LOAD_PARTICLE 
	call DYNAMAX_ENERGY_LOAD_PARTICLE
	waitanimation 
	pokespritefromBG side_attacker 
	resetblends 
	endanimation

DYNAMAX_ENERGY_LOAD_PARTICLE:
	launchtemplate 0x83AD9E8 0x2 0x6 0x0 0xffe8 0x50 0x80 0x0 0x1  
	pause 0x4
	return
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_RAID_BATTLE_STORM:
	launchtask AnimTask_GetRaidBattleStormLevel 0x2 0x0
	jumpifargmatches 0x0 0x1 RAID_BATTLE_STORM_LEVEL_1
	jumpifargmatches 0x0 0x2 RAID_BATTLE_STORM_LEVEL_2
	jumpifargmatches 0x0 0x3 RAID_BATTLE_STORM_LEVEL_3
	jumpifargmatches 0x0 0x4 RAID_BATTLE_STORM_LEVEL_4
	
RAID_BATTLE_STORM_LEVEL_0:
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0x0 0x8 0x301F
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x2 0x0 0xB 0x301F
	call RAID_BATTLE_STORM_BLOW
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0x8 0x0 0x301F
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x2 0xB 0x0 0x301F
	
RAID_BATTLE_STORM_CONTINUE:
	waitanimation
	endanimation

RAID_BATTLE_STORM_BLOW:
	launchtask AnimTask_LoadSandstormBackground 0x5 0x1 0x1
	@launchtask AnimTask_BlendBackground 0x6 0x2 0x6 0x301F
	playsound2 0x7d SOUND_PAN_ABOVE
	pause 0x44
	playsound2 0x7e SOUND_PAN_ABOVE
	pause 0x38
	return

RAID_BATTLE_STORM_LEVEL_1:
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0x0 0x9 0x301F
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x2 0x0 0xC 0x301F
	call RAID_BATTLE_STORM_BLOW
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0x9 0x0 0x301F
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x2 0xC 0x0 0x301F
	goto RAID_BATTLE_STORM_CONTINUE

RAID_BATTLE_STORM_LEVEL_2:
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0x0 0xA 0x301F
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x2 0x0 0xD 0x301F
	call RAID_BATTLE_STORM_BLOW
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0xA 0x0 0x301F
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x2 0xD 0x0 0x301F
	goto RAID_BATTLE_STORM_CONTINUE

RAID_BATTLE_STORM_LEVEL_3:
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0x0 0xB 0x301F
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x2 0x0 0xE 0x301F
	call RAID_BATTLE_STORM_BLOW
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0xB 0x0 0x301F
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x2 0xE 0x0 0x301F
	goto RAID_BATTLE_STORM_CONTINUE

RAID_BATTLE_STORM_LEVEL_4:
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0x0 0xC 0x301F
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x2 0x0 0xF 0x301F
	call RAID_BATTLE_STORM_BLOW
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0xC 0x0 0x301F
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_BG 0x2 0xF 0x0 0x301F
	goto RAID_BATTLE_STORM_CONTINUE

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool	
ANIM_RAID_BATTLE_ENERGY_BURST:
	loadparticle ANIM_TAG_ELECTRIC_ORBS
	loadparticle ANIM_TAG_RED_ORB
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_ELECTRIC_ORBS 0x0 0xC 0xC 0x301F @;Pinkish Red
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_RED_ORB 0x0 0xC 0xC 0x301F @;Pinkish Red
	launchtask AnimTask_ChargeBalls 0x2 0x4 0x0 0x14 0x0 0x2
	playsound2 0xCE SOUND_PAN_ATTACKER
	waitanimation
	setarg 0x7 0xffff
	playsound2 0xc8 SOUND_PAN_ATTACKER
	launchtask AnimTask_ScaleMonAndRestore 0x5 0x5 0xfff9 0xfff9 0xb 0x0 0x0
	launchtemplate Template_HiddenPowerOrbScatter 0x82 0x1 0x0
	launchtemplate Template_HiddenPowerOrbScatter 0x82 0x1 0x20
	launchtemplate Template_HiddenPowerOrbScatter 0x82 0x1 0x40
	launchtemplate Template_HiddenPowerOrbScatter 0x82 0x1 0x60
	launchtemplate Template_HiddenPowerOrbScatter 0x82 0x1 0x80
	launchtemplate Template_HiddenPowerOrbScatter 0x82 0x1 0xa0
	launchtemplate Template_HiddenPowerOrbScatter 0x82 0x1 0xc0
	launchtemplate Template_HiddenPowerOrbScatter 0x82 0x1 0xe0
	waitanimation
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_G_MAX_VINE_LASH:
	loadparticle ANIM_TAG_UNUSED_VINE_2
	launchtask AnimTask_move_bank 0x2 0x5 bank_target 0x3 0x0 17 0x1
	call POWER_WHIP
	call POWER_WHIP
	call POWER_WHIP
	waitanimation
	endanimation

.pool
ANIM_G_MAX_WILDFIRE:
	goto 0x81B9C8F @Fire Spin

.pool
ANIM_G_MAX_CANNONADE:
	goto 0x81B3AF6 @Whirlpool

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool	
ANIM_G_MAX_VOLCALITH:
	loadparticle ANIM_TAG_ROCKS
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_ROCKS 0x0 0x6 0x6 0x05D5 @;Orangish Red
	pokespritetoBG side_target
	playsound2 0x7C SOUND_PAN_TARGET
	launchtemplate Template_RockFragment 0x2 0x6 0x0 0x0 0x14 0x18 0xe 0x2 
	launchtemplate Template_RockFragment 0x2 0x6 0x5 0x0 0xffec 0x18 0xe 0x1 
	launchtemplate Template_RockFragment 0x2 0x6 0x0 0x5 0x14 0xffe8 0xe 0x2 
	launchtemplate Template_RockFragment 0x2 0x6 0xfffb 0x0 0xffec 0xffe8 0xe 0x2 
	launchtemplate Template_RockFragment 0x2 0x6 0x0 0xfffb 0x1e 0x12 0x8 0x2 
	launchtemplate Template_RockFragment 0x2 0x6 0x0 0x0 0x1e 0xffee 0x8 0x2 
	launchtemplate Template_RockFragment 0x2 0x6 0x0 0x0 0xffe2 0x12 0x8 0x2 
	launchtemplate Template_RockFragment 0x2 0x6 0x0 0x0 0xffe2 0xffee 0x8 0x2 
	launchtask AnimTask_move_bank 0x2 0x5 bank_target 0x0 0x3 0x7 0x1  
	waitanimation 
	pokespritefromBG side_target
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_TERASTAL:
	loadparticle ANIM_TAG_TERASTAL_SYMBOL
	loadparticle ANIM_TAG_WHITE_CIRCLE_OF_LIGHT
	loadparticle ANIM_TAG_ORBS @Recover
	pokespritetoBG side_attacker
	setblends 0x80c

@Recover:
	soundcomplex 0x85 SOUND_PAN_ATTACKER 0xD 0x3
	launchtask AnimTask_pal_fade_complex 0x2 0x6 PAL_ATK 0x0 0x6 0x0 0xb 0x7fff
	call RECOVER_LOAD_PARTICLES
	call RECOVER_LOAD_PARTICLES
	call RECOVER_LOAD_PARTICLES
	waitanimation
	launchtemplate TERASTALSYMBOL 0x82 0x0
	waitanimation

@CircleThing:
	playsound2 0xc3 SOUND_PAN_ATTACKER
	launchtemplate Template_LusterPurgeCircle 0x29 0x4 0x0 0x0 0x0 0x0
	pause 0x14

@WhiteOutScreen:
	launchtask AnimTask_BlendExcept 0x5 0x5 0x5 0x2 0x0 0x10 0xffff
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_WHITE_CIRCLE_OF_LIGHT 0x2 0x0 0x10 0xffff
	waitanimation
	launchtask AnimTask_BlendParticle 0x5 0x0
	launchtask AnimTask_ReloadAttackerSprite 0x2 0x0
	launchtask AnimTask_BlendExcept 0x5 0x5 0x5 0x2 0x10 0x0 0xffff
	waitanimation
	launchtask AnimTask_pal_fade 0xa 0x5 PAL_ALL_BANKS 0x2 0x0 0x0 0x7FFF
	launchtask AnimTask_screen_shake 0x5 0x3 0x0 0x5 0xe
	launchtask AnimTask_PlayAttackerCry 0x1 0x2 0x0 0xFF
	waitanimation

@End:
	resetblends
	pokespritefrombg side_attacker
	endanimation

.align 2
TERASTALSYMBOL: objtemplate ANIM_TAG_TERASTAL_SYMBOL ANIM_TAG_TERASTAL_SYMBOL 0x8370B28 gDummySpriteAnimTable 0x0 gDummySpriteAffineAnimTable 0x80B7A95

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_SUBSTITUTE2:
	goto 0x81B73EF		@MOVE_SUBSTITUTE
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_SALTCURE_END_TURN:
	goto ANIM_SALTCURE
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_SYRUPBOMB_END_TURN:
	loadparticle ANIM_TAG_POISON_BUBBLE
	launchtask AnimTask_BlendParticle 0x5 0x5 ANIM_TAG_POISON_BUBBLE 0x0 0xC 0xC 0x061D
	pokespritetoBG side_target
	launchtemplate APPLE_ACID_DRIP TEMPLATE_TARGET | 2, 0x5 0x0 0xffea 0x0 0xf 0x37  
	playsound2 0x75 SOUND_PAN_TARGET 
	pause 0xa 
	launchtemplate APPLE_ACID_DRIP TEMPLATE_TARGET | 2, 0x5 0xffe6 0xffe8 0x0 0xf 0x37  
	playsound2 0x75 SOUND_PAN_TARGET 
	pause 0xa 
	launchtemplate APPLE_ACID_DRIP TEMPLATE_TARGET | 2, 0x5 0xf 0xffe5 0x0 0xf 0x32  
	playsound2 0x75 SOUND_PAN_TARGET 
	pause 0xa 
	launchtemplate APPLE_ACID_DRIP TEMPLATE_TARGET | 2, 0x5 0xfff1 0xffef 0x0 0xa 0x2d  
	playsound2 0x75 SOUND_PAN_TARGET 
	pause 0xa 
	launchtemplate APPLE_ACID_DRIP TEMPLATE_TARGET | 2, 0x5 0x1b 0xffea 0x0 0xf 0x32  
	playsound2 0x75 SOUND_PAN_TARGET
	waitanimation
	pokespritefromBG bank_target 
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
ANIM_AI_ITEM_HEAL:
	playsound2 0xE8 SOUND_PAN_ATTACKER
	launchtask AnimTask_StatusClearedEffect 0x2 0x1 FALSE
	waitanimation
	endanimation

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.pool
.align 2
.global gBattleAnims_Special
gBattleAnims_Special:
.word 0x81BA472
.word 0x81BA493
.word 0x81BA4A4
.word 0x81BA4B5
.word 0x81BA537
.word 0x81BA550
.word 0x81BA55A
.word gBattleAnim_CriticalCapture

.global gBattleAnim_CriticalCapture
gBattleAnim_CriticalCapture:
	launchtask 0x80F03F1 0x2 0x0
	pause 0
	playsound2 54 0
	goto 0x81BA4C2
