#ifndef GUARD_POKEMON_SUMMARY_SCREEN_H
#define GUARD_POKEMON_SUMMARY_SCREEN_H

#include "main.h"
#include "constants/moves.h"

extern const u8* const gMoveDescriptionPointers[];
extern const u8* const gNatureNamePointers[];

void __attribute__((long_call)) ShowSelectMovePokemonSummaryScreen(struct Pokemon *, u8, u8, MainCallback, u16);
u8 __attribute__((long_call)) GetMoveSlotToReplace(void);
void __attribute__((long_call)) SummaryScreen_SetUnknownTaskId(u8 a0);
void __attribute__((long_call)) SummaryScreen_DestroyUnknownTask(void);
u8 __attribute__((long_call)) GetLastViewedMonIndex(void);
void __attribute__((long_call)) ShowPokemonSummaryScreen(struct Pokemon * party, u8 cursorPos, u8 lastIdx, void (*callback)(void), u8 a4);
void __attribute__((long_call)) sub_81392FC(u8);

// The Pokemon Summary Screen can operate in different modes. Certain features,
// such as move re-ordering, are available in the different modes.
enum PokemonSummaryScreenMode
{
    PSS_MODE_NORMAL,
    PSS_MODE_UNK1,
    PSS_MODE_SELECT_MOVE,
    PSS_MODE_FORGET_MOVE,
    PSS_MODE_UNK4,
    PSS_MODE_BOX,
};

enum PokemonSummaryScreenPage
{
    PSS_PAGE_INFO,
    PSS_PAGE_SKILLS,
    PSS_PAGE_MOVES,
    PSS_PAGE_MOVES_INFO,
    PSS_PAGE_UNK4,
    PSS_PAGE_MOVE_DELETER,
};

enum PokemonSummaryScreenState321C
{
    PSS_STATE321C_0,
    PSS_STATE321C_1,
    PSS_STATE321C_2,
    PSS_STATE321C_3,
    PSS_STATE321C_4,
    PSS_STATE321C_5,
    PSS_STATE321C_6
};

enum PokemonSummaryScreenStat
{
    PSS_STAT_ATK,
    PSS_STAT_DEF,
    PSS_STAT_SPA,
    PSS_STAT_SPD,
    PSS_STAT_SPE
};

#define POKESUM_WIN_PAGE_NAME        0
#define POKESUM_WIN_CONTROLS         1
#define POKESUM_WIN_LVL_NICK         2
#define POKESUM_WIN_RIGHT_PANE       3
#define POKESUM_WIN_TRAINER_MEMO     4

#define POKESUM_WIN_INFO_3           3
#define POKESUM_WIN_INFO_4           4
#define POKESUM_WIN_INFO_5           5
#define POKESUM_WIN_INFO_6           6

#define POKESUM_WIN_SKILLS_3         3
#define POKESUM_WIN_SKILLS_4         4
#define POKESUM_WIN_SKILLS_5         5
#define POKESUM_WIN_SKILLS_6         6

#define POKESUM_WIN_MOVES_3          3
#define POKESUM_WIN_MOVES_4          4
#define POKESUM_WIN_MOVES_5          5
#define POKESUM_WIN_MOVES_6          6

struct PokemonSummaryScreenData
{
    u16 unk0[0x800];
    u16 unk1000[0x800];
    u16 unk2000[0x800];
    u8 ALIGNED(4) windowIds[7];

    u8 ALIGNED(4) unk3008;
    u8 ALIGNED(4) ballIconSpriteId;
    u8 ALIGNED(4) unk3010;
    u8 ALIGNED(4) unk3014;

    u8 ALIGNED(4) unk3018;
    u8 ALIGNED(4) unk301C;

    u8 ALIGNED(4) unk3020;

    bool32 isEnemyParty; /* 0x3024 */

    struct PokeSummary
    {
        u8 ALIGNED(4) unk3028[POKEMON_NAME_LENGTH - 4];
        u8 ALIGNED(4) unk3034[POKEMON_NAME_LENGTH - 3];
        u8 ALIGNED(4) unk3040[8];
        u8 ALIGNED(4) unk3048[2][8];

        u8 ALIGNED(4) unk3058[5];
        u8 ALIGNED(4) unk3060[7];
        u8 ALIGNED(4) unk3068[ITEM_NAME_LENGTH + 1];

        u8 ALIGNED(4) unk3074[3];
        u8 ALIGNED(4) unk3078[7];
        u8 ALIGNED(4) unk3080[9];
        u8 ALIGNED(4) unk308C[5][5];

        u8 ALIGNED(4) unk30A8[5][11];
        u8 ALIGNED(4) unk30E0[4][11];
        u8 ALIGNED(4) unk310C;
        u8 ALIGNED(4) unk3110[5][MOVE_NAME_LENGTH - 6];
        u8 ALIGNED(4) unk3140[5][5];
        u8 ALIGNED(4) unk315C[5][5];

        u8 ALIGNED(4) unk3178[9];
        u8 ALIGNED(4) unk3184[9];

        u8 ALIGNED(4) unk318C[9];
        u8 ALIGNED(4) unk3195[21];
    } summary;

    u8 ALIGNED(4) isEgg; /* 0x31AC */
    u8 ALIGNED(4) isBadEgg; /* 0x31B0 */

    u8 ALIGNED(4) mode; /* 0x31B4 */
    u8 ALIGNED(4) unk31B8; /* 0x31B8 */
    u8 ALIGNED(4) lastIndex; /* 0x31BC */
    u8 ALIGNED(4) curPageIndex; /* 0x31C0 */
    u8 ALIGNED(4) unk31C4; /* 0x31C4 */
    u8 ALIGNED(4) isBoxMon; /* 0x31C8 */
    u8 ALIGNED(4) monTypes[2]; /* 0x31CC */

    u8 ALIGNED(4) unk31D0; /* 0x31D0 */
    u8 ALIGNED(4) unk31D4; /* 0x31D4 */
    u8 ALIGNED(4) unk31D8; /* 0x31D8 */
    u8 ALIGNED(4) unk31DC; /* 0x31DC */

    u8 ALIGNED(4) lockMovesFlag; /* 0x31E0 */

    u8 ALIGNED(4) unk31E4; /* 0x31E4 */
    u8 ALIGNED(4) unk31E8; /* 0x31E8 */
    u8 ALIGNED(4) unk31EC; /* 0x31EC */
    u8 ALIGNED(4) unk31F0; /* 0x31F0 */
    u8 ALIGNED(4) unk31F4; /* 0x31F4 */
    s16 ALIGNED(4) unk31F8; /* 0x31F8 */

    u16 unk31FC[5]; /* 0x31FC */
    u16 unk3206[5]; /* 0x3206 */
    u8 ALIGNED(4) unk3210; /* 0x3210 */
    u8 ALIGNED(4) unk3214; /* 0x3214 */

    u8 ALIGNED(4) unk3218; /* 0x3218 */

    u8 ALIGNED(4) state321C; /* 0x321C */
    u8 ALIGNED(4) unk3220; /* 0x3220 */
    u8 ALIGNED(4) unk3224; /* 0x3224 */
    u8 ALIGNED(4) unk3228; /* 0x3228 */
    u8 ALIGNED(4) unk322C; /* 0x322C */
    u8 ALIGNED(4) unk3230; /* 0x3230 */
    u8 ALIGNED(4) unk3234; /* 0x3234 */
    u8 ALIGNED(4) unk3238; /* 0x3238 */

    struct Pokemon currentMon; /* 0x323C */

    union
    {
        struct Pokemon * mons;
        struct BoxPokemon * boxMons;
    } monList;

    MainCallback savedCallback;
    struct Sprite * markingSprite;

    u8 ALIGNED(4) unk3300[2]; /* 0x3300 */
    u8 ALIGNED(4) unk3304[3]; /* 0x3304 */
};

extern struct PokemonSummaryScreenData* sMonSummaryScreen;

#define TAG_PSS_UNK_64 0x64
#define TAG_PSS_UNK_65 0x65
#define TAG_PSS_UNK_66 0x66
#define TAG_PSS_UNK_67 0x67
#define TAG_PSS_UNK_6E 0x6E
#define TAG_PSS_UNK_78 0x78
#define TAG_PSS_UNK_82 0x82
#define TAG_PSS_UNK_8C 0x8C
#define TAG_PSS_UNK_96 0x96
#define TAG_PSS_UNK_A0 0xA0

#endif // GUARD_POKEMON_SUMMARY_SCREEN_H
