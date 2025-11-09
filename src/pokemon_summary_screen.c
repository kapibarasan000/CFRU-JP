#include "defines.h"
#include "../include/menu.h"
#include "../include/sprite.h"
#include "../include/string_util.h"
#include "../include/pokemon_summary_screen.h"
#include "../include/constants/moves.h"


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
