#include "defines.h"
#include "../include/menu.h"
#include "../include/sprite.h"
#include "../include/string_util.h"
#include "../include/pokemon_summary_screen.h"
#include "../include/constants/moves.h"

struct Struct203B0B8
{
    u16 unk00;
    u16 curHpStr;
    u16 atkStr;
    u16 defStr;
    u16 spAStr;
    u16 spDStr;
    u16 speStr;
    u16 expStr;
    u16 toNextLevel;

    u16 curPp[5];
    u16 maxPp[5];

    u16 unk26;
};

extern struct Struct203B0B8 *sMonSkillsPrinterXpos;
extern const s8 sNatureStatTable[25][5];

void PokeSum_PrintMonTypeIcons(void)
{
    switch (sMonSummaryScreen->curPageIndex)
    {
    case PSS_PAGE_INFO:
        if (!sMonSummaryScreen->isEgg)
        {
            blit_move_info_icon(sMonSummaryScreen->windowIds[POKESUM_WIN_RIGHT_PANE], sMonSummaryScreen->monTypes[0] + 1, 26, 30);

            if (sMonSummaryScreen->monTypes[0] != sMonSummaryScreen->monTypes[1])
                blit_move_info_icon(sMonSummaryScreen->windowIds[POKESUM_WIN_RIGHT_PANE], sMonSummaryScreen->monTypes[1] + 1, 62, 30);

            #ifdef TERASTAL_FEATURE
            blit_move_info_icon(sMonSummaryScreen->windowIds[POKESUM_WIN_RIGHT_PANE], sMonSummaryScreen->currentMon.teratype + 1, 63, 5);
            #endif
        }
        break;
    case PSS_PAGE_SKILLS:
        break;
    case PSS_PAGE_MOVES:
        break;
    case PSS_PAGE_MOVES_INFO:
        FillWindowPixelBuffer(sMonSummaryScreen->windowIds[6], 0);
        blit_move_info_icon(sMonSummaryScreen->windowIds[6], sMonSummaryScreen->monTypes[0] + 1, 0, 3);

        if (sMonSummaryScreen->monTypes[0] != sMonSummaryScreen->monTypes[1])
            blit_move_info_icon(sMonSummaryScreen->windowIds[6], sMonSummaryScreen->monTypes[1] + 1, 36, 3);

        PutWindowTilemap(sMonSummaryScreen->windowIds[6]);
        break;
    }
}

static const struct TextColor sOTGenderTextColors[] =
{
    {0, 7, 10},
    {0, 12, 10},
};

void PokeSum_PrintOTGender(void)
{
    WindowPrint(sMonSummaryScreen->windowIds[3], 2, 26, 43, &sOTGenderTextColors[GetMonData(&sMonSummaryScreen->currentMon, MON_DATA_OT_GENDER, NULL)], 0xFF, sMonSummaryScreen->summary.otNameStrBuf);
}

static const struct TextColor sNatureTextColors[] =
{
    {0, 14, 10},
    {0, 1, 10},
    {0, 7, 10},
};

u8 GetNatureTextColor(s8 natureMod)
{
    if (natureMod == 0)
        return 0;
    else if (natureMod > 0)
        return 1;
    else
        return 2;
}

void PrintSkillsPage(void)
{
    u8 nature = sMonSummaryScreen->currentMon.natureMint != 0 ? sMonSummaryScreen->currentMon.natureMint - 1 : GetNature(&sMonSummaryScreen->currentMon);
    const s8 *natureMod = sNatureStatTable[nature];

    WindowPrint(sMonSummaryScreen->windowIds[POKESUM_WIN_RIGHT_PANE], 2, sMonSkillsPrinterXpos->curHpStr, 4, &sNatureTextColors[0], 0xFF, sMonSummaryScreen->summary.curHpStrBuf);
    WindowPrint(sMonSummaryScreen->windowIds[POKESUM_WIN_RIGHT_PANE], 2, 50 + sMonSkillsPrinterXpos->atkStr, 22, &sNatureTextColors[GetNatureTextColor(natureMod[STAT_ATK - 1])], 0xFF, sMonSummaryScreen->summary.statValueStrBufs[PSS_STAT_ATK]);
    WindowPrint(sMonSummaryScreen->windowIds[POKESUM_WIN_RIGHT_PANE], 2, 50 + sMonSkillsPrinterXpos->defStr, 35, &sNatureTextColors[GetNatureTextColor(natureMod[STAT_DEF - 1])], 0xFF, sMonSummaryScreen->summary.statValueStrBufs[PSS_STAT_DEF]);
    WindowPrint(sMonSummaryScreen->windowIds[POKESUM_WIN_RIGHT_PANE], 2, 50 + sMonSkillsPrinterXpos->spAStr, 48, &sNatureTextColors[GetNatureTextColor(natureMod[STAT_SPATK - 1])], 0xFF, sMonSummaryScreen->summary.statValueStrBufs[PSS_STAT_SPA]);
    WindowPrint(sMonSummaryScreen->windowIds[POKESUM_WIN_RIGHT_PANE], 2, 50 + sMonSkillsPrinterXpos->spDStr, 61, &sNatureTextColors[GetNatureTextColor(natureMod[STAT_SPDEF - 1])], 0xFF, sMonSummaryScreen->summary.statValueStrBufs[PSS_STAT_SPD]);
    WindowPrint(sMonSummaryScreen->windowIds[POKESUM_WIN_RIGHT_PANE], 2, 50 + sMonSkillsPrinterXpos->speStr, 74, &sNatureTextColors[GetNatureTextColor(natureMod[STAT_SPD - 1])], 0xFF, sMonSummaryScreen->summary.statValueStrBufs[PSS_STAT_SPE]);
    WindowPrint(sMonSummaryScreen->windowIds[POKESUM_WIN_RIGHT_PANE], 2, 15 + sMonSkillsPrinterXpos->expStr, 87, &sNatureTextColors[0], 0xFF, sMonSummaryScreen->summary.expPointsStrBuf);
    WindowPrint(sMonSummaryScreen->windowIds[POKESUM_WIN_RIGHT_PANE], 2, 15 + sMonSkillsPrinterXpos->toNextLevel, 100, &sNatureTextColors[0], 0xFF, sMonSummaryScreen->summary.expToNextLevelStrBuf);
}
