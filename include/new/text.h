#pragma once

/**
 * \file text.h
 * \brief Contains text contants for strings.
 */

#define MSGBOX_LEN 35

#define PC_BUFFER(x) 0xFD, x
#define PC_END 0xFF
#define PC_SPACE 0x0
#define PC_NEWLINE 0xFE

//  Punctutation
#define PC_DASH 0xAE
#define PC_EXCLAMATION 0xAB
#define PC_APOSTROPHE 0xB4
#define PC_TIMES 0xB9

// Uppercase
#define PC_A 0xBB
#define PC_B 0xBC
#define PC_C 0xBD
#define PC_D 0xBE
#define PC_E 0xBF
#define PC_F 0xC0
#define PC_G 0xC1
#define PC_H 0xC2
#define PC_I 0xC3
#define PC_J 0xC4
#define PC_K 0xC5
#define PC_L 0xC6
#define PC_M 0xC7
#define PC_N 0xC8
#define PC_O 0xC9
#define PC_P 0xCA
#define PC_Q 0xCB
#define PC_R 0xCC
#define PC_S 0xCD
#define PC_T 0xCE
#define PC_U 0xCF
#define PC_V 0xD0
#define PC_W 0xD1
#define PC_X 0xD2
#define PC_Y 0xD3
#define PC_Z 0xD4

// Lowercase
#define PC_a 0xD5
#define PC_b 0xD6
#define PC_c 0xD7
#define PC_d 0xD8
#define PC_e 0xD9
#define PC_f 0xDA
#define PC_g 0xDB
#define PC_h 0xDC
#define PC_i 0xDD
#define PC_j 0xDE
#define PC_k 0xDF
#define PC_l 0xE0
#define PC_m 0xE1
#define PC_n 0xE2
#define PC_o 0xE3
#define PC_p 0xE4
#define PC_q 0xE5
#define PC_r 0xE6
#define PC_s 0xE7
#define PC_t 0xE8
#define PC_u 0xE9
#define PC_v 0xEA
#define PC_w 0xEB
#define PC_x 0xEC
#define PC_y 0xED
#define PC_z 0xEE

//Numbers
#define PC_0 0xA1
#define PC_1 0xA2
#define PC_2 0xA3
#define PC_3 0xA4
#define PC_4 0xA5
#define PC_5 0xA6
#define PC_6 0xA7
#define PC_7 0xA8
#define PC_8 0xA9
#define PC_9 0xAA

#define PC_aa 0x1
#define PC_ii 0x2
#define PC_uu 0x3
#define PC_ee 0x4
#define PC_oo 0x5
#define PC_ka 0x6
#define PC_ki 0x7
#define PC_ku 0x8
#define PC_ke 0x9
#define PC_ko 0x0A
#define PC_sa 0x0B
#define PC_si 0x0C
#define PC_su 0x0D
#define PC_se 0x0E
#define PC_so 0x0F
#define PC_ta 0x10
#define PC_ti 0x11
#define PC_tu 0x12
#define PC_te 0x13
#define PC_to 0x14
#define PC_na 0x15
#define PC_ni 0x16
#define PC_nu 0x17
#define PC_ne 0x18
#define PC_no 0x19
#define PC_ha 0x1A
#define PC_hi 0x1B
#define PC_hu 0x1C
#define PC_he 0x1D
#define PC_ho 0x1E
#define PC_ma 0x1F
#define PC_mi 0x20
#define PC_mu 0x21
#define PC_me 0x22
#define PC_mo 0x23
#define PC_ya 0x24
#define PC_yu 0x25
#define PC_yo 0x26
#define PC_ra 0x27
#define PC_ri 0x28
#define PC_ru 0x29
#define PC_re 0x2A
#define PC_ro 0x2B
#define PC_wa 0x2C
#define PC_wo 0x2D
#define PC_nn 0x2E
#define PC_xa 0x2F
#define PC_xi 0x30
#define PC_xu 0x31
#define PC_xe 0x32
#define PC_xo 0x33
#define PC_xya 0x34
#define PC_xyu 0x35
#define PC_xyo 0x36
#define PC_ga 0x37
#define PC_gi 0x38
#define PC_gu 0x39
#define PC_ge 0x3A
#define PC_go 0x3B
#define PC_za 0x3C
#define PC_zi 0x3D
#define PC_zu 0x3E
#define PC_ze 0x3F
#define PC_zo 0x40
#define PC_da 0x41
#define PC_di 0x42
#define PC_du 0x43
#define PC_de 0x44
#define PC_do 0x45
#define PC_ba 0x46
#define PC_bi 0x47
#define PC_bu 0x48
#define PC_be 0x49
#define PC_bo 0x4A
#define PC_pa 0x4B
#define PC_pi 0x4C
#define PC_pu 0x4D
#define PC_pe 0x4E
#define PC_po 0x4F
#define PC_xtu 0x50
#define PC_AA 0x51
#define PC_II 0x52
#define PC_UU 0x53
#define PC_EE 0x54
#define PC_OO 0x55
#define PC_KA 0x56
#define PC_KI 0x57
#define PC_KU 0x58
#define PC_KE 0x59
#define PC_KO 0x5A
#define PC_SA 0x5B
#define PC_SI 0x5C
#define PC_SU 0x5D
#define PC_SE 0x5E
#define PC_SO 0x5F
#define PC_TA 0x60
#define PC_TI 0x61
#define PC_TU 0x62
#define PC_TE 0x63
#define PC_TO 0x64
#define PC_NA 0x65
#define PC_NI 0x66
#define PC_NU 0x67
#define PC_NE 0x68
#define PC_NO 0x69
#define PC_HA 0x6A
#define PC_HI 0x6B
#define PC_HU 0x6C
#define PC_HE 0x6D
#define PC_HO 0x6E
#define PC_MA 0x6F
#define PC_MI 0x70
#define PC_MU 0x71
#define PC_ME 0x72
#define PC_MO 0x73
#define PC_YA 0x74
#define PC_YU 0x75
#define PC_YO 0x76
#define PC_RA 0x77
#define PC_RI 0x78
#define PC_RU 0x79
#define PC_RE 0x7A
#define PC_RO 0x7B
#define PC_WA 0x7C
#define PC_WO 0x7D
#define PC_NN 0x7E
#define PC_XA 0x7F
#define PC_XI 0x80
#define PC_XU 0x81
#define PC_XE 0x82
#define PC_XO 0x83
#define PC_XYA 0x84
#define PC_XYU 0x85
#define PC_XYO 0x86
#define PC_GA 0x87
#define PC_GI 0x88
#define PC_GU 0x89
#define PC_GE 0x8A
#define PC_GO 0x8B
#define PC_ZA 0x8C
#define PC_ZI 0x8D
#define PC_ZU 0x8E
#define PC_ZE 0x8F
#define PC_ZO 0x90
#define PC_DA 0x91
#define PC_DI 0x92
#define PC_DU 0x93
#define PC_DE 0x94
#define PC_DO 0x95
#define PC_BA 0x96
#define PC_BI 0x97
#define PC_BU 0x98
#define PC_BE 0x99
#define PC_BO 0x9A
#define PC_PA 0x9B
#define PC_PI 0x9C
#define PC_PU 0x9D
#define PC_PE 0x9E
#define PC_PO 0x9F
#define PC_XTU 0xA0