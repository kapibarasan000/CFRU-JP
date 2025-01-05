.thumb
.text
.align 2
.global BattleScriptCommandsTable
/*
battle_script_command_table.s
	table of battle script commands, including new ones
*/

.include "../asm_defines.s"
.equ NULL, 0x00000000

.global gBattleScriptingCommandsTable
.global gBattleScriptingCommandsTable2

gBattleScriptingCommandsTable:
.word atk00_attackcanceler
.word atk01_accuracycheck
.word atk02_attackstring
.word atk03_ppreduce
.word atk04_critcalc
.word atk05_damagecalc
.word atk06_typecalc
.word atk07_adjustnormaldamage
.word atk08_adjustnormaldamage2
.word atk09_attackanimation
.word 0x801ED99					@waitanimation
.word atk0B_healthbarupdate		@graphicalhpupdate
.word atk0C_datahpupdate
.word atk0D_critmessage
.word atk0E_effectivenesssound
.word atk0F_resultmessage
.word 0x801F561					@printstring
.word 0x801F5A1					@printstring2
.word atk12_waitmessage
.word atk13_printfromtable
.word 0x801F695					@printfromtable2
.word atk15_seteffectwithchance	@seteffectwithchancetarget
.word 0x8020A21					@seteffecttarget
.word 0x8020A31					@seteffectuser
.word 0x8020A41					@clearstatus
.word atk19_tryfaintmon			@faintpokemon
.word 0x8020DB1					@dofaintanimation
.word atk1B_cleareffectsonfaint
.word 0x8020E51					@jumpifstatus
.word atk1D_jumpifstatus2		@jumpifsecondarystatus
.word atk1E_jumpifability		@jumpifability
.word atk1F_jumpifsideaffecting	@jumpifhalverset
.word atk20_jumpifstat
.word 0x8021199					@jumpifspecialstatusflag
.word atk22_jumpiftype
.word atk23_getexp				@battleendingfunction
.word 0x8021BF9					@ifwildbattleend
.word 0x8021DD9					@movevaluescleanup
.word 0x8021DF1					@storeloopingcounter
.word atk27_decrementmultihit
.word 0x8021E51					@goto
.word 0x8021E71					@jumpifbyte
.word 0x8021F11					@jumpifhalfword
.word 0x8021FB9					@jumpifword
.word 0x802206D					@jumpifarrayequal
.word 0x80220F5					@jumpifarraynotequal
.word 0x8022179					@setbyte
.word 0x80221A1					@addbyte
.word 0x80221CD					@subtractbyte
.word 0x80221F9					@copyarray
.word 0x802224D					@copyarraywithindex
.word 0x80222B9					@orbyte
.word 0x80222E5					@orhalfword
.word 0x802231D					@orword
.word 0x8022361					@bicbyte
.word 0x802238D					@bichalfword
.word 0x80223C5					@bicword
.word 0x8022409					@pause
.word 0x8022449					@waitstateatk
.word 0x8022469					@healthbarupdate
.word 0x80224C1					@return
.word 0x80224CD					@end
.word 0x80224ED					@end2
.word 0x8022505					@end3
.word atk40_jumpifaffectedbyprotect
.word 0x8022541					@call
.word atk42_jumpiftype2
.word 0x80225CD					@jumpifabilitypresent
.word 0x8022619					@endselectionscript
.word atk45_playanimation
.word atk46_playanimation2
.word atk47_setgraphicalstatchangevalues
.word atk48_playstatchangeanimation
.word atk49_moveend				@cmd49
.word atk4A_typecalc2			@damagecalc2
.word 0x8023689					@returnatktoball
.word 0x80236D9					@getswitchedmondata
.word atk4D_switchindataupdate	@switchindataupdate
.word 0x80238D5					@switchinanim
.word atk4F_jumpifcantswitch	@jumpifcannotswitch
.word 0x8023BE1					@openpartyscreen
.word atk51_switchhandleorder
.word atk52_switchineffects
.word atk53_trainerslidein
.word 0x8024911					@playse
.word 0x802494D					@fanfare
.word 0x8024989					@pokemonfaintcry
.word 0x80249B9					@flee
.word 0x80249F1					@returntoball
.word 0x8024A25					@handlelearnnewmove
.word 0x8024B71					@yesnoboxlearnmove
.word 0x8024ED5					@yesnoboxstoplearningmove
.word atk5C_hitanimation		@flash
.word 0x80250A1					@getmoneyreward
.word 0x8025259					@atk5e
.word 0x802530D					@atk5f
.word 0x802535D					@incrementgamestat
.word atk61_drawpartystatussummary
.word 0x8025455					@atk62
.word atk63_jumptocalledmove	@jumptoattack
.word atk64_statusanimation
.word 0x8025579					@status2animation
.word atk66_chosenstatusanimation
.word 0x80256B5					@yesnobox
.word 0x8025791					@cancelallactions
.word atk69_adjustsetdamage
.word atk6A_removeitem
.word 0x80259B5					@atknameinbuff1
.word 0x80259F1					@drawlvlupbox
.word 0x8025FB5					@resetsentmonsvalue
.word 0x8025FCD					@setatktoplayer0
.word 0x8025FED					@makevisible
.word atk70_recordlastability
.word 0x802607D					@buffermovetolearn
.word 0x8026095					@jumpifplayerran
.word 0x80260D9					@hpthresholds
.word 0x8026185					@hpthresholds2
.word 0x8026235					@useitemonopponent
.word 0x802628D					@atk76
.word atk77_setprotect
.word atk78_faintifabilitynotdamp
.word 0x802699D					@setuserhptozero
.word atk7A_jumpifnexttargetvalid	@jumpwhiletargetvalid
.word atk7B_tryhealhalfhealth		@setdamageasrestorehalfmaxhp
.word atk7C_trymirrormove			@jumptolastusedattack
.word atk7D_setrain
.word atk7E_setreflect
.word atk7F_setseeded			@setleechseed
.word 0x8026E61					@manipulatedamage
.word atk81_trysetrest			@setrest
.word atk82_jumpifnotfirstturn
.word 0x8026FF9					@nop3
.word atk84_jumpifcantmakeasleep	@jumpifcannotsleep
.word 0x8027121					@stockpile
.word atk86_stockpiletobasedamage
.word atk87_stockpiletohpheal	@stockpiletohprecovery
.word atk88_negativedamage
.word atk89_statbuffchange
.word atk8A_normalisebuffs
.word 0x80278F9					@setbide
.word 0x8027969					@confuseifrepeatingattackends
.word atk8D_setmultihitcounter	@setloopcounter
.word 0x80279F5					@initmultihitstring
.word atk8F_forcerandomswitch
.word atk90_tryconversiontypechange	@changetypestoenemyattacktype
.word atk91_givepaydaymoney
.word atk92_setlightscreen
.word atk93_tryKO
.word atk94_damagetohalftargethp	@gethalfcurrentenemyhp
.word atk95_setsandstorm
.word atk96_weatherdamage
.word atk97_tryinfatuating		@tryinfatuatebank
.word 0x8028821					@refreshhpbar
.word atk99_setmist				@setmisteffect
.word 0x8028A51					@setincreasedcriticalchance
.word atk9B_transformdataexecution
.word 0x8028C4D					@setsubstituteeffect
.word atk9D_mimicattackcopy		@copyattack
.word atk9E_metronome			@metronomeeffect
.word 0x8028FD5					@nightshadedamageeffect
.word atkA0_psywavedamageeffect
.word atkA1_counterdamagecalculator
.word atkA2_mirrorcoatdamagecalculator
.word atkA3_disablelastusedattack
.word atkA4_trysetencore		@setencore
.word atkA5_painsplitdmgcalc	@painsplitdamagecalculator
.word atkA6_settypetorandomresistance
.word 0x8029785					@setalwayshitflag
.word atkA8_copymovepermanently
.word atkA9_trychoosesleeptalkmove
.word atkAA_setdestinybond		@destinybondeffect
.word 0x8029C31					@trysetdestinybondtohappen
.word 0x8029C49					@remaininghptopower
.word atkAD_tryspiteppreduce	@reducepprandom
.word atkAE_healpartystatus		@healpartystatus
.word atkAF_cursetarget
.word atkB0_trysetspikes
.word 0x802A27D					@setforesight
.word atkB2_trysetperishsong	@setperishsong
.word atkB3_rolloutdamagecalculation
.word atkB4_jumpifconfusedandstatmaxed
.word atkB5_furycuttercalc		@furycutterdamagecalculation
.word 0x802A5FD					@happinesstodamagecalculation
.word atkB7_presentdamagecalculation
.word atkB8_setsafeguard
.word atkB9_magnitudedamagecalculation
.word atkBA_jumpifnopursuitswitchdmg
.word atkBB_setsunny
.word atkBC_maxattackhalvehp
.word atkBD_copyfoestats
.word atkBE_rapidspinfree		@breakfree
.word 0x802AD19					@setcurled
.word atkC0_recoverbasedonsunlight
.word 0x802AE51					@hiddenpowerdamagecalculation
.word atkC2_selectfirstvalidtarget	@selectnexttarget
.word atkC3_trysetfutureattack		@setfutureattack
.word 0x802B0E9					@beatupcalculation
.word atkC5_setsemiinvulnerablebit
.word atkC6_clearsemiinvulnerablebit
.word 0x802B40D					@setminimize
.word atkC8_sethail
.word atkC9_jumpifattackandspecialattackcannotfall
.word atkCA_setforcedtarget
.word 0x802B58D					@setcharge
.word atkCC_callterrainattack
.word atkCD_cureifburnedparalysedorpoisoned
.word atkCE_settorment
.word atkCF_jumpifnodamage
.word atkD0_settaunt
.word 0x802B811					@sethelpinghand
.word atkD2_tryswapitems		@itemswap
.word atkD3_trycopyability		@copyability
.word atkD4_trywish
.word 0x802BCB5					@setroots
.word 0x802BD0D					@doubledamagedealtifdamaged
.word atkD7_setyawn
.word atkD8_setdamagetohealthdifference
.word 0x802BE49					@scaledamagebyhealthratio
.word atkDA_tryswapabilities	@abilityswap
.word atkDB_tryimprision		@imprisoneffect
.word 0x802C04D					@setgrudge
.word 0x802C0A5					@weightdamagecalculation
.word atkDE_asistattackselect
.word 0x802C2BD					@setmagiccoat
.word 0x802C341					@setstealstatchange
.word atkE1_trygetintimidatetarget
.word atkE2_switchoutabilities
.word 0x802C515					@jumpiffainted
.word atkE4_getsecretpowereffect	@secretpower
.word atkE5_pickupitemcalculation
.word 0x802C709					@castformtransform
.word atkE7_trycastformdatachange	@castformswitch
.word atkE8_settypebasedhalvers
.word 0x802C869					@seteffectbyweather
.word atkEA_tryrecycleitem
.word atkEB_settypetoterrain
.word 0x802CA79					@pursuitwhenswitched
.word 0x802CB3D					@snatchmove
.word atkEE_removelightscreenreflect	@removereflectlightscreen
.word atkEF_handleballthrow		@pokemoncatchfunction
.word atkF0_givecaughtmon		@catchpoke
.word atkF1_trysetcaughtmondexflags
.word 0x802D1E9					@displaydexinfo
.word 0x802D535					@capturenicknamepoke
.word 0x802D7B9					@subattackerhpbydmg
.word 0x802D7E9					@removeattackerstatus1
.word 0x802D811					@finishaction
.word 0x802D81D					@finishturn
.word atkF8_callasm
.word atkF9_sethalfword
.word atkFA_setword
.word atkFB_setspecialstatusbit
.word atkFC_clearspecialstatusbit
.word atkFD_jumpifabilitypresenttargetfield
.word atkFE_prefaintmoveendeffects
.word atkFF_callsecondarytable

gBattleScriptingCommandsTable2:
.word NULL
.word NULL
.word atkFF02_cureprimarystatus
.word atkFF03_jumpifpartnerattack
.word NULL
.word NULL
.word atkFF06_setterrain
.word atkFF07_jumpifhelditemeffect
.word atkFF08_counterclear
.word atkFF09_jumpifcounter
.word atkFF0A_setability
.word NULL
.word atkFF0C_jumpiftargetpartner
.word NULL
.word atkFF0E_setcounter
.word atkFF0F_jumpifgrounded
.word atkFF10_jumpifhelditem
.word 0x8028821					@refreshhpbar
.word atkFF12_jumpifhealthcomparestomax
.word atkFF13_setdamagetobankhealthfraction
.word atkFF14_jumpiftypepresent
.word atkFF15_jumpifstatcanbemodified
.word atkFF16_jumpifnoviablemonsleft
.word atkFF17_setsidestatus
.word atkFF18_clearsidestatus
.word atkFF19_formchange
.word atkFF1A_jumpifabilitypresentattackerfield
.word atkFF1B_tryactivateswitchinability
.word atkFF1C_handletrainerslidemsg
.word atkFF1D_trytrainerslidefirstdownmsg
.word atkFF1E_trainerslideout
.word atkFF1F_flowershieldlooper
.word atkFF20_jumpifprotectedbycraftyshield
.word atkFF21_tryspectralthiefsteal
.word atkFF22_jumpifspecies
.word atkFF23_faintpokemonaftermove
.word atkFF24_jumpifattackeralreadydiddamage
.word atkFF25_jumpifterrainandgrounded
.word atkFF26_attackstringnoprotean
.word atkFF27_tryactivateprotean
.word atkFF28_jumpifweight
.word atkFF29_trysetsleep
.word atkFF2A_trysetparalysis
.word atkFF2B_trysetburn
.word atkFF2C_trysetpoison
.word atkFF2D_addindicatorforattackerswitchineffects
.word atkFF2E_setmoveeffect2
.word atkFF2F_setmaxmoveeffect
.word atkFF30_jumpifdynamaxed
.word atkFF31_jumpifraidboss
.word atkFF32_recycleberry
.word atkFF33_SetEffectPrimaryScriptingBank
.word atkFF34_canconfuse
.word atkFF35_jumpifmaxchistrikecapped
