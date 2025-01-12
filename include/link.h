#ifndef GUARD_LINK_H
#define GUARD_LINK_H

#define MAX_LINK_PLAYERS 4
#define MAX_RFU_PLAYERS 5
#define CMD_LENGTH 8
#define QUEUE_CAPACITY 50
#define BLOCK_BUFFER_SIZE 0x100

#define LINK_SLAVE 0
#define LINK_MASTER 8

#define LINK_STAT_LOCAL_ID               0x00000003
#define LINK_STAT_PLAYER_COUNT           0x0000001C
#define LINK_STAT_PLAYER_COUNT_SHIFT     2
#define LINK_STAT_MASTER                 0x00000020
#define LINK_STAT_MASTER_SHIFT           5
#define LINK_STAT_CONN_ESTABLISHED       0x00000040
#define LINK_STAT_CONN_ESTABLISHED_SHIFT 6
#define LINK_STAT_RECEIVED_NOTHING       0x00000100
#define LINK_STAT_RECEIVED_NOTHING_SHIFT 8
#define LINK_STAT_UNK_FLAG_9             0x00000200
#define LINK_STAT_UNK_FLAG_9_SHIFT       9
#define LINK_STAT_ERRORS                 0x0007F000
#define LINK_STAT_ERRORS_SHIFT           12

#define LINK_STAT_ERROR_HARDWARE         0x00001000
#define LINK_STAT_ERROR_HARDWARE_SHIFT   12
#define LINK_STAT_ERROR_CHECKSUM         0x00002000
#define LINK_STAT_ERROR_CHECKSUM_SHIFT   13
#define LINK_STAT_ERROR_QUEUE_FULL       0x00004000
#define LINK_STAT_ERROR_QUEUE_FULL_SHIFT 14
#define LINK_STAT_ERROR_LAG_MASTER       0x00010000
#define LINK_STAT_ERROR_LAG_MASTER_SHIFT 16
#define LINK_STAT_ERROR_INVALID_ID       0x00020000
#define LINK_STAT_ERROR_INVALID_ID_SHIFT 17
#define LINK_STAT_ERROR_LAG_SLAVE        0x00040000
#define LINK_STAT_ERROR_LAG_SLAVE_SHIFT  18

#define EXTRACT_PLAYER_COUNT(status) \
(((status) & LINK_STAT_PLAYER_COUNT) >> LINK_STAT_PLAYER_COUNT_SHIFT)
#define EXTRACT_MASTER(status) \
(((status) >> LINK_STAT_MASTER_SHIFT) & 1)
#define EXTRACT_CONN_ESTABLISHED(status) \
(((status) >> LINK_STAT_CONN_ESTABLISHED_SHIFT) & 1)
#define EXTRACT_RECEIVED_NOTHING(status) \
(((status) >> LINK_STAT_RECEIVED_NOTHING_SHIFT) & 1)
#define EXTRACT_LINK_ERRORS(status) \
(((status) & LINK_STAT_ERRORS) >> LINK_STAT_ERRORS_SHIFT)

#define LINKCMD_SEND_LINK_TYPE        0x2222
#define LINKCMD_0x2FFE                0x2FFE
#define LINKCMD_SEND_HELD_KEYS        0x4444
#define LINKCMD_0x5555                0x5555
#define LINKCMD_0x5566                0x5566
#define LINKCMD_0x5FFF                0x5FFF
#define LINKCMD_0x6666                0x6666
#define LINKCMD_0x7777                0x7777
#define LINKCMD_CONT_BLOCK            0x8888
#define LINKCMD_0xAAAA                0xAAAA
#define LINKCMD_0xAAAB                0xAAAB
#define LINKCMD_READY_TO_TRADE        0xAABB
#define LINKCMD_READY_FINISH_TRADE    0xABCD
#define LINKCMD_INIT_BLOCK            0xBBBB
#define LINKCMD_READY_CANCEL_TRADE    0xBBCC
#define LINKCMD_SEND_HELD_KEYS_2      0xCAFE
#define LINKCMD_0xCCCC                0xCCCC
#define LINKCMD_START_TRADE           0xCCDD
#define LINKCMD_CONFIRM_FINISH_TRADE  0xDCBA
#define LINKCMD_SET_MONS_TO_TRADE     0xDDDD 
#define LINKCMD_0xDDEE                0xDDEE
#define LINKCMD_REQUEST_CANCEL        0xEEAA
#define LINKCMD_CANCEL_TRADE          0xEEBB
#define LINKCMD_0xEECC                0xEECC

#define LINKTYPE_0x1111              0x1111  // trade
#define LINKTYPE_0x1122              0x1122  // trade
#define LINKTYPE_0x1133              0x1133  // trade
#define LINKTYPE_0x1144              0x1144  // trade
#define LINKTYPE_BATTLE              0x2211
#define LINKTYPE_0x2222              0x2222  // unused battle?
#define LINKTYPE_SINGLE_BATTLE       0x2233
#define LINKTYPE_DOUBLE_BATTLE       0x2244
#define LINKTYPE_MULTI_BATTLE        0x2255
#define LINKTYPE_BATTLE_TOWER_50     0x2266
#define LINKTYPE_BATTLE_TOWER_OPEN   0x2277 
#define LINKTYPE_BATTLE_TOWER        0x2288
#define LINKTYPE_0x3311              0x3311
#define LINKTYPE_0x3322              0x3322
#define LINKTYPE_BERRY_BLENDER_SETUP 0x4411
#define LINKTYPE_BERRY_BLENDER       0x4422
#define LINKTYPE_0x5501              0x5501  // mystery event
#define LINKTYPE_0x5502              0x5502  // unused?
#define LINKTYPE_0x5503              0x5503  // eReader
#define LINKTYPE_CONTEST_GMODE       0x6601
#define LINKTYPE_CONTEST_EMODE       0x6602

struct LinkStatus
{
    u32 localId:2;
    u32 playerCount:3;
    u32 master:1;
    u32 connEstablished:1;
    u32 unused_7:1;
    u32 receivedNothing:1;
    u32 unused_9:7;
    u32 errors:7;
};

#define MASTER_HANDSHAKE 0x8FFF
#define SLAVE_HANDSHAKE  0xB9A0

#define SIO_MULTI_CNT ((struct SioMultiCnt *)REG_ADDR_SIOCNT)

enum
{
    LINK_STATE_START0,
    LINK_STATE_START1,
    LINK_STATE_HANDSHAKE,
    LINK_STATE_INIT_TIMER,
    LINK_STATE_CONN_ESTABLISHED,
};

enum
{
    EXCHANGE_NOT_STARTED,
    EXCHANGE_COMPLETE,
    EXCHANGE_TIMED_OUT,
    EXCHANGE_IN_PROGRESS,
    EXCHANGE_PLAYER_NOT_READY,
    EXCHANGE_PARTNER_NOT_READY,
    EXCHANGE_STAT_6,
    EXCHANGE_STAT_7
};

enum
{
    QUEUE_FULL_NONE,
    QUEUE_FULL_SEND,
    QUEUE_FULL_RECV,
};

enum
{
    LAG_NONE,
    LAG_MASTER,
    LAG_SLAVE,
};

struct LinkPlayer
{
    /* 0x00 */ u16 version;
    /* 0x02 */ u16 lp_field_2;
    /* 0x04 */ u32 trainerId;
    /* 0x08 */ u8 name[PLAYER_NAME_LENGTH + 1];
    /* 0x10 */ u8 progressFlags; // (& 0x0F) is hasNationalDex, (& 0xF0) is hasClearedGame
    /* 0x11 */ u8 neverRead;
    /* 0x12 */ u8 progressFlagsCopy;
    /* 0x13 */ u8 gender;
    /* 0x14 */ u32 linkType;
    /* 0x18 */ u16 id; // battler id in battles
    /* 0x1A */ u16 language;
};

struct LinkPlayerBlock
{
    char magic1[16];
    struct LinkPlayer linkPlayer;
    char magic2[16];
};

// circular queues

struct SendQueue
{
    /* 0x000 */ u16 data[CMD_LENGTH][QUEUE_CAPACITY];
    /* 0x320 */ u8 pos;
    /* 0x321 */ u8 count;
};

struct RecvQueue
{
    u16 data[MAX_LINK_PLAYERS][CMD_LENGTH][QUEUE_CAPACITY];
    u8 pos;
    u8 count;
};

struct Link
{
    /* 0x000 */ u8 isMaster; // 0: slave, 8: master
    /* 0x001 */ u8 state;
    /* 0x002 */ u8 localId; // local multi-player ID
    /* 0x003 */ u8 playerCount;
    /* 0x004 */ u16 tempRecvBuffer[4];
    /* 0x00c */ bool8 receivedNothing;
    /* 0x00d */ s8 serialIntrCounter;
    /* 0x00e */ bool8 handshakeAsMaster;
    /* 0x00f */ u8 link_field_F;

    // error conditions
    /* 0x010 */ bool8 hardwareError; // hardware reported an error
    /* 0x011 */ bool8 badChecksum; // checksum didn't match between devices
    /* 0x012 */ u8 queueFull; // send or recv queue out of space
    /* 0x013 */ u8 lag; // connection is lagging

    /* 0x014 */ u16 checksum;

    /* 0x016 */ u8 sendCmdIndex;
    /* 0x017 */ u8 recvCmdIndex;

    /* 0x018 */ struct SendQueue sendQueue;
    /* 0x33c */ struct RecvQueue recvQueue;
};

struct BlockRequest
{
    void * address;
    u32 size;
};

extern const struct BlockRequest sBlockRequestLookupTable[5];

extern struct Link gLink;
extern u16 gRecvCmds[MAX_RFU_PLAYERS][CMD_LENGTH];
extern u8 gBlockSendBuffer[BLOCK_BUFFER_SIZE];
extern u16 gLinkType;
extern u32 gLinkStatus;
extern u16 gBlockRecvBuffer[MAX_RFU_PLAYERS][BLOCK_BUFFER_SIZE / 2];
extern u16 gSendCmd[CMD_LENGTH];
extern struct LinkPlayer gLinkPlayers[5];
extern u16 word_3002948[];
extern bool8 gReceivedRemoteLinkPlayers;
extern u32 gUnknown_02022330;
extern bool8 gLinkVSyncDisabled;
extern u32 gLinkStatus;


/*bool8 IsWirelessAdapterConnected(void);
void Task_DestroySelf(u8 taskId);
void OpenLink(void);
void CloseLink(void);
u16 LinkMain2(const u16 *);
void sub_8007B14(void);
bool32 sub_8007B24(void);
void ClearLinkCallback(void);
void ClearLinkCallback_2(void);
u8 GetLinkPlayerCount(void);
void OpenLinkTimed(void);
u8 GetLinkPlayerDataExchangeStatusTimed(int lower, int upper);
bool8 IsLinkPlayerDataExchangeComplete(void);
u32 GetLinkPlayerTrainerId(u8);
void ResetLinkPlayers(void);
void sub_8007E24(void);
void sub_8007E4C(void);*/
u8 __attribute__((long_call)) GetMultiplayerId(void);
/*u8 bitmask_all_link_players_but_self(void);
bool8 SendBlock(u8, const void *, u16);
u8 GetBlockReceivedStatus(void);
void ResetBlockReceivedFlags(void);
void ResetBlockReceivedFlag(u8);
u8 GetLinkPlayerCount_2(void);
bool8 IsLinkMaster(void);
void CB2_LinkError(void);
u8 GetSioMultiSI(void);
bool8 IsLinkConnectionEstablished(void);
bool8 HasLinkErrorOccurred(void);
void ResetSerial(void);
u32 LinkMain1(u8 *shouldAdvanceLinkState, u16 *sendCmd, u16 (*recvCmds)[CMD_LENGTH]);
void LinkVSync(void);
void Timer3Intr(void);
void SerialCB(void);*/
bool32 __attribute__((long_call)) InUnionRoom(void);
/*void LoadWirelessStatusIndicatorSpriteGfx(void);
bool8 IsLinkTaskFinished(void);
void CreateWirelessStatusIndicatorSprite(u8, u8);
void sub_800ADF8(void);
void sub_800B488(void);
void CheckShouldAdvanceLinkState(void);
void sub_8011BD0(void);
u8 IsLinkMaster(void);
void sub_800AC34(void);
bool8 HandleLinkConnection(void);
void SetLinkDebugValues(u32 seed, u32 flags);
void sub_800A418(void);
void SetSuppressLinkErrorMessage(bool8 flag);
void sub_800B524(struct LinkPlayer *linkPlayer);
u8 GetSioMultiSI(void);
void sub_800AAF4(void);
void sub_800AF18(u32 status, u8 lastSendQueueCount, u8 lastRecvQueueCount, u8 unk_06);
void sub_800B348(void);
void sub_800B3A4(u32 who);
bool32 sub_800A07C(void);
void ResetLinkPlayerCount(void);
void sub_800AA04(u8 a0);
void sub_800B4C0(void);
bool32 sub_800B504(void);*/

extern u16 gLinkPartnersHeldKeys[6];
extern u32 gLinkDebugSeed;
extern struct LinkPlayerBlock gLocalLinkPlayerBlock;
extern bool8 gLinkErrorOccurred;
extern u32 gLinkDebugFlags;
extern bool8 gRemoteLinkPlayersNotReceived[MAX_LINK_PLAYERS];
extern u8 gBlockReceivedStatus[MAX_LINK_PLAYERS];
extern u16 gLinkHeldKeys;
extern u32 gLinkStatus;
extern u8 gUnknown_03003124;
extern u8 gUnknown_03003128;
extern u8 gUnknown_0300312C[MAX_LINK_PLAYERS];
extern u8 gUnknown_03003130[MAX_LINK_PLAYERS];
extern u16 gUnknown_03003134;
extern u8 gSuppressLinkErrorMessage;
extern u8 gWirelessCommType;
extern bool8 gSavedLinkPlayerCount;
extern u8 gSavedMultiplayerId;
extern struct LinkTestBGInfo gLinkTestBGInfo;
extern void (*gLinkCallback)(void);
extern bool8 gShouldAdvanceLinkState;
extern u16 gLinkTestBlockChecksums[MAX_LINK_PLAYERS];
extern u8 gBlockRequestType;
extern u8 gLastSendQueueCount;
extern u8 gLastRecvQueueCount;
extern u16 gLinkSavedIme;
extern u32 gFiller_030030AC;
extern u32 gFiller_03003194;
extern u32 gFiller_03003198;
extern u32 gFiller_0300319C;
extern u32 gFiller_03004178;
extern u32 gFiller_0300417C;
extern u32 gFiller_030030B8;
extern struct LinkPlayer gLocalLinkPlayer;

/*bool32 Link_AnyPartnersPlayingRubyOrSapphire(void);
bool32 sub_800A03C(void);
void SetLocalLinkPlayerId(u8);
u8 GetSavedPlayerCount(void);
void sub_8009FAC(void);
bool8 sub_800A4D8(u8 a0);
u8 sub_800A9D8(void);
u8 sub_800A0C8(s32, s32);
u8 sub_800A9A8(void);
void sub_800AD10(void);
void sub_800AB18(void);
void sub_8009F18(void);
bool8 sub_800AA60(void);
void sub_800ABF4(u16 a0);
bool32 IsSendingKeysToLink(void);
u32 GetLinkRecvQueueLength(void);*/

#endif // GUARD_LINK_H
