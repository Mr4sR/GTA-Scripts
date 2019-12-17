/*
Just to begin with, i've never taken any credit of parts that were created by Astro (Denver) aka
Denver the creator of PEN1.
Valhalla Gaming Comunity has indeed paid me for this very script you are about to read, where they
only paid for the systems and parts that were created by me.
They received this script a few months ago, and their server owner is trying to rip me off.
Due to this fact + i'm not scripting anymore, i release this script so that everyone can use it.

Credits to Astro.
Credits to Tratulla for his 2 .ini Functions.
Credits to the Fuel System creator on SA-MP forums.
Credits to Morph for the Name Showing timer.
*/
#include <a_samp>
#include <core>
#include <float>
#include <time>
#include <file>
#include <dprop>
#include <utils>
#include <morphinc>
static gTeam[MAX_PLAYERS];

#define MAX_STRING 255
#define CHECKPOINT_NONE 0
#define CHECKPOINT_HOME 12
#define COLOR_GRAD1 0xB4B5B7FF
#define COLOR_GRAD2 0xBFC0C2FF
#define COLOR_GRAD3 0xCBCCCEFF
#define COLOR_GRAD4 0xD8D8D8FF
#define COLOR_GRAD5 0xE3E3E3FF
#define COLOR_GRAD6 0xF0F0F0FF
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_LIGHTRED 0xFF6347AA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_LIGHTGREEN 0x9ACD32AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_YELLOW2 0xF5DEB3AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_FADE1 0xE6E6E6E6
#define COLOR_FADE2 0xC8C8C8C8
#define COLOR_FADE3 0xAAAAAAAA
#define COLOR_FADE4 0x8C8C8C8C
#define COLOR_FADE5 0x6E6E6E6E
#define COLOR_PURPLE 0xC2A2DAAA
#define COLOR_DBLUE 0x2641FEAA
#define COLOR_ALLDEPT 0xFF8282AA
#define COLOR_NEWS 0xFFA500AA
#define COLOR_OOC 0xE0FFFFAA
#define TEAM_CYAN 1
#define TEAM_BLUE 2
#define TEAM_GREEN 3
#define TEAM_ORANGE 4
#define TEAM_COR 5
#define TEAM_BAR 6
#define TEAM_TAT 7
#define TEAM_CUN 8
#define TEAM_STR 9
#define TEAM_HIT 10
#define TEAM_ADMIN 11
#define OBJECTIVE_COLOR 0x64000064
#define TEAM_GREEN_COLOR 0xFFFFFFAA
#define TEAM_JOB_COLOR 0xFFB6C1AA
#define TEAM_HIT_COLOR 0xFFFFFF00
#define TEAM_BLUE_COLOR 0x8D8DFF00
#define COLOR_ADD 0x63FF60AA
#define TEAM_GROVE_COLOR 0x00D900C8
#define TEAM_VAGOS_COLOR 0xFFC801C8
#define TEAM_BALLAS_COLOR 0xD900D3C8
#define TEAM_AZTECAS_COLOR 0x01FCFFC8
#define TEAM_CYAN_COLOR 0xFF8282AA
#define TEAM_ORANGE_COLOR 0xFF830000
#define TEAM_COR_COLOR 0x39393900
#define TEAM_BAR_COLOR 0x00D90000
#define TEAM_TAT_COLOR 0xBDCB9200
#define TEAM_CUN_COLOR 0xD900D300
#define TEAM_STR_COLOR 0x01FCFF00
#define TEAM_ADMIN_COLOR 0x00808000
#define COLOR_INVIS 0xAFAFAF00
#define COLOR_SPEC 0xBFC0C200

forward LoadProperty();
forward LoadBizz();
forward LoadSBizz();
forward LoadStuff();
forward SaveStuff();
forward LoadCK();
forward SaveCK();
forward LoadFamilies();
forward SaveFamilies();
forward LoadTurfs();
forward SaveTurfs();
forward LoadIRC();
forward SaveIRC();
forward LoadPapers();
forward SavePapers();
forward LoadBoxer();
forward SaveBoxer();
forward OnPropUpdate();
forward ExtortionBiz(bizid, money);
forward ExtortionSBiz(bizid, money);
forward JoinChannel(playerid, number, line[]);
forward JoinChannelNr(playerid, number);
forward IsAtClothShop(playerid);
forward IsAtGasStation(playerid);
forward IsAtFishPlace(playerid);
forward IsAtCookPlace(playerid);
forward IsAtBar(playerid);
forward SearchingHit(playerid);
forward DollahScoreUpdate();
forward SetPlayerSpawn(playerid);
forward SetupPlayerForClassSelection(playerid);
forward SetPlayerTeamFromClass(playerid,classid);
forward PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z);
forward CrimInRange(Float:radi, playerid,copid);
forward SendEnemyMessage(color, string[]);
forward SendTeamBeepMessage(team, color, string[]);
forward ABroadCast(color,const string[],level);
forward DateProp(playerid);
forward GetClosestPlayer(p1);
forward IsPlayerInTurf(playerid, turfid);
forward LoadMission(playerid,name[]);
forward SaveMission(playerid,name[]);
forward PrintBizInfo(playerid,targetid);
forward PrintSBizInfo(playerid,targetid);
forward SetPlayerUnjail();
forward OtherTimer();
forward RingTonerRev();
forward RingToner();
forward HireCost(carid);
forward BanLog(string[]);
forward KickLog(string[]);
forward PayLog(string[]);
forward CKLog(string[]);
forward IsATruck(carid);
forward IsAnAmbulance(carid);
forward IsACopCar(carid);
forward IsAPlane(carid);
forward IsABoat(carid);
forward IsACop(playerid);
forward IsAMember(playerid);
forward IsAnInstructor(playerid);
forward Spectator();
forward ConvertTicks(ticks);
forward Encrypt(string[]);
forward KartingEnded();
forward StartKarting();
forward PrepareKarting();
forward PaintballEnded();
forward StartPaintball();
forward PreparePaintball();
forward Float:GetDistanceBetweenPlayers(p1,p2);
forward GameModeExitFunc();
forward SetAllPlayerCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi, num);
forward SetAllCopCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi);
forward SetPlayerCriminal(playerid,declare,reason[]);
forward SetPlayerFree(playerid,declare,reason[]);
forward SetPlayerWeapons(playerid);
forward ShowStats(playerid,targetid);
forward SetPlayerToTeamColor(playerid);
forward GameModeInitExitFunc();
forward split(const strsrc[], strdest[][], delimiter);
forward OnPlayerLogin(playerid,password[]);
forward OnPlayerUpdate(playerid);
forward BroadCast(color,const string[]);
forward OOCOff(color,const string[]);
forward OOCNews(color,const string[]);
forward SendJobMessage(job, color, string[]);
forward SendFamilyMessage(family, color, string[]);
forward SendNewFamilyMessage(family, color, string[]);
forward SendIRCMessage(channel, color, string[]);
forward SendTeamMessage(team, color, string[]);
forward SendRadioMessage(member, color, string[]);
forward SendAdminMessage(color, string[]);
forward AddCar(carcoords);
forward ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5);
forward ProxDetectorS(Float:radi, playerid, targetid);
forward ClearCK(ck);
forward ClearFamily(family);
forward ClearMarriage(playerid);
forward ClearPaper(paper);
forward ClearCrime(playerid);
forward FishCost(playerid, fish);
forward ClearFishes(playerid);
forward ClearFishID(playerid, fish);
forward ClearCooking(playerid);
forward ClearCookingID(playerid, cook);
forward ClearGroceries(playerid);
forward Lotto(number);
forward CarCheck();
forward CarInit();
forward CarTow(carid);
forward CarRespawn(carid);
forward LockCar(carid);
forward UnLockCar(carid);
forward InitLockDoors(playerid);
forward CheckGas();
forward Fillup();
forward StoppedVehicle();
forward SyncTime();
forward SyncUp();
forward SaveAccounts();
forward IsPlayerInZone(playerid, zoneid);
forward Production();
forward Checkprop();
forward PayDay();
forward ini_GetKey( line[] );
forward ini_GetValue( line[] );
forward PlayerPlayMusic(playerid);
forward StopMusic();
forward PlayerFixRadio(playerid);
forward PlayerFixRadio2();
forward HouseLevel(playerid);
forward CHouseLevel(houseid);
forward CustomPickups();
forward IdleKick();
forward SetCamBack(playerid);
forward FixHour(hour);
forward AddsOn();
//------------------------------------------------------------------------------------------------------
new Security = 0;
new CreatedCars[100];
new CreatedCar = 0;
new Tax = 0;
new TaxValue = 0;
new Jackpot = 0;
new StartingPaintballRound = 0;
new AnnouncedPaintballRound = 0;
new PaintballPlayers = 0;
new PaintballRound = 0;
new PaintballWinner = 999;
new PaintballWinnerKills = 0;
new StartingKartRound = 0;
new EndingKartRound = 0;
new AnnouncedKartRound = 0;
new KartingPlayers = 0;
new KartingRound = 0;
new FirstKartWinner = 999;
new SecondKartWinner = 999;
new ThirdKartWinner = 999;
new InRing = 0;
new RoundStarted = 0;
new BoxDelay = 0;
new Boxer1 = 255;
new Boxer2 = 255;
new TBoxer = 255;
new PlayerBoxing[MAX_PLAYERS];
new hitfound = 0;
new hitid = 999;
new Medics = 0;
new MedicCall = 999;
new MedicCallTime[MAX_PLAYERS];
new Mechanics = 0;
new MechanicCall = 999;
new MechanicCallTime[MAX_PLAYERS];
new TaxiDrivers = 0;
new TaxiCall = 999;
new TaxiCallTime[MAX_PLAYERS];
new TaxiAccepted[MAX_PLAYERS];
new BusDrivers = 0;
new BusCall = 999;
new BusCallTime[MAX_PLAYERS];
new BusAccepted[MAX_PLAYERS];
new TransportDuty[MAX_PLAYERS];
new TransportValue[MAX_PLAYERS];
new TransportMoney[MAX_PLAYERS];
new TransportTime[MAX_PLAYERS];
new TransportCost[MAX_PLAYERS];
new TransportDriver[MAX_PLAYERS];
new JobDuty[MAX_PLAYERS];
new RegistrationStep[MAX_PLAYERS];
new MapIconsShown[MAX_PLAYERS];
new OnCK[MAX_PLAYERS];
new GettingCK[MAX_PLAYERS];
new PlayerPaintballing[MAX_PLAYERS];
new PlayerPaintballKills[MAX_PLAYERS];
new PlayerKarting[MAX_PLAYERS];
new PlayerInKart[MAX_PLAYERS];
new SchoolSpawn[MAX_PLAYERS];
new TakingLesson[MAX_PLAYERS];
new UsedFind[MAX_PLAYERS];
new PlayersChannel[MAX_PLAYERS];
new PlayerOnMission[MAX_PLAYERS];
new MissionCheckpoint[MAX_PLAYERS];
new WatchingTV[MAX_PLAYERS];
new NoFuel[MAX_PLAYERS];
new MatsHolding[MAX_PLAYERS];
new DivorceOffer[MAX_PLAYERS];
new MarriageCeremoney[MAX_PLAYERS];
new ProposeOffer[MAX_PLAYERS];
new ProposedTo[MAX_PLAYERS];
new GotProposedBy[MAX_PLAYERS];
new MarryWitness[MAX_PLAYERS];
new MarryWitnessOffer[MAX_PLAYERS];
new TicketOffer[MAX_PLAYERS];
new TicketMoney[MAX_PLAYERS];
new PlayerStoned[MAX_PLAYERS];
new ConsumingMoney[MAX_PLAYERS];
new BringingPaper[MAX_PLAYERS]; //Paper Boys must pick up a Paper first, then use /deliver
new GotPaper[MAX_PLAYERS]; //The player has a paper so he can use /read
new WritingPaper[MAX_PLAYERS]; //Used for onplayertext so he can type in lines
new WritingPaperNumber[MAX_PLAYERS]; //To which Paper in PaperInfo will it be written
new WritingLine[MAX_PLAYERS]; //Used for onplayertext to see which line he's at
new FishCount[MAX_PLAYERS];
new SpawnChange[MAX_PLAYERS];
new TutTime[MAX_PLAYERS];
new PlayerDrunk[MAX_PLAYERS];
new PlayerDrunkTime[MAX_PLAYERS];
new PlayerTazeTime[MAX_PLAYERS];
new FindTimePoints[MAX_PLAYERS];
new FindTime[MAX_PLAYERS];
new BoxWaitTime[MAX_PLAYERS];
new TestFishes[MAX_PLAYERS];
new PaperOffer[MAX_PLAYERS];
new BoxOffer[MAX_PLAYERS];
new CarOffer[MAX_PLAYERS];
new CarPrice[MAX_PLAYERS];
new CarID[MAX_PLAYERS];
new CarCalls[MAX_PLAYERS];
new GotHit[MAX_PLAYERS];
new GoChase[MAX_PLAYERS];
new GetChased[MAX_PLAYERS];
new OrderReady[MAX_PLAYERS];
new ConnectedToPC[MAX_PLAYERS];
new MedicTime[MAX_PLAYERS];
new NeedMedicTime[MAX_PLAYERS];
new MedicBill[MAX_PLAYERS];
new PlayerTied[MAX_PLAYERS];
new PlayerCuffed[MAX_PLAYERS];
new PlayerCuffedTime[MAX_PLAYERS];
new LiveOffer[MAX_PLAYERS];
new TalkingLive[MAX_PLAYERS];
new PlacedNews[MAX_PLAYERS];
new SelectChar[MAX_PLAYERS];
new SelectCharID[MAX_PLAYERS];
new SelectCharPlace[MAX_PLAYERS];
new ChosenSkin[MAX_PLAYERS];
new GettingJob[MAX_PLAYERS];
new GuardOffer[MAX_PLAYERS];
new GuardPrice[MAX_PLAYERS];
new ApprovedLawyer[MAX_PLAYERS];
new CallLawyer[MAX_PLAYERS];
new WantLawyer[MAX_PLAYERS];
new CurrentMoney[MAX_PLAYERS];
new KickPlayer[MAX_PLAYERS];
new Robbed[MAX_PLAYERS];
new RobbedTime[MAX_PLAYERS];
new CP[MAX_PLAYERS];
new MoneyMessage[MAX_PLAYERS];
new Condom[MAX_PLAYERS];
new STDPlayer[MAX_PLAYERS];
new SexOffer[MAX_PLAYERS];
new SexPrice[MAX_PLAYERS];
new RepairOffer[MAX_PLAYERS];
new RepairPrice[MAX_PLAYERS];
new RefillOffer[MAX_PLAYERS];
new RefillPrice[MAX_PLAYERS];
new RepairCar[MAX_PLAYERS];
new DrugOffer[MAX_PLAYERS];
new DrugPrice[MAX_PLAYERS];
new DrugGram[MAX_PLAYERS];
new JailPrice[MAX_PLAYERS];
new WantedPoints[MAX_PLAYERS];
new WantedLevel[MAX_PLAYERS];
new OnDuty[MAX_PLAYERS];
new gPlayerCheckpointStatus[MAX_PLAYERS];
new gPlayerLogged[MAX_PLAYERS];
new gPlayerLogTries[MAX_PLAYERS];
new gPlayerSpawned[MAX_PLAYERS];
new gActivePlayers[MAX_PLAYERS];
new gLastCar[301];
new gOoc[MAX_PLAYERS];
new gNews[MAX_PLAYERS];
new gFam[MAX_PLAYERS];
new BigEar[MAX_PLAYERS];
new Spectate[MAX_PLAYERS];
new CellTime[MAX_PLAYERS];
new StartTime[MAX_PLAYERS];
new HireCar[MAX_PLAYERS];
new SafeTime[MAX_PLAYERS];
new HidePM[MAX_PLAYERS];
new PhoneOnline[MAX_PLAYERS];
new gDice[MAX_PLAYERS];
new gGas[MAX_PLAYERS];
new gSpeedo[MAX_PLAYERS];
new gSpentCash[MAX_PLAYERS];
new FirstSpawn[MAX_PLAYERS];
new SwitchKey[MAX_PLAYERS];
new Fixr[MAX_PLAYERS];
new Locator[MAX_PLAYERS];
new Mobile[MAX_PLAYERS];
new RingTone[MAX_PLAYERS];
new CallCost[MAX_PLAYERS];
new gPlayerAccount[MAX_PLAYERS];
new gPlayerMission[MAX_PLAYERS];
new gLastDriver[302];
new gCarLock[265];
new MissionPlayable = 0;
new noooc = 0;
new adds = 1;
new addtimer = 60000;
new Float:rx, Float:ry, Float:rz;
new carselect[15];
new objstore[128];
new cbjstore[128];
new motd[256];
new rccounter = 0;
//new RStart;
new ghour = 0;
new gminute = 0;
new gsecond = 0;
new numplayers = 0;
new dollah = 1000; // Amount player recieves on spawn.
new realtime = 1;
new wtime = 15;
new levelcost = 25000;
new deathcost = 500;
new callcost = 10; //20 seconds
new realchat = 1;
new timeshift = -1;
new shifthour;
new othtimer;
new synctimer;
new newmistimer;
new unjailtimer;
new turftimer;
new pickuptimer;
new spectatetimer;
new idletimer;
new productiontimer;
new accountstimer;
new checkgastimer;
new stoppedvehtimer;
new cartimer;
new intrate = 1;
new levelexp = 4;
new idletime = 600000; //10 mins
new civnokill = 0;
new suecost = 2000;
new cchargetime = 60;
new txtcost = 25;
new pickups;
new CIV[] = {7,19,20,23,73,101,122};
new STD1[] = {0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3};
new STD2[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3};
new STD3[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3};
new STD4[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 3};
new SELLCAR1[] = { 1000, 1124, 1245, 1349, 1475, 1574, 1636, 1762, 1895, 1946, 2000 };
new SELLCAR2[] = { 2099, 2135, 2255, 2378, 2457, 2563, 2614, 2721, 2878, 2988, 3000 };
new SELLCAR3[] = { 3058, 3175, 3212, 3377, 3454, 3555, 3678, 3751, 3865, 3964, 4000 };
new SELLCAR4[] = { 4077, 4123, 4275, 4378, 4422, 4565, 4613, 4752, 4897, 4911, 5000 };
new Float:ChangePos[MAX_PLAYERS][3];
new ChangePos2[MAX_PLAYERS][2];
new Float:PlayerPos[MAX_PLAYERS][6];
new Float:TeleportDest[MAX_PLAYERS][3];
new Float:TelePos[MAX_PLAYERS][6];

#define GasMax 100
#define RunOutTime 15000
#define RefuelWait 5000

#define CAR_AMOUNT 700 //Change to Your Vehicle Amount
new Gas[CAR_AMOUNT];

new Refueling[MAX_PLAYERS];

enum SavePlayerPosEnum
{
    Float:LastX,
    Float:LastY,
    Float:LastZ
}
new SavePlayerPos[MAX_PLAYERS][SavePlayerPosEnum];
new SpeedMode = 1;
new UpdateSeconds = 1;

public Float:GetDistanceBetweenPlayers(p1,p2)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	if(!IsPlayerConnected(p1) || !IsPlayerConnected(p2))
	{
		return -1.00;
	}
	GetPlayerPos(p1,x1,y1,z1);
	GetPlayerPos(p2,x2,y2,z2);
	return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

new Music[MAX_PLAYERS];
new Songs[7][1] = {
{1187},
{1185},
{1183},
{1097},
{1076},
{1068},
{1062}
};

new FishNamesNumber = 22;
new FishNames[22][20] = {
{"Jacket"},
{"Amberjack"},
{"Grouper"},
{"Red Snapper"},
{"Pants"},
{"Trout"},
{"Blue Marlin"},
{"Can"},
{"Mackeral"},
{"Sea Bass"},
{"Shoes"},
{"Pike"},
{"Sail Fish"},
{"Garbage"},
{"Tuna"},
{"Eel"},
{"Dolphin"},
{"Shark"},
{"Turtle"},
{"Catfish"},
{"Money Bag"},
{"Swordfish"}
};

new Float:PaintballSpawns[7][3] = {
{-394.8027,2232.2317,42.4297},
{-430.8412,2240.5371,42.9834},
{-369.2361,2248.3127,42.4844},
{-350.8910,2218.0215,42.4912},
{-384.0544,2206.2908,42.4235},
{-395.7100,2214.9480,42.4297},
{-445.3718,2222.5481,42.4297}
};

new Float:gRandomPlayerSpawns[1][3] = {
{2223.8,-1147.1,1025.7} // sp1
};

new Float:gInviteSpawns[10][4] = {
{-1976.5912,166.1818,36.9623,272.6393},
{-1975.8610,162.1945,36.9623,272.0126},
{-1975.7461,157.5404,36.9623,276.1093},
{-1975.2136,151.4920,36.9623,268.2993},
{-1974.9963,145.3430,36.9623,269.2628},
{-1975.5842,140.8170,36.9623,269.8895},
{-1975.7874,134.0368,36.9623,271.7696},
{-1975.1681,129.0926,36.9623,270.8531},
{-1975.9069,121.4700,36.9623,270.5631},
{-1975.3311,112.7078,36.9623,267.7665}
};

new Float:gMedicSpawns[2][3] = {
{317.9066,315.6765,999.1484},
{317.6252,311.8465,999.1484}
};

new Float:gCopPlayerSpawns[2][3] = {
{1530.8369,-1664.8872,6.2188},
{1530.6913,-1669.4760,6.2188}
//{614.8,-608.2,17.2},
//{611.5,-607.8,17.2}
};

new Float:gMedPlayerSpawns[2][3] = {
{1178.1,-1321.0,14.1},
{1177.7,-1325.0,14.0}
};

enum pBoxingStats
{
    TitelName[128],
    TitelWins,
    TitelLoses,
};
new Titel[pBoxingStats];

enum cCKInfo
{
	cSendername[20],
	cGiveplayer[20],
	cUsed,
};
new CKInfo[10][cCKInfo];

enum pPaperInfo
{
	PaperUsed,
	PaperMaker[20],
	PaperTitle[64],
	PaperText1[128],
	PaperText2[128],
	PaperText3[128],
	PaperText4[128],
	PaperText5[128],
	PaperText6[128],
	PaperText7[128],
	SafeSaving,
};
new PaperInfo[10][pPaperInfo];

enum pPaper
{
	pMaker[20],
	pTitle[64],
	pLine1[128],
	pLine2[128],
	pLine3[128],
	pLine4[128],
	pLine5[128],
	pLine6[128],
	pLine7[128],
};
new Paper[MAX_PLAYERS][pPaper];

enum fInfo
{
	FamilyTaken,
	FamilyName[20],
	FamilyMOTD[128],
	FamilyColor[20],
	FamilyLeader[MAX_PLAYER_NAME],
	FamilyMembers,
	Float:FamilySpawn[4],
	FamilyInterior,
};
new FamilyInfo[10][fInfo];

enum zInfo
{
	zOwner[64],
	zColor[20],
    Float:zMinX,
    Float:zMinY,
    Float:zMaxX,
    Float:zMaxY,
};
new TurfInfo[6][zInfo];
new Turfs[6];

enum pFishing
{
	pFish1[20],
	pFish2[20],
	pFish3[20],
	pFish4[20],
	pFish5[20],
	pWeight1,
	pWeight2,
	pWeight3,
	pWeight4,
	pWeight5,
	pFid1,
	pFid2,
	pFid3,
	pFid4,
	pFid5,
	pLastFish,
	pFishID,
	pLastWeight,
};
new Fishes[MAX_PLAYERS][pFishing];

enum pCooking
{
	pCook1[20],
	pCook2[20],
	pCook3[20],
	pCook4[20],
	pCook5[20],
	pCWeight1,
	pCWeight2,
	pCWeight3,
	pCWeight4,
	pCWeight5,
	pCookID1,
	pCookID2,
	pCookID3,
	pCookID4,
	pCookID5,
};
new Cooking[MAX_PLAYERS][pCooking];

enum pGroceries
{
	pChickens,
	pChicken,
	pHamburgers,
	pHamburger,
	pPizzas,
	pPizza,
};
new Groceries[MAX_PLAYERS][pGroceries];

enum pSpec
{
	Float:Coords[3],
	Float:sPx,
	Float:sPy,
	Float:sPz,
	sPint,
	sLocal,
	sCam,
};

new Unspec[MAX_PLAYERS][pSpec];

enum eCars
{
	model_id,
	Float:pos_x,
	Float:pos_y,
	Float:pos_z,
	Float:z_angle,
};

enum hNews
{
	hTaken1,
	hTaken2,
	hTaken3,
	hTaken4,
	hTaken5,
	hAdd1[128],
	hAdd2[128],
	hAdd3[128],
	hAdd4[128],
	hAdd5[128],
	hContact1[128],
	hContact2[128],
	hContact3[128],
	hContact4[128],
	hContact5[128],
};
new News[hNews];

enum pInfo
{
	pKey[128],
	pLevel,
	pAdmin,
	pDonateRank,
	gPupgrade,
	pConnectTime,
	pReg,
	pSex,
	pAge,
	pOrigin,
	pCK,
	pMuted,
	pExp,
	pCash,
	pAccount,
	pCrimes,
	pKills,
	pDeaths,
	pArrested,
	pWantedDeaths,
	pPhoneBook,
	pLottoNr,
	pFishes,
	pBiggestFish,
	pJob,
	pPayCheck,
	pHeadValue,
	pJailed,
	pJailTime,
	pMats,
	pDrugs,
	pLeader,
	pMember,
	pFMember,
	pRank,
	pChar,
	pContractTime,
	pDetSkill,
	pSexSkill,
	pBoxSkill,
	pLawSkill,
	pMechSkill,
	pJackSkill,
	pCarSkill,
	pNewsSkill,
	pDrugsSkill,
	pCookSkill,
	pFishSkill,
	Float:pHealth,
	Float:pSHealth,
	pInt,
	pLocal,
	pTeam,
	pModel,
	pPnumber,
	pPhousekey,
	pPbiskey,
	Float:pPos_x,
	Float:pPos_y,
	Float:pPos_z,
	pCarLic,
	pFlyLic,
	pBoatLic,
	pFishLic,
	pGunLic,
	pGun1,
	pGun2,
	pGun3,
	pGun4,
	pAmmo1,
	pAmmo2,
	pAmmo3,
	pAmmo4,
	pCarTime,
	pPayDay,
	pPayDayHad,
	pCDPlayer,
	pWins,
	pLoses,
	pAlcoholPerk,
	pDrugPerk,
	pMiserPerk,
	pPainPerk,
	pTraderPerk,
	pTut,
	pMissionNr,
	pWarns,
	pAdjustable,
	pFuel,
	pMarried,
	pMarriedTo[128],
};
new PlayerInfo[MAX_PLAYERS][pInfo];

enum hInfo
{
	Float:hEntrancex,
	Float:hEntrancey,
	Float:hEntrancez,
	Float:hExitx,
	Float:hExity,
	Float:hExitz,
	hHealthx,
	hHealthy,
	hHealthz,
	hArmourx,
	hArmoury,
	hArmourz,
	hOwner[MAX_PLAYER_NAME],
	hDiscription[MAX_PLAYER_NAME],
	hValue,
	hHel,
	hArm,
	hInt,
	hLock,
	hOwned,
	hRooms,
	hRent,
	hRentabil,
	hTakings,
	hVec,
	hVcol1,
	hVcol2,
	hDate,
	hLevel,
};

new HouseInfo[34][hInfo];

enum bInfo
{
    bOwned,
	bOwner[64],
	bMessage[128],
	bExtortion[MAX_PLAYER_NAME],
	Float:bEntranceX,
	Float:bEntranceY,
	Float:bEntranceZ,
	Float:bExitX,
	Float:bExitY,
	Float:bExitZ,
	bLevelNeeded,
	bBuyPrice,
	bEntranceCost,
	bTill,
	bLocked,
	bInterior,
	bProducts,
	bMaxProducts,
	bPriceProd,
};
new BizzInfo[5][bInfo];

enum sbInfo
{
	sbOwned,
	sbOwner[64],
	sbMessage[128],
	sbExtortion[MAX_PLAYER_NAME],
	Float:sbEntranceX,
	Float:sbEntranceY,
	Float:sbEntranceZ,
	sbLevelNeeded,
	sbBuyPrice,
	sbEntranceCost,
	sbTill,
	sbLocked,
	sbInterior,
	sbProducts,
	sbMaxProducts,
	sbPriceProd,
};
new SBizzInfo[12][sbInfo];

enum pHaul
{
	pCapasity,
	pLoad,
};

new PlayerHaul[100][pHaul];

enum pCrime
{
	pBplayer[32],
	pAccusing[32],
	pAccusedof[32],
	pVictim[32],
};
new PlayerCrime[MAX_PLAYERS][pCrime];

enum mInfo
{
    mTitle[128],
    mText1[128],
    mText2[128],
    mText3[128],
    mText4[128],
    mText5[128],
    mText6[128],
    mText7[128],
    mText8[128],
    mText9[128],
    mText10[128],
    mText11[128],
    mText12[128],
    mText13[128],
    mText14[128],
    mText15[128],
    mText16[128],
    mText17[128],
    mText18[128],
    mGText1[128],
    mGText2[128],
    mGText3[128],
    mGText4[128],
    mGText5[128],
    mGText6[128],
	Float:mCP1[3],
	Float:mCP2[3],
	Float:mCP3[3],
	Float:mCP4[3],
	Float:mCP5[3],
	Float:mCP6[3],
	mReward,
	mToggle,
};
new MissionInfo[mInfo];

enum kInfo
{
    kTitle[128],
    kMaker[MAX_PLAYER_NAME],
    kText1[128],
    kText2[128],
    kText3[128],
    kText4[128],
    kText5[128],
    kText6[128],
    kText7[128],
    kText8[128],
    kText9[128],
    kText10[128],
    kText11[128],
    kText12[128],
    kText13[128],
    kText14[128],
    kText15[128],
    kText16[128],
    kText17[128],
    kText18[128],
    kGText1[128],
    kGText2[128],
    kGText3[128],
    kGText4[128],
    kGText5[128],
    kGText6[128],
	Float:kCP1[3],
	Float:kCP2[3],
	Float:kCP3[3],
	Float:kCP4[3],
	Float:kCP5[3],
	Float:kCP6[3],
	kNumber,
	kReward,
	kToggle,
};
new PlayMission[kInfo];

enum iInfo
{
	iAdmin[128],
	iMOTD[128],
	iPassword[128],
	iNeedPass,
	iLock,
	iPlayers,
};
new IRCInfo[10][iInfo];

new RandCars[20][1] = {
{496},{542},{507},{585},
{466},{492},{579},{559},
{400},{551},{516},{475},
{561},{550},{566},{558},
{562},{562},{603},{560}
};


new RandLCars[1][1] = {
{431}// coach
};


new GunPrice[30][1] = {
{500}, //parachute
{400}, //golfclub
{300}, //nightstick
{200}, //knife
{700}, //baseballbat
{300}, //shovel
{100}, //poolcue
{400}, //purpledildo
{780}, //whitedildo
{560}, //longwhitedildo
{530}, //whitedildo2
{200}, //flowers
{600}, //cane
{500}, //sdpistol
{1000}, //colt45
{3000}, //deagle
{2000}, //Tec9
{3000}, //uzi
{2500}, //mp5
{3000}, //shotgun
{6000}, //spas12
{4000}, //sawnoff
{5000}, //ak47
{5000}, //m4
{1000}, //rifle
{25}, //pistolammo
{40}, //shotgunammo
{25}, //smgammo
{40}, //assaultammo
{50} //rifle
};

new JoinPed[52][1] = {
{280},//POLICE_FORCE
{281},
{282},
{283},
{284},
{285},
{288},
{71},
{166},
{295},
{148},
{286},//FBI/ATF
{164},
{163},
{287},//NATIONAL_GUARD
{285},
{70},//FIRE/AMBULANCE
{274},
{275},
{276},
{277},
{278},
{279},
{258},//LA_COSA_NOSTRA
{127},
{126},
{125},
{124},
{113},
{111},
{98},
{120},//YAKUZA
{121},
{122},
{123},
{169},
{186},
{228},
{127},//HITMANS
{165},
{186},
{93},
{141},
{148},//NEWS_REPORTERS
{188},
{187},
{255},//TAXI_CAB_COMPANY
{253},
{59},//DRIVING/FLYING_SCHOOL
{60},//DRIVING/FLYING_SCHOOL
{76},//DRIVING/FLYING_SCHOOL
{150}//DRIVING/FLYING_SCHOOL
};

new Peds[217][1] = {
{264},
{288},//TEAM_ADMIN
{286},{287},{228},{113},{120},{147},{294},{227},{61},{171},
{247},//CIVILIANS DOWN HERE
{248},{100},{256},{263},{262},{261},{260},{259},{258},{257},{256},{255},
{253},{252},{251},{249},{246},{245},{244},{243},{242},{241},{240},{239},
{238},{237},{236},{235},{234},{233},{232},{231},{230},{229},
{226},{225},{173},{174},{175},{224},{223},{222},{221},{220},{219},{218},
{217},{216},{215},{214},{213},{212},{211},{210},{209},
{207},{206},{205},{204},{203},{202},{201},{200},{199},{198},{197},{196},
{195},{194},{193},{192},{191},{190},{189},{185},{184},{183},
{182},{181},{180},{179},{178},{176},{172},{170},{168},{167},{162},
{161},{160},{159},{158},{157},{156},{155},{154},{153},{152},{151},
{146},{145},{144},{143},{142},{141},{140},{139},{138},{137},{136},{135},
{134},{133},{132},{131},{130},{129},{128},{254},{99},{97},{96},{95},{94},
{92},{90},{89},{88},{87},{85},{84},{83},{82},{81},{80},{79},{78},{77},{76},
{75},{73},{72},{69},{68},{67},{66},{64},{63},{62},{58},{57},{56},{55},
{54},{53},{52},{51},{50},{49},{45},{44},{43},{41},{39},{38},{37},{36},{35},
{34},{33},{32},{31},{30},{29},{28},{27},{26},{25},{24},{23},{22},{21},{20},
{19},{18},{17},{16},{15},{14},{13},{12},{11},{10},{1},{2},
{290},//ROSE
{291},//PAUL
{292},//CESAR
{293},//OGLOC
{187},
{296},//JIZZY
{297},//MADDOGG
{298},//CAT
{299}//ZERO
};

new Float:HouseCarSpawns[34][4] = {
{-2637.2544,165.0454,4.2919,179.9976},//House 2
{2064.4,-1694.4,13.1,271.1561},//House 1
{-2712.7625,870.3005,70.5348,89.1608},//House 2
{1109.8,-968.0,42.7,0.0},//house 3
{2497.6274,-2025.6306,13.2521,355.4281}, // House 4
{2645.0,-1990.8,13.1,180.0},//House - 5
{-2724.8965,914.8384,67.4253,110.1072},//house 6
{1910.5149,-1120.5304,25.4493,177.8350},//house 7
{828.8,-887.0,68.5,230.7095},//House 8
{2149.6,-1610.9,14.0,90.7904},//House 9
{760.1,-1687.8,4.3,180.6},//House 10
{645.5,-1616.1,14.9,0.0},//House 11
{-2635.2371,931.1931,71.5643,215.3709},//House 12
{-2665.9224,989.9724,64.6955,1.7814},//House 13
{959.5864,-901.0845,45.8584,177.3087},//House 14
{2445.8,-1326.8,23.6,18.4},//House 15
{2845.9,-1286.8,18.9,90.0},//house 16
{2159.8,-1803.9,13.3,271.4}, //House 17
{-2693.7847,132.3186,4.1676,89.5330},//House 18
{-2723.0105,977.7357,54.2926,359.9068},//House 19
{1514.0,-694.6,94.5,90.0},//House 20
{1246.7,-1107.6,25.5,266.4},//House 21
{831.7,-857.5,69.9,180.0},//House 22
{1007.9,-659.4,121.1,130.6194},//House 23
{1110.0,-726.4,100.1,90.0},//House 24
{259.7,-1221.0,74.7,202.0011},//House 25
{1463.7,-901.7,55.8,359.0},//house 26
{1440.1,-890.6,51.2,0.0},//house 27
{-2528.8298,2250.2998,4.8112,334.9590},//house 28
{-2554.7874,2270.5356,4.9064,333.9774}, //House 29
{-2371.1323,2438.4104,9.0698,159.2582},//House 30
{-2237.9492,893.7390,66.4872,89.7571},//House 31
{-2529.4817,-142.6608,19.7107,4.2929}, //House 32
{-2616.1897,-108.4479,4.1693,269.8246}//House 33
};


new CarSpawns[182][eCars] = {
	{405,-2125.7424,658.0462,52.2988,93.9612},//carid 90
	{426,-2158.0222,657.3932,52.2775,272.8372},
	{445,-1926.3204,585.6179,34.9963,359.8303},
	{492,2229.2,-1170.2,25.7,86.9},
	{507,-2214.8047,-82.7890,35.0474,0.6476},
	{545,2217.0,-1157.2,25.7,269.8},
	{547,405.9748,-1264.3921,50.1237,24.2110},
	{550,-1497.4576,845.8479,6.9382,88.5201},
	{551,-1741.0051,811.0620,24.5782,270.6681},
	{560,2106.4695,-1248.7920,24.0461,0.1524},
	{566,2196.2891,-1277.7905,24.2147,180.4522},
	{402,-1704.3132,999.7747,17.3646,90.0725},
	{405,216.5521,-1431.4004,13.0853,132.5749},
	{554,334.2231,-1343.7405,14.3828,209.9581},
	{507,697.4343,-1230.9486,16.5063,298.7916},
	{545,723.9850,-1121.5535,18.1450,333.9010},
	{536,666.8468,-467.6579,16.0734,90.8623},
	{560,668.1161,-546.2436,16.0413,89.4239},
	{540,912.2176,-996.2035,38.1402,7.5764},
	{482,-1758.3512,910.7219,24.5923,269.8633},
	{547,981.8715,-917.3546,41.5443,88.0589},
	{550,1188.4082,-925.1859,42.8590,277.5563},
	{400,-1699.4597,1035.9624,45.0934,91.6588},
	{405,1450.2,-937.1,36.2,269.6909}, //116
	{492,2148.3257,-1175.2518,24.1959,269.6909},
	{507,-1786.7155,1205.1598,24.7812,178.8758},
	{545,-1716.5907,1350.4829,6.8346,44.2506},
	{540,2348.2910,-1167.9983,27.3637,323.1586},
	{482,2502.0388,-1134.9507,39.1953,150.9506},
	{547,-2166.4534,1251.1536,27.2650,1.0352},
	{550,2853.1858,-1326.8011,11.1511,278.9301},
	{551,-2040.4761,1107.7072,53.4166,89.8473},
	{533,2796.9031,-1567.2024,10.6386,272.4041},
	{482,2813.2175,-1673.0276,9.6638,2.3369},
	{547,2827.6736,-1703.9755,9.7308,77.2896},
	{550,2809.3872,-1837.2391,9.7398,268.9880},
	{551,-2438.0784,1341.1190,7.6988,84.5107},
	{566,2411.5386,-2134.7576,13.9352,0.7795},
	{554,1389.7467,-2695.9370,13.4164,121.1818},
	{405,783.1359,-1601.8208,13.2577,270.9069},
	{554,782.7205,-1619.3584,13.2653,93.0550},
	{426,923.0841,-1361.7990,13.0324,181.1371},
	{445,-2644.6819,1342.3251,6.8981,270.7903},
	{492,1174.6599,-922.1939,43.1189,276.8927},
	{507,1363.0210,-1288.3124,13.2839,180.1453},
	{545,1363.2723,-1260.8229,13.0954,179.5841},
	{540,2383.5627,-1927.9207,13.2436,359.6281},
	{482,-2635.0933,1377.1693,6.8692,180.6415},
	{547,-2513.1277,1209.6135,37.1506,270.2610},
	{550,2396.6899,-1966.8123,13.2793,271.6838},
	{551,2391.1135,-1500.6554,23.6355,269.7709},
	{560,-2273.8679,921.3550,66.3095,0.6336},
	{405,-2153.0779,953.6602,79.7271,180.3209},
	{554,334.3586,-1789.3143,4.6717,178.7722},
	{426,343.8039,-1808.9827,4.3090,181.8368},
	{445,-2129.2915,787.6183,69.3346,87.1812},
	{492,646.4998,-1771.6411,13.2905,348.7706},
	{507,-2151.9524,395.9857,34.9395,180.7696},//150
	{545,-2078.8027,265.4074,35.1672,268.0607},
	{540,-2034.8334,178.8471,28.5682,269.9615},
	{482,438.9431,-1625.4088,25.7951,0.1850},
	{547,453.3896,-1494.3240,30.7917,7.7513},
	{550,487.6469,-1516.2312,20.0235,185.5384},
	{551,300.5775,-1490.8882,24.3748,235.1359},
	{560,-2180.1323,41.8542,35.1717,269.9866},
	{566,524.0590,-1375.0093,15.8231,193.3626},
	{405,598.9131,-1519.1414,14.8214,180.4083},
	{554,-2488.1333,-133.0336,25.3507,90.1064},
	{426,-2499.5225,45.0666,25.2641,89.9251},
	{445,-2636.7976,-55.4094,4.0630,359.9826},
	{492,-2718.5115,-124.4794,4.3505,269.1428},
	{507,736.8572,-1337.1550,13.3140,271.3832},
	{545,856.7003,-1363.1852,13.4093,179.8542},//165
	{482,888.1506,-1659.2727,13.3296,1.2414},
	{547,879.1024,-1669.2560,13.3305,180.5853},
	{550,-2134.1443,-453.9576,35.1479,95.0877},
	{551,920.4441,-1823.0966,12.3452,84.1821},
	{560,-1639.3900,-567.5057,13.9530,80.1994},
	{566,1062.6744,-1757.9412,13.1956,89.0572},
	{405,-2265.1501,148.9554,34.8837,269.3405},
	{554,1081.8948,-1629.9564,13.4064,90.0880},
	{426,981.7941,-1523.5115,13.3379,267.2751},
	{445,1014.7464,-1434.4586,13.3292,266.3129},
	{492,492.6386,-1555.3513,17.1462,213.1128},//DERBY
	{507,2684.6,-2019.0,13.3 ,0.8777},
	{545,1096.1,-1379.9,13.3,270.1909},//178
	{540,-2743.6772,-303.1675,7.1422,49.0919},//179 DERBY
	{482,1182.2568,-1219.2407,18.4163,0.5578},
	{547,1260.9978,-1187.1921,23.3559,183.3606},
	{550,1331.9304,-1081.3899,24.9941,90.4092},
	{551,1284.8755,-1525.5013,13.3451,269.4388},//near taxi
	{560,1279.1887,-1539.2032,13.3201,94.8070},//near taxi
	{566,1275.9120,-1646.7448,13.3273,267.2669},
	{405,-2200.5999,-2503.3606,30.4213,321.7648},
	{554,1253.9153,-1833.3832,13.1734,175.3692},
	{426,1279.2875,-1814.4156,13.1657,93.6385},
	{445,-2205.5234,-2439.3523,30.4224,51.1660},
	{492,1479.9131,-1737.8813,13.2418,269.5805},
	{507,1508.1047,-1737.7089,13.2418,270.0250},
	{545,1618.0411,-1891.1044,13.3278,0.3364},
	{540,1623.7291,-1892.7234,13.3307,180.0126},
	{482,-2079.6389,-2303.7983,30.3466,322.7155},
	{547,1743.5837,-1844.6041,13.3557,180.3384},
	{550,1838.1904,-1871.3842,13.1703,358.5452},
	{551,-1557.8568,-2741.5632,48.3481,144.5150},
	{560,1777.1376,-1910.0310,13.1681,91.0725},
	{566,-16.7753,-2503.6228,36.4593,121.7103},
	{566,1981.0780,-1986.3513,13.3275,2.1479},
	{405,218.4485,-173.3024,1.3809,90.0117},
	{554,199.5586,-155.4912,1.3827,0.3471},
	{426,1984.7471,-2066.7776,13.1625,359.7226},
	{445,1938.0565,-2086.8459,13.3429,268.3414},
	{492,318.4840,-86.0588,2.0804,90.9324},
	{507,-113.9556,-39.4382,2.9209,164.0464},
	{545,115.3321,-217.1147,1.3028,89.7911},
	{540,1748.0751,-2084.2090,13.3324,0.4337},
	{482,1560.5026,-2260.5457,13.3258,268.7398},
	{547,1461.6943,-1505.1688,13.2541,356.9007},
	{550,1426.4930,-1402.3170,13.1800,181.0290},
	{551,1435.0645,-1325.6835,13.2580,270.9400},
	{560,1513.9486,-1272.5691,14.2685,181.0697},
	{566,1583.7561,-1338.7435,16.1896,359.8619},
	{405,-2760.5156,-312.1838,7.1557,3.8747},//DERBY
	{554,-2766.6875,-281.2887,7.1613,180.1256},//DERBY
	{426,1430.2316,-1054.8555,22.8693,359.3625},
	{445,1574.1168,-1036.7643,23.6151,145.6786},
	//{492,1617.6676,-1009.8663,23.6052,356.8697},
	{507,1645.3188,-1036.5238,23.6027,0.7258},
	{545,485.9422,-1467.4543,18.3154,157.6833},//DERBY
	{540,1770.4874,-1060.9886,23.6658,179.2750},
	{482,-2781.4741,-281.6054,7.1515,181.0279},//DERBY
	{547,1653.1766,-1134.8994,23.6110,178.6835},
	{550,1617.3746,-1132.8293,23.6117,91.7300},
	{551,1790.0190,-1292.9065,13.2653,267.2964},
	{560,1754.3009,-1476.8170,13.2402,269.6320},
	{554,2003.3417,-1121.4993,26.3879,357.4926},
	{426,2084.2334,-1170.0986,24.2042,91.8975},
	{492,2229.2278,-1345.4033,23.6892,93.3009},
	{507,2332.5684,-1362.4845,23.7297,358.1198},
	{545,2384.1567,-1275.6326,23.9198,101.6528},
	{540,2432.3149,-1226.0785,24.9941,17.9805},
	{482,2426.9612,-1224.4158,25.0000,202.7159},
	{547,2438.4309,-1321.6925,24.1225,269.7535},
	{551,2612.9702,-1262.6970,48.2461,269.4752},
	{560,2659.4529,-1428.4343,30.1790,266.5051},
	{566,2659.7053,-1422.6743,30.1714,89.8159},
	{405,2485.5313,-1556.1823,23.7478,178.8338},
	{554,2478.7664,-1555.7006,23.7226,183.6043},
	{426,2605.3967,-1365.8829,34.6461,359.9891},
	{445,2754.7136,-1373.0253,40.1154,91.4169},
	{492,2717.3662,-1468.0308,30.0894,1.0298},
	{507,2816.7195,-1449.4285,15.9549,268.9106},
	{545,2816.9937,-1441.5880,15.9544,90.7779},
	{540,2681.9016,-1673.3879,9.1290,0.5605},
	{482,2442.5845,-1642.7507,13.1644,180.3454},
	{547,2361.3120,-1674.6146,13.2505,357.4959},
	{550,2298.3535,-1633.7542,14.3849,80.8107},
	{551,2297.9077,-1639.9464,14.4352,94.4292},
	{560,2255.4045,-1664.5736,15.1304,74.6898},
	{566,2234.1057,-1726.9386,13.1665,271.7536},
	{405,2319.3833,-1716.6823,13.2518,359.8540},
	{554,2474.5105,-1755.9194,13.2522,270.5967},
	{426,2501.8213,-1754.2794,13.1208,176.4916}, //= 255
	{445,2489.1560,-1952.6886,13.1366,178.1629},
	{492,2495.4326,-1953.2922,13.1299,356.5514},
	{507,2306.7168,-1989.6796,13.2639,184.8385},
	{482,2056.1807,-1904.7751,13.2502,2.2910},
	{550,2064.9871,-1919.1674,13.2504,180.8575},
	{551,1886.4812,-2022.9338,13.0964,179.4265},
	{560,1824.8976,-2019.8374,13.0875,272.5273},
	{566,1942.1669,-1862.6425,13.2679,264.5590},
	{405,1923.9409,-1795.5616,13.0877,90.0886},
	{554,1807.0905,-1571.7120,13.1659,125.1048},
	{426,1809.9016,-1676.0603,13.2422,180.7589},
	{445,1809.6266,-1653.3402,13.2365,180.6530},
	{492,1809.7056,-1660.3019,13.2380,180.6262},
	{507,1978.4003,-1675.0157,15.6741,269.7336},
	{545,1974.8230,-1693.5488,15.6741,92.1162},
	{540,1929.2253,-1584.6954,13.2700,185.5542},
	{482,1731.9725,-1590.8959,13.1630,77.7249},
	{547,1721.5776,-1589.2834,13.1526,80.9057},
	{550,1695.1428,-1519.2667,13.1671,0.7121},
	{551,1694.7080,-1501.7454,13.1675,357.8150}
    };

//------------------------------------------------------------------------------------------------------

main()
{
print(" ");
print(" ");
print(" The Godfather: LS/SF");
print("_____________________");
print(" By: Fear & parts of Astro");
print(" ");
}

//------------------------------------------------------------------------------------------------------

public SearchingHit(playerid)
{
	new string[256];
	new giveplayer[MAX_PLAYER_NAME];
	new searchhit = 0;
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(searchhit == 0)
		    {
			    if(PlayerInfo[i][pHeadValue] > 0 && GotHit[i] == 0 && PlayerInfo[i][pMember] != 8)
			    {
			        GetPlayerName(i, giveplayer, sizeof(giveplayer));
			        searchhit = 1;
			        hitfound = 1;
			        hitid = i;
			        for(new k=0; k<MAX_PLAYERS; k++)
					{
						if(IsPlayerConnected(k))
						{
				        	if(PlayerInfo[k][pMember] == 8 || PlayerInfo[k][pLeader] == 8)
				        	{
	               				SendClientMessage(k, COLOR_WHITE, "|__________________ Hitman Agency News __________________|");
				                SendClientMessage(k, COLOR_DBLUE, "*** Incoming Message: A Hit has become available. ***");
				                format(string, sizeof(string), "Person: %s   ID: %d   Value: $%d", giveplayer, i, PlayerInfo[i][pHeadValue]);
								SendClientMessage(k, COLOR_DBLUE, string);
								SendClientMessage(k, COLOR_YELLOW, "Use Givehit hitmanid, to assign the Contract to one of the Hitmans.");
								SendClientMessage(k, COLOR_WHITE, "|________________________________________________________|");
	      					}
					    }
					}
					return 0;
			    }
			}
		}
	}
	if(searchhit == 0)
	{
	    SendClientMessage(playerid, COLOR_GREY, "   No Contracts available !");
	}
	return 0;
}

public ExtortionBiz(bizid, money)
{
    new string[256];
    format(string, sizeof(string), "No-one");
    if(strcmp(BizzInfo[bizid][bExtortion],string, true ) == 0 )
	{
	    return 0;
	}
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        new name[MAX_PLAYER_NAME];
			new wstring[MAX_PLAYER_NAME];
			GetPlayerName(i, name, sizeof(name));
			format(string, sizeof(string), "%s", name);
			strmid(wstring, string, 0, strlen(string), 255);
			if(strcmp(BizzInfo[bizid][bExtortion] ,wstring, true ) == 0 )
			{
			    new value = money / 100;
			    value = value * 10;
			    GivePlayerMoney(i, value);
			    BizzInfo[bizid][bTill] -= value;
			}
		}
	}
	return 1;
}

public ExtortionSBiz(bizid, money)
{
    new string[256];
    format(string, sizeof(string), "No-one");
    if(strcmp(SBizzInfo[bizid][sbExtortion],string, true ) == 0 )
	{
	    return 0;
	}
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        new name[MAX_PLAYER_NAME];
			new wstring[MAX_PLAYER_NAME];
			GetPlayerName(i, name, sizeof(name));
			format(string, sizeof(string), "%s", name);
			strmid(wstring, string, 0, strlen(string), 255);
			if(strcmp(SBizzInfo[bizid][sbExtortion] ,wstring, true ) == 0 )
			{
			    new value = money / 100;
			    value = value * 10;
			    GivePlayerMoney(i, value);
			    SBizzInfo[bizid][sbTill] -= value;
			}
		}
	}
	return 1;
}

public PreparePaintball()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(PlayerPaintballing[i] != 0)
	        {
	            SendClientMessage(i, COLOR_YELLOW, "Paintball Match will start in 20 seconds.");
	        }
		}
	}
 	SetTimer("StartPaintball", 20000, 0);
	return 1;
}

public StartPaintball()
{
	PaintballRound = 1;
	StartingPaintballRound = 0;
	PaintballWinner = 999;
	PaintballWinnerKills = 0;
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(PlayerPaintballing[i] != 0)
	        {
	            ResetPlayerWeapons(i);
	            GivePlayerWeapon(i, 29, 999);
	            TogglePlayerControllable(i, 1);
	            SendClientMessage(i, COLOR_YELLOW, "Paintball Match started, 4 minutes left.");
	            PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
	        }
	    }
	}
	SetTimer("PaintballEnded", 240000, 0);
	return 1;
}

public PaintballEnded()
{
	new string[256];
	new name[MAX_PLAYER_NAME];
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(PlayerPaintballing[i] != 0)
	        {
	            if(IsPlayerConnected(PaintballWinner))
	            {
	                GetPlayerName(PaintballWinner, name, sizeof(name));
	                format(string,sizeof(string), "** %s won the Paintball Match with %d kills **",name,PaintballWinnerKills);
	                SendClientMessage(i, COLOR_WHITE, string);
	            }
	            ResetPlayerWeapons(i);
	            PlayerPaintballing[i] = 0;
	            SetPlayerPos(i, SBizzInfo[10][sbEntranceX],SBizzInfo[10][sbEntranceY],SBizzInfo[10][sbEntranceZ]);
	        }
		}
	}
	AnnouncedPaintballRound = 0;
    PaintballRound = 0;
	return 1;
}

public PrepareKarting()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
	        {
	            CP[i] = 9;
				SetPlayerCheckpoint(i,2308.3540,-2354.0039,12.6842,8.0);
				SendClientMessage(i, COLOR_YELLOW, "Kart Race will start in 20 seconds, go to the starting line.");
	        }
		}
	}
	SetTimer("StartKarting", 20000, 0);
	return 1;
}

public StartKarting()
{
	KartingRound = 1;
	StartingKartRound = 0;
	EndingKartRound = 0;
	FirstKartWinner = 999;
	SecondKartWinner = 999;
	ThirdKartWinner = 999;
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
	        {
	            CP[i] = 10;
	            SendClientMessage(i, COLOR_YELLOW, "Green light, go go go !");
	            PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
	            SetPlayerCheckpoint(i,2308.3540,-2354.0039,12.6842,8.0);
	        }
	    }
	}
	SetTimer("KartingEnded", 240000, 0);
	return 1;
}

public KartingEnded()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
	        {
	            CP[i] = 0;
	            DisablePlayerCheckpoint(i);
	        }
		}
	}
	AnnouncedKartRound = 0;
    KartingRound = 0;
	return 1;
}

public DollahScoreUpdate()
{
	new LevScore;
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
   			LevScore = PlayerInfo[i][pLevel];
			SetPlayerScore(i, LevScore);
		}
	}
	return 1;
}

public Encrypt(string[])
{
	for(new x=0; x < strlen(string); x++)
	  {
		  string[x] += (3^x) * (x % 15);
		  if(string[x] > (0xff))
		  {
			  string[x] -= 256;
		  }
	  }
	return 1;
}

stock right(source[], len)
{
	new retval[MAX_STRING], srclen;
	srclen = strlen(source);
	strmid(retval, source, srclen - len, srclen, MAX_STRING);
	return retval;
}

public Spectator()
{
	new string[256];
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(KickPlayer[i]==1) { Kick(i); }
			else if(KickPlayer[i]==2) { Ban(i); }
			//if(GetPlayerPing(i) >= 500 && PlayerInfo[i][pAdmin] < 1) { Kick(i); }
			if(Spectate[i] < 253 && Spectate[i] != 255)
			{
				SetPlayerColor(i,COLOR_SPEC);
				TogglePlayerControllable(i, 0);
				new targetid = Spectate[i];
				if(IsPlayerConnected(targetid))
				{
				    TogglePlayerSpectating(i, 1);
				    if(PlayerInfo[i][pAdmin] >= 1)
				    {
				        new Float:health;
					    new name[MAX_PLAYER_NAME];
					    GetPlayerName(targetid, name, sizeof(name));
					    GetPlayerHealth(targetid, health);
					    format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~y~%s(ID:%d)~n~~y~health:%.1f",name,targetid,health);
					    GameTextForPlayer(i, string, 2500, 3);
				    }
				    if(IsPlayerInAnyVehicle(targetid))
					{
					    new carid = GetPlayerVehicleID(targetid);
					    PlayerSpectateVehicle(i, carid);
					}
					else
					{
					    PlayerSpectatePlayer(i, targetid);
					}
					if(GetPlayerInterior(targetid) == 0)
					{
						SetPlayerInterior(i,0);
					}
					else if(GetPlayerInterior(targetid) > 0)
					{
						SetPlayerInterior(i,GetPlayerInterior(targetid));
					}
				}//Targetid connected
			}
			if(Spectate[i] == 253)
			{
				TogglePlayerControllable(i, 1);
				TogglePlayerSpectating(i, 0);
				SetPlayerInterior(i,Unspec[i][sPint]);
				PlayerInfo[i][pInt] = Unspec[i][sPint];
				PlayerInfo[i][pLocal] = Unspec[i][sLocal];
				Unspec[i][sLocal] = 255;
				SetSpawnInfo(i, PlayerInfo[i][pTeam], PlayerInfo[i][pModel], Unspec[i][sPx],  Unspec[i][sPy], Unspec[i][sPz]-1.0, 1.0, -1, -1, -1, -1, -1, -1);
				gTeam[i] = PlayerInfo[i][pTeam];
				SetPlayerToTeamColor(i);
				MedicBill[i] = 0;
				if(PlayerInfo[i][pDonateRank] > 0)
		        {
		            SetSpawnInfo(i, PlayerInfo[i][pTeam], PlayerInfo[i][pModel], Unspec[i][Coords][0], Unspec[i][Coords][1], Unspec[i][Coords][2], 10.0, -1, -1, -1, -1, -1, -1);
					SpawnPlayer(i);
					SetCameraBehindPlayer(i);
		        }
		        else
		        {
					SpawnPlayer(i);
				}
				Spectate[i] = 255;
			}
			if(Spectate[i] == 254)
			{
				TogglePlayerControllable(i, 1);
				SetPlayerInterior(i,Unspec[i][sPint]);
				PlayerInfo[i][pInt] = Unspec[i][sPint];
				PlayerInfo[i][pLocal] = Unspec[i][sLocal];
				SetPlayerPos(i, Unspec[i][sPx],  Unspec[i][sPy], Unspec[i][sPz]);
				Spectate[i] = 255;
			}
			if(Spectate[i] == 256)
			{
				SetPlayerToTeamColor(i);
				Spectate[i] = 255;
			}
			if(Spectate[i] == 257)
			{
				Spectate[i] = 254;
			}
		}
	}
}

//------------------------------------------------------------------------------------------------------

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(gTeam[playerid] >= 3)
	{
		if (IsACopCar(vehicleid) && !ispassenger)
		{
			if(PlayerInfo[playerid][pLeader]==1||PlayerInfo[playerid][pLeader]==2||PlayerInfo[playerid][pLeader]==3) {}
		    else { WantedPoints[playerid]+=2; SetPlayerCriminal(playerid,255, "Stealing A Police Vehicle"); }
		}
		if (IsAnAmbulance(vehicleid) && !ispassenger)
		{
		    if(PlayerInfo[playerid][pMember]==4||PlayerInfo[playerid][pLeader]==4) { }
		    else { WantedPoints[playerid]+=2; SetPlayerCriminal(playerid,255, "Stealing An Ambulance"); }
		}
	}
	return 1;
}

public IsAnInstructor(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    new leader = PlayerInfo[playerid][pLeader];
	    new member = PlayerInfo[playerid][pMember];
	    if(member==11)
		{
		    return 1;
		}
		if(leader==11)
		{
		    return 1;
		}
	}
	return 0;
}

public IsAMember(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    new leader = PlayerInfo[playerid][pLeader];
	    new member = PlayerInfo[playerid][pMember];
	    if(member==5 || member==6 || member==8)
		{
		    return 1;
		}
		if(leader==5 || leader==6 || leader==8)
		{
		    return 1;
		}
	}
	return 0;
}

public IsACop(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    new leader = PlayerInfo[playerid][pLeader];
	    new member = PlayerInfo[playerid][pMember];
	    if(member==1 || member==2 || member==3)
		{
		    return 1;
		}
		else if(leader==1 || leader==2 || leader==3)
		{
		    return 1;
		}
	}
	return 0;
}

public IsAtClothShop(playerid)
{
    if(IsPlayerConnected(playerid))
	{
        if(PlayerToPoint(25.0,playerid,207.5627,-103.7291,1005.2578) || PlayerToPoint(25.0,playerid,203.9068,-41.0728,1001.8047))
		{//Binco & Suburban
		    return 1;
		}
		else if(PlayerToPoint(30.0,playerid,214.4470,-7.6471,1001.2109) || PlayerToPoint(50.0,playerid,161.3765,-83.8416,1001.8047))
		{//Zip & Victim
		    return 1;
		}
	}
	return 0;
}

public IsAtGasStation(playerid)
{
    if(IsPlayerConnected(playerid))
	{
		if(PlayerToPoint(6.0,playerid,1004.0070,-939.3102,42.1797) || PlayerToPoint(6.0,playerid,1944.3260,-1772.9254,13.3906))
		{//LS
		    return 1;
		}
		else if(PlayerToPoint(6.0,playerid,-90.5515,-1169.4578,2.4079) || PlayerToPoint(6.0,playerid,-1609.7958,-2718.2048,48.5391))
		{//LS
		    return 1;
		}
		else if(PlayerToPoint(6.0,playerid,-2029.4968,156.4366,28.9498) || PlayerToPoint(8.0,playerid,-2408.7590,976.0934,45.4175))
		{//SF
		    return 1;
		}
		else if(PlayerToPoint(5.0,playerid,-2243.9629,-2560.6477,31.8841) || PlayerToPoint(8.0,playerid,-1676.6323,414.0262,6.9484))
		{//Between LS and SF
		    return 1;
		}
		else if(PlayerToPoint(6.0,playerid,2202.2349,2474.3494,10.5258) || PlayerToPoint(10.0,playerid,614.9333,1689.7418,6.6968))
		{//LV
		    return 1;
		}
		else if(PlayerToPoint(8.0,playerid,-1328.8250,2677.2173,49.7665) || PlayerToPoint(6.0,playerid,70.3882,1218.6783,18.5165))
		{//LV
		    return 1;
		}
		else if(PlayerToPoint(8.0,playerid,2113.7390,920.1079,10.5255) || PlayerToPoint(6.0,playerid,-1327.7218,2678.8723,50.0625))
		{//LV
		    return 1;
		}
	}
	return 0;
}

public IsAtFishPlace(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    if(PlayerToPoint(1.0,playerid,403.8266,-2088.7598,7.8359) || PlayerToPoint(1.0,playerid,398.7553,-2088.7490,7.8359))
		{//Fishplace at the bigwheel
		    return 1;
		}
		else if(PlayerToPoint(1.0,playerid,396.2197,-2088.6692,7.8359) || PlayerToPoint(1.0,playerid,391.1094,-2088.7976,7.8359))
		{//Fishplace at the bigwheel
		    return 1;
		}
		else if(PlayerToPoint(1.0,playerid,383.4157,-2088.7849,7.8359) || PlayerToPoint(1.0,playerid,374.9598,-2088.7979,7.8359))
		{//Fishplace at the bigwheel
		    return 1;
		}
		else if(PlayerToPoint(1.0,playerid,369.8107,-2088.7927,7.8359) || PlayerToPoint(1.0,playerid,367.3637,-2088.7925,7.8359))
		{//Fishplace at the bigwheel
		    return 1;
		}
		else if(PlayerToPoint(1.0,playerid,362.2244,-2088.7981,7.8359) || PlayerToPoint(1.0,playerid,354.5382,-2088.7979,7.8359))
		{//Fishplace at the bigwheel
		    return 1;
		}
	}
	return 0;
}

public IsAtCookPlace(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    if(PlayerToPoint(3.0,playerid,369.9786,-4.0798,1001.8589))
	    {//Cluckin Bell
	        return 1;
	    }
	    else if(PlayerToPoint(3.0,playerid,376.4466,-60.9574,1001.5078) || PlayerToPoint(3.0,playerid,378.1215,-57.4928,1001.5078))
		{//Burgershot
		    return 1;
		}
		else if(PlayerToPoint(3.0,playerid,374.1185,-113.6361,1001.4922) || PlayerToPoint(3.0,playerid,377.7971,-113.7668,1001.4922))
		{//Well Stacked Pizza
		    return 1;
		}
	}
	return 0;
}

public IsAtBar(playerid)
{
    if(IsPlayerConnected(playerid))
	{
		if(PlayerToPoint(4.0,playerid,495.7801,-76.0305,998.7578) || PlayerToPoint(4.0,playerid,499.9654,-20.2515,1000.6797))
		{//In grove street bar (with girlfriend), and in Havanna
		    return 1;
		}
		else if(PlayerToPoint(4.0,playerid,1215.9480,-13.3519,1000.9219) || PlayerToPoint(10.0,playerid,-2658.9749,1407.4136,906.2734))
		{//PIG Pen
		    return 1;
		}
	}
	return 0;
}

public IsABoat(carid)
{
	if(carid >= 86 && carid <=90)
	{
		return 1;
	}
	return 0;
}

public IsAPlane(carid)
{
	if(carid==39||carid==40||carid==60||carid==83||carid==91||carid==92||carid==93||carid==95||carid==96||carid==99||carid==100||carid==101||carid==102||carid==103||carid==104||carid==105||carid==106||carid==107||carid==108||carid==109)
	{
		return 1;
	}
	return 0;
}

public IsACopCar(carid)
{
	if((carid >= 35) && (carid <= 60) || carid == 66 || carid == 67 || carid == 91 || carid == 92 || carid == 93 || carid == 36)
	{
	    if(carid == 45 || carid == 46 || carid == 55 || carid == 59) { return 0; }
		return 1;
	}
	return 0;
}

public IsAnAmbulance(carid)
{
	if((carid >= 61) && (carid <= 63)|| carid == 83)
	{
		return 1;
	}
	return 0;
}

public IsATruck(carid)
{
	if(carid >= 78 && carid <= 81)
	{
		return 1;
	}
	return 0;
}

//------------------------------------------------------------------------------------------------------

public OnPlayerConnect(playerid)
{
	if(Security != 0)
	{
	    SendClientMessage(playerid, COLOR_YELLOW, "Host has broken one of the Agreement rules, action has been taken.");
	    Kick(playerid);
	    return 1;
	}
	gActivePlayers[playerid]++;
	numplayers++;
	new plname[MAX_PLAYER_NAME];
	new string[MAX_PLAYER_NAME];
	SelectChar[playerid] = 0; HidePM[playerid] = 0; PhoneOnline[playerid] = 0;
	SelectCharID[playerid] = 0; SelectCharPlace[playerid] = 0; ChosenSkin[playerid] = 0;
	GettingJob[playerid] = 0; GuardOffer[playerid] = 999; GuardPrice[playerid] = 0;
    ApprovedLawyer[playerid] = 0; CallLawyer[playerid] = 0; WantLawyer[playerid] = 0;
	KickPlayer[playerid] = 0; CurrentMoney[playerid] = 0; UsedFind[playerid] = 0;
	CP[playerid] = 0; Robbed[playerid] = 0; SpawnChange[playerid] = 1;
	CarOffer[playerid] = 999; CarPrice[playerid] = 0; CarID[playerid] = 0; CarCalls[playerid] = 0;
	RobbedTime[playerid] = 0; MoneyMessage[playerid] = 0; Condom[playerid] = 0;
	STDPlayer[playerid] = 0; SexOffer[playerid] = 999; SexPrice[playerid] = 0;
	RepairOffer[playerid] = 999; RepairPrice[playerid] = 0; RepairCar[playerid] = 0;
	TalkingLive[playerid] = 255; LiveOffer[playerid] = 999; TakingLesson[playerid] = 0;
	RefillOffer[playerid] = 999; RefillPrice[playerid] = 0; MapIconsShown[playerid] = 0;
	DrugOffer[playerid] = 999; PlayerCuffed[playerid] = 0; PlayerCuffedTime[playerid] = 0;
	DrugPrice[playerid] = 0; RegistrationStep[playerid] = 0; OnCK[playerid] = 999; GettingCK[playerid] = 999;
	DrugGram[playerid] = 0; ConnectedToPC[playerid] = 0; OrderReady[playerid] = 0;
	JailPrice[playerid] = 0; MedicTime[playerid] = 0; NeedMedicTime[playerid] = 0; MedicBill[playerid] = 0; GotHit[playerid] = 0;
	WantedPoints[playerid] = 0; GoChase[playerid] = 999; GetChased[playerid] = 999; PlacedNews[playerid] = 0;
	OnDuty[playerid] = 0; WantedLevel[playerid] = 0; TestFishes[playerid] = 0;
	BoxWaitTime[playerid] = 0; SchoolSpawn[playerid] = 0; ChangePos2[playerid][1] = 0;
	SafeTime[playerid] = 60; TransportDuty[playerid] = 0; PlayerTied[playerid] = 0;
	BusCallTime[playerid] = 0; TaxiCallTime[playerid] = 0; MedicCallTime[playerid] = 0; MechanicCallTime[playerid] = 0;
	FindTimePoints[playerid] = 0; FindTime[playerid] = 0; JobDuty[playerid] = 0;
	Mobile[playerid] = 255; Music[playerid] = 0; BoxOffer[playerid] = 999; PlayerBoxing[playerid] = 0;
	Spectate[playerid] = 255; PlayerDrunk[playerid] = 0; PlayerDrunkTime[playerid] = 0;
	Unspec[playerid][sLocal] = 255; FishCount[playerid] = 0;
	WritingPaper[playerid] = 0; WritingPaperNumber[playerid] = 999; WritingLine[playerid] = 0; BringingPaper[playerid] = 0; GotPaper[playerid] = 0;
	PaperOffer[playerid] = 999; ConsumingMoney[playerid] = 0;
    gLastCar[playerid] = 0; FirstSpawn[playerid] = 0;
	gOoc[playerid] = 0; gNews[playerid] = 0; BigEar[playerid] = 0; gDice[playerid] = 0; gFam[playerid] = 0;
	gSpeedo[playerid] = 0; gGas[playerid] = 0;
	gPlayerLogged[playerid] = 0; gPlayerLogTries[playerid] = 0; gPlayerAccount[playerid] = 0;
	gPlayerSpawned[playerid] = 0; PlayerKarting[playerid] = 0; PlayerInKart[playerid] = 0;
	PlayerTazeTime[playerid] = 0; PlayerStoned[playerid] = 0;
	StartTime[playerid] = 0; TicketOffer[playerid] = 999; TicketMoney[playerid] = 0;
	MatsHolding[playerid] = 0; TutTime[playerid] = 0;
	gPlayerMission[playerid] = 0; TaxiAccepted[playerid] = 999; BusAccepted[playerid] = 999;
	PlayerInfo[playerid][pCash] = dollah; NoFuel[playerid] = 0;
	HireCar[playerid] = 299; PlayersChannel[playerid] = 999;
	TransportValue[playerid] = 0; TransportMoney[playerid] = 0; TransportTime[playerid] = 0; TransportCost[playerid] = 0; TransportDriver[playerid] = 999;
	Locator[playerid] = 0; PlayerOnMission[playerid] = 0; MissionCheckpoint[playerid] = 0;
	WatchingTV[playerid] = 0; PlayerPaintballing[playerid] = 0; PlayerPaintballKills[playerid] = 0;
	Fishes[playerid][pLastFish] = 0; Fishes[playerid][pFishID] = 0;
	ProposeOffer[playerid] = 999; MarryWitness[playerid] = 999; MarryWitnessOffer[playerid] = 999; MarriageCeremoney[playerid] = 0; ProposedTo[playerid] = 999; GotProposedBy[playerid] = 999; DivorceOffer[playerid] = 999;
	GivePlayerMoney(playerid,PlayerInfo[playerid][pCash]);
	PlayerInfo[playerid][pLevel] = 0;
	PlayerInfo[playerid][pAdmin] = 0;
	PlayerInfo[playerid][pDonateRank] = 0;
	PlayerInfo[playerid][gPupgrade] = 0;
	PlayerInfo[playerid][pConnectTime] = 0;
	PlayerInfo[playerid][pReg] = 0;
	PlayerInfo[playerid][pSex] = 0;
	PlayerInfo[playerid][pAge] = 0;
	PlayerInfo[playerid][pOrigin] = 0;
	PlayerInfo[playerid][pExp] = 0;
	PlayerInfo[playerid][pAccount] = 0;
	PlayerInfo[playerid][pCrimes] = 0;
	PlayerInfo[playerid][pDeaths] = 0;
	PlayerInfo[playerid][pArrested] = 0;
	PlayerInfo[playerid][pWantedDeaths] = 0;
	PlayerInfo[playerid][pPhoneBook] = 0;
	PlayerInfo[playerid][pLottoNr] = 0;
	PlayerInfo[playerid][pFishes] = 0;
	PlayerInfo[playerid][pBiggestFish] = 0;
	PlayerInfo[playerid][pJob] = 0;
	PlayerInfo[playerid][pPayCheck] = 0;
	PlayerInfo[playerid][pHeadValue] = 0;
	PlayerInfo[playerid][pJailed] = 0;
	PlayerInfo[playerid][pJailTime] = 0;
	PlayerInfo[playerid][pMats] = 0;
	PlayerInfo[playerid][pDrugs] = 0;
	PlayerInfo[playerid][pLeader] = 0;
	PlayerInfo[playerid][pMember] = 0;
	PlayerInfo[playerid][pFMember] = 255;
	PlayerInfo[playerid][pRank] = 0;
	PlayerInfo[playerid][pChar] = 0;
	PlayerInfo[playerid][pContractTime] = 0;
	PlayerInfo[playerid][pDetSkill] = 0;
	PlayerInfo[playerid][pSexSkill] = 0;
	PlayerInfo[playerid][pBoxSkill] = 0;
	PlayerInfo[playerid][pLawSkill] = 0;
	PlayerInfo[playerid][pMechSkill] = 0;
	PlayerInfo[playerid][pJackSkill] = 0;
	PlayerInfo[playerid][pCarSkill] = 0;
	PlayerInfo[playerid][pNewsSkill] = 0;
	PlayerInfo[playerid][pDrugsSkill] = 0;
	PlayerInfo[playerid][pCookSkill] = 0;
	PlayerInfo[playerid][pFishSkill] = 0;
	PlayerInfo[playerid][pSHealth] = 0.0;
	PlayerInfo[playerid][pHealth] = 50.0;
	PlayerInfo[playerid][pPos_x] = 2246.6;
	PlayerInfo[playerid][pPos_y] = -1161.9;
	PlayerInfo[playerid][pPos_z] = 1029.7;
	PlayerInfo[playerid][pInt] = 15;
	PlayerInfo[playerid][pLocal] = 255;
	PlayerInfo[playerid][pTeam] = 3;
	PlayerInfo[playerid][pModel] = 264;
	new randphone = 1000 + random(8999);//minimum 1000  max 9999 //giving one at the start
	PlayerInfo[playerid][pPnumber] = randphone;
	PlayerInfo[playerid][pPhousekey] = 255;
	PlayerInfo[playerid][pPbiskey] = 255;
	PlayerInfo[playerid][pCarLic] = 0;
	PlayerInfo[playerid][pFlyLic] = 0;
	PlayerInfo[playerid][pBoatLic] = 0;
	PlayerInfo[playerid][pFishLic] = 0;
	PlayerInfo[playerid][pGunLic] = 0;
	PlayerInfo[playerid][pGun1] = 0;
	PlayerInfo[playerid][pGun2] = 0;
	PlayerInfo[playerid][pGun3] = 0;
	PlayerInfo[playerid][pGun4] = 0;
	PlayerInfo[playerid][pAmmo1] = 0;
	PlayerInfo[playerid][pAmmo2] = 0;
	PlayerInfo[playerid][pAmmo3] = 0;
	PlayerInfo[playerid][pAmmo4] = 0;
	PlayerInfo[playerid][pCarTime] = 0;
	PlayerInfo[playerid][pPayDay] = 0;
	PlayerInfo[playerid][pPayDayHad] = 0;
	PlayerInfo[playerid][pCDPlayer] = 0;
	PlayerInfo[playerid][pWins] = 0;
	PlayerInfo[playerid][pLoses] = 0;
	PlayerInfo[playerid][pAlcoholPerk] = 0;
	PlayerInfo[playerid][pDrugPerk] = 0;
	PlayerInfo[playerid][pMiserPerk] = 0;
	PlayerInfo[playerid][pPainPerk] = 0;
	PlayerInfo[playerid][pTraderPerk] = 0;
	PlayerInfo[playerid][pTut] = 0;
	PlayerInfo[playerid][pMissionNr] = 0;
	PlayerInfo[playerid][pWarns] = 0;
	PlayerInfo[playerid][pFuel] = 0;
	PlayerInfo[playerid][pAdjustable] = 0;
	ClearCrime(playerid);
	ClearFishes(playerid);
	ClearCooking(playerid);
	ClearGroceries(playerid);
	ClearMarriage(playerid);
	SetPlayerColor(playerid,COLOR_GRAD2);
	GetPlayerName(playerid, plname, sizeof(plname));
	format(string, sizeof(string), "%s.ini", plname);
	if(fexist(string))
	{
		gPlayerAccount[playerid] = 1;
		SendClientMessage(playerid, COLOR_YELLOW, "SERVER: That nick is registered, please login");
		SendClientMessage(playerid, COLOR_WHITE, "HINT: You can now login by typing /login <password>");
		return 1;
	}
	else
	{
		gPlayerAccount[playerid] = 0;
		SendClientMessage(playerid,COLOR_YELLOW,"You dont have an account. Register at our site: www.godfather-rp.com");
		KickPlayer[playerid] = 1;
		return 1;
	}
}

public JoinChannel(playerid, number, line[])
{
    if(IsPlayerConnected(playerid))
	{
	    if(strcmp(IRCInfo[number][iPassword],line, true ) == 0 )
		{
	        JoinChannelNr(playerid, number);
	    }
	    else
	    {
	        SendClientMessage(playerid, COLOR_GREY, "   Wrong Channel Password !");
	    }
	}
	return 1;
}

public JoinChannelNr(playerid, number)
{
	if(IsPlayerConnected(playerid))
	{
	    new string[256];
		new sendername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(PlayersChannel[playerid] < 999)
	    {
			format(string, sizeof(string), "* %s has left the Channel.", sendername);
			SendIRCMessage(PlayersChannel[playerid], COLOR_GREEN, string);
			IRCInfo[PlayersChannel[playerid]][iPlayers] -= 1;
	    }
		new channel; channel = number; channel += 1;
	    PlayersChannel[playerid] = number;
	    IRCInfo[PlayersChannel[playerid]][iPlayers] += 1;
    	new wstring[128];
		format(string, sizeof(string), "%s", sendername);
		strmid(wstring, string, 0, strlen(string), 255);
		if(strcmp(IRCInfo[number][iAdmin],wstring, true ) == 0 )
		{
		    format(string, sizeof(string), "* You have joined IRC Channel %d as the Administrator.", channel);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		}
		else
		{
		    format(string, sizeof(string), "* You have joined IRC Channel %d, Admin: %s.", channel, IRCInfo[number][iAdmin]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		}
		format(string, sizeof(string), "MOTD: %s.", IRCInfo[number][iMOTD]);
		SendClientMessage(playerid, COLOR_YELLOW, string);
		format(string, sizeof(string), "* %s has joined the Channel.", sendername);
		SendIRCMessage(number, COLOR_GREEN, string);
	}
	return 1;
}

public ClearCK(ck)
{
    new string[MAX_PLAYER_NAME];
	format(string, sizeof(string), "No-one");
	strmid(CKInfo[ck][cSendername], string, 0, strlen(string), 255);
	strmid(CKInfo[ck][cGiveplayer], string, 0, strlen(string), 255);
	CKInfo[ck][cUsed] = 0;
	SaveCK();
	return 1;
}

public ClearMarriage(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    new string[MAX_PLAYER_NAME];
		format(string, sizeof(string), "No-one");
		strmid(PlayerInfo[playerid][pMarriedTo], string, 0, strlen(string), 255);
		PlayerInfo[playerid][pMarried] = 0;
	}
	return 1;
}

public ClearPaper(paper)
{
    new string[MAX_PLAYER_NAME];
	format(string, sizeof(string), "None");
	PaperInfo[paper][PaperUsed] = 0;
	strmid(PaperInfo[paper][PaperMaker], string, 0, strlen(string), 255);
	strmid(PaperInfo[paper][PaperTitle], string, 0, strlen(string), 255);
	strmid(PaperInfo[paper][PaperText1], string, 0, strlen(string), 255);
	strmid(PaperInfo[paper][PaperText2], string, 0, strlen(string), 255);
	strmid(PaperInfo[paper][PaperText3], string, 0, strlen(string), 255);
	strmid(PaperInfo[paper][PaperText4], string, 0, strlen(string), 255);
	strmid(PaperInfo[paper][PaperText5], string, 0, strlen(string), 255);
	strmid(PaperInfo[paper][PaperText6], string, 0, strlen(string), 255);
	strmid(PaperInfo[paper][PaperText7], string, 0, strlen(string), 255);
	SavePapers();
	return 1;
}

public ClearFamily(family)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(PlayerInfo[i][pFMember] == family)
	        {
	            SendClientMessage(i, COLOR_LIGHTBLUE, "* The Family you are in got Deleted by the Organisation Leader, you got kicked out automaticly.");
	            PlayerInfo[i][pFMember] = 255;
	        }
	    }
	}
    new string[MAX_PLAYER_NAME];
	format(string, sizeof(string), "None");
	FamilyInfo[family][FamilyTaken] = 0;
	strmid(FamilyInfo[family][FamilyName], string, 0, strlen(string), 255);
	strmid(FamilyInfo[family][FamilyMOTD], string, 0, strlen(string), 255);
	strmid(FamilyInfo[family][FamilyLeader], string, 0, strlen(string), 255);
	format(string, sizeof(string), "0xFF000069");
	strmid(FamilyInfo[family][FamilyColor], string, 0, strlen(string), 255);
	FamilyInfo[family][FamilyMembers] = 0;
	FamilyInfo[family][FamilySpawn][0] = 0.0;
	FamilyInfo[family][FamilySpawn][1] = 0.0;
	FamilyInfo[family][FamilySpawn][2] = 0.0;
	FamilyInfo[family][FamilySpawn][3] = 0.0;
	FamilyInfo[family][FamilyInterior] = 0;
	SaveFamilies();
	return 1;
}

public ClearCrime(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		new string[MAX_PLAYER_NAME];
		format(string, sizeof(string), "********");
		strmid(PlayerCrime[playerid][pBplayer], string, 0, strlen(string), 255);
		strmid(PlayerCrime[playerid][pVictim], string, 0, strlen(string), 255);
		strmid(PlayerCrime[playerid][pAccusing], string, 0, strlen(string), 255);
		strmid(PlayerCrime[playerid][pAccusedof], string, 0, strlen(string), 255);
	}
	return 1;
}

public FishCost(playerid, fish)
{
	if(IsPlayerConnected(playerid))
	{
		new cost = 0;
		switch (fish)
		{
		    case 1:
		    {
		        cost = 1;
		    }
		    case 2:
		    {
		        cost = 3;
		    }
		    case 3:
		    {
		        cost = 3;
		    }
		    case 5:
		    {
		        cost = 5;
		    }
		    case 6:
		    {
		        cost = 2;
		    }
		    case 8:
		    {
		        cost = 8;
		    }
		    case 9:
		    {
		        cost = 12;
		    }
		    case 11:
		    {
		        cost = 9;
		    }
		    case 12:
		    {
		        cost = 7;
		    }
		    case 14:
		    {
		        cost = 12;
		    }
		    case 15:
		    {
		        cost = 9;
		    }
		    case 16:
		    {
		        cost = 7;
		    }
		    case 17:
		    {
		        cost = 7;
		    }
		    case 18:
		    {
		        cost = 10;
		    }
		    case 19:
		    {
		        cost = 4;
		    }
		    case 21:
		    {
		        cost = 3;
		    }
		}
		return cost;
	}
	return 0;
}

public ClearFishes(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    Fishes[playerid][pFid1] = 0; Fishes[playerid][pFid2] = 0; Fishes[playerid][pFid3] = 0;
		Fishes[playerid][pFid4] = 0; Fishes[playerid][pFid5] = 0;
		Fishes[playerid][pWeight1] = 0; Fishes[playerid][pWeight2] = 0; Fishes[playerid][pWeight3] = 0;
		Fishes[playerid][pWeight4] = 0; Fishes[playerid][pWeight5] = 0;
		new string[MAX_PLAYER_NAME];
		format(string, sizeof(string), "None");
		strmid(Fishes[playerid][pFish1], string, 0, strlen(string), 255);
		strmid(Fishes[playerid][pFish2], string, 0, strlen(string), 255);
		strmid(Fishes[playerid][pFish3], string, 0, strlen(string), 255);
		strmid(Fishes[playerid][pFish4], string, 0, strlen(string), 255);
		strmid(Fishes[playerid][pFish5], string, 0, strlen(string), 255);
	}
	return 1;
}

public ClearFishID(playerid, fish)
{
	if(IsPlayerConnected(playerid))
	{
		new string[MAX_PLAYER_NAME];
		format(string, sizeof(string), "None");
		switch (fish)
		{
		    case 1:
		    {
		        strmid(Fishes[playerid][pFish1], string, 0, strlen(string), 255);
		        Fishes[playerid][pWeight1] = 0;
		        Fishes[playerid][pFid1] = 0;
		    }
		    case 2:
		    {
		        strmid(Fishes[playerid][pFish2], string, 0, strlen(string), 255);
		        Fishes[playerid][pWeight2] = 0;
		        Fishes[playerid][pFid2] = 0;
		    }
		    case 3:
		    {
		        strmid(Fishes[playerid][pFish3], string, 0, strlen(string), 255);
		        Fishes[playerid][pWeight3] = 0;
		        Fishes[playerid][pFid3] = 0;
		    }
		    case 4:
		    {
		        strmid(Fishes[playerid][pFish4], string, 0, strlen(string), 255);
		        Fishes[playerid][pWeight4] = 0;
		        Fishes[playerid][pFid4] = 0;
		    }
		    case 5:
		    {
		        strmid(Fishes[playerid][pFish5], string, 0, strlen(string), 255);
		        Fishes[playerid][pWeight5] = 0;
		        Fishes[playerid][pFid5] = 0;
		    }
		}
	}
	return 1;
}

public ClearCooking(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    Cooking[playerid][pCookID1] = 0; Cooking[playerid][pCookID2] = 0; Cooking[playerid][pCookID3] = 0;
		Cooking[playerid][pCookID4] = 0; Cooking[playerid][pCookID5] = 0;
		Cooking[playerid][pCWeight1] = 0; Cooking[playerid][pCWeight2] = 0; Cooking[playerid][pCWeight3] = 0;
		Cooking[playerid][pCWeight4] = 0; Cooking[playerid][pCWeight5] = 0;
		new string[MAX_PLAYER_NAME];
		format(string, sizeof(string), "Nothing");
		strmid(Cooking[playerid][pCook1], string, 0, strlen(string), 255);
		strmid(Cooking[playerid][pCook2], string, 0, strlen(string), 255);
		strmid(Cooking[playerid][pCook3], string, 0, strlen(string), 255);
		strmid(Cooking[playerid][pCook4], string, 0, strlen(string), 255);
		strmid(Cooking[playerid][pCook5], string, 0, strlen(string), 255);
	}
	return 1;
}

public ClearCookingID(playerid, cook)
{
	if(IsPlayerConnected(playerid))
	{
		new string[MAX_PLAYER_NAME];
		format(string, sizeof(string), "Nothing");
		switch (cook)
		{
		    case 1:
		    {
		        strmid(Cooking[playerid][pCook1], string, 0, strlen(string), 255);
		        Cooking[playerid][pCWeight1] = 0;
		        Cooking[playerid][pCookID1] = 0;
		    }
		    case 2:
		    {
		        strmid(Cooking[playerid][pCook2], string, 0, strlen(string), 255);
		        Cooking[playerid][pCWeight2] = 0;
		        Cooking[playerid][pCookID2] = 0;
		    }
		    case 3:
		    {
		        strmid(Cooking[playerid][pCook3], string, 0, strlen(string), 255);
		        Cooking[playerid][pCWeight3] = 0;
		        Cooking[playerid][pCookID3] = 0;
		    }
		    case 4:
		    {
		        strmid(Cooking[playerid][pCook4], string, 0, strlen(string), 255);
		        Cooking[playerid][pCWeight4] = 0;
		        Cooking[playerid][pCookID4] = 0;
		    }
		    case 5:
		    {
		        strmid(Cooking[playerid][pCook5], string, 0, strlen(string), 255);
		        Cooking[playerid][pCWeight5] = 0;
		        Cooking[playerid][pCookID5] = 0;
		    }
		}
	}
	return 1;
}

public ClearGroceries(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    Groceries[playerid][pChickens] = 0; Groceries[playerid][pChicken] = 0;
	    Groceries[playerid][pHamburgers] = 0; Groceries[playerid][pHamburger] = 0;
	    Groceries[playerid][pPizzas] = 0; Groceries[playerid][pPizza] = 0;
	}
	return 1;
}

public Lotto(number)
{
	new JackpotFallen = 0;
	new string[256];
	new winner[MAX_PLAYER_NAME];
	format(string, sizeof(string), "Lottery News: Today the Winning Number has fallen on: %d.", number);
    OOCOff(COLOR_WHITE, string);
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pLottoNr] > 0)
		    {
			    if(PlayerInfo[i][pLottoNr] == number)
			    {
			        JackpotFallen = 1;
			        GetPlayerName(i, winner, sizeof(winner));
					format(string, sizeof(string), "Lottery News: %s has won the Jackpot of $%d with his Lottery Ticket.", winner, Jackpot);
					OOCOff(COLOR_WHITE, string);
					format(string, sizeof(string), "* You have Won $%d with your Lottery Ticket.", Jackpot);
					SendClientMessage(i, COLOR_YELLOW, string);
					ConsumingMoney[i] = 1;
					GivePlayerMoney(i, Jackpot);
			    }
			    else
			    {
			        SendClientMessage(i, COLOR_LIGHTBLUE, "* You haven't won with your Lottery Ticket this time.");
			    }
			}
			PlayerInfo[i][pLottoNr] = 0;
		}
	}
	if(JackpotFallen)
	{
	    new rand = random(125000); rand += 15789;
	    Jackpot = rand;
	    SaveStuff();
	    format(string, sizeof(string), "Lottery News: The new Jackpot has been started with $%d.", Jackpot);
		OOCOff(COLOR_WHITE, string);
	}
	else
	{
	    new rand = random(15000); rand += 2158;
	    Jackpot += rand;
	    SaveStuff();
	    format(string, sizeof(string), "Lottery News: The Jackpot has been raised to $%d.", Jackpot);
		OOCOff(COLOR_WHITE, string);
	}
	return 1;
}

//------------------------------------------------------------------------------------------------------
public OnPlayerDisconnect(playerid)
{
	gActivePlayers[playerid]--;
	numplayers--;
	PlayerInfo[playerid][pAdjustable] = 1;
	OnPlayerUpdate(playerid);
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(TaxiAccepted[i] < 999)
	        {
		        if(TaxiAccepted[i] == playerid)
		        {
		            TaxiAccepted[i] = 999;
		            GameTextForPlayer(i, "~w~Taxi Caller~n~~r~Left the game", 5000, 1);
		            TaxiCallTime[i] = 0;
		            DisablePlayerCheckpoint(i);
		        }
	        }
	        else if(BusAccepted[i] < 999)
	        {
		        if(BusAccepted[i] == playerid)
		        {
		            BusAccepted[i] = 999;
		            GameTextForPlayer(i, "~w~Bus Caller~n~~r~Left the game", 5000, 1);
		            BusCallTime[i] = 0;
		            DisablePlayerCheckpoint(i);
		        }
	        }
	    }
	}
	if(GettingCK[playerid] < 999)
	{
	    if(IsPlayerConnected(GettingCK[playerid]))
	    {
	        SendClientMessage(GettingCK[playerid], COLOR_YELLOW, "Your Character Kill has left the server, try again later.");
	        OnCK[GettingCK[playerid]] = 999;
	    }
	}
	if(TransportCost[playerid] > 0 && TransportDriver[playerid] < 999)
	{
	    if(IsPlayerConnected(TransportDriver[playerid]))
		{
		    new string[64];
		    TransportMoney[TransportDriver[playerid]] += TransportCost[playerid];
		    TransportTime[TransportDriver[playerid]] = 0;
		    TransportCost[TransportDriver[playerid]] = 0;
		    format(string, sizeof(string), "~w~Passenger left~n~~g~Earned $%d",TransportCost[playerid]);
		    GameTextForPlayer(TransportDriver[playerid], string, 5000, 1);
		}
	}
	if(GotHit[playerid] > 0)
	{
	    if(GetChased[playerid] < 999)
	    {
	        if(IsPlayerConnected(GetChased[playerid]))
	        {
	        	SendClientMessage(GetChased[playerid], COLOR_YELLOW, "Your Hit has left the server.");
	            GoChase[GetChased[playerid]] = 999;
			}
	    }
	}
	if(PlayerPaintballing[playerid] != 0)
	{
	    PaintballPlayers --;
	}
	if(PlayerKarting[playerid] > 0 && PlayerInKart[playerid] > 0)
	{
	    KartingPlayers --;
	}
	if(PlayersChannel[playerid] < 999)
	{
		IRCInfo[PlayersChannel[playerid]][iPlayers] -= 1;
	}
	if(HireCar[playerid] != 299)
	{
		gLastDriver[HireCar[playerid]] = 300;
		gCarLock[HireCar[playerid]] = 0;
		UnLockCar(HireCar[playerid]);
	}
	if (gLastCar[playerid] > 0)
	{
		gLastDriver[gLastCar[playerid]] = 300;
		if(PlayerInfo[playerid][pPhousekey] != gLastCar[playerid]-1)
		{
			gCarLock[gLastCar[playerid]] = 0;
			UnLockCar(gLastCar[playerid]);
		}
	}
	if(PlayerBoxing[playerid] > 0)
	{
	    if(Boxer1 == playerid)
	    {
	        if(IsPlayerConnected(Boxer2))
	        {
	        	PlayerBoxing[Boxer2] = 0;
	        	SetPlayerPos(Boxer2, 765.8433,3.2924,1000.7186);
	        	SetPlayerInterior(Boxer2, 5);
	        	GameTextForPlayer(Boxer2, "~r~Match interupted", 5000, 1);
			}
	    }
	    else if(Boxer2 == playerid)
	    {
	        if(IsPlayerConnected(Boxer1))
	        {
	        	PlayerBoxing[Boxer1] = 0;
	        	SetPlayerPos(Boxer1, 765.8433,3.2924,1000.7186);
	        	SetPlayerInterior(Boxer1, 5);
	        	GameTextForPlayer(Boxer1, "~r~Match interupted", 5000, 1);
			}
	    }
	    InRing = 0;
     	RoundStarted = 0;
		Boxer1 = 255;
		Boxer2 = 255;
		TBoxer = 255;
	}
    if(TransportDuty[playerid] == 1)
	{
		TaxiDrivers -= 1;
	}
    else if(TransportDuty[playerid] == 2)
	{
		BusDrivers -= 1;
	}
	if(PlayerInfo[playerid][pJob] == 11)
	{
	    if(JobDuty[playerid] == 1) { Medics -= 1; }
	}
	else if(PlayerInfo[playerid][pJob] == 7)
	{
	    if(JobDuty[playerid] == 1) { Mechanics -= 1; }
	}
}

public SetPlayerSpawn(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    if(PlayerInfo[playerid][pTut] == 0)
	    {
			gOoc[playerid] = 1; gNews[playerid] = 1; gFam[playerid] = 1;
			TogglePlayerControllable(playerid, 0);
			RegistrationStep[playerid] = 1;
			SendClientMessage(playerid, COLOR_YELLOW, "Welcome to Role Play - The Godfather server, please fill in some information to proceed.");
			SendClientMessage(playerid, COLOR_LIGHTRED, "Are you a Male or Female? (Type in what you are).");
	    }
		new rand;
		new house = PlayerInfo[playerid][pPhousekey];
		if(PlayerPaintballing[playerid] != 0)
		{
		    ResetPlayerWeapons(playerid);
      		GivePlayerWeapon(playerid, 29, 999);
		    rand = random(sizeof(PaintballSpawns));
			SetPlayerPos(playerid, PaintballSpawns[rand][0], PaintballSpawns[rand][1], PaintballSpawns[rand][2]);
		    return 1;
		}
		if(PlayerInfo[playerid][pJailed] == 1)
		{
		    SetPlayerInterior(playerid, 6);
			SetPlayerPos(playerid,264.6288,77.5742,1001.0391);
			SendClientMessage(playerid, COLOR_LIGHTRED, "Incomplete Jail Sentence, back to jail.");
			return 1;
		}
		if(PlayerInfo[playerid][pJailed] == 2)
		{
		    SetPlayerInterior(playerid, 0);
			SetPlayerPos(playerid,268.5777,1857.9351,9.8133);
			SetPlayerWorldBounds(playerid, 337.5694,101.5826,1940.9759,1798.7453); //285.3481,96.9720,1940.9755,1799.0811
			return 1;
		}
		if(MedicBill[playerid] == 1 && PlayerInfo[playerid][pJailed] == 0 && PlayerPaintballing[playerid] == 0)
		{
		    new string[256];
		    new cut = deathcost; //PlayerInfo[playerid][pLevel]*deathcost;
			GivePlayerMoney(playerid, -cut);
			format(string, sizeof(string), "DOC: Your Medical Bill comes to $%d, Have a nice day.", cut);
			SendClientMessage(playerid, TEAM_CYAN_COLOR, string);
			MedicBill[playerid] = 0;
			MedicTime[playerid] = 0;
			NeedMedicTime[playerid] = 0;
			PlayerInfo[playerid][pDeaths] += 1;
			SetPlayerHealth(playerid, 25.0);
		    /*SetPlayerInterior(playerid, 5);
	        rand = random(sizeof(gMedicSpawns));
			SetPlayerPos(playerid, gMedicSpawns[rand][0], gMedicSpawns[rand][1], gMedicSpawns[rand][2]); // Warp the player
			SetPlayerFacingAngle(playerid, 270.0);
	        TogglePlayerControllable(playerid, 0);
	        GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~y~You are recovering from your ~r~wounds~y~...", 35000, 3);
	        MedicTime[playerid] = 1;
	        if(PlayerInfo[playerid][pDonateRank] > 0)
	        {
	            NeedMedicTime[playerid] = 30;
	        }
	        else
	        {
	        	NeedMedicTime[playerid] = 60;
			}
	        PlayerPlaySound(playerid, 1062, 0.0, 0.0, 0.0);
		    return 1;*/
		}
		if(house !=255)
		{
		    if(SpawnChange[playerid]) //If 1, then you get to your house, else spawn somewhere else
		    {
				SetPlayerToTeamColor(playerid);
				SetPlayerInterior(playerid,HouseInfo[house][hInt]);
				SetPlayerPos(playerid, HouseInfo[house][hExitx], HouseInfo[house][hExity],HouseInfo[house][hExitz]); // Warp the player
				PlayerInfo[playerid][pLocal] = house;
				PlayerInfo[playerid][pInt] = HouseInfo[house][hInt];
				return 1;
			}
		}
		if(PlayerInfo[playerid][pLeader] == 7)//Mayor spawn
		{
		    SetPlayerToTeamColor(playerid);
		    SetPlayerInterior(playerid, 3);
		    SetPlayerPos(playerid, 356.2998,151.9914,1025.7891);
		    PlayerInfo[playerid][pInt] = 3;
			PlayerInfo[playerid][pLocal] = 241;
		    return 1;
		}
		if (PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pMember] == 2 || PlayerInfo[playerid][pLeader] == 2 || PlayerInfo[playerid][pLeader] == 1)//Police Force spawn & FBI/ATF
		{
			SetPlayerToTeamColor(playerid);
		    rand = random(sizeof(gCopPlayerSpawns));
			SetPlayerPos(playerid, gCopPlayerSpawns[rand][0], gCopPlayerSpawns[rand][1], gCopPlayerSpawns[rand][2]); // Warp the player
			SetPlayerFacingAngle(playerid, 270.0);
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			return 1;
	    }
		if (PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLeader] == 3)//National Guard spawn
		{
		    SetPlayerToTeamColor(playerid);
		    SetPlayerInterior(playerid, 0);
		    SetPlayerPos(playerid, -1346.2050,492.3983,11.2027);
		    PlayerInfo[playerid][pInt] = 0;
		    return 1;
		}
		if (PlayerInfo[playerid][pMember] == 4 || PlayerInfo[playerid][pLeader] == 4)//Fire/Ambulance spawn
		{
		    SetPlayerToTeamColor(playerid);
		    SetPlayerInterior(playerid, 0);
		    SetPlayerPos(playerid, -2656.0393,635.0596,14.4531);
		    PlayerInfo[playerid][pInt] = 0;
		    return 1;
		}
		if (PlayerInfo[playerid][pMember] == 5 || PlayerInfo[playerid][pLeader] == 5)//LaCosaNostra spawn
		{
		    SetPlayerToTeamColor(playerid);
		    SetPlayerInterior(playerid, 0);
		    SetPlayerPos(playerid, 1124.2415,-2037.1274,69.8847);
		    PlayerInfo[playerid][pInt] = 0;
		    return 1;
		}
		if (PlayerInfo[playerid][pMember] == 6 || PlayerInfo[playerid][pLeader] == 6)//Yakuza spawn
		{
		    SetPlayerToTeamColor(playerid);
		    SetPlayerInterior(playerid, 0);
		    SetPlayerPos(playerid, -2192.3020,646.8816,49.4375);
		    PlayerInfo[playerid][pInt] = 0;
		    return 1;
		}
	    if (PlayerInfo[playerid][pMember] == 8 || PlayerInfo[playerid][pLeader] == 8) //Hitman spawn
	    {
	        SetPlayerToTeamColor(playerid);
			SetPlayerPos(playerid, 1102.7017,-299.0774,73.9922);
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
	        return 1;
	    }
	    if (PlayerInfo[playerid][pMember] == 9 || PlayerInfo[playerid][pLeader] == 9) //News spawn
	    {
	        SetPlayerToTeamColor(playerid);
			SetPlayerPos(playerid, -2050.8962,460.0262,35.1719);
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
	        return 1;
	    }
	    if (PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLeader] == 10) //Taxi Cab Company spawn
	    {
	        SetPlayerToTeamColor(playerid);
			SetPlayerPos(playerid, -1978.5934,102.9237,27.6875);
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
	        return 1;
	    }
	    if(IsAnInstructor(playerid)) //Driving/Flying School spawn
	    {
			if(SchoolSpawn[playerid] == 0)
			{
		        SetPlayerToTeamColor(playerid);
				SetPlayerPos(playerid, -2032.6810,-117.4816,1035.1719);
				SetPlayerFacingAngle(playerid, 275.1114);
				SetPlayerInterior(playerid,3);
				PlayerInfo[playerid][pInt] = 3;
			}
			else if(SchoolSpawn[playerid] == 1)
			{
				SetPlayerToTeamColor(playerid);
				SetPlayerPos(playerid, 414.4144,2531.9580,19.1565);
				SetPlayerFacingAngle(playerid, 4.6505);
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
			}
	        return 1;
	    }
	    if ((gTeam[playerid]) == 1)
	    {
			SetPlayerToTeamColor(playerid);
			rand = random(sizeof(gMedPlayerSpawns));
			SetPlayerPos(playerid, gMedPlayerSpawns[rand][0], gMedPlayerSpawns[rand][1], gMedPlayerSpawns[rand][2]); // Warp the player
			SetPlayerFacingAngle(playerid, 270.0);
			SetPlayerInterior(playerid,0);
			PlayerInfo[playerid][pInt] = 0;
			return 1;
		}
		if(PlayerInfo[playerid][pFMember] != 255)
		{
		    new family = PlayerInfo[playerid][pFMember];
		    SetPlayerToTeamColor(playerid);
		    SetPlayerInterior(playerid, FamilyInfo[family][FamilyInterior]);
		    SetPlayerPos(playerid, FamilyInfo[family][FamilySpawn][0],FamilyInfo[family][FamilySpawn][1],FamilyInfo[family][FamilySpawn][2]);
		    SetPlayerFacingAngle(playerid, FamilyInfo[family][FamilySpawn][3]);
		    return 1;
		}
	    else
	    {
			SetPlayerToTeamColor(playerid);
			if(PlayerInfo[playerid][pOrigin] == 1)//USA
			{
			    SetPlayerPos(playerid,-2721.2612,-317.8447,7.8438);
				SetPlayerFacingAngle(playerid, 46.8583);
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
			}
			else if(PlayerInfo[playerid][pOrigin] == 2)//Europe
			{
			    SetPlayerPos(playerid,477.8121,-1499.7649,20.5001);
				SetPlayerFacingAngle(playerid, 262.9963);
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
			}
			else if(PlayerInfo[playerid][pOrigin] == 3)//Asia
			{
			    SetPlayerPos(playerid,-2155.4368,635.8173,52.3672);
				SetPlayerFacingAngle(playerid, 272.3543);
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
			}
			else
			{
				rand = random(sizeof(gRandomPlayerSpawns));
				SetPlayerPos(playerid, gRandomPlayerSpawns[rand][0], gRandomPlayerSpawns[rand][1], gRandomPlayerSpawns[rand][2]); // Warp the player
				SetPlayerFacingAngle(playerid, 270.0);
				SetPlayerInterior(playerid,15);
				PlayerInfo[playerid][pInt] = 15;
			}
			return 1;
		}
	}
	return 1;
}

//------------------------------------------------------------------------------------------------------

public OnPlayerDeath(playerid, killerid, reason)
{
	new name[MAX_PLAYER_NAME];
	new string[256];
	//new dmessage[128];
	//new deathreason[20];
	new playercash;
	new victimteam;
	new Float:px,Float:py,Float:pz;
	new killerteam;

	victimteam = gTeam[playerid];
	killerteam = gTeam[killerid];
	gPlayerSpawned[playerid] = 0;
	GetPlayerName(playerid, name, sizeof(name));
	PlayerInfo[playerid][pLocal] = 255;
	GetPlayerPos(playerid, px, py, pz);
	if(killerid != 255)
	{
		if(GetPlayerState(killerid) == 2)
		{
			SendClientMessage(killerid, COLOR_YELLOW, "DriveBy Kill, dont abuse it, On foot gets you $$$!");
			return 1;
		}
	}
	if(reason == 38)
	{
		new kstring[128];
		new kickname[MAX_PLAYER_NAME];
		if(IsPlayerConnected(killerid))
		{
			GetPlayerName(killerid, kickname, sizeof(kickname));
			format(string, 256, "AdmWarning: [%d]%s just killed a player with minigun, be sure he's not fake-killing.",killerid,kickname);
			ABroadCast(COLOR_YELLOW,string,1);
			printf("%s", kstring);
		}
	}
	if (gPlayerCheckpointStatus[playerid] > 4 && gPlayerCheckpointStatus[playerid] < 11)
	{
		DisablePlayerCheckpoint(playerid);
		gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
	}
	new caller = Mobile[playerid];
	if(caller != 255)
	{
		if(caller < 255)
		{
			SendClientMessage(caller,  COLOR_GRAD2, "   The line just went dead....");
			CellTime[caller] = 0;
			CellTime[playerid] = 0;
			Mobile[caller] = 255;
		}
		Mobile[playerid] = 255;
		CellTime[playerid] = 0;
	}
	ClearCrime(playerid);
	if(PlayerPaintballing[playerid] != 0)
	{
	    PlayerPaintballKills[killerid] ++;
	    if(PlayerPaintballKills[killerid] > PaintballWinnerKills)
	    {
	        new killer[MAX_PLAYER_NAME];
	        PaintballWinner = killerid;
	        PaintballWinnerKills = PlayerPaintballKills[killerid];
	        GetPlayerName(killerid, killer, sizeof(killer));
	        for(new i = 0; i < MAX_PLAYERS; i++)
	        {
	            if(IsPlayerConnected(i))
	            {
	                if(PlayerPaintballing[i] != 0)
	                {
	                    format(string, sizeof(string), "* %s is in the lead with %d Kills.",killer,PaintballWinnerKills);
						SendClientMessage(i, COLOR_WHITE, string);
	                }
	            }
	        }
	    }
	    return 1;
	}
	if(GettingCK[playerid] < 999 || OnCK[playerid] < 999)
	{
	    if(IsPlayerConnected(killerid))
	    {
	        if(GettingCK[killerid] < 999 || OnCK[playerid] < 999)
	        {
	            new killer[MAX_PLAYER_NAME];
	            new dier[MAX_PLAYER_NAME];
	            GetPlayerName(playerid, dier, sizeof(dier));
				GetPlayerName(killerid, killer, sizeof(killer));
	            format(string, sizeof(string), "* %s has performed a Character Kill on you, you aren't able to play with this Character anymore.",killer);
	            SendClientMessage(playerid, COLOR_LIGHTRED, string);
	            format(string, sizeof(string), "** %s has Character Killed %s **",killer,dier);
	            CKLog(string);
	            PlayerInfo[playerid][pCK] = 1;
	            if(GettingCK[playerid] < 999) { GettingCK[playerid] = 999; }
	            else if(OnCK[playerid] < 999) { OnCK[playerid] = 999; }
	            if(GettingCK[killerid] < 999) { GettingCK[killerid] = 999; }
	            else if(OnCK[killerid] < 999) { OnCK[killerid] = 999; }
	            KickPlayer[playerid] = 1;
	        }
	    }
	}
	if(PlayerInfo[playerid][pHeadValue] > 0)
	{
	    if(IsPlayerConnected(killerid))
	    {
		    if(gTeam[killerid] == 10 || PlayerInfo[killerid][pLeader] == 8)
		    {
		        if(GoChase[killerid] == playerid)
		        {
		            ConsumingMoney[killerid] = 1;
					new killer[MAX_PLAYER_NAME];
					GetPlayerName(killerid, killer, sizeof(killer));
					GivePlayerMoney(killerid, PlayerInfo[playerid][pHeadValue]);
					format(string,128,"<< Hitman %s has fulfilled the contract on %s and collected $%d >>",killer,name,PlayerInfo[playerid][pHeadValue]);
					SendFamilyMessage(8, COLOR_YELLOW, string);
					PlayerInfo[playerid][pHeadValue] = 0;
					GotHit[playerid] = 0;
					GetChased[playerid] = 999;
					GoChase[killerid] = 999;
				}
			}
		}
	}
	if(victimteam >= 4)
	{
	    if(IsPlayerConnected(killerid))
	    {
			//new killer[MAX_PLAYER_NAME];
			//GetPlayerName(killerid, killer, sizeof(killer));
			new slice = 100; //$100
			playercash = GetPlayerMoney(playerid);
			if(gTeam[killerid] != 2) { WantedPoints[killerid] += 2; } //+ 2 wanted points
			if(SafeTime[playerid] <= 0)
			{
				if(gTeam[killerid] != gTeam[playerid])
				{
					if(GetPlayerState(killerid) == 1)
					{
						PlayerInfo[killerid][pKills] = PlayerInfo[killerid][pKills] + 2;
					}
					else
					{
						PlayerInfo[killerid][pKills]++;
					}
					PlayerInfo[playerid][pKills]--;
				}
			}
			/*if (strlen(deathreason) > 0)// patch
			{
				if (((gTeam[killerid]) == 1) || ((gTeam[killerid]) == 3 && civnokill) || gTeam[killerid] == gTeam[playerid])//med kill criminal
				{
					format(string, sizeof(string), ".: %s murdered %s. (%s) :.", killer, name, deathreason);
				}
				else
				{
					format(string, sizeof(string), ".: %s murdered %s. (%s) for $%d :.", killer, name, deathreason, slice);
				}

			}
			else
			{
				if (((gTeam[killerid]) == 1) || ((gTeam[killerid]) == 3 && civnokill || gTeam[killerid] == gTeam[playerid]))
				{
					format(string, sizeof(string), ".: %s murdered %s :.", killer, name);
				}
				else
				{
					format(string, sizeof(string), ".: %s murdered %s for $%d :.", killer, name, slice);
				}
			}*/
			if (((gTeam[killerid]) == 1) || ((gTeam[killerid]) == 3 && civnokill) || (gTeam[killerid] == gTeam[playerid] && gTeam[playerid] != 4))
			{
				slice = 0;
			}
			if (((gTeam[killerid]) != 4) && ((gTeam[killerid]) == gTeam[playerid]))//no team kill
			{
				slice = 0;
			}
			if (playercash > 0)
			{
				GivePlayerMoney(playerid, -slice);
			}
			else
			{
				slice = slice+500;
			}
			GivePlayerMoney(killerid, slice);
			//GameTextForPlayer(playerid, dmessage, 5000, 2);
			PlayerPlaySound(killerid, 1083, 0.0, 0.0, 0.0);
			if (((gTeam[killerid]) == 3) && reason != 49)
			{
				SetPlayerCriminal(killerid,255, "First Degree Murder");
			}
			else if (((gTeam[killerid]) == 3) && reason == 49)
			{
				SetPlayerCriminal(killerid,255, "Hit And Run");
			}
		}
	}
	else if (victimteam == 2)
	{
	    if(IsPlayerConnected(killerid))
	    {
			//new killer[MAX_PLAYER_NAME];
			//GetPlayerName(killerid, killer, sizeof(killer));
			// Cop kill
			PlayerInfo[playerid][pKills]--;
			if (gTeam[killerid] == 2)//cops kill cop
			{
				//format(string,128,".: Officer %s murdered Officer %s (%s) and was sued for $%d :.",killer,name,deathreason,suecost);
				PlayerPlaySound(killerid, 1084, 0.0, 0.0, 0.0);
				GivePlayerMoney(killerid, -suecost);
				GivePlayerMoney(playerid, suecost+100);//+100pays hospital bill
			}
			else
			{
				//format(string,128,".: %s murdered Officer %s (%s) :.",killer,name,deathreason);
		    }
			if (gTeam[killerid] >= 3)
			{
			    WantedPoints[killerid] += 2; //+ 2 wanted points
				if(reason != 49)
				{
					SetPlayerCriminal(killerid,255, "First Degree Murder");
				}
				else if (reason == 49)
				{
					SetPlayerCriminal(killerid,255, "Hit And Run");
				}
			}
			if(gTeam[killerid] >= 5 && SafeTime[playerid] <= 0)
			{
				if(GetPlayerState(killerid) == 1)
				{
					PlayerInfo[killerid][pKills] = PlayerInfo[killerid][pKills]+2;
				}
				else
				{
					PlayerInfo[killerid][pKills]++;
				}
				WantedPoints[killerid]+=2;
			}
			//BroadCast(COLOR_RED, string);
		}
	}
	else if (victimteam == 3)
	{
	    if(IsPlayerConnected(killerid))
	    {
			//new killer[MAX_PLAYER_NAME];
			//GetPlayerName(killerid, killer, sizeof(killer));
			// Civ kill
			if ((gTeam[killerid]) == 2)//cops kill civ
			{
			    if(WantedLevel[playerid] < 1)
			    {
					//format(string,128,".: Officer %s murdered %s (%s) and was sued for $%d :.",killer,name,deathreason,suecost);
					PlayerPlaySound(killerid, 1084, 0.0, 0.0, 0.0);
					GivePlayerMoney(killerid, -suecost);
					GivePlayerMoney(playerid, suecost+100);//+100pays hospital bill
				}
			}
			else
			{
				//format(string,128,".: %s murdered %s (%s) :.",killer,name,deathreason);
				WantedPoints[killerid] += 2;
		    }
			if (((gTeam[killerid]) >= 3 || (gTeam[killerid]) == 1) && reason != 49)
			{
				SetPlayerCriminal(killerid,255, "First Degree Murder");
			}
			else if (((gTeam[killerid]) >= 3 || (gTeam[killerid]) == 1) && reason == 49)
			{
				SetPlayerCriminal(killerid,255, "Hit And Run");
			}
		    //BroadCast(COLOR_RED, string);
		}
	}
	else if (victimteam == 1)
	{
	    if(IsPlayerConnected(killerid))
	    {
			//new killer[MAX_PLAYER_NAME];
			//GetPlayerName(killerid, killer, sizeof(killer));
			// Civ kill
			if ((gTeam[killerid]) == 2)//cops kill civ
			{
				//format(string,128,".: Officer %s murdered Paramedic %s (%s) and was sued for $%d :.",killer,name,deathreason,suecost);
				PlayerPlaySound(killerid, 1084, 0.0, 0.0, 0.0);
				GivePlayerMoney(killerid, -suecost);
				GivePlayerMoney(playerid, suecost+100);//+100pays hospital bill
			}
			else if ((gTeam[killerid]) == 1)//med kill civ
			{
				//format(string,128,".: Paramedic %s murdered %s (%s) and was sued for $%d :.",killer,name,deathreason,suecost);
				PlayerPlaySound(killerid, 1084, 0.0, 0.0, 0.0);
				GivePlayerMoney(killerid, -suecost);
				GivePlayerMoney(playerid, suecost+100);//+100pays hospital bill
			}
			else
			{
				//format(string,128,".: %s murdered %s (%s) :.",killer,name,deathreason);
		    }
			if (((gTeam[killerid]) == 4) && reason != 49)
			{
				SetPlayerCriminal(killerid,255, "First Degree Murder");
			}
			else if (((gTeam[killerid]) == 3) && reason == 49)
			{
				SetPlayerCriminal(killerid,255, "Hit And Run");
			}
		    //BroadCast(COLOR_RED, string);
		}
	}
	if (victimteam >= 3 && WantedPoints[playerid] > 0 && killerteam == 2)
	{
	    SetPlayerFree(playerid,killerid, "Got Killed");
	}
	killerid = INVALID_PLAYER_ID;
	SetPlayerColor(playerid,COLOR_GRAD2);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	InitLockDoors(playerid);
	STDPlayer[playerid] = 0;
	gTeam[playerid] = PlayerInfo[playerid][pTeam]; //Set the Team
	if (gTeam[playerid] == 4) //medic / criminal reset team
	{
		gTeam[playerid] = 3;
	}
	if(gPlayerLogged[playerid] == 0)
	{
    	SendClientMessage(playerid, COLOR_LIGHTRED, "** This server requires a Login BEFORE spawn (Kicked) **");
        KickPlayer[playerid] = 1;
 	}
	if(gTeam[playerid] == 11 && PlayerInfo[playerid][pLeader] < 1)
	{
	    MedicBill[playerid] = 0;
	    new rand = random(sizeof(CIV));
		SendClientMessage(playerid, COLOR_LIGHTRED, "You are not an Approved Leader, you are now a Civilian !");
		PlayerInfo[playerid][pTeam] = 3;
		gTeam[playerid] = 3;
		SetSpawnInfo(playerid, gTeam[playerid], CIV[rand],0.0,0.0,0.0,0,0,0,0,0,0,0);
		PlayerInfo[playerid][pModel] = CIV[rand];
		SpawnPlayer(playerid);
	}
	if(gTeam[playerid] == 5)
	{
	    if(PlayerInfo[playerid][pMember] < 1)
	    {
	        MedicBill[playerid] = 0;
	        new rand = random(sizeof(CIV));
			SendClientMessage(playerid, COLOR_LIGHTRED, "You are not a Family Member, you are now a Civilian !");
			PlayerInfo[playerid][pTeam] = 3;
			gTeam[playerid] = 3;
            SetSpawnInfo(playerid, gTeam[playerid], CIV[rand],0.0,0.0,0.0,0,0,0,0,0,0,0);
			PlayerInfo[playerid][pModel] = CIV[rand];
			SpawnPlayer(playerid);
		}
	}
	if(gTeam[playerid] == 10)
	{
	    if(PlayerInfo[playerid][pMember] != 8)
	    {
	        MedicBill[playerid] = 0;
	        new rand = random(sizeof(CIV));
			SendClientMessage(playerid, COLOR_LIGHTRED, "You are not a Member of this Agency, you are now a Civilian !");
			PlayerInfo[playerid][pTeam] = 3;
			gTeam[playerid] = 3;
            SetSpawnInfo(playerid, gTeam[playerid], CIV[rand],0.0,0.0,0.0,0,0,0,0,0,0,0);
			PlayerInfo[playerid][pModel] = CIV[rand];
			SpawnPlayer(playerid);
		}
	}
	if(gTeam[playerid] == 2 && PlayerInfo[playerid][pMember] > 3)
	{
	    MedicBill[playerid] = 0;
		new rand = random(sizeof(CIV));
		SendClientMessage(playerid, COLOR_LIGHTRED, "You haven't applied for being an Officer / FBI / National Guard, you are now a Civilian !");
		PlayerInfo[playerid][pTeam] = 3;
		gTeam[playerid] = 3;
		SetSpawnInfo(playerid, gTeam[playerid], CIV[rand],0.0,0.0,0.0,0,0,0,0,0,0,0);
		PlayerInfo[playerid][pModel] = CIV[rand];
		SpawnPlayer(playerid);
	}
	if(gTeam[playerid] == 3)
	{
	    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pLeader] > 0)
	    {
			SendClientMessage(playerid, COLOR_LIGHTRED, "You are part of a Family/Force, you've been forced to the right Class + Char !");
			MedicBill[playerid] = 0;
			new model = PlayerInfo[playerid][pChar];
			if(PlayerInfo[playerid][pMember] == 1) { SetSpawnInfo(playerid, 2, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 2; gTeam[playerid] = 2; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pMember] == 2) { SetSpawnInfo(playerid, 2, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 2; gTeam[playerid] = 2; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pMember] == 3) { SetSpawnInfo(playerid, 2, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 2; gTeam[playerid] = 2; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pMember] == 4) { SetSpawnInfo(playerid, 1, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 1; gTeam[playerid] = 1; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pMember] == 5) { SetSpawnInfo(playerid, 5, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 5; gTeam[playerid] = 5; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pMember] == 6) { SetSpawnInfo(playerid, 5, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 5; gTeam[playerid] = 5; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pMember] == 8) { SetSpawnInfo(playerid, 10, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 10; gTeam[playerid] = 10; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pMember] == 9) { SetSpawnInfo(playerid, 12, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 12; gTeam[playerid] = 12; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pMember] == 10) { SetSpawnInfo(playerid, 12, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 12; gTeam[playerid] = 12; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pMember] == 11) { SetSpawnInfo(playerid, 12, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 12; gTeam[playerid] = 12; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pLeader] == 1) { SetSpawnInfo(playerid, 11, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 11; gTeam[playerid] = 11; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pLeader] == 2) { SetSpawnInfo(playerid, 11, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 11; gTeam[playerid] = 11; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pLeader] == 3) { SetSpawnInfo(playerid, 11, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 11; gTeam[playerid] = 11; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pLeader] == 4) { SetSpawnInfo(playerid, 11, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 11; gTeam[playerid] = 11; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pLeader] == 5) { SetSpawnInfo(playerid, 11, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 11; gTeam[playerid] = 11; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pLeader] == 6) { SetSpawnInfo(playerid, 11, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 11; gTeam[playerid] = 11; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pLeader] == 7) { SetSpawnInfo(playerid, 11, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 11; gTeam[playerid] = 11; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pLeader] == 8) { SetSpawnInfo(playerid, 11, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 11; gTeam[playerid] = 11; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pLeader] == 9) { SetSpawnInfo(playerid, 11, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 11; gTeam[playerid] = 11; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pLeader] == 10) { SetSpawnInfo(playerid, 11, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 11; gTeam[playerid] = 11; PlayerInfo[playerid][pModel] = model; }
			else if(PlayerInfo[playerid][pLeader] == 11) { SetSpawnInfo(playerid, 11, model,0.0,0.0,0.0,0,0,0,0,0,0,0); PlayerInfo[playerid][pTeam] = 11; gTeam[playerid] = 11; PlayerInfo[playerid][pModel] = model; }
			//SetSpawnInfo(playerid, team, model,0.0,0.0,0.0,0,0,0,0,0,0,0);
			SpawnPlayer(playerid);
		}
	}
	if(PlayerInfo[playerid][pChar] > 0) { SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]); }
	else { SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]); }
	SetPlayerWeapons(playerid);
	SetPlayerSpawn(playerid);
	SetPlayerToTeamColor(playerid);
	PlayerFixRadio(playerid);
	for(new i = 0; i < sizeof(Turfs); i++)
	{
	    GangZoneShowForPlayer(playerid, i, TurfInfo[i][zColor]);
	}
	if(MapIconsShown[playerid] != 1)
	{
	    MapIconsShown[playerid] = 1;
	    for(new i = 0; i < sizeof(BizzInfo); i++)
		{
			SetPlayerMapIcon(playerid,i + 1,BizzInfo[i][bEntranceX],BizzInfo[i][bEntranceY],BizzInfo[i][bEntranceZ],36,COLOR_LIGHTRED);
		}
		for(new i = 0; i < sizeof(SBizzInfo); i++)
		{
		    SetPlayerMapIcon(playerid,i + 20,SBizzInfo[i][sbEntranceX],SBizzInfo[i][sbEntranceY],SBizzInfo[i][sbEntranceZ],36,COLOR_LIGHTRED);
		}
	}
	return 1;
}

public CKLog(string[])
{
	new entry[256];
	format(entry, sizeof(entry), "%s\n",string);
	new File:hFile;
	hFile = fopen("ck.log", io_append);
	fwrite(hFile, entry);
	fclose(hFile);
}

public PayLog(string[])
{
	new entry[256];
	format(entry, sizeof(entry), "%s\n",string);
	new File:hFile;
	hFile = fopen("pay.log", io_append);
	fwrite(hFile, entry);
	fclose(hFile);
}

public KickLog(string[])
{
	new entry[256];
	format(entry, sizeof(entry), "%s\n",string);
	new File:hFile;
	hFile = fopen("kick.log", io_append);
	fwrite(hFile, entry);
	fclose(hFile);
}

public BanLog(string[])
{
	new entry[256];
	format(entry, sizeof(entry), "%s\n",string);
	new File:hFile;
	hFile = fopen("ban.log", io_append);
	fwrite(hFile, entry);
	fclose(hFile);
}

public OnPlayerEnterCheckpoint(playerid)
{
	new string[128];
	new name[MAX_PLAYER_NAME];
	if(TaxiCallTime[playerid] > 0 && TaxiAccepted[playerid] < 999)
	{
	    TaxiAccepted[playerid] = 999;
		GameTextForPlayer(playerid, "~w~Reached destination", 5000, 1);
		TaxiCallTime[playerid] = 0;
		DisablePlayerCheckpoint(playerid);
	}
	else if(BusCallTime[playerid] > 0 && BusAccepted[playerid] < 999)
	{
	    BusAccepted[playerid] = 999;
		GameTextForPlayer(playerid, "~w~Reached destination", 5000, 1);
		BusCallTime[playerid] = 0;
		DisablePlayerCheckpoint(playerid);
	}
	else if(CP[playerid]==1)
	{
	    if(IsPlayerInAnyVehicle(playerid))
	    {
		    PlayerInfo[playerid][pJackSkill] ++;
			if(PlayerInfo[playerid][pJackSkill] == 50)
			{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Car Jack Skill is now Level 2, you will earn more Money and quicker Reload Time."); }
			else if(PlayerInfo[playerid][pJackSkill] == 100)
			{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Car Jack Skill is now Level 3, you will earn more Money and quicker Reload Time."); }
			else if(PlayerInfo[playerid][pJackSkill] == 200)
			{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Car Jack Skill is now Level 4, you will earn more Money and quicker Reload Time."); }
			else if(PlayerInfo[playerid][pJackSkill] == 400)
			{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Car Jack Skill is now Level 5, you will earn more Money and quicker Reload Time."); }
			new level = PlayerInfo[playerid][pJackSkill];
			if(level >= 0 && level <= 50)
			{
			    new rand = random(sizeof(SELLCAR1));
			    format(string, sizeof(string), "You sold a car for $%d, your reload time is 20 minutes.", SELLCAR1[rand]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				GivePlayerMoney(playerid, SELLCAR1[rand]);
			    PlayerInfo[playerid][pCarTime] = 1200;
			}
			else if(level >= 51 && level <= 100)
			{
			    new rand = random(sizeof(SELLCAR2));
			    format(string, sizeof(string), "You sold a car for $%d, your reload time is 18 minutes.", SELLCAR2[rand]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				GivePlayerMoney(playerid, SELLCAR2[rand]);
			    PlayerInfo[playerid][pCarTime] = 1080;
			}
			else if(level >= 101 && level <= 200)
			{
			    new rand = random(sizeof(SELLCAR3));
			    format(string, sizeof(string), "You sold a car for $%d, your reload time is 16 minutes.", SELLCAR3[rand]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				GivePlayerMoney(playerid, SELLCAR3[rand]);
			    PlayerInfo[playerid][pCarTime] = 960;
			}
			else if(level >= 201 && level <= 400)
			{
			    new rand = random(sizeof(SELLCAR4));
			    format(string, sizeof(string), "You sold a car for $%d, your reload time is 14 minutes.", SELLCAR4[rand]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				GivePlayerMoney(playerid, SELLCAR4[rand]);
			    PlayerInfo[playerid][pCarTime] = 840;
			}
			else if(level >= 401)
			{
			    new money = 6000;
			    format(string, sizeof(string), "You sold a car for $%d, your reload time is 12 minutes.", money);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				GivePlayerMoney(playerid, money);
			    PlayerInfo[playerid][pCarTime] = 720;
			}
			GameTextForPlayer(playerid, "~y~Sold the car", 2500, 1);
			CP[playerid] = 0;
		    DisablePlayerCheckpoint(playerid);
		    SetVehicleToRespawn(GetPlayerVehicleID(playerid));
		}
		else
		{
		    GameTextForPlayer(playerid, "Not in a car", 5000, 1);
		}
	}
	else if(CP[playerid] == 5)
	{
	    GameTextForPlayer(playerid, "~y~At the Missions Checkpoint", 2500, 1);
		CP[playerid] = 0;
	    DisablePlayerCheckpoint(playerid);
	}
	else if(CP[playerid] == 9)//Karting
	{
		GameTextForPlayer(playerid, "~r~Wait here for more Kart Racers", 4000, 3);
		DisablePlayerCheckpoint(playerid);
	}
	else if(CP[playerid] == 10) { CP[playerid] = 11; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2258.7874,-2402.9712,12.7035,8.0); }
	else if(CP[playerid] == 11) { CP[playerid] = 12; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2225.8755,-2461.3875,12.7190,8.0); }
	else if(CP[playerid] == 12) { CP[playerid] = 13; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2276.9983,-2662.8328,12.8580,8.0); }
	else if(CP[playerid] == 13) { CP[playerid] = 14; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2449.1399,-2663.0562,12.8138,8.0); }
	else if(CP[playerid] == 14) { CP[playerid] = 15; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2566.9814,-2504.5686,12.7692,8.0); }
	else if(CP[playerid] == 15) { CP[playerid] = 16; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2719.0520,-2503.5962,12.7706,8.0); }
	else if(CP[playerid] == 16) { CP[playerid] = 17; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2720.7881,-2405.6589,12.7441,8.0); }
	else if(CP[playerid] == 17) { CP[playerid] = 18; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2571.5195,-2401.1531,12.7528,8.0); }
	else if(CP[playerid] == 18) { CP[playerid] = 19; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2406.6995,-2423.1182,12.6641,8.0); }
	else if(CP[playerid] == 19) { CP[playerid] = 20; DisablePlayerCheckpoint(playerid); SetPlayerCheckpoint(playerid,2322.9194,-2341.5715,12.6664,8.0); }
	else if(CP[playerid] == 20)//End of Karting
	{
	    CP[playerid] = 0;
	    DisablePlayerCheckpoint(playerid);
	    GetPlayerName(playerid, name, sizeof(name));
	    if(FirstKartWinner == 999)
	    {
	        FirstKartWinner = playerid;
	        for(new i = 0; i < MAX_PLAYERS; i++)
	        {
	            if(IsPlayerConnected(i))
	            {
		            if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
		            {
		                format(string, sizeof(string), "* %s finished First in the Kart Race.",name);
		                SendClientMessage(i, COLOR_WHITE, string);
		            }
				}
			}
	    }
	    else if(SecondKartWinner == 999)
	    {
	        SecondKartWinner = playerid;
	        for(new i = 0; i < MAX_PLAYERS; i++)
	        {
	            if(IsPlayerConnected(i))
	            {
		            if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
		            {
		                format(string, sizeof(string), "* %s finished Second in the Kart Race.",name);
		                SendClientMessage(i, COLOR_WHITE, string);
		            }
				}
			}
	    }
	    else if(ThirdKartWinner == 999)
	    {
	        ThirdKartWinner = playerid;
	        for(new i = 0; i < MAX_PLAYERS; i++)
	        {
	            if(IsPlayerConnected(i))
	            {
		            if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
		            {
		                format(string, sizeof(string), "* %s finished Third in the Kart Race.",name);
		                SendClientMessage(i, COLOR_WHITE, string);
		                SendClientMessage(i, COLOR_WHITE, "** Karting Race Over **");
		                CP[i] = 0;
		                DisablePlayerCheckpoint(i);
		            }
				}
	        }
	    }
	}
	else if(MissionCheckpoint[playerid] > 0 && PlayMission[kToggle] == 1)//Missions + Checkpoint on toggle
	{
        	RingTone[playerid] = 20;
		    switch(MissionCheckpoint[playerid])
		    {
	        	case 1:
		        {
					format(string, sizeof(string), "%s", PlayMission[kGText1]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText4]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText5]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText6]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP2][0], PlayMission[kCP2][1], PlayMission[kCP2][2], 8);
					MissionCheckpoint[playerid] = 2;
		        }
		        case 2:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText2]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText7]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText8]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText9]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP3][0], PlayMission[kCP3][1], PlayMission[kCP3][2], 8);
					MissionCheckpoint[playerid] = 3;
		        }
		        case 3:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText3]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText10]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText11]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText12]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP4][0], PlayMission[kCP4][1], PlayMission[kCP4][2], 8);
					MissionCheckpoint[playerid] = 4;
		        }
		        case 4:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText4]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText13]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText14]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText15]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP5][0], PlayMission[kCP5][1], PlayMission[kCP5][2], 8);
					MissionCheckpoint[playerid] = 5;
		        }
		        case 5:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText5]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText16]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText17]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText18]);
					SendClientMessage(playerid, COLOR_YELLOW2, string);
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, PlayMission[kCP6][0], PlayMission[kCP6][1], PlayMission[kCP6][2], 8);
					MissionCheckpoint[playerid] = 6;
		        }
		        case 6:
		        {
		            format(string, sizeof(string), "%s", PlayMission[kGText6]);
					GameTextForPlayer(playerid, string, 8000, 3);
					format(string, sizeof(string), "..:: Mission Passed : %s | Reward received: $%d ::..", PlayMission[kTitle], PlayMission[kReward]);
					SendClientMessage(playerid, COLOR_GREEN, string);
					DisablePlayerCheckpoint(playerid);
					GivePlayerMoney(playerid, PlayMission[kReward]);
					PlayerInfo[playerid][pMissionNr] = PlayerOnMission[playerid];
					MissionCheckpoint[playerid] = 0;
					PlayerOnMission[playerid] = 0;
		        }
		    }
	}
	else
	{
		switch (gPlayerCheckpointStatus[playerid])
		{
			case CHECKPOINT_HOME:
		    {
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				DisablePlayerCheckpoint(playerid);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_NONE;
				GameTextForPlayer(playerid, "~w~You are~n~~y~Home", 5000, 1);
		    }
		}
	}
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public SetAllPlayerCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi, num)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			SetPlayerCheckpoint(i,allx,ally,allz, radi);
			if (num != 255)
			{
				gPlayerCheckpointStatus[i] = num;
			}
		}
	}

}

public SetAllCopCheckpoint(Float:allx, Float:ally, Float:allz, Float:radi)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(gTeam[i] == 2)
			{
				SetPlayerCheckpoint(i,allx,ally,allz, radi);
			}
		}
	}
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	new string[256];
	if(newstate == PLAYER_STATE_ONFOOT)
	{
	    if(PlayerKarting[playerid] > 0 && PlayerInKart[playerid] > 0)
		{
		    PlayerInKart[playerid] = 0;
		    KartingPlayers --;
		}
	    if(TransportDuty[playerid] > 0)
		{
		    if(TransportDuty[playerid] == 1)
			{
		        TaxiDrivers -= 1;
			}
			else if(TransportDuty[playerid] == 2)
			{
			    BusDrivers -= 1;
			}
			TransportDuty[playerid] = 0;
			format(string, sizeof(string), "* You are now Off Duty and earned $%d.", TransportMoney[playerid]);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			GivePlayerMoney(playerid, TransportMoney[playerid]);
			ConsumingMoney[playerid] = 1; TransportValue[playerid] = 0; TransportMoney[playerid] = 0;
		}
		if(TransportCost[playerid] > 0 && TransportDriver[playerid] < 999)
		{
		    if(IsPlayerConnected(TransportDriver[playerid]))
			{
			    TransportMoney[TransportDriver[playerid]] += TransportCost[playerid];
			    TransportTime[TransportDriver[playerid]] = 0;
			    TransportCost[TransportDriver[playerid]] = 0;
			    format(string, sizeof(string), "~w~The ride cost~n~~r~$%d",TransportCost[playerid]);
			    GameTextForPlayer(playerid, string, 5000, 1);
			    format(string, sizeof(string), "~w~Passenger left the taxi~n~~g~Earned $%d",TransportCost[playerid]);
			    GameTextForPlayer(TransportDriver[playerid], string, 5000, 1);
				GivePlayerMoney(playerid, -TransportCost[playerid]);
				TransportCost[playerid] = 0;
				TransportTime[playerid] = 0;
				TransportDriver[playerid] = 999;
			}
		}
		TelePos[playerid][0] = 0.0;
		TelePos[playerid][1] = 0.0;
	}
	if(newstate == PLAYER_STATE_PASSENGER) // TAXI & BUSSES
	{
	    new name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, name, sizeof(name));
	    new vehicleid = GetPlayerVehicleID(playerid);
	    for(new i = 0; i < MAX_PLAYERS; i++)
	    {
	        if(IsPlayerConnected(i))
	        {
	            if(IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == 2 && TransportDuty[i] > 0)
	            {
	                if(GetPlayerMoney(playerid) < TransportValue[i])
	                {
	                    format(string, sizeof(string), "* You need $%d to enter.", TransportValue[i]);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						RemovePlayerFromVehicle(playerid);
	                }
	                else
	                {
	                    if(TransportDuty[i] == 1)
	                    {
	                        format(string, sizeof(string), "* You paid $%d to the Taxi Driver.", TransportValue[i]);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* Passenger %s has entered your Taxi.", name);
							SendClientMessage(i, COLOR_LIGHTBLUE, string);
							TransportTime[i] = 1;
	                    	TransportTime[playerid] = 1;
	                    	TransportCost[playerid] = TransportValue[i];
	                    	TransportCost[i] = TransportValue[i];
	                    	TransportDriver[playerid] = i;
	                    }
	                    else if(TransportDuty[i] == 2)
	                    {
	                        format(string, sizeof(string), "* You paid $%d to the Bus Driver.", TransportValue[i]);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* Passenger %s has entered your Bus.", name);
							SendClientMessage(i, COLOR_LIGHTBLUE, string);
	                    }
						GivePlayerMoney(playerid, - TransportValue[i]);
						TransportMoney[i] += TransportValue[i];
	                }
	            }
	        }
	    }
	}
	if(newstate == PLAYER_STATE_WASTED)
	{
		if(WantedLevel[playerid] >= 1)
		{
		    new price = WantedLevel[playerid] * 4000;
			new count;
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
				    if(gTeam[i] == 2 && CrimInRange(30.0, playerid,i))
				    {
						count = 1;
						format(string, sizeof(string), "~w~Running Suspect~r~Killed~n~Bonus~g~$%d", price);
						GameTextForPlayer(i, string, 5000, 1);
						ConsumingMoney[i] = 1;
						GivePlayerMoney(i, price / 2);
						PlayerPlaySound(i, 1058, 0.0, 0.0, 0.0);
					}
				}
			}
			if(count == 1)
			{
				GivePlayerMoney(playerid, - price);
				PlayerInfo[playerid][pWantedDeaths] += 1;
				PlayerInfo[playerid][pJailed] = 1;
			    PlayerInfo[playerid][pJailTime] = (WantedLevel[playerid])*(600);
			    format(string, sizeof(string), "* You are in Jail for %d Seconds and lose $%d because of running away and getting shot by the Officer.", PlayerInfo[playerid][pJailTime], price);
			    SendClientMessage(playerid, COLOR_LIGHTRED, string);
			    WantedPoints[playerid] = 0;
				WantedLevel[playerid] = 0;
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER) //buggy dont finnish
	{// 38 / 49 / 56 = SS
		new newcar = GetPlayerVehicleID(playerid);
		new oldcar = gLastCar[playerid];
		new housecar = PlayerInfo[playerid][pPhousekey]+1;
		TelePos[playerid][0] = 0.0;
		TelePos[playerid][1] = 0.0;
		if(IsABoat(newcar))
		{
		    if(PlayerInfo[playerid][pBoatLic] < 1)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You don't know how to Sail yet, so you left the Boat !");
			    RemovePlayerFromVehicle(playerid);
			}
		}
		else if(IsAPlane(newcar))
		{
		    if(PlayerInfo[playerid][pFlyLic] < 1)
			{
			    if(TakingLesson[playerid] == 1) { }
			    else {
			    SendClientMessage(playerid, COLOR_GREY, "   You don't know how to Fly yet, so you left the Plane !");
			    RemovePlayerFromVehicle(playerid); }
			}
		}
		else
		{
			if(PlayerInfo[playerid][pCarLic] < 1)
			{
			    if(PlayerDrunk[playerid] >= 5)
				{
				    WantedPoints[playerid] += 1;
					SetPlayerCriminal(playerid,255, "Drunk Driving");
				}
				if(TakingLesson[playerid] == 1) { }
				else {
				SendClientMessage(playerid, COLOR_GREY, "   You don't know how to Drive yet, so you left the Car !");
                RemovePlayerFromVehicle(playerid); }
			}
			else if(PlayerDrunk[playerid] >= 5)
			{
			    WantedPoints[playerid] += 1;
				SetPlayerCriminal(playerid,255, "Drunk Driving");
			}
		}//Done with car check
		if(IsACopCar(newcar))
		{
		    if(IsACop(playerid)) { }
		    else { RemovePlayerFromVehicle(playerid); }
		}
		else if(IsAnAmbulance(newcar))
		{
		    if(PlayerInfo[playerid][pMember] == 4||PlayerInfo[playerid][pLeader] == 4) { }
		    else { RemovePlayerFromVehicle(playerid); }
		}
		if(IsATruck(newcar))
		{
			format(string, sizeof(string), "Products: %d/%d", PlayerHaul[newcar][pLoad],PlayerHaul[newcar][pCapasity]);
			SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
			SendClientMessage(playerid, COLOR_WHITE, "INFO: You can deliver Products to Businesses.");
			SendClientMessage(playerid, COLOR_WHITE, "INFO: Commands are /load /buyprods /sellprods");
		}
		if(PlayerKarting[playerid] != 0)
		{
		    new kart = GetPlayerVehicleID(playerid);
		    if(kart==110||kart==111||kart==112||kart==113||kart==114||kart==115)
		    {
		        PlayerInKart[playerid] = 1;
		    	KartingPlayers ++;
			}
		}
		if(newcar == 39 || newcar == 40)
		{
		    if(PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLeader] == 3)//national guard
		    {
		        if(PlayerInfo[playerid][pRank] < 3)
		        {
			        SendClientMessage(playerid,COLOR_GREY,"   You need Rank 3 to Fly this baby !");
			        RemovePlayerFromVehicle(playerid);
		        }
		    }
		    else
		    {
		        RemovePlayerFromVehicle(playerid);
		    }
		}
		if(newcar == 55 || newcar == 59)
		{
		    if(PlayerInfo[playerid][pMember] != 4)
		    {
		        SendClientMessage(playerid,COLOR_GREY,"   You are not a Fireman !");
		        RemovePlayerFromVehicle(playerid);
		    }
		}
		if(newcar == 64 || newcar == 65)
		{
		    if(PlayerInfo[playerid][pJob] != 14)
		    {
		        SendClientMessage(playerid,COLOR_GREY,"   You are not a Bus Driver !");
		        RemovePlayerFromVehicle(playerid);
		    }
		}
		if(newcar == 69 || newcar == 70 || newcar == 71 || newcar == 99 || newcar == 100 || newcar == 101)
		{
		    if(TakingLesson[playerid] == 1) { }
		    else if(!IsAnInstructor(playerid))
		    {
		        SendClientMessage(playerid,COLOR_GREY,"   You are not a School Instructor !");
		        RemovePlayerFromVehicle(playerid);
		    }
		}
		if(newcar == 82 || newcar == 84 || newcar == 85 || newcar == 94)
		{
		    if(PlayerInfo[playerid][pMember] == 10||PlayerInfo[playerid][pLeader] == 10) { }
		    else
			{
		        SendClientMessage(playerid,COLOR_GREY,"   You are not a Taxi Driver !");
		        RemovePlayerFromVehicle(playerid);
		    }
		}
		if(newcar == 95)
		{
		    if(PlayerInfo[playerid][pMember] == 8 || PlayerInfo[playerid][pLeader] == 8)
		    {
		        if(PlayerInfo[playerid][pRank] < 3)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   Your Rank is to Low !");
				    RemovePlayerFromVehicle(playerid);
			    }
		    }
		    else
		    {
		        SendClientMessage(playerid, COLOR_GREY, "   You are not a Hitman !");
			    RemovePlayerFromVehicle(playerid);
		    }
		}
		if(newcar == 96 || newcar == 97 || newcar == 98)
		{
			if(PlayerInfo[playerid][pMember] == 9 || PlayerInfo[playerid][pLeader] == 9){ }
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not a News Reporter !");
			    RemovePlayerFromVehicle(playerid);
			}
			if(PlayerInfo[playerid][pNewsSkill] < 200 && newcar == 96)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   Your News Reporter Skill is to low, cant fly the Chopper yet !");
			    RemovePlayerFromVehicle(playerid);
			}
		}
		if(newcar==110||newcar==111||newcar==112||newcar==113||newcar==114||newcar==115)
		{
		    if(PlayerKarting[playerid] != 1)
		    {
		        RemovePlayerFromVehicle(playerid);
		    }
		}
		if(newcar >= 72 && newcar <= 74)
		{
			if (HireCar[playerid] != newcar)
			{
				format(string, sizeof(string), "~w~You can Rent this car~n~Cost:~g~$%d~n~~w~To rent type ~g~/rentcar~w~~n~to get out type ~r~/exit",SBizzInfo[0][sbEntranceCost]);
				TogglePlayerControllable(playerid, 0);
				GameTextForPlayer(playerid, string, 5000, 3);
			}
		}
		if(newcar >= 75 && newcar <= 77)
		{
			if (HireCar[playerid] != newcar)
			{
				format(string, sizeof(string), "~w~You can Rent this car~n~Cost:~g~$%d~n~~w~To rent type ~g~/rentcar~w~~n~to get out type ~r~/exit",SBizzInfo[1][sbEntranceCost]);
				TogglePlayerControllable(playerid, 0);
				GameTextForPlayer(playerid, string, 5000, 3);
			}
		}
		if(oldcar != 301)
		{
			if((housecar != oldcar && oldcar != 0) && (HireCar[playerid] != oldcar && newcar != housecar))
			{
				if(gLastDriver[oldcar] == playerid && oldcar != newcar)
				{
					gLastDriver[oldcar] = 300;
					gCarLock[oldcar] = 0;
					UnLockCar(oldcar);
				}
			}
		}
		gLastCar[playerid] = newcar;
		gLastDriver[newcar] = playerid;
	}
	if(newstate == PLAYER_STATE_SPAWNED)
	{
		new Float: lwx, Float:lwy, Float:lwz;
		GetPlayerPos(playerid, lwx, lwy, lwz);
		if((lwz > 530.0 && PlayerInfo[playerid][pInt] == 0) || PlayerToPoint(1000.0, playerid, -1041.9,-1868.4,79.1)) //the highest land point in sa = 526.8
		{
			SetPlayerSpawn(playerid);
		}
		if(WantedPoints[playerid] > 0)
		{
		    new dstring[128];
			new wanted = WantedPoints[playerid];
			new diecash = 0;
		    while(WantedPoints[playerid] > 0)
		    {
		        diecash += 500;
		        WantedPoints[playerid] --;
		    }
		    format(dstring, sizeof(dstring), "You lost $%d for dieing with %d Wanted Points.", diecash, wanted);
		    SendClientMessage(playerid, COLOR_YELLOW, dstring);
		    GivePlayerMoney(playerid, - diecash);
		    PlayerInfo[playerid][pWantedDeaths] += 1;
		}
		if(PlayerOnMission[playerid] > 0)
		{
			GameTextForPlayer(playerid, "~r~Mission failed", 5000, 3);
			PlayerOnMission[playerid] = 0;
		    PlayerInfo[playerid][pMissionNr] = 0;
		}
		WantedPoints[playerid] = 0;
		WantedLevel[playerid] = 0;
		if(PlayerInfo[playerid][pDonateRank] > 0) { SetPlayerHealth(playerid, 100.0); }
		else { SetPlayerHealth(playerid, 50.0+PlayerInfo[playerid][pSHealth]); }
		MedicBill[playerid] = 1;
		TelePos[playerid][0] = 0.0;
		TelePos[playerid][1] = 0.0;
		gPlayerSpawned[playerid] = 1;
		SafeTime[playerid] = 60;
	}
	return 1;
}

public HireCost(carid)
{
	switch (carid)
	{
		case 69:
		{
			return 90000; //bullit
		}
		case 70:
		{
			return 130000; //infurnus
		}
		case 71:
		{
			return 100000; //turismo
		}
		case 72:
		{
			return 80000;
		}
		case 73:
		{
			return 70000;
		}
		case 74:
		{
			return 60000;
		}
	}
	return 0;
}

public CarCheck()
{
	new string[256];
	for(new j = 0; j<MAX_PLAYERS; j++)
	{
	    if(IsPlayerConnected(j))
	    {
	        SetVehicleParamsForPlayer(99, j, 0, 0);
	        SetVehicleParamsForPlayer(100, j, 0, 0);
	        SetVehicleParamsForPlayer(101, j, 0, 0);
	        SetVehicleParamsForPlayer(102, j, 0, 0);
	        SetVehicleParamsForPlayer(103, j, 0, 0);
	        SetVehicleParamsForPlayer(104, j, 0, 0);
	        SetVehicleParamsForPlayer(105, j, 0, 0);
	        SetVehicleParamsForPlayer(106, j, 0, 0);
	        SetVehicleParamsForPlayer(107, j, 0, 0);
	        SetVehicleParamsForPlayer(108, j, 0, 0);
	        SetVehicleParamsForPlayer(109, j, 0, 0);
		    new Float:health;
		    GetPlayerHealth(j, health);
			SetPlayerHealth(j, health - 1.0);
			if(STDPlayer[j]==1)
			{
			    GetPlayerHealth(j, health);
			    SetPlayerHealth(j, health - 5.0);
			    SendClientMessage(j, COLOR_LIGHTBLUE, "* Lost 4 health due to STD.");
			}
			else if(STDPlayer[j]==2)
			{
			    GetPlayerHealth(j, health);
			    SetPlayerHealth(j, health - 12.0);
			    SendClientMessage(j, COLOR_LIGHTBLUE, "* Lost 8 health due to STD.");
			}
			else if(STDPlayer[j]==3)
			{
			    GetPlayerHealth(j, health);
			    SetPlayerHealth(j, health - 20.0);
			    SendClientMessage(j, COLOR_LIGHTBLUE, "* Lost 12 health due to STD.");
			}

			if(GetPlayerMoney(j) < 0)
			{
			    if(MoneyMessage[j]==0)
			    {
				    format(string, sizeof(string), "You are in debt, you have till next Time Check to get: $%d or you go to jail.", GetPlayerMoney(j));
					SendClientMessage(j, COLOR_LIGHTRED, string);
					MoneyMessage[j] = 1;
				}
			}
			else
			{
			    MoneyMessage[j] = 0;
			}
		}
	}
	for(new c = 1; c < 254; c++)
	{
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if (PlayerInfo[i][pJob] == 5)
				{
					SetVehicleParamsForPlayer(c, i, 0, 0);
				}
			}
		}
		if (gLastDriver[c] == 301)
		{
			CarRespawn(c);
		}
		if (gLastDriver[c] >= 300)
		{
			gLastDriver[c]++;
		}
		//foundowner = -1;
	}
	return 1;
}

public CarInit()
{
	for(new c = 1; c < 254; c++)
	{
 		gLastDriver[c] = 299;
	}
	gLastDriver[301]=255;
	return 1;
}

public CarTow(carid)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInVehicle(i, carid) || HireCar[i] == carid)
			{
				gLastDriver[carid] = 255;
				return 0;
			}
		}
	}
	SetVehiclePos(carid,HouseCarSpawns[carid-1][0], HouseCarSpawns[carid-1][1], HouseCarSpawns[carid-1][2]);
	SetVehicleZAngle(carid, HouseCarSpawns[carid-1][3]);
	return 1;
}

public CarRespawn(carid)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInVehicle(i, carid) || HireCar[i] == carid)
			{
				gLastDriver[carid] = 255;
				return 0;
			}
		}
	}
	SetVehicleToRespawn(carid);
	gLastDriver[carid] = 299;
	return 1;
}

public LockCar(carid)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			SetVehicleParamsForPlayer(carid,i,0,1);
		}
	}
}

public UnLockCar(carid)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(!IsAPlane(carid))
			{
				SetVehicleParamsForPlayer(carid,i,0,0);
			}
		}
	}
}

public InitLockDoors(playerid)
{
    if(IsPlayerConnected(playerid))
	{
		new c;
		while (c < 254)
		{
			c++;
			if (gCarLock[c] == 1)
			{
				SetVehicleParamsForPlayer(c,playerid,0,1);
			}
		}
	}
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	if (GetPlayerState(playerid) == 1)
	{
		return 1;
	}
	if(gGas[playerid] == 1)
	{
	    GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~Left car", 500, 3);
	}
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	new string[128];
	PlayerPlaySound(playerid, 1187, 0.0, 0.0, 0.0);
	PlayerInfo[playerid][pModel] = Peds[classid][0];
 	if (classid == 1)
	{
			format(string, sizeof(string), "~y~> ~p~Police Chief ~y~< ~n~Leaders only!");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid == 2)
	{
			format(string, sizeof(string), "~y~> ~p~FBI/ATF Leader ~y~< ~n~Leaders only!");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid == 3)
	{
			format(string, sizeof(string), "~y~> ~p~National Guard General ~y~< ~n~Leaders only!");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid == 4)
	{
			format(string, sizeof(string), "~y~> ~p~Fire/Ambulance Chief ~y~< ~n~Leaders only!");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid == 5)
	{
			format(string, sizeof(string), "~y~> ~p~La Cosa Nostra Leader ~y~< ~n~Leaders only!");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid == 6)
	{
			format(string, sizeof(string), "~y~> ~p~Yakuza Leader ~y~< ~n~Leaders only!");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid == 7)
	{
			format(string, sizeof(string), "~y~> ~p~Mayor ~y~< ~n~Leaders only!");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid == 8)
	{
			format(string, sizeof(string), "~y~> ~p~Hitman Leader ~y~< ~n~Leaders only!");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid == 9)
	{
			format(string, sizeof(string), "~y~> ~p~News Leader ~y~< ~n~Leaders only!");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid == 10)
	{
			format(string, sizeof(string), "~y~> ~p~Taxi Cab Company Leader ~y~< ~n~Leaders only!");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else if (classid == 11)
	{
			format(string, sizeof(string), "~y~> ~p~License Faction Leader ~y~< ~n~Leaders only!");
			GameTextForPlayer(playerid,string,3500,6);
	}
	else
	{
		format(string, sizeof(string), "~y~> ~g~Civilian ~y~<");
		GameTextForPlayer(playerid,string,3500,6);
	}
	SetPlayerTeamFromClass(playerid,classid);
	SetupPlayerForClassSelection(playerid);
	return 1;
}

public SetupPlayerForClassSelection(playerid)
{
	switch (gTeam[playerid])
	{
		case TEAM_BLUE:
		{
			SetPlayerInterior(playerid,5);
			SetPlayerPos(playerid,323.4,305.6,999.1);
			SetPlayerFacingAngle(playerid, 90.0);
			SetPlayerCameraPos(playerid,323.4-1.5-1.0,305.6,999.1+0.7);
			SetPlayerCameraLookAt(playerid,323.4-1.0,305.6,999.1+0.7);

		}
		case TEAM_ADMIN:
		{
		    SetPlayerInterior(playerid,3);
			SetPlayerPos(playerid,-2654.4,1424.2,912.4);
			SetPlayerFacingAngle(playerid, 90.0);
			SetPlayerCameraPos(playerid,-2654.4-1.5,1424.2,912.4+0.7);
			SetPlayerCameraLookAt(playerid,-2654.4,1424.2,912.4+0.7);
		}
		default:
		{
		    SetPlayerInterior(playerid,0);
			SetPlayerPos(playerid,-1657.5237,1207.6644,13.6719);
			SetPlayerFacingAngle(playerid,357.6906);
		    SetPlayerCameraPos(playerid, -1657.4678,1211.2292,13.6781);
		    SetPlayerCameraLookAt(playerid,-1657.5237,1207.6644,13.6719);
		}
	}
}

//---------------------------------------------------------

public SetPlayerTeamFromClass(playerid,classid)
{
 	if (classid >= 1 && classid <= 11)
	{
		gTeam[playerid] = 11; //admin
		PlayerInfo[playerid][pTeam] = 11;
	}
	else
	{
	    gTeam[playerid] = 3;
	    PlayerInfo[playerid][pTeam] = 3;
	}
}

//---------------------------------------------------------

public SetPlayerCriminal(playerid,declare,reason[])
{//example: SetPlayerCriminal(playerid,255, "Stealing A Police Vehicle");
	if(IsPlayerConnected(playerid))
	{
	    PlayerInfo[playerid][pCrimes] += 1;
	    new points = WantedPoints[playerid];
		new turned[MAX_PLAYER_NAME];
		new turner[MAX_PLAYER_NAME];
		new turnmes[128];
		new wantedmes[128];
		new wlevel;
		strmid(PlayerCrime[playerid][pAccusedof], reason, 0, strlen(reason), 255);
		GetPlayerName(playerid, turned, sizeof(turned));
		if (declare == 255)
		{
			format(turner, sizeof(turner), "Unknown");
			strmid(PlayerCrime[playerid][pVictim], turner, 0, strlen(turner), 255);
		}
		else
		{
		    if(IsPlayerConnected(declare))
		    {
				GetPlayerName(declare, turner, sizeof(turner));
				strmid(PlayerCrime[playerid][pVictim], turner, 0, strlen(turner), 255);
				strmid(PlayerCrime[declare][pBplayer], turned, 0, strlen(turned), 255);
				strmid(PlayerCrime[declare][pAccusing], reason, 0, strlen(reason), 255);
			}
		}
		format(turnmes, sizeof(turnmes), "You've commited a Crime ( %s ). Reporter: %s.",reason,turner);
		SendClientMessage(playerid, COLOR_LIGHTRED, turnmes);
		if(points > 0)
		{
		    new yesno;
			if(points == 3) { if(WantedLevel[playerid] != 1) { WantedLevel[playerid] = 1; wlevel = 1; yesno = 1; } }
			else if(points >= 4 && points <= 5) { if(WantedLevel[playerid] != 2) { WantedLevel[playerid] = 2; wlevel = 2; yesno = 1; } }
			else if(points >= 6 && points <= 7) { if(WantedLevel[playerid] != 3) { WantedLevel[playerid] = 3; wlevel = 3; yesno = 1; } }
			else if(points >= 8 && points <= 9) { if(WantedLevel[playerid] != 4) { WantedLevel[playerid] = 4; wlevel = 4; yesno = 1; } }
			else if(points >= 10 && points <= 11) { if(WantedLevel[playerid] != 5) { WantedLevel[playerid] = 5; wlevel = 5; yesno = 1; } }
			else if(points >= 12 && points <= 13) { if(WantedLevel[playerid] != 6) { WantedLevel[playerid] = 6; wlevel = 6; yesno = 1; } }
			else if(points >= 14) { if(WantedLevel[playerid] != 10) { WantedLevel[playerid] = 10; wlevel = 10; yesno = 1; } }
			if(WantedLevel[playerid] >= 1) { if(gTeam[playerid] == 3) { gTeam[playerid] = 4; } }
			if(yesno)
			{
				format(wantedmes, sizeof(wantedmes), "Current Wanted Level: %d", wlevel);
				SendClientMessage(playerid, COLOR_YELLOW, wantedmes);
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
					    if(PlayerInfo[i][pMember] == 1||PlayerInfo[i][pLeader] == 1)
					    {
							format(cbjstore, sizeof(turnmes), "HQ: All Units APB: Reporter: %s",turner);
							SendClientMessage(i, TEAM_BLUE_COLOR, cbjstore);
							format(cbjstore, sizeof(turnmes), "HQ: Crime: %s, Suspect: %s",reason,turned);
							SendClientMessage(i, TEAM_BLUE_COLOR, cbjstore);
						}
					}
				}
			}
		}
	}//not connected
}
//---------------------------------------------------------

public SetPlayerFree(playerid,declare,reason[])
{
	if(IsPlayerConnected(playerid))
	{
		ClearCrime(playerid);
		new turned[MAX_PLAYER_NAME];
		new turner[MAX_PLAYER_NAME];
		new turnmes[128];
		new crbjstore[128];
		if (declare == 255)
		{
			format(turner, sizeof(turner), "911");
		}
		else
		{
		    if(IsPlayerConnected(declare))
		    {
				GetPlayerName(declare, turner, sizeof(turner));
			}
		}
		GetPlayerName(playerid, turned, sizeof(turned));
		format(turnmes, sizeof(turnmes), "SMS: %s, Because you %s, you are no longer a Criminal, Sender: MOLE (555)",turned,reason);
		RingTone[playerid] = 20;
		SendClientMessage(playerid, COLOR_YELLOW, turnmes);
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
			    if(PlayerInfo[i][pMember] == 1||PlayerInfo[i][pLeader] == 1)
			    {
					format(crbjstore, sizeof(crbjstore), "HQ: All Units Officer %s Has Completed Assignment",turner);
					SendClientMessage(i, COLOR_DBLUE, crbjstore);
					format(crbjstore, sizeof(crbjstore), "HQ: %s Has Been Processed, %s",turned,reason);
					SendClientMessage(i, COLOR_DBLUE, crbjstore);
				}
			}
		}
	}
}

public RingToner()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
			if(RingTone[i] != 6 && RingTone[i] != 0 && RingTone[i] < 11)
			{
				RingTone[i] = RingTone[i] -1;
				PlayerPlaySound(i, 1138, 0.0, 0.0, 0.0);
			}
			if(RingTone[i] == 6)
			{
				RingTone[i] = RingTone[i] -1;
			}
			if(RingTone[i] == 20)
			{
				RingTone[i] = RingTone[i] -1;
				PlayerPlaySound(i, 1139, 0.0, 0.0, 0.0);
			}
		}
	}
	SetTimer("RingTonerRev", 1000, 0);
	return 1;
}

public RingTonerRev()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
			if(RingTone[i] != 5 && RingTone[i] != 0 && RingTone[i] < 10)
			{
				RingTone[i] = RingTone[i] -1;
				PlayerPlaySound(i, 1137, 0.0, 0.0, 0.0);
			}
			if(RingTone[i] == 5)
			{
				RingTone[i] = RingTone[i] -1;
			}
			if(RingTone[i] == 19)
			{
				PlayerPlaySound(i, 1139, 0.0, 0.0, 0.0);
				RingTone[i] = 0;
			}
		}
	}
	SetTimer("RingToner", 1000, 0);
	return 1;
}

public OtherTimer()
{
    new Float:maxspeed = 175.0;
    new plname[MAX_PLAYER_NAME];
	new string[256];
	new Float:oldposx, Float:oldposy, Float:oldposz;
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
            if(SafeTime[i] > 0)
			{
				SafeTime[i]--;
			}
			if(SafeTime[i] == 1)
			{
				if(gPlayerAccount[i] == 1 && gPlayerLogged[i] == 0)
				{
					SendClientMessage(i, COLOR_WHITE, "HINT: You can now login by typing /login <password>");
				}
			}
		    if(GetPlayerState(i) == 2)
		    {
				GetPlayerPos(i, TelePos[i][3], TelePos[i][4], TelePos[i][5]);
				if(TelePos[i][5] > 550.0)
				{
					TelePos[i][0] = 0.0;
					TelePos[i][1] = 0.0;
				}
				if(TelePos[i][0] != 0.0)
				{
					new Float:xdist = TelePos[i][3]-TelePos[i][0];
					new Float:ydist = TelePos[i][4]-TelePos[i][1];
					new Float:sqxdist = xdist*xdist;
					new Float:sqydist = ydist*ydist;
					new Float:distance = (sqxdist+sqydist)/31;
					if(gSpeedo[i] == 2)
					{
						if(distance <10)
						{
							format(string, 256, "~n~~n~~n~~n~~n~~n~~n~~g~mph :   ~w~%.0f",distance);
						}
						if(distance > 10 && distance < 100)
						{
							format(string, 256, "~n~~n~~n~~n~~n~~n~~n~~g~mph :  ~w~%.0f",distance);
						}
						if(distance > 100)
						{
							format(string, 256, "~n~~n~~n~~n~~n~~n~~n~~g~mph : ~w~%.0f",distance);
						}
						GameTextForPlayer(i, string, 2000, 5);
					}
					if(distance > maxspeed && PlayerInfo[i][pAdmin] < 1)
					{
						new tmpcar = GetPlayerVehicleID(i);
						if(!IsAPlane(tmpcar))
						{
							GetPlayerName(i, plname, sizeof(plname));
							format(string, 256, "AdmWarning: [%d]%s %.0f mph",i,plname,distance);
							ABroadCast(COLOR_YELLOW,string,1);
						}
					}
				}
				if(TelePos[i][5] < 550.0 && TelePos[i][3] != 0.0)
				{
					TelePos[i][0] = TelePos[i][3];
					TelePos[i][1] = TelePos[i][4];
				}
			}
		    if(PlayerInfo[i][pLocal] != 255 && PlayerInfo[i][pInt] != 0)
			{
				new house = PlayerInfo[i][pLocal];
				GetPlayerPos(i, oldposx, oldposy, oldposz);
				if(oldposz != 0.0)
				{
					if(oldposz < 600.0)
					{
						if(house > 10000)
						{
							new tmpcar = GetPlayerVehicleID(i);
							if (!PlayerToPoint(6, i,1040.6,-1021.0,31.7) && house == 10001 ||!PlayerToPoint(6, i,-2720.5,217.5,4.1) && house == 10002 ||!PlayerToPoint(6, i,2644.6,-2044.9,13.3) && house == 10003)
							{
								if (GetPlayerState(i) == 2)
								{
									SetVehiclePos(tmpcar, HouseCarSpawns[tmpcar-1][0], HouseCarSpawns[tmpcar-1][1], HouseCarSpawns[tmpcar-1][2]);
									SetVehicleZAngle(tmpcar, HouseCarSpawns[tmpcar-1][3]);
								}
								else
								{
									SetPlayerPos(i, HouseCarSpawns[tmpcar-1][0], HouseCarSpawns[tmpcar-1][1], HouseCarSpawns[tmpcar-1][2]);
								}
								new oldcash = gSpentCash[i];
								new Total = GetPlayerMoney(i) - oldcash;
								printf("Total %d = GetPlayerMoney(playerid) %d - oldcash %d",Total,GetPlayerMoney(i),oldcash);
								new name[MAX_PLAYER_NAME];
								GetPlayerName(i, name, sizeof(name));
								format(string,128,"<< %s has left the homemodshop with $%d >>",name,Total);
								PayLog(string);
								gSpentCash[i] = 0;
								TelePos[i][0] = 0.0;
								TelePos[i][1] = 0.0;
								PlayerInfo[i][pLocal] = 255;
								SetPlayerInterior(i,0);
								PlayerInfo[i][pInt] = 0;
								Spectate[i] = 255;
							}
						}
						if(house == 241)//City Hall
						{
						    SetPlayerInterior(i,0);
							SetPlayerPos(i,-2162.2554,-2385.9541,30.6250);
							PlayerInfo[i][pInt] = 0;
							PlayerInfo[i][pLocal] = 255;
						}
						if(house == 242)
						{
						    SetPlayerInterior(i,0);
							SetPlayerPos(i,1073.0619,-344.5148,73.9922);
							PlayerInfo[i][pInt] = 0;
							PlayerInfo[i][pLocal] = 255;
						}
						if(house >= 99 && house != 10000)
						{
							SetPlayerPos(i, BizzInfo[house-99][bEntranceX], BizzInfo[house-99][bEntranceY],BizzInfo[house-99][bEntranceZ]); // Warp the player
							PlayerInfo[i][pLocal] = 255;
							SetPlayerInterior(i,0);
							PlayerInfo[i][pInt] = 0;
						}
						else if(house < 99 && house != 10000)
						{
							SetPlayerPos(i, HouseInfo[house][hEntrancex], HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]); // Warp the player
							PlayerInfo[i][pLocal] = 255;
							SetPlayerInterior(i,0);
							PlayerInfo[i][pInt] = 0;
						}
					}
				}
			}
		    if(CellTime[i] > 0)
			{
				if (CellTime[i] == cchargetime)
				{
					CellTime[i] = 1;
					if(Mobile[Mobile[i]] == i)
					{
						CallCost[i] = CallCost[i]+callcost;
					}
				}
				CellTime[i] = CellTime[i] +1;
				if (Mobile[Mobile[i]] == 255 && CellTime[i] == 5)
				{
				    if(IsPlayerConnected(Mobile[i]))
				    {
						new called[MAX_PLAYER_NAME];
						GetPlayerName(Mobile[i], called, sizeof(called));
						format(string, sizeof(string), "* %s's phone rings.", called);
						RingTone[Mobile[i]] = 10;
						ProxDetector(30.0, Mobile[i], string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					}
				}
			}
			if(CellTime[i] == 0 && CallCost[i] > 0)
			{
				format(string, sizeof(string), "~w~The call cost~n~~r~$%d",CallCost[i]);
				GivePlayerMoney(i, -CallCost[i]);
				SBizzInfo[2][sbTill] += CallCost[i];
				ExtortionSBiz(2, CallCost[i]);
				GameTextForPlayer(i, string, 5000, 1);
				CallCost[i] = 0;
			}
			if(TransportTime[i] > 0)
			{//Taxi driver and passenger only
			    if(TransportTime[i] >= 16)
				{
					TransportTime[i] = 1;
					if(TransportDriver[i] < 999)
					{
						if(IsPlayerConnected(TransportDriver[i]))
						{
	      					TransportCost[i] += TransportValue[TransportDriver[i]];
						    TransportCost[TransportDriver[i]] = TransportCost[i];
						}
					}
				}
			    TransportTime[i] += 1;
			    format(string, sizeof(string), "~r~%d ~w~: ~g~$%d",TransportTime[i],TransportCost[i]);
			    GameTextForPlayer(i, string, 15000, 6);
			}
		}
	}
	return 1;
}

public SetPlayerUnjail()
{
	new plname[MAX_PLAYER_NAME];
	new string[256];
	if(PaintballPlayers >= 2 && PaintballRound != 1 && StartingPaintballRound != 1)
	{
		StartingPaintballRound = 1;
	   	SetTimer("PreparePaintball", 15000, 0);
	}
	if(KartingPlayers >= 2 && KartingRound != 1 && StartingKartRound != 1)
	{
	    StartingKartRound = 1;
	    SetTimer("PrepareKarting", 15000, 0);
	}
	if(KartingRound != 0 && KartingPlayers < 2)
	{
	    StartingKartRound = 0;
	    KartingRound = 0;
	    EndingKartRound = 1;
	}
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
	    {
			new newcar = GetPlayerVehicleID(i);
			new level = PlayerInfo[i][pLevel];
			if(level >= 0 && level <= 2) { PlayerInfo[i][pPayCheck] += 1; }
			else if(level >= 3 && level <= 4) { PlayerInfo[i][pPayCheck] += 2; }
			else if(level >= 5 && level <= 6) { PlayerInfo[i][pPayCheck] += 3; }
			else if(level >= 7 && level <= 8) { PlayerInfo[i][pPayCheck] += 4; }
			else if(level >= 9 && level <= 10) { PlayerInfo[i][pPayCheck] += 5; }
			else if(level >= 11 && level <= 12) { PlayerInfo[i][pPayCheck] += 6; }
			else if(level >= 13 && level <= 14) { PlayerInfo[i][pPayCheck] += 7; }
			else if(level >= 15 && level <= 16) { PlayerInfo[i][pPayCheck] += 8; }
			else if(level >= 17 && level <= 18) { PlayerInfo[i][pPayCheck] += 9; }
			else if(level >= 19 && level <= 20) { PlayerInfo[i][pPayCheck] += 10; }
			else if(level >= 21) { PlayerInfo[i][pPayCheck] += 11; }
		    if(PlayerInfo[i][pJailed] > 0)
		    {
				if(PlayerInfo[i][pJailTime] > 0 && WantLawyer[i] == 0)
				{
					PlayerInfo[i][pJailTime]--;
				}
				if(PlayerInfo[i][pJailTime] <= 0 && WantLawyer[i] == 0)
				{
				    PlayerInfo[i][pJailTime] = 0;
					if(PlayerInfo[i][pJailed] == 1)
					{
						SetPlayerInterior(i, 6);
						SetPlayerPos(i,268.0903,77.6489,1001.0391);
					}
					else if(PlayerInfo[i][pJailed] == 2)
					{
					    SetPlayerWorldBounds(i,20000.0000,-20000.0000,20000.0000,-20000.0000); //Reset world to player
					    SetPlayerInterior(i, 0);
					    SetPlayerPos(i, 90.2101,1920.4854,17.9422);
					}
					PlayerInfo[i][pJailed] = 0;
					SendClientMessage(i, COLOR_GRAD1,"   You have paid your debt to society.");
					format(string, sizeof(string), "~g~Freedom~n~~w~Try to be a better citizen");
					GameTextForPlayer(i, string, 5000, 1);
					if(gTeam[i] == 4) { gTeam[i] = 3; }
					ClearCrime(i);
					SetPlayerToTeamColor(i);
				}
			}
			if(GetPlayerMoney(i) - CurrentMoney[i] >= 50000 && PlayerInfo[i][pAdmin] < 1)
		    {
		        if(ConsumingMoney[i])
		        {
                    CurrentMoney[i] = GetPlayerMoney(i);
					ConsumingMoney[i] = 0;
		        }
		        else
		        {
			        GetPlayerName(i, plname, sizeof(plname));
			        format(string, 256, "AdmWarning: [%d]%s just spawned above $50000 in one second (moneycheat), use /check on him.",i,plname);
					ABroadCast(COLOR_YELLOW,string,1);
					PayLog(string);
			        CurrentMoney[i] = GetPlayerMoney(i);
		        }
		    }
		    else
		    {
		        CurrentMoney[i] = GetPlayerMoney(i);
		    }
		    if(IsABoat(newcar))
			{
			    if(PlayerInfo[i][pBoatLic] < 1 && GetPlayerState(i) == 2)
				{
				    RemovePlayerFromVehicle(i);
				}
			}
			else if(IsAPlane(newcar))
			{
			    if(PlayerInfo[i][pFlyLic] < 1 && GetPlayerState(i) == 2)
				{
				    if(TakingLesson[i] == 1) { }
				    else { RemovePlayerFromVehicle(i); }
				}
			}
			else
			{
				if(PlayerInfo[i][pCarLic] < 1 && IsPlayerInAnyVehicle(i) && GetPlayerState(i) == 2)
				{
					if(TakingLesson[i] == 1) { }
				    else { RemovePlayerFromVehicle(i); }
				}
			}//Done with car check
		    if(UsedFind[i] >= 1)
		    {
		        UsedFind[i] += 1;
				if(UsedFind[i] >= 120)
				{
				    UsedFind[i] = 0;
				}
		    }
			if(MedicTime[i] > 0)
			{
			    if(MedicTime[i] == 3)
			    {
			        SetPlayerInterior(i, 5);
			        new Float:X, Float:Y, Float:Z;
			        GetPlayerPos(i, X,Y,Z);
			        SetPlayerCameraPos(i, X + 3, Y, Z);
			        SetPlayerCameraLookAt(i,X,Y,Z);
			    }
			    MedicTime[i] ++;
			    if(MedicTime[i] >= NeedMedicTime[i])
			    {
					new cut = deathcost; //PlayerInfo[playerid][pLevel]*deathcost;
					GivePlayerMoney(i, -cut);
					format(string, sizeof(string), "DOC: Your Medical Bill comes to $%d, Have a nice day.", cut);
					SendClientMessage(i, TEAM_CYAN_COLOR, string);
					TogglePlayerControllable(i, 1);
			        MedicBill[i] = 0;
			        MedicTime[i] = 0;
			        NeedMedicTime[i] = 0;
			        PlayerInfo[i][pDeaths] += 1;
			        PlayerFixRadio(i);
			        SpawnPlayer(i);
			    }
			}
			if(WantLawyer[i] >= 1)
			{
			    CallLawyer[i] = 111;
			    if(WantLawyer[i] == 1)
				{
				    SendClientMessage(i, COLOR_LIGHTRED, "Do you want a Lawyer? (Type yes or no)");
				}
				WantLawyer[i] ++;
				if(WantLawyer[i] == 8)
				{
				    SendClientMessage(i, COLOR_LIGHTRED, "Do you want a Lawyer? (Type yes or no)");
				}
	            if(WantLawyer[i] == 15)
				{
				    SendClientMessage(i, COLOR_LIGHTRED, "Do you want a Lawyer? (Type yes or no)");
				}
				if(WantLawyer[i] == 20)
				{
				    SendClientMessage(i, COLOR_LIGHTRED, "There is no Lawyer available to you anymore, Jail Time started.");
				    WantLawyer[i] = 0;
				    CallLawyer[i] = 0;
				}
			}
			if(TutTime[i] >= 1)
			{
			    TutTime[i] += 1;
			    if(TutTime[i] == 3)
			    {
			        SendClientMessage(i, COLOR_YELLOW2, "|____ Tutorial: The beginning ____|");
			        SendClientMessage(i, COLOR_YELLOW2, "Hi there, i can see that you are new, so here's a quick Tutorial.");
			        SendClientMessage(i, COLOR_YELLOW2, "Every new players needs to know what he / she, can and can't do.");
			        SendClientMessage(i, COLOR_YELLOW2, "I will give your quiet some information, so please pay attention to avoid questions later on.");
			    }
			    else if(TutTime[i] == 14)
			    {
			        SendClientMessage(i, COLOR_YELLOW, "|____ Tutorial: Kind of server ____|");
			    }
			    else if(TutTime[i] == 16)
			    {
			        SendClientMessage(i, COLOR_YELLOW2, "This server is a RP server which stands for Role Playing.");
			        SendClientMessage(i, COLOR_YELLOW2, "We are absolutely not interested in players that just come along and Deathmatch.");
			        SendClientMessage(i, COLOR_YELLOW2, "The name you have also matters alot, other players are getting used to your chosen name");
			        SendClientMessage(i, COLOR_YELLOW2, "so it's better to have a name like for example: Oliver_Wood.");
			        SendClientMessage(i, COLOR_YELLOW2, "If you want to know more about how to RP, visit our forums and search for the topic.");
			        SendClientMessage(i, COLOR_YELLOW2, "(You can find the forum on our webpage: http://www.godfather-rp.com");
			    }
			    else if(TutTime[i] == 30)
			    {
			        SendClientMessage(i, COLOR_YELLOW, "|____ Tutorial: Requesting Help ____|");
			    }
			    else if(TutTime[i] == 32)
			    {
			        SendClientMessage(i, COLOR_YELLOW2, "If you are confused and would like to know some more information when you are ingame");
			        SendClientMessage(i, COLOR_YELLOW2, "simply just ask any Player or an Admin (/admins) in a common way.");
			        SendClientMessage(i, COLOR_YELLOW2, "Just use common lines like: Hi, could you help me a sec please?");
			        SendClientMessage(i, COLOR_YELLOW2, "Don't start to shout or curse at someone, because it will only make you look worse..");
			        SendClientMessage(i, COLOR_YELLOW2, "And you might end up banned, which you want to skip of course.");
			        SendClientMessage(i, COLOR_YELLOW2, "Use the commands /o (OOC) /w (Whisper) /sms (If you have the Phone Number) to talk to someone.");
			    }
			    else if(TutTime[i] == 52)
			    {
			        SendClientMessage(i, COLOR_YELLOW, "|____ Tutorial: Cheating & Abusing ____|");
			    }
			    else if(TutTime[i] == 54)
			    {
			        SendClientMessage(i, COLOR_YELLOW2, "We wish that n0beit was never made and we certainly don't allow players to use it.");
			        SendClientMessage(i, COLOR_YELLOW2, "Thats why we don't want YOU to cheat, or allow other players to cheat.");
			        SendClientMessage(i, COLOR_YELLOW2, "If you see someone cheating, please report it with /report right away.");
			        SendClientMessage(i, COLOR_YELLOW2, "Bug abusing, or in any other way stuff abusing is just as bad as Cheating.");
			        SendClientMessage(i, COLOR_YELLOW2, "So we don't want YOU to abuse aswell, simply use the /report as well if you see");
			        SendClientMessage(i, COLOR_YELLOW2, "someone abusing something.");
			    }
			    else if(TutTime[i] == 74)
			    {
			        SendClientMessage(i, COLOR_YELLOW, "|____ Tutorial: Respect ____|");
			    }
			    else if(TutTime[i] == 76)
			    {
			        SendClientMessage(i, COLOR_YELLOW2, "First of all I like to start with Admins, respect Admins in any way.");
			        SendClientMessage(i, COLOR_YELLOW2, "We are all trying to keep everyony satisfied and trying to help everyone in anyway possible.");
			        SendClientMessage(i, COLOR_YELLOW2, "Secondly, don't curse / shout / swear at other players, this will end you up muted / banned.");
			        SendClientMessage(i, COLOR_YELLOW2, "Just treat people with respect, just like you want to be respected.");
			    }
			    else if(TutTime[i] == 96)
			    {
			        SendClientMessage(i, COLOR_YELLOW, "|____ Tutorial: Drive-by ____|");
			    }
			    else if(TutTime[i] == 98)
			    {
			        SendClientMessage(i, COLOR_YELLOW2, "We don't allow Drive-by's on this server, since it's lame and simple to kill.");
			        SendClientMessage(i, COLOR_YELLOW2, "And it's deathmatching, which we definately don't allow.");
			        SendClientMessage(i, COLOR_YELLOW2, "Don't do this if you don't want yourself to get banned.");
			    }
			    else if(TutTime[i] == 108)
			    {
			        SendClientMessage(i, COLOR_YELLOW, "|____ Tutorial: Language & Advertising ____|");
			    }
			    else if(TutTime[i] == 110)
			    {
			        SendClientMessage(i, COLOR_YELLOW2, "We'd like you to use English in any chat.");
			        SendClientMessage(i, COLOR_YELLOW2, "If you want to talk with someone in your own Language, use the /w or /sms commands");
			        SendClientMessage(i, COLOR_YELLOW2, "Advertising is not allowed aswell, advertising will get you banned aswell.");
			    }
			    else if(TutTime[i] == 119)
			    {
			        SendClientMessage(i, COLOR_YELLOW, "|____ Tutorial: The End ____|");
			    }
			    else if(TutTime[i] == 121)
			    {
			        SendClientMessage(i, COLOR_YELLOW2, "So that was it, probably obvious but we still want you to remember our rules.");
			        SendClientMessage(i, COLOR_YELLOW2, "Just keep reminding them and have fun!");
			        SendClientMessage(i, COLOR_YELLOW2, "Greetings from: Role Play - The Godfather Admin Team.");
			    }
			    else if(TutTime[i] == 127)
			    {
			        TutTime[i] = 0; PlayerInfo[i][pTut] = 1;
					gOoc[i] = 0; gNews[i] = 0; gFam[i] = 0;
					TogglePlayerControllable(i, 1);
					MedicBill[i] = 0;
					SetPlayerSpawn(i);
			    }
			}
			if(PlayerTazeTime[i] >= 1)
			{
			    PlayerTazeTime[i] += 1;
			    if(PlayerTazeTime[i] == 15)
			    {
                    PlayerTazeTime[i] = 0;
			    }
			    else
			    {
			        new Float:angle;
					GetPlayerFacingAngle(i, angle);
					SetPlayerFacingAngle(i, angle + 90);
			    }
			}
			if(PlayerDrunk[i] >= 5)
			{
			    PlayerDrunkTime[i] += 1;
			    if(PlayerDrunkTime[i] == 8)
			    {
			        PlayerDrunkTime[i] = 0;
			        new Float:angle;
					GetPlayerFacingAngle(i, angle);
					if(IsPlayerInAnyVehicle(i))
					{
					    if(GetPlayerState(i) == 2)
					    {
					    	SetVehicleZAngle(GetPlayerVehicleID(i), angle + 25);
						}
					}
					else
					{
					    ApplyAnimation(i,"PED", "WALK_DRUNK",4.0,0,1,0,0,0);
					}
			    }
			}
			if(PlayerStoned[i] >= 2)
			{
		        PlayerStoned[i] += 1;
			    if(PlayerStoned[i] == 10)
			    {
			        PlayerStoned[i] = 2;
			        new Float:angle;
					GetPlayerFacingAngle(i, angle);
					if(IsPlayerInAnyVehicle(i))
					{
					    if(GetPlayerState(i) == 2)
					    {
					    	SetVehicleZAngle(GetPlayerVehicleID(i), angle + 25);
						}
					}
					else
					{
					    SetPlayerFacingAngle(i, angle + 90);
					}
			    }
			}
			if(PlayerInfo[i][pCarTime] > 0)
			{
			    if(PlayerInfo[i][pCarTime] <= 0)
			    {
			        PlayerInfo[i][pCarTime] = 0;
			    }
			    else
			    {
			        PlayerInfo[i][pCarTime] -= 1;
			    }
			}
			if(BoxWaitTime[i] > 0)
			{
			    if(BoxWaitTime[i] >= BoxDelay)
				{
				    BoxDelay = 0;
					BoxWaitTime[i] = 0;
					PlayerPlaySound(i, 1057, 0.0, 0.0, 0.0);
					GameTextForPlayer(i, "~g~Match Started", 5000, 1);
					TogglePlayerControllable(i, 1);
					RoundStarted = 1;
				}
			    else
				{
				    format(string, sizeof(string), "%d", BoxDelay - BoxWaitTime[i]);
					GameTextForPlayer(i, string, 1500, 6);
					BoxWaitTime[i] += 1;
				}
			}
			if(RoundStarted > 0)
			{
			    if(PlayerBoxing[i] > 0)
			    {
			        new trigger = 0;
			        new Lost = 0;
		        	new Float:angle;
		            new Float:health;
					GetPlayerHealth(i, health);
		            if(health < 12)
					{
					    if(i == Boxer1) { Lost = 1; trigger = 1; }
			            else if(i == Boxer2) { Lost = 2; trigger = 1; }
					}
			        if(health < 28) { GetPlayerFacingAngle(i, angle); SetPlayerFacingAngle(i, angle + 85); }
			        if(trigger)
			        {
			            new winner[MAX_PLAYER_NAME];
			            new loser[MAX_PLAYER_NAME];
			            new titel[MAX_PLAYER_NAME];
			            if(Lost == 1)
			            {
			                if(IsPlayerConnected(Boxer1) && IsPlayerConnected(Boxer2))
			                {
					        	SetPlayerPos(Boxer1, 765.8433,3.2924,1000.7186); SetPlayerPos(Boxer2, 765.8433,3.2924,1000.7186);
					        	SetPlayerInterior(Boxer1, 5); SetPlayerInterior(Boxer2, 5);
			                	GetPlayerName(Boxer1, loser, sizeof(loser));
			                	GetPlayerName(Boxer2, winner, sizeof(winner));
		                		if(PlayerInfo[Boxer1][pJob] == 12) { PlayerInfo[Boxer1][pLoses] += 1; }
								if(PlayerInfo[Boxer2][pJob] == 12) { PlayerInfo[Boxer2][pWins] += 1; }
			                	if(TBoxer < 255)
			                	{
			                	    if(IsPlayerConnected(TBoxer))
			                	    {
				                	    if(TBoxer != Boxer2)
				                	    {
				                	        if(PlayerInfo[Boxer2][pJob] == 10)
				                	        {
				                	            TBoxer = Boxer2;
				                	            GetPlayerName(TBoxer, titel, sizeof(titel));
					                	        new nstring[MAX_PLAYER_NAME];
												format(nstring, sizeof(nstring), "%s", titel);
												strmid(Titel[TitelName], nstring, 0, strlen(nstring), 255);
					                	        Titel[TitelWins] = PlayerInfo[TBoxer][pWins];
					                	        Titel[TitelLoses] = PlayerInfo[TBoxer][pLoses];
					                	        SaveBoxer();
							                	format(string, sizeof(string), "Boxing News: %s has Won the fight against Champion %s and is now the new Boxing Champion.",  titel, loser);
												OOCOff(COLOR_WHITE,string);
				                	        }
				                	        else
				                	        {
				                	            SendClientMessage(Boxer2, COLOR_LIGHTBLUE, "* You would have been the Champion if you had the Boxer Job !");
				                	        }
										}
										else
										{
										    GetPlayerName(TBoxer, titel, sizeof(titel));
										    format(string, sizeof(string), "Boxing News: Boxing Champion %s has Won the fight against %s.",  titel, loser);
											OOCOff(COLOR_WHITE,string);
											Titel[TitelWins] = PlayerInfo[TBoxer][pWins];
				                	        Titel[TitelLoses] = PlayerInfo[Boxer2][pLoses];
				                	        SaveBoxer();
										}
									}
								}//TBoxer
								format(string, sizeof(string), "* You have Lost the Fight against %s.", winner);
								SendClientMessage(Boxer1, COLOR_LIGHTBLUE, string);
								GameTextForPlayer(Boxer1, "~r~You lost", 3500, 1);
								format(string, sizeof(string), "* You have Won the Fight against %s.", loser);
								SendClientMessage(Boxer2, COLOR_LIGHTBLUE, string);
								GameTextForPlayer(Boxer2, "~r~You won", 3500, 1);
								if(GetPlayerHealth(Boxer1, health) < 20)
								{
								    SendClientMessage(Boxer1, COLOR_LIGHTBLUE, "* You feel exhausted from the Fight, go eat somewhere.");
								    SetPlayerHealth(Boxer1, 30.0);
								}
								else
								{
								    SendClientMessage(Boxer1, COLOR_LIGHTBLUE, "* You feel perfect, even after the Fight.");
								    SetPlayerHealth(Boxer1, 50.0);
								}
								if(GetPlayerHealth(Boxer2, health) < 20)
								{
								    SendClientMessage(Boxer2, COLOR_LIGHTBLUE, "* You feel exhausted from the Fight, go eat somewhere.");
							    	SetPlayerHealth(Boxer2, 30.0);
								}
								else
								{
								    SendClientMessage(Boxer2, COLOR_LIGHTBLUE, "* You feel perfect, even after the Fight.");
								    SetPlayerHealth(Boxer2, 50.0);
								}
                                GameTextForPlayer(Boxer1, "~g~Match Over", 5000, 1); GameTextForPlayer(Boxer2, "~g~Match Over", 5000, 1);
								if(PlayerInfo[Boxer2][pJob] == 10) { PlayerInfo[Boxer2][pBoxSkill] += 1; }
								PlayerBoxing[Boxer1] = 0;
								PlayerBoxing[Boxer2] = 0;
							}
			            }
			            else if(Lost == 2)
			            {
			                if(IsPlayerConnected(Boxer1) && IsPlayerConnected(Boxer2))
			                {
					        	SetPlayerPos(Boxer1, 765.8433,3.2924,1000.7186); SetPlayerPos(Boxer2, 765.8433,3.2924,1000.7186);
					        	SetPlayerInterior(Boxer1, 5); SetPlayerInterior(Boxer2, 5);
			                	GetPlayerName(Boxer1, winner, sizeof(winner));
			                	GetPlayerName(Boxer2, loser, sizeof(loser));
		                		if(PlayerInfo[Boxer2][pJob] == 10) { PlayerInfo[Boxer2][pLoses] += 1; }
								if(PlayerInfo[Boxer1][pJob] == 10) { PlayerInfo[Boxer1][pWins] += 1; }
			                	if(TBoxer < 255)
			                	{
			                	    if(IsPlayerConnected(TBoxer))
			                	    {
				                	    if(TBoxer != Boxer1)
				                	    {
				                	        if(PlayerInfo[Boxer1][pJob] == 10)
				                	        {
					                	        TBoxer = Boxer1;
					                	        GetPlayerName(TBoxer, titel, sizeof(titel));
					                	        new nstring[MAX_PLAYER_NAME];
												format(nstring, sizeof(nstring), "%s", titel);
												strmid(Titel[TitelName], nstring, 0, strlen(nstring), 255);
					                	        Titel[TitelWins] = PlayerInfo[TBoxer][pWins];
					                	        Titel[TitelLoses] = PlayerInfo[TBoxer][pLoses];
					                	        SaveBoxer();
							                	format(string, sizeof(string), "Boxing News: %s has Won the fight against Champion %s and is now the new Boxing Champion.",  titel, loser);
												OOCOff(COLOR_WHITE,string);
											}
				                	        else
				                	        {
				                	            SendClientMessage(Boxer1, COLOR_LIGHTBLUE, "* You would have been the Champion if you had the Boxer Job !");
				                	        }
										}
										else
										{
										    GetPlayerName(TBoxer, titel, sizeof(titel));
										    format(string, sizeof(string), "Boxing News: Boxing Champion %s has Won the fight against %s.",  titel, loser);
											OOCOff(COLOR_WHITE,string);
											Titel[TitelWins] = PlayerInfo[TBoxer][pWins];
				                	        Titel[TitelLoses] = PlayerInfo[Boxer1][pLoses];
				                	        SaveBoxer();
										}
									}
								}//TBoxer
								format(string, sizeof(string), "* You have Lost the Fight against %s.", winner);
								SendClientMessage(Boxer2, COLOR_LIGHTBLUE, string);
								GameTextForPlayer(Boxer2, "~r~You lost", 3500, 1);
								format(string, sizeof(string), "* You have Won the Fight against %s.", loser);
								SendClientMessage(Boxer1, COLOR_LIGHTBLUE, string);
								GameTextForPlayer(Boxer1, "~g~You won", 3500, 1);
								if(GetPlayerHealth(Boxer1, health) < 20)
								{
								    SendClientMessage(Boxer1, COLOR_LIGHTBLUE, "* You feel exhausted from the Fight, go eat somewhere.");
								    SetPlayerHealth(Boxer1, 30.0);
								}
								else
								{
								    SendClientMessage(Boxer1, COLOR_LIGHTBLUE, "* You feel perfect, even after the Fight.");
								    SetPlayerHealth(Boxer1, 50.0);
								}
								if(GetPlayerHealth(Boxer2, health) < 20)
								{
								    SendClientMessage(Boxer2, COLOR_LIGHTBLUE, "* You feel exhausted from the Fight, go eat somewhere.");
							    	SetPlayerHealth(Boxer2, 30.0);
								}
								else
								{
								    SendClientMessage(Boxer2, COLOR_LIGHTBLUE, "* You feel perfect, even after the Fight.");
								    SetPlayerHealth(Boxer2, 50.0);
								}
                                GameTextForPlayer(Boxer1, "~g~Match Over", 5000, 1); GameTextForPlayer(Boxer2, "~g~Match Over", 5000, 1);
								if(PlayerInfo[Boxer1][pJob] == 10) { PlayerInfo[Boxer1][pBoxSkill] += 1; }
								PlayerBoxing[Boxer1] = 0;
								PlayerBoxing[Boxer2] = 0;
							}
			            }
			            InRing = 0;
			            RoundStarted = 0;
			            Boxer1 = 255;
			            Boxer2 = 255;
			            TBoxer = 255;
			            trigger = 0;
			        }
			    }
			}
			if(StartingPaintballRound == 1 && AnnouncedPaintballRound == 0)
			{
			    AnnouncedPaintballRound = 1;
			    if(PlayerPaintballing[i] != 0)
			    {
			        SendClientMessage(i, COLOR_YELLOW, "Paintball Match will be announced in 15 seconds (For getting more Paintball players).");
			    }
			}
			if(StartingKartRound == 1 && AnnouncedKartRound == 0)
			{
			    AnnouncedKartRound = 1;
			    if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
			    {
			        SendClientMessage(i, COLOR_YELLOW, "Karting Race will be announced in 15 seconds (For getting more Kart Racers).");
			    }
			}
			if(EndingKartRound == 1)
			{
			    if(PlayerKarting[i] != 0 && PlayerInKart[i] != 0)
			    {
			        DisablePlayerCheckpoint(i);
			        CP[i] = 0;
			    }
			}
			if(FindTime[i] > 0)
			{
			    if(FindTime[i] == FindTimePoints[i]) { FindTime[i] = 0; FindTimePoints[i] = 0; DisablePlayerCheckpoint(i); PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0); GameTextForPlayer(i, "~r~RedMarker gone", 2500, 1); }
			    else
				{
				    format(string, sizeof(string), "%d", FindTimePoints[i] - FindTime[i]);
					GameTextForPlayer(i, string, 1500, 6);
					FindTime[i] += 1;
				}
			}
			if(TaxiCallTime[i] > 0)
			{
			    if(TaxiAccepted[i] < 999)
			    {
				    if(IsPlayerConnected(TaxiAccepted[i]))
				    {
				        new Float:X,Float:Y,Float:Z;
						GetPlayerPos(TaxiAccepted[i], X, Y, Z);
						SetPlayerCheckpoint(i, X, Y, Z, 5);
				    }
				}
			}
			if(BusCallTime[i] > 0)
			{
			    if(BusAccepted[i] < 999)
			    {
				    if(IsPlayerConnected(BusAccepted[i]))
				    {
				        new Float:X,Float:Y,Float:Z;
						GetPlayerPos(BusAccepted[i], X, Y, Z);
						SetPlayerCheckpoint(i, X, Y, Z, 5);
				    }
				}
			}
			if(MedicCallTime[i] > 0)
			{
			    if(MedicCallTime[i] == 30) { MedicCallTime[i] = 0; DisablePlayerCheckpoint(i); PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0); GameTextForPlayer(i, "~r~RedMarker gone", 2500, 1); }
			    else
				{
				    format(string, sizeof(string), "%d", 30 - MedicCallTime[i]);
					GameTextForPlayer(i, string, 1500, 6);
					MedicCallTime[i] += 1;
				}
			}
			if(MechanicCallTime[i] > 0)
			{
			    if(MechanicCallTime[i] == 30) { MechanicCallTime[i] = 0; DisablePlayerCheckpoint(i); PlayerPlaySound(i, 1056, 0.0, 0.0, 0.0); GameTextForPlayer(i, "~r~RedMarker gone", 2500, 1); }
			    else
				{
				    format(string, sizeof(string), "%d", 30 - MechanicCallTime[i]);
					GameTextForPlayer(i, string, 1500, 6);
					MechanicCallTime[i] += 1;
				}
			}
			if(Robbed[i] == 1)
			{
			    if(RobbedTime[i] <= 0)
			    {
			        RobbedTime[i] = 0;
					Robbed[i] = 0;
			    }
			    else
			    {
			        RobbedTime[i] -= 1;
			    }
			}
			if(PlayerCuffed[i] == 1)
			{
			    if(PlayerCuffedTime[i] <= 0)
			    {
			        TogglePlayerControllable(i, 1);
			        PlayerCuffed[i] = 0;
			        PlayerCuffedTime[i] = 0;
			        PlayerTazeTime[i] = 1;
			    }
			    else
			    {
			        PlayerCuffedTime[i] -= 1;
			    }
			}
			if(PlayerCuffed[i] == 2)
			{
			    if(PlayerCuffedTime[i] <= 0)
			    {
			        GameTextForPlayer(i, "~r~You broke the Cuffs, you are free!", 2500, 3);
			        TogglePlayerControllable(i, 1);
			        PlayerCuffed[i] = 0;
			        PlayerCuffedTime[i] = 0;
			    }
			    else
			    {
			        PlayerCuffedTime[i] -= 1;
			    }
			}
			if(PlayerToPoint(20, i,2015.4500,1017.0900,996.8750))
			{//Four Dragons
			    GameTextForPlayer(i, "~r~Closed", 5000, 1);
			    SetPlayerInterior(i, 0);
			    SetPlayerPos(i,1022.599975,-1123.699951,23.799999);
			}
			else if(PlayerToPoint(20, i,2233.9099,1710.7300,1011.2987))
			{//Caligula
			    GameTextForPlayer(i, "~r~Closed", 5000, 1);
			    SetPlayerInterior(i, 0);
			    SetPlayerPos(i,1022.599975,-1123.699951,23.799999);
			}
			else if(PlayerToPoint(10, i,2265.7900,1619.5800,1090.4453))
			{//Caligula Roof 1
			    GameTextForPlayer(i, "~r~Closed", 5000, 1);
			    SetPlayerInterior(i, 0);
			    SetPlayerPos(i,1022.599975,-1123.699951,23.799999);
			}
			else if(PlayerToPoint(10, i,2265.7800,1675.9301,1090.4453))
			{//Caligula Roof 2
			    GameTextForPlayer(i, "~r~Closed", 5000, 1);
			    SetPlayerInterior(i, 0);
			    SetPlayerPos(i,1022.599975,-1123.699951,23.799999);
			}
			else if(PlayerToPoint(20, i,1133.0699,-9.5731,1000.6797))
			{//West Casino place
			    GameTextForPlayer(i, "~r~Closed", 5000, 1);
			    SetPlayerInterior(i, 0);
			    SetPlayerPos(i,1022.599975,-1123.699951,23.799999);
			}
			else if(PlayerToPoint(20, i,292.0274,-36.0291,1001.5156))
			{//Ammunation 1
			    GameTextForPlayer(i, "~r~Jailed for going to ammunation", 5000, 1);
			    SetPlayerInterior(i, 6);
				SetPlayerPos(i,264.6288,77.5742,1001.0391);
				PlayerInfo[i][pJailTime] = 300;
				PlayerInfo[i][pJailed] = 1;
			}
			else if(PlayerToPoint(20, i,308.2740,-141.2833,999.6016))
			{//Ammunation 2
			    GameTextForPlayer(i, "~r~Jailed for going to ammunation", 5000, 1);
			    SetPlayerInterior(i, 6);
				SetPlayerPos(i,264.6288,77.5742,1001.0391);
				PlayerInfo[i][pJailTime] = 300;
				PlayerInfo[i][pJailed] = 1;
			}
			else if(PlayerToPoint(20, i,294.3212,-108.7869,1001.5156))
			{//Ammunation 3 (small one's)
			    GameTextForPlayer(i, "~r~Jailed for going to ammunation", 5000, 1);
			    SetPlayerInterior(i, 6);
				SetPlayerPos(i,264.6288,77.5742,1001.0391);
				PlayerInfo[i][pJailTime] = 300;
				PlayerInfo[i][pJailed] = 1;
			}
			else if(PlayerToPoint(20, i,288.8592,-80.4535,1001.5156))
			{//Ammunation 4 (small one's)
			    GameTextForPlayer(i, "~r~Jailed for going to ammunation", 5000, 1);
			    SetPlayerInterior(i, 6);
				SetPlayerPos(i,264.6288,77.5742,1001.0391);
				PlayerInfo[i][pJailTime] = 300;
				PlayerInfo[i][pJailed] = 1;
			}
			else if(PlayerToPoint(20, i,316.9583,-165.4707,999.6010))
			{//Ammunation 5 (Unprotected)
			    GameTextForPlayer(i, "~r~Jailed for going to ammunation", 5000, 1);
			    SetPlayerInterior(i, 6);
				SetPlayerPos(i,264.6288,77.5742,1001.0391);
				PlayerInfo[i][pJailTime] = 300;
				PlayerInfo[i][pJailed] = 1;
			}
		}
	}
}

public CheckGas()
{
	new string[256];
	for(new i=0;i<MAX_PLAYERS;i++)
	{
    	if(IsPlayerConnected(i))
       	{
       	    if(GetPlayerState(i) == PLAYER_STATE_DRIVER)
       	    {
	       		new vehicle = GetPlayerVehicleID(i);
	        	if(Gas[vehicle] >= 1)
		   		{
		   		    if(Gas[vehicle] <= 10) { PlayerPlaySound(i, 1085, 0.0, 0.0, 0.0); }
		   		    if(gGas[i] == 1) {
		      		format(string, sizeof(string), "~r~~n~~n~~n~~n~~n~~n~~n~~n~~n~Fuel:~w~ %d%",Gas[vehicle]);
		      		GameTextForPlayer(i,string,15500,3); }
					if(IsAPlane(vehicle) || IsABoat(vehicle)) { Gas[vehicle]++; }
	              	Gas[vehicle]--;
		   		}
	   			else
	           	{
	              	NoFuel[i] = 1;
	              	TogglePlayerControllable(i, 0);
		        	GameTextForPlayer(i,"~w~~n~~n~~n~~n~~n~~n~~n~~n~No fuel in Vehicle~n~Use /exit to leave the vehicle",1500,3);
				}
			}
    	}
	}
	return 1;
}

public Fillup()
{
	for(new i=0; i<MAX_PLAYERS; i++)
   	{
	   	if(IsPlayerConnected(i))
	   	{
		    new VID;
		    new FillUp;
		    new string[256];
		    VID = GetPlayerVehicleID(i);
		    FillUp = GasMax - Gas[VID];
			if(Refueling[i] == 1)
		    {
				if(GetPlayerMoney(i) >= FillUp+4)
				{
					Gas[VID] += FillUp;
					FillUp = FillUp * SBizzInfo[3][sbEntranceCost];
				    format(string,sizeof(string),"* Vehicle filled up, for: $%d.",FillUp);
				    SendClientMessage(i,COLOR_LIGHTBLUE,string);
					GivePlayerMoney(i, - FillUp);
					SBizzInfo[3][sbTill] += FillUp;
					ExtortionSBiz(3, FillUp);
					Refueling[i] = 0;
				}
			   	else
			   	{
			   	    format(string,sizeof(string),"* Not enough Money to refill, it costs $%d to fill your Vehicle.",FillUp);
				    SendClientMessage(i,COLOR_LIGHTBLUE,string);
			   	}
		 	}
		}
	}
	return 1;
}

public StoppedVehicle()
{
	new Float:x,Float:y,Float:z;
	new Float:distance,value;
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInAnyVehicle(i))
			{
				new VID;
				VID = GetPlayerVehicleID(i);
				GetPlayerPos(i, x, y, z);
				distance = floatsqroot(floatpower(floatabs(floatsub(x,SavePlayerPos[i][LastX])),2)+floatpower(floatabs(floatsub(y,SavePlayerPos[i][LastY])),2)+floatpower(floatabs(floatsub(z,SavePlayerPos[i][LastZ])),2));
				value = floatround(distance * 3600);
				if(UpdateSeconds > 1)
				{
					value = floatround(value / UpdateSeconds);
				}
				if(SpeedMode)
				{
	            }
				if(value == 0)
				{
					Gas[VID]++;
				}
				SavePlayerPos[i][LastX] = x;
				SavePlayerPos[i][LastY] = y;
				SavePlayerPos[i][LastZ] = z;
			}
		}
	}
	return 1;
}

public SetPlayerWeapons(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    ResetPlayerWeapons(playerid);
	    if(PlayerInfo[playerid][pJailed] < 1)
	    {
			if(gTeam[playerid] == 2 || IsACop(playerid))
			{
				GivePlayerWeapon(playerid, 41, 500); //spray
				if(OnDuty[playerid] == 1 || PlayerInfo[playerid][pMember] == 2)//Cops & FBI/ATF
				{
				    GivePlayerWeapon(playerid, 41, 500); //spray
					GivePlayerWeapon(playerid, 24, 200);
					GivePlayerWeapon(playerid, 3, 1);
					if(PlayerInfo[playerid][pChar] == 285)//SWAT
					{
					    GivePlayerWeapon(playerid, 25, 100);
					    GivePlayerWeapon(playerid, 29, 450);
					}
					else if(PlayerInfo[playerid][pChar] == 287)//Army
					{
					    GivePlayerWeapon(playerid, 25, 100);
					    GivePlayerWeapon(playerid, 31, 500);
					}
				}
				if(PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLeader] == 3)//National Guard
				{
				    GivePlayerWeapon(playerid, 24, 200);
				    GivePlayerWeapon(playerid, 31, 600);
				    GivePlayerWeapon(playerid, 29, 600);
				}
			}
			if(gTeam[playerid] >= 3)
			{
				GivePlayerWeapon(playerid, 5, 0);
			}
			if(PlayerInfo[playerid][pDonateRank] > 0)
			{
				if (PlayerInfo[playerid][pGun1] > 0)
				{
					GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun1], PlayerInfo[playerid][pAmmo1]);
					PlayerInfo[playerid][pGun1] = 0; PlayerInfo[playerid][pAmmo1] = 0;
				}
				if (PlayerInfo[playerid][pGun2] > 0)
				{
					GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun2], PlayerInfo[playerid][pAmmo2]);
					PlayerInfo[playerid][pGun2] = 0; PlayerInfo[playerid][pAmmo2] = 0;
				}
				if (PlayerInfo[playerid][pGun3] > 0)
				{
					GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun3], PlayerInfo[playerid][pAmmo3]);
					PlayerInfo[playerid][pGun3] = 0; PlayerInfo[playerid][pAmmo3] = 0;
				}
				if (PlayerInfo[playerid][pGun4] > 0)
				{
					GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun4], PlayerInfo[playerid][pAmmo4]);
					PlayerInfo[playerid][pGun4] = 0; PlayerInfo[playerid][pAmmo4] = 0;
				}
			}
			else
			{
			    if (PlayerInfo[playerid][pGun1] > 0)
				{
					GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun1], PlayerInfo[playerid][pAmmo1]);
					PlayerInfo[playerid][pGun1] = 0; PlayerInfo[playerid][pAmmo1] = 0;
				}
				if (PlayerInfo[playerid][pGun2] > 0)
				{
					GivePlayerWeapon(playerid, PlayerInfo[playerid][pGun2], PlayerInfo[playerid][pAmmo2]);
					PlayerInfo[playerid][pGun2] = 0; PlayerInfo[playerid][pAmmo2] = 0;
				}
			}
		}
	}
}

public PrintSBizInfo(playerid,targetid)
{
	if(IsPlayerConnected(playerid))
	{
		new coordsstring[256];
		SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
		format(coordsstring, sizeof(coordsstring),"*** %s ***",SBizzInfo[targetid][sbMessage]);
		SendClientMessage(playerid, COLOR_WHITE,coordsstring);
		format(coordsstring, sizeof(coordsstring), "Locked: %d EntryFee: $%d Till: $%d", SBizzInfo[targetid][sbLocked], SBizzInfo[targetid][sbEntranceCost], SBizzInfo[targetid][sbTill]);
		SendClientMessage(playerid, COLOR_GRAD1,coordsstring);
		format(coordsstring, sizeof(coordsstring), "Products: %d/%d Extortion By: %s", SBizzInfo[targetid][sbProducts],SBizzInfo[targetid][sbMaxProducts],SBizzInfo[targetid][sbExtortion]);
		SendClientMessage(playerid, COLOR_GRAD2,coordsstring);
		SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	}
}

public PrintBizInfo(playerid,targetid)
{
    if(IsPlayerConnected(playerid))
	{
		new coordsstring[256];
		SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
		format(coordsstring, sizeof(coordsstring),"*** %s ***",BizzInfo[targetid][bMessage]);
		SendClientMessage(playerid, COLOR_WHITE,coordsstring);
		format(coordsstring, sizeof(coordsstring), "Locked: %d EntryFee: $%d Till: $%d", BizzInfo[targetid][bLocked], BizzInfo[targetid][bEntranceCost], BizzInfo[targetid][bTill]);
		SendClientMessage(playerid, COLOR_GRAD1,coordsstring);
		format(coordsstring, sizeof(coordsstring), "Products: %d/%d Extortion By: %s", BizzInfo[targetid][bProducts],BizzInfo[targetid][bMaxProducts],BizzInfo[targetid][bExtortion]);
		SendClientMessage(playerid, COLOR_GRAD2,coordsstring);
		SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	}
}

public ShowStats(playerid,targetid)
{
    if(IsPlayerConnected(playerid)&&IsPlayerConnected(targetid))
	{
		new cash =  GetPlayerMoney(targetid);
		new atext[20];
		if(PlayerInfo[targetid][pSex] == 1) { atext = "Male"; }
		else if(PlayerInfo[targetid][pSex] == 2) { atext = "Female"; }
  		new otext[20];
		if(PlayerInfo[targetid][pOrigin] == 1) { otext = "USA"; }
		else if(PlayerInfo[targetid][pOrigin] == 2) { otext = "Europe"; }
		else if(PlayerInfo[targetid][pOrigin] == 3) { otext = "Asia"; }
		new ttext[20];
		if(PlayerInfo[targetid][pMember] == 4 || PlayerInfo[targetid][pLeader] == 4) { ttext = "Medic"; }
		else if(gTeam[targetid] == 3 || gTeam[targetid] == 4) { ttext = "Civilian"; }
		else if(PlayerInfo[targetid][pMember] == 1 || PlayerInfo[targetid][pLeader] == 1) { ttext = "Officer"; }
		else if(PlayerInfo[targetid][pMember] == 2 || PlayerInfo[targetid][pLeader] == 2) { ttext = "FBI Agent"; }
		else if(PlayerInfo[targetid][pMember] == 3 || PlayerInfo[targetid][pLeader] == 3) { ttext = "National Guard"; }
		else if(PlayerInfo[targetid][pMember] == 4 || PlayerInfo[targetid][pLeader] == 4) { ttext = "Firemen/Paramedic"; }
		else if(PlayerInfo[targetid][pMember] == 5 || PlayerInfo[targetid][pLeader] == 5) { ttext = "LCN"; }
		else if(PlayerInfo[targetid][pMember] == 6 || PlayerInfo[targetid][pLeader] == 6) { ttext = "Yakuza"; }
		else if(PlayerInfo[targetid][pMember] == 8 || PlayerInfo[targetid][pLeader] == 8) { ttext = "Hitmen"; }
		else if(PlayerInfo[targetid][pMember] == 9 || PlayerInfo[targetid][pLeader] == 9) { ttext = "News Reporter"; }
		else if(PlayerInfo[targetid][pMember] == 10 || PlayerInfo[targetid][pLeader] == 10) { ttext = "Taxi"; }
		else if(PlayerInfo[targetid][pMember] == 11 || PlayerInfo[targetid][pLeader] == 11) { ttext = "School Instructor"; }
		new dtext[20];
		if(STDPlayer[targetid] == 1) { dtext = "Chlamydia"; }
		else if(STDPlayer[targetid] == 2) { dtext = "Gonorrhea"; }
		else if(STDPlayer[targetid] == 3) { dtext = "Syphilis"; }
		else { dtext = "None"; }
	    new ftext[20];
	    if(PlayerInfo[targetid][pMember] == 4 || PlayerInfo[targetid][pLeader] == 4)
		{ ftext = "Firemen/Paramedics"; }
  		else if(PlayerInfo[targetid][pMember] == 5 || PlayerInfo[targetid][pLeader] == 5)
		{ ftext = "La Cosa Nostra"; }
		else if(PlayerInfo[targetid][pMember] == 6 || PlayerInfo[targetid][pLeader] == 6)
		{ ftext = "Yakuza"; }
		else if(PlayerInfo[targetid][pMember] == 11 || PlayerInfo[targetid][pLeader] == 11)
		{ ftext = "License Faction"; }
		else
		{ ftext = "None"; }
		new f2text[20];
	    if(PlayerInfo[targetid][pFMember] < 255) { f2text = FamilyInfo[PlayerInfo[targetid][pFMember]][FamilyName]; }
		else { f2text = "None"; }
	    new rtext[64];
	    if(gTeam[targetid] == 5 || PlayerInfo[targetid][pFMember] < 255)//The 2 Organisations
	    {
        	if(PlayerInfo[targetid][pRank] == 1) { rtext = "Outsider"; }
			else if(PlayerInfo[targetid][pRank] == 2) { rtext = "Associate"; }
			else if(PlayerInfo[targetid][pRank] == 3) { rtext = "Soldier"; }
			else if(PlayerInfo[targetid][pRank] == 4) { rtext = "Capo"; }
			else if(PlayerInfo[targetid][pRank] == 5) { rtext = "Underboss"; }
  			else if(PlayerInfo[targetid][pRank] == 6) { rtext = "Godfather"; }
			else { rtext = "Outsider"; }
		}
		else if(PlayerInfo[targetid][pMember] == 1 || PlayerInfo[targetid][pLeader] == 1)//PD Ranks
		{
		    if(PlayerInfo[targetid][pRank] == 1) { rtext = "Cadet"; }
			else if(PlayerInfo[targetid][pRank] == 2) { rtext = "Officer"; }
			else if(PlayerInfo[targetid][pRank] == 3) { rtext = "Sergeant"; }
			else if(PlayerInfo[targetid][pRank] == 4) { rtext = "Lieutenant"; }
			else if(PlayerInfo[targetid][pRank] == 5) { rtext = "Captain"; }
	        else if(PlayerInfo[targetid][pRank] == 6) { rtext = "Chief"; }
			else { rtext = "Cadet"; }
		}
		else if(PlayerInfo[targetid][pMember] == 2 || PlayerInfo[targetid][pLeader] == 2)//FBI Ranks
		{
		    if(PlayerInfo[targetid][pRank] == 1) { rtext = "Professional Staff"; }
			else if(PlayerInfo[targetid][pRank] == 2) { rtext = "Special Agent Trainee"; }
			else if(PlayerInfo[targetid][pRank] == 3) { rtext = "Special Agent"; }
			else if(PlayerInfo[targetid][pRank] == 4) { rtext = "Special Agent in Charge"; }
			else if(PlayerInfo[targetid][pRank] == 5) { rtext = "Assistant Director in Charge"; }
		    else if(PlayerInfo[targetid][pRank] == 6) { rtext = "Director"; }
			else { rtext = "Intern"; }
		}
		else if(PlayerInfo[targetid][pMember] == 3 || PlayerInfo[targetid][pLeader] == 3)//NG Ranks
		{
		    if(PlayerInfo[targetid][pRank] == 1) { rtext = "Private"; }
			else if(PlayerInfo[targetid][pRank] == 2) { rtext = "Sergeant"; }
			else if(PlayerInfo[targetid][pRank] == 3) { rtext = "Major"; }
			else if(PlayerInfo[targetid][pRank] == 4) { rtext = "Captain"; }
			else if(PlayerInfo[targetid][pRank] == 5) { rtext = "Lieutenant"; }
		    else if(PlayerInfo[targetid][pRank] == 6) { rtext = "General"; }
			else { rtext = "Private"; }
		}
		else if(PlayerInfo[targetid][pMember] == 8 || PlayerInfo[targetid][pLeader] == 8)//Hitman Ranks
		{
		    if(PlayerInfo[targetid][pRank] == 1) { rtext = "Freelancer"; }
			else if(PlayerInfo[targetid][pRank] == 2) { rtext = "Marksman"; }
			else if(PlayerInfo[targetid][pRank] == 3) { rtext = "Agent"; }
			else if(PlayerInfo[targetid][pRank] == 4) { rtext = "Special Agent"; }
			else if(PlayerInfo[targetid][pRank] == 5) { rtext = "Vice-Director"; }
		    else if(PlayerInfo[targetid][pRank] == 6) { rtext = "Director"; }
			else { rtext = "Freelancer"; }
		}
		else if(PlayerInfo[targetid][pMember] == 9 || PlayerInfo[targetid][pLeader] == 9)//NR Ranks
		{
		    if(PlayerInfo[targetid][pRank] == 1) { rtext = "Intern"; }
			else if(PlayerInfo[targetid][pRank] == 2) { rtext = "Local Reporter"; }
			else if(PlayerInfo[targetid][pRank] == 3) { rtext = "Local Editor"; }
			else if(PlayerInfo[targetid][pRank] == 4) { rtext = "Network Anchor"; }
			else if(PlayerInfo[targetid][pRank] == 5) { rtext = "Network Editor"; }
		    else if(PlayerInfo[targetid][pRank] == 6) { rtext = "Network Producer"; }
			else { rtext = "Intern"; }
		}
		else if(PlayerInfo[targetid][pMember] == 10 || PlayerInfo[targetid][pLeader] == 10)//Taxi Company Ranks
		{
		    if(PlayerInfo[targetid][pRank] == 1) { rtext = "Trainee"; }
			else if(PlayerInfo[targetid][pRank] == 2) { rtext = "Taxi Rookie"; }
			else if(PlayerInfo[targetid][pRank] == 3) { rtext = "Cabbie"; }
			else if(PlayerInfo[targetid][pRank] == 4) { rtext = "Dispatcher"; }
			else if(PlayerInfo[targetid][pRank] == 5) { rtext = "Shift Supervisor"; }
		    else if(PlayerInfo[targetid][pRank] == 6) { rtext = "Taxi Company Owner"; }
			else { rtext = "Trainee"; }
		}
		else if(IsAnInstructor(targetid))//Driving/Flying School Ranks
		{
		    if(PlayerInfo[targetid][pRank] == 1) { rtext = "Trainee"; }
			else if(PlayerInfo[targetid][pRank] == 2) { rtext = "Instructor"; }
			else if(PlayerInfo[targetid][pRank] == 3) { rtext = "Senior Instructor"; }
			else if(PlayerInfo[targetid][pRank] == 4) { rtext = "Manager"; }
			else if(PlayerInfo[targetid][pRank] == 5) { rtext = "Under Boss"; }
		    else if(PlayerInfo[targetid][pRank] == 6) { rtext = "Boss"; }
			else { rtext = "Trainee"; }
		}
		else
		{
		    rtext = "None";
		}
        new jtext[20];
        if(PlayerInfo[targetid][pJob] == 1) { jtext = "Detective"; }
        else if(PlayerInfo[targetid][pJob] == 2) { jtext = "Lawyer"; }
        else if(PlayerInfo[targetid][pJob] == 3) { jtext = "Whore"; }
        else if(PlayerInfo[targetid][pJob] == 4) { jtext = "Drugs Dealer"; }
        else if(PlayerInfo[targetid][pJob] == 5) { jtext = "Car Jacker"; }
        else if(PlayerInfo[targetid][pJob] == 6) { jtext = "News Reporter"; }
        else if(PlayerInfo[targetid][pJob] == 7) { jtext = "Car Mechanic"; }
        else if(PlayerInfo[targetid][pJob] == 8) { jtext = "Bodyguard"; }
        else if(PlayerInfo[targetid][pJob] == 9) { jtext = "Arms Dealer"; }
        else if(PlayerInfo[targetid][pJob] == 10) { jtext = "Car Dealer"; }
		else if(PlayerInfo[targetid][pJob] == 12) { jtext = "Boxer"; }
        else if(PlayerInfo[targetid][pJob] == 14) { jtext = "Bus Driver"; }
        else if(PlayerInfo[targetid][pJob] == 15) { jtext = "Paper Boy"; }
        else if(PlayerInfo[targetid][pJob] == 16) { jtext = "Trucker"; }
        else { jtext = "None"; }
		new drank[20];
		if(PlayerInfo[targetid][pDonateRank] == 1) { drank = "Power User"; }
		else if(PlayerInfo[targetid][pDonateRank] >= 2) { drank = "Donater"; }
		else { drank = "None"; }
		new married[20];
		strmid(married, PlayerInfo[targetid][pMarriedTo], 0, strlen(PlayerInfo[targetid][pMarriedTo]), 255);
		new age = PlayerInfo[targetid][pAge];
		new ptime = PlayerInfo[targetid][pConnectTime];
		new lotto = PlayerInfo[targetid][pLottoNr];
		new deaths = PlayerInfo[targetid][pDeaths];
		new fishes = PlayerInfo[targetid][pFishes];
		new bigfish = PlayerInfo[targetid][pBiggestFish];
		new crimes = PlayerInfo[targetid][pCrimes];
		new arrests = PlayerInfo[targetid][pArrested];
		new warrests = PlayerInfo[targetid][pWantedDeaths];
		new drugs = PlayerInfo[targetid][pDrugs];
		new mats = PlayerInfo[targetid][pMats];
		new wanted = WantedLevel[targetid];
		new level = PlayerInfo[targetid][pLevel];
		new exp = PlayerInfo[targetid][pExp];
		new kills = PlayerInfo[targetid][pKills];
		new pnumber = PlayerInfo[targetid][pPnumber];
		new account = PlayerInfo[targetid][pAccount];
		new nxtlevel = PlayerInfo[targetid][pLevel]+1;
		new expamount = nxtlevel*levelexp;
		new costlevel = nxtlevel*levelcost;//10k for testing purposes
		new housekey = PlayerInfo[targetid][pPhousekey];
		new bizkey = PlayerInfo[targetid][pPbiskey];
		new intir = PlayerInfo[targetid][pInt];
		new local = PlayerInfo[targetid][pLocal];
		new Float:shealth = PlayerInfo[targetid][pSHealth];
		new Float:health;
		new name[MAX_PLAYER_NAME];
		GetPlayerName(targetid, name, sizeof(name));
		GetPlayerHealth(targetid,health);
		new Float:px,Float:py,Float:pz;
		GetPlayerPos(targetid, px, py, pz);
		new coordsstring[256];
		SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
		format(coordsstring, sizeof(coordsstring),"*** %s ***",name);
		SendClientMessage(playerid, COLOR_WHITE,coordsstring);
		format(coordsstring, sizeof(coordsstring), "Level:[%d] Sex:[%s] Age:[%d] Origin:[%s] SpawnHealth:[%.1f] Cash:[$%d] Bank:[$%d] Ph:[%d]", level,atext,age,otext,shealth+50, cash, account, pnumber);
		SendClientMessage(playerid, COLOR_GRAD1,coordsstring);
		format(coordsstring, sizeof(coordsstring), "DonateRank:[%s] MarriedTo:[%s] PlayingHours:[%d] LottoNr:[%d] Job:[%s]", drank,married,ptime,lotto,jtext);
		SendClientMessage(playerid, COLOR_GRAD3,coordsstring);
		format(coordsstring, sizeof(coordsstring), "FishesCaught:[%d] BiggestFish:[%d] CrimesCommited:[%d] TimesArrested:[%d] WantedDeaths:[%d]", fishes,bigfish,crimes,arrests,warrests );
		SendClientMessage(playerid, COLOR_GRAD4,coordsstring);
		format(coordsstring, sizeof(coordsstring), "Kills:[%d] Deaths:[%d] NextLevel:[$%d] Respect:[%d/%d] WantedLevel:[%d] Family:[%s]",kills,deaths,costlevel,exp,expamount,wanted,f2text);
		SendClientMessage(playerid, COLOR_GRAD5,coordsstring);
		format(coordsstring, sizeof(coordsstring), "Drugs:[%d] Materials:[%d] Team:[%s] Disease:[%s] Organisation:[%s] Rank:[%s]",drugs,mats,ttext,dtext,ftext,rtext);
		SendClientMessage(playerid, COLOR_GRAD5,coordsstring);
		if (PlayerInfo[playerid][pAdmin] >= 1)
		{
			format(coordsstring, sizeof(coordsstring), "House key [%d] Business key [%d] HireKey [%d] int:[%d] local[%d]", housekey,bizkey,HireCar[targetid],intir,local);
			SendClientMessage(playerid, COLOR_GRAD6,coordsstring);
		}
		SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	}
}
//---------------------------------------------------------

public SetPlayerToTeamColor(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    SetPlayerColor(playerid,TEAM_HIT_COLOR); // white
	}
}

//---------------------------------------------------------

public GameModeInitExitFunc()
{
	new string[128];
	format(string, sizeof(string), "Traveling...");
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			DisablePlayerCheckpoint(i);
			gPlayerCheckpointStatus[i] = CHECKPOINT_NONE;
			GameTextForPlayer(i, string, 4000, 5);
			SetPlayerCameraPos(i,1460.0, -1324.0, 287.2);
			SetPlayerCameraLookAt(i,1374.5, -1291.1, 239.0);
			OnPlayerUpdate(i);
			gPlayerLogged[i] = 0;
		}
	}
	SetTimer("GameModeExitFunc", 4000, 0);
	return 1;
}

public GameModeExitFunc()
{
	KillTimer(synctimer);
	KillTimer(newmistimer);
	KillTimer(unjailtimer);
	KillTimer(othtimer);
	KillTimer(cartimer);
	KillTimer(accountstimer);
	KillTimer(checkgastimer);
	KillTimer(idletimer);
	KillTimer(pickuptimer);
	KillTimer(productiontimer);
	KillTimer(spectatetimer);
	KillTimer(stoppedvehtimer);
	KillTimer(turftimer);
	GameModeExit();
}

//------------------------------------------------------------------------------------------------------
public SaveMission(playerid,name[])
{
	if(IsPlayerConnected(playerid))
	{
	    new coordsstring[256];
	    new missionname[64];
		new var[128];
		new makername[MAX_PLAYER_NAME];
		GetPlayerName(playerid, makername, sizeof(makername));
		new rand = random(999);
		if(rand == 0) { rand = 1; }
		new number = rand;
		if(MissionInfo[mToggle] == 0 || MissionInfo[mToggle] == 1) { }
		else { MissionInfo[mToggle] = 1; }
		format(missionname, sizeof(missionname), "%s.mis",name);
		new File: hFile = fopen(missionname, io_write);
		format(var, 128, "Title=%s\n", MissionInfo[mTitle]);fwrite(hFile, var);
		format(var, 128, "Maker=%s\n", makername);fwrite(hFile, var);
		format(var, 128, "Text1=%s\n", MissionInfo[mText1]);fwrite(hFile, var);
		format(var, 128, "Text2=%s\n", MissionInfo[mText2]);fwrite(hFile, var);
		format(var, 128, "Text3=%s\n", MissionInfo[mText3]);fwrite(hFile, var);
		format(var, 128, "Text4=%s\n", MissionInfo[mText4]);fwrite(hFile, var);
		format(var, 128, "Text5=%s\n", MissionInfo[mText5]);fwrite(hFile, var);
		format(var, 128, "Text6=%s\n", MissionInfo[mText6]);fwrite(hFile, var);
		format(var, 128, "Text7=%s\n", MissionInfo[mText7]);fwrite(hFile, var);
		format(var, 128, "Text8=%s\n", MissionInfo[mText8]);fwrite(hFile, var);
		format(var, 128, "Text9=%s\n", MissionInfo[mText9]);fwrite(hFile, var);
		format(var, 128, "Text10=%s\n", MissionInfo[mText10]);fwrite(hFile, var);
		format(var, 128, "Text11=%s\n", MissionInfo[mText11]);fwrite(hFile, var);
		format(var, 128, "Text12=%s\n", MissionInfo[mText12]);fwrite(hFile, var);
		format(var, 128, "Text13=%s\n", MissionInfo[mText13]);fwrite(hFile, var);
		format(var, 128, "Text14=%s\n", MissionInfo[mText14]);fwrite(hFile, var);
		format(var, 128, "Text15=%s\n", MissionInfo[mText15]);fwrite(hFile, var);
		format(var, 128, "Text16=%s\n", MissionInfo[mText16]);fwrite(hFile, var);
		format(var, 128, "Text17=%s\n", MissionInfo[mText17]);fwrite(hFile, var);
		format(var, 128, "Text18=%s\n", MissionInfo[mText18]);fwrite(hFile, var);
		format(var, 128, "GText1=%s\n", MissionInfo[mGText1]);fwrite(hFile, var);
		format(var, 128, "GText2=%s\n", MissionInfo[mGText2]);fwrite(hFile, var);
		format(var, 128, "GText3=%s\n", MissionInfo[mGText3]);fwrite(hFile, var);
		format(var, 128, "GText4=%s\n", MissionInfo[mGText4]);fwrite(hFile, var);
		format(var, 128, "GText5=%s\n", MissionInfo[mGText5]);fwrite(hFile, var);
		format(var, 128, "GText6=%s\n", MissionInfo[mGText6]);fwrite(hFile, var);
		format(var, 128, "CP1X=%f\n", MissionInfo[mCP1][0]);fwrite(hFile, var);
		format(var, 128, "CP1Y=%f\n", MissionInfo[mCP1][1]);fwrite(hFile, var);
		format(var, 128, "CP1Z=%f\n", MissionInfo[mCP1][2]);fwrite(hFile, var);
		format(var, 128, "CP2X=%f\n", MissionInfo[mCP2][0]);fwrite(hFile, var);
		format(var, 128, "CP2Y=%f\n", MissionInfo[mCP2][1]);fwrite(hFile, var);
		format(var, 128, "CP2Z=%f\n", MissionInfo[mCP2][2]);fwrite(hFile, var);
		format(var, 128, "CP3X=%f\n", MissionInfo[mCP3][0]);fwrite(hFile, var);
		format(var, 128, "CP3Y=%f\n", MissionInfo[mCP3][1]);fwrite(hFile, var);
		format(var, 128, "CP3Z=%f\n", MissionInfo[mCP3][2]);fwrite(hFile, var);
		format(var, 128, "CP4X=%f\n", MissionInfo[mCP4][0]);fwrite(hFile, var);
		format(var, 128, "CP4Y=%f\n", MissionInfo[mCP4][1]);fwrite(hFile, var);
		format(var, 128, "CP4Z=%f\n", MissionInfo[mCP4][2]);fwrite(hFile, var);
		format(var, 128, "CP5X=%f\n", MissionInfo[mCP5][0]);fwrite(hFile, var);
		format(var, 128, "CP5Y=%f\n", MissionInfo[mCP5][1]);fwrite(hFile, var);
		format(var, 128, "CP5Z=%f\n", MissionInfo[mCP5][2]);fwrite(hFile, var);
		format(var, 128, "CP6X=%f\n", MissionInfo[mCP6][0]);fwrite(hFile, var);
		format(var, 128, "CP6Y=%f\n", MissionInfo[mCP6][1]);fwrite(hFile, var);
		format(var, 128, "CP6Z=%f\n", MissionInfo[mCP6][2]);fwrite(hFile, var);
		format(var, 128, "Number=%d\n", number);fwrite(hFile, var);
		format(var, 128, "Reward=%d\n", MissionInfo[mReward]);fwrite(hFile, var);
		format(var, 128, "Toggle=%d\n", MissionInfo[mToggle]);fwrite(hFile, var);
		fclose(hFile);
		format(coordsstring, sizeof(coordsstring), "%s Mission Saved.",name);
		SendClientMessage(playerid, COLOR_GREEN,coordsstring);
	}
	return 1;
}

public LoadMission(playerid,name[])
{
	if(IsPlayerConnected(playerid))
	{
		new strFromFile2[128];
		new missionname[64];
		format(missionname, sizeof(missionname), "%s.mis",name);
		new File: file = fopen(missionname, io_read);
		if (file)
		{
		    new key[ 256 ] , val[ 256 ];
		    new Data[ 256 ];
		    while ( fread( file , Data , sizeof( Data ) ) )
			{
				key = ini_GetKey( Data );
				if( strcmp( key , "Title" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kTitle], val, 0, strlen(val), 255); }
				if( strcmp( key , "Maker" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kMaker], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text1" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText1], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text2" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText2], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text3" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText3], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text4" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText4], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text5" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText5], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text6" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText6], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text7" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText7], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text8" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText8], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text9" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText9], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text10" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText10], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text11" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText11], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text12" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText12], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text13" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText13], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text14" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText14], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text15" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText15], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text16" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText16], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text17" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText17], val, 0, strlen(val), 255); }
				if( strcmp( key , "Text18" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kText18], val, 0, strlen(val), 255); }
				if( strcmp( key , "GText1" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kGText1], val, 0, strlen(val), 255); }
				if( strcmp( key , "GText2" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kGText2], val, 0, strlen(val), 255); }
				if( strcmp( key , "GText3" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kGText3], val, 0, strlen(val), 255); }
				if( strcmp( key , "GText4" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kGText4], val, 0, strlen(val), 255); }
				if( strcmp( key , "GText5" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kGText5], val, 0, strlen(val), 255); }
				if( strcmp( key , "GText6" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayMission[kGText6], val, 0, strlen(val), 255); }
				if( strcmp( key , "CP1X" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP1][0] = floatstr( val ); }
				if( strcmp( key , "CP1Y" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP1][1] = floatstr( val ); }
				if( strcmp( key , "CP1Z" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP1][2] = floatstr( val ); }
				if( strcmp( key , "CP2X" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP2][0] = floatstr( val ); }
				if( strcmp( key , "CP2Y" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP2][1] = floatstr( val ); }
				if( strcmp( key , "CP2Z" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP2][2] = floatstr( val ); }
				if( strcmp( key , "CP3X" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP3][0] = floatstr( val ); }
				if( strcmp( key , "CP3Y" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP3][1] = floatstr( val ); }
				if( strcmp( key , "CP3Z" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP3][2] = floatstr( val ); }
				if( strcmp( key , "CP4X" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP4][0] = floatstr( val ); }
				if( strcmp( key , "CP4Y" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP4][1] = floatstr( val ); }
				if( strcmp( key , "CP4Z" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP4][2] = floatstr( val ); }
				if( strcmp( key , "CP5X" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP5][0] = floatstr( val ); }
				if( strcmp( key , "CP5Y" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP5][1] = floatstr( val ); }
				if( strcmp( key , "CP5Z" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP5][2] = floatstr( val ); }
				if( strcmp( key , "CP6X" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP6][0] = floatstr( val ); }
				if( strcmp( key , "CP6Y" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP6][1] = floatstr( val ); }
				if( strcmp( key , "CP6Z" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kCP6][2] = floatstr( val ); }
				if( strcmp( key , "Number" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kNumber] = strval( val ); }
				if( strcmp( key , "Reward" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kReward] = strval( val ); }
				if( strcmp( key , "Toggle" , true ) == 0 ) { val = ini_GetValue( Data ); PlayMission[kToggle] = strval( val ); }
			}
			fclose(file);
			format(strFromFile2, sizeof(strFromFile2), "%s Mission Loaded.",name);
			SendClientMessage(playerid, COLOR_GREEN,strFromFile2);
			format(strFromFile2, sizeof(strFromFile2), "Mission Available: %s, By : %s | Reward: $%d",PlayMission[kTitle],PlayMission[kMaker],PlayMission[kReward]);
			SendClientMessageToAll(COLOR_GREEN, strFromFile2);
			MissionPlayable = PlayMission[kNumber];
		}
		else
		{
			SendClientMessage(playerid, COLOR_GREEN,"Mission File not found.");
		}
	}
	return 1;
}

public LoadBoxer()
{
	new arrCoords[3][64];
	new strFromFile2[256];
	new File: file = fopen("boxer.ini", io_read);
	if (file)
	{
		fread(file, strFromFile2);
		split(strFromFile2, arrCoords, ',');
		Titel[TitelWins] = strval(arrCoords[0]);
		strmid(Titel[TitelName], arrCoords[1], 0, strlen(arrCoords[1]), 255);
		Titel[TitelLoses] = strval(arrCoords[2]);
		fclose(file);
	}
	return 1;
}

public SaveBoxer()
{
	new coordsstring[256];
	format(coordsstring, sizeof(coordsstring), "%d,%s,%d", Titel[TitelWins],Titel[TitelName],Titel[TitelLoses]);
	new File: file2 = fopen("boxer.ini", io_write);
	fwrite(file2, coordsstring);
	fclose(file2);
	return 1;
}

public LoadStuff()
{
	new arrCoords[4][64];
	new strFromFile2[256];
	new File: file = fopen("stuff.ini", io_read);
	if (file)
	{
		fread(file, strFromFile2);
		split(strFromFile2, arrCoords, ',');
		Jackpot = strval(arrCoords[0]);
		Tax = strval(arrCoords[1]);
		TaxValue = strval(arrCoords[2]);
		Security = strval(arrCoords[3]);
		fclose(file);
		if(Security == 0 || Security == 1)
		{
		}
		else
		{
		    GameModeExit();
		}
	}
	else
	{
	    GameModeExit();
	}
	return 1;
}

public SaveStuff()
{
	new coordsstring[256];
	format(coordsstring, sizeof(coordsstring), "%d,%d,%d,%d", Jackpot,Tax,TaxValue,Security);
	new File: file2 = fopen("stuff.ini", io_write);
	fwrite(file2, coordsstring);
	fclose(file2);
	return 1;
}

public LoadIRC()
{
	new arrCoords[5][64];
	new strFromFile2[256];
	new File: file = fopen("channels.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(IRCInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, '|');
			strmid(IRCInfo[idx][iAdmin], arrCoords[0], 0, strlen(arrCoords[0]), 255);
			strmid(IRCInfo[idx][iMOTD], arrCoords[1], 0, strlen(arrCoords[1]), 255);
			strmid(IRCInfo[idx][iPassword], arrCoords[2], 0, strlen(arrCoords[2]), 255);
			IRCInfo[idx][iNeedPass] = strval(arrCoords[3]);
			IRCInfo[idx][iLock] = strval(arrCoords[4]);
			printf("IRC:%d Admin:%s MOTD: %s Password: %s NeedPass: %d Lock: %d",idx,IRCInfo[idx][iAdmin],IRCInfo[idx][iMOTD],IRCInfo[idx][iPassword],IRCInfo[idx][iNeedPass],IRCInfo[idx][iLock]);
			idx++;
		}
		fclose(file);
	}
	return 1;
}

public SaveIRC()
{
	new idx;
	new File: file2;
	while (idx < sizeof(IRCInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%s|%s|%s|%d|%d\n",
		IRCInfo[idx][iAdmin],
		IRCInfo[idx][iMOTD],
		IRCInfo[idx][iPassword],
		IRCInfo[idx][iNeedPass],
		IRCInfo[idx][iLock]);
		if(idx == 0)
		{
			file2 = fopen("channels.cfg", io_write);
		}
		else
		{
			file2 = fopen("channels.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	return 1;
}

public LoadTurfs()
{
	new arrCoords[6][64];
	new strFromFile2[256];
	new File: file = fopen("turfs.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(TurfInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, '|');
			strmid(TurfInfo[idx][zOwner], arrCoords[0], 0, strlen(arrCoords[0]), 255);
			strmid(TurfInfo[idx][zColor], arrCoords[1], 0, strlen(arrCoords[1]), 255);
			TurfInfo[idx][zMinX] = floatstr(arrCoords[2]);
			TurfInfo[idx][zMinY] = floatstr(arrCoords[3]);
			TurfInfo[idx][zMaxX] = floatstr(arrCoords[4]);
			TurfInfo[idx][zMaxY] = floatstr(arrCoords[5]);
			//printf("Turf:%d Name: %s Owner:%s MinX:%f MinY:%f MinZ:%f MaxX:%f MaxY:%f MaxZ:%f\n",
			//idx,TurfInfo[idx][zName],TurfInfo[idx][zOwner],TurfInfo[idx][zMinX],TurfInfo[idx][zMinY],TurfInfo[idx][zMinZ],TurfInfo[idx][zMaxX],TurfInfo[idx][zMaxY],TurfInfo[idx][zMaxZ]);
			idx++;
		}
		fclose(file);
	}
	return 1;
}

public SaveTurfs()
{
	new idx;
	new File: file2;
	while (idx < sizeof(TurfInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%s|%s|%f|%f|%f|%f|%f|%f\n",
		TurfInfo[idx][zOwner],
		TurfInfo[idx][zColor],
		TurfInfo[idx][zMinX],
		TurfInfo[idx][zMinY],
		TurfInfo[idx][zMaxX],
		TurfInfo[idx][zMaxY]);
		if(idx == 0)
		{
			file2 = fopen("turfs.cfg", io_write);
		}
		else
		{
			file2 = fopen("turfs.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	return 1;
}

public LoadCK()
{
	new arrCoords[3][64];
	new strFromFile2[256];
	new File: file = fopen("ck.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(CKInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, '|');
			strmid(CKInfo[idx][cSendername], arrCoords[0], 0, strlen(arrCoords[0]), 255);
			strmid(CKInfo[idx][cGiveplayer], arrCoords[1], 0, strlen(arrCoords[1]), 255);
			CKInfo[idx][cUsed] = strval(arrCoords[2]);
			printf("CK:%d Taken: %d Sendername:%s Giveplayer: %s",
			idx,CKInfo[idx][cUsed],CKInfo[idx][cSendername],CKInfo[idx][cGiveplayer]);
			idx++;
		}
		fclose(file);
	}
	return 1;
}

public SaveCK()
{
	new idx;
	new File: file2;
	while (idx < sizeof(CKInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%s|%s|%d\n",
		CKInfo[idx][cSendername],
		CKInfo[idx][cGiveplayer],
		CKInfo[idx][cUsed]);
		if(idx == 0)
		{
			file2 = fopen("ck.cfg", io_write);
		}
		else
		{
			file2 = fopen("ck.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	return 1;
}

public LoadFamilies()
{
	new arrCoords[11][64];
	new strFromFile2[256];
	new File: file = fopen("families.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(FamilyInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, '|');
			FamilyInfo[idx][FamilyTaken] = strval(arrCoords[0]);
			strmid(FamilyInfo[idx][FamilyName], arrCoords[1], 0, strlen(arrCoords[1]), 255);
			strmid(FamilyInfo[idx][FamilyMOTD], arrCoords[2], 0, strlen(arrCoords[2]), 255);
			strmid(FamilyInfo[idx][FamilyColor], arrCoords[3], 0, strlen(arrCoords[3]), 255);
			strmid(FamilyInfo[idx][FamilyLeader], arrCoords[4], 0, strlen(arrCoords[4]), 255);
			FamilyInfo[idx][FamilyMembers] = strval(arrCoords[5]);
			FamilyInfo[idx][FamilySpawn][0] = floatstr(arrCoords[6]);
			FamilyInfo[idx][FamilySpawn][1] = floatstr(arrCoords[7]);
			FamilyInfo[idx][FamilySpawn][2] = floatstr(arrCoords[8]);
			FamilyInfo[idx][FamilySpawn][3] = floatstr(arrCoords[9]);
			FamilyInfo[idx][FamilyInterior] = strval(arrCoords[10]);
			printf("Family:%d Taken: %d Name:%s MOTD:%s Leader:%s Members:%d SpawnX:%f SpawnY:%f SpawnZ:%f Int:%d",
			idx,FamilyInfo[idx][FamilyTaken],FamilyInfo[idx][FamilyName],FamilyInfo[idx][FamilyMOTD],FamilyInfo[idx][FamilyLeader],FamilyInfo[idx][FamilyMembers],FamilyInfo[idx][FamilySpawn][0],FamilyInfo[idx][FamilySpawn][1],FamilyInfo[idx][FamilySpawn][2],FamilyInfo[idx][FamilyInterior]);
			idx++;
		}
		fclose(file);
	}
	return 1;
}

public SaveFamilies()
{
	new idx;
	new File: file2;
	while (idx < sizeof(FamilyInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%d|%s|%s|%s|%s|%d|%f|%f|%f|%f|%d\n",
		FamilyInfo[idx][FamilyTaken],
		FamilyInfo[idx][FamilyName],
		FamilyInfo[idx][FamilyMOTD],
		FamilyInfo[idx][FamilyColor],
		FamilyInfo[idx][FamilyLeader],
		FamilyInfo[idx][FamilyMembers],
		FamilyInfo[idx][FamilySpawn][0],
		FamilyInfo[idx][FamilySpawn][1],
		FamilyInfo[idx][FamilySpawn][2],
		FamilyInfo[idx][FamilySpawn][3],
		FamilyInfo[idx][FamilyInterior]);
		if(idx == 0)
		{
			file2 = fopen("families.cfg", io_write);
		}
		else
		{
			file2 = fopen("families.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	return 1;
}

public LoadPapers()
{
	new arrCoords[11][64];
	new strFromFile2[256];
	new File: file = fopen("papers.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(PaperInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, '|');
			PaperInfo[idx][PaperUsed] = strval(arrCoords[0]);
			strmid(PaperInfo[idx][PaperMaker], arrCoords[1], 0, strlen(arrCoords[1]), 255);
			strmid(PaperInfo[idx][PaperTitle], arrCoords[2], 0, strlen(arrCoords[2]), 255);
			strmid(PaperInfo[idx][PaperText1], arrCoords[3], 0, strlen(arrCoords[3]), 255);
			strmid(PaperInfo[idx][PaperText2], arrCoords[4], 0, strlen(arrCoords[4]), 255);
			strmid(PaperInfo[idx][PaperText3], arrCoords[5], 0, strlen(arrCoords[5]), 255);
			strmid(PaperInfo[idx][PaperText4], arrCoords[6], 0, strlen(arrCoords[6]), 255);
			strmid(PaperInfo[idx][PaperText5], arrCoords[7], 0, strlen(arrCoords[7]), 255);
			strmid(PaperInfo[idx][PaperText6], arrCoords[8], 0, strlen(arrCoords[8]), 255);
			strmid(PaperInfo[idx][PaperText7], arrCoords[9], 0, strlen(arrCoords[9]), 255);
			PaperInfo[idx][SafeSaving] = strval(arrCoords[10]);
			printf("Paper:%d Used: %d Maker:%s Title: %s Text1: %s Text2: %s Text3: %s Text4: %s Text5: %s Text6: %s Text7: %s",
			idx,PaperInfo[idx][PaperUsed],PaperInfo[idx][PaperMaker],PaperInfo[idx][PaperTitle],PaperInfo[idx][PaperText1],PaperInfo[idx][PaperText2],PaperInfo[idx][PaperText3],PaperInfo[idx][PaperText4],PaperInfo[idx][PaperText5],PaperInfo[idx][PaperText6],PaperInfo[idx][PaperText7]);
			idx++;
		}
		fclose(file);
	}
	return 1;
}

public SavePapers()
{
	new idx;
	new File: file2;
	while (idx < sizeof(IRCInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%d|%s|%s|%s|%s|%s|%s|%s|%s|%s|%d\n",
		PaperInfo[idx][PaperUsed],
		PaperInfo[idx][PaperMaker],
		PaperInfo[idx][PaperTitle],
		PaperInfo[idx][PaperText1],
		PaperInfo[idx][PaperText2],
		PaperInfo[idx][PaperText3],
		PaperInfo[idx][PaperText4],
		PaperInfo[idx][PaperText5],
		PaperInfo[idx][PaperText6],
		PaperInfo[idx][PaperText7],
		PaperInfo[idx][SafeSaving]);
		if(idx == 0)
		{
			file2 = fopen("papers.cfg", io_write);
		}
		else
		{
			file2 = fopen("papers.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	return 1;
}

public LoadProperty()
{
	new arrCoords[29][64];
	new strFromFile2[256];
	new File: file = fopen("property.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(HouseInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, ',');
			HouseInfo[idx][hEntrancex] = floatstr(arrCoords[0]);
			HouseInfo[idx][hEntrancey] = floatstr(arrCoords[1]);
			HouseInfo[idx][hEntrancez] = floatstr(arrCoords[2]);
			HouseInfo[idx][hExitx] = floatstr(arrCoords[3]);
			HouseInfo[idx][hExity] = floatstr(arrCoords[4]);
			HouseInfo[idx][hExitz] = floatstr(arrCoords[5]);
			HouseInfo[idx][hHealthx] = strval(arrCoords[6]);
			HouseInfo[idx][hHealthy] = strval(arrCoords[7]);
			HouseInfo[idx][hHealthz] = strval(arrCoords[8]);
			HouseInfo[idx][hArmourx] = strval(arrCoords[9]);
			HouseInfo[idx][hArmoury] = strval(arrCoords[10]);
			HouseInfo[idx][hArmourz] = strval(arrCoords[11]);
			//printf("HouseInfo hEntrancez %f",HouseInfo[idx][hEntrancez]);
			strmid(HouseInfo[idx][hOwner], arrCoords[12], 0, strlen(arrCoords[12]), 255);
			strmid(HouseInfo[idx][hDiscription], arrCoords[13], 0, strlen(arrCoords[13]), 255);
			HouseInfo[idx][hValue] = strval(arrCoords[14]);
			HouseInfo[idx][hHel] = strval(arrCoords[15]);
			HouseInfo[idx][hArm] = strval(arrCoords[16]);
			HouseInfo[idx][hInt] = strval(arrCoords[17]);
			HouseInfo[idx][hLock] = strval(arrCoords[18]);
			HouseInfo[idx][hOwned] = strval(arrCoords[19]);
			HouseInfo[idx][hRooms] = strval(arrCoords[20]);
			HouseInfo[idx][hRent] = strval(arrCoords[21]);
			HouseInfo[idx][hRentabil] = strval(arrCoords[22]);
			HouseInfo[idx][hTakings] = strval(arrCoords[23]);
			HouseInfo[idx][hVec] = strval(arrCoords[24]);
  	        if(HouseInfo[idx][hVec] == 457)
			{
				HouseInfo[idx][hVec] = 411;
			}
			HouseInfo[idx][hVcol1] = strval(arrCoords[25]);
			HouseInfo[idx][hVcol2] = strval(arrCoords[26]);
			HouseInfo[idx][hDate] = strval(arrCoords[27]);
			HouseInfo[idx][hLevel] = strval(arrCoords[28]);
			printf("HouseInfo:%d Owner:%s hTakings %d hVec %d",idx,HouseInfo[idx][hOwner],HouseInfo[idx][hTakings],HouseInfo[idx][hVec]);
			idx++;
		}
		fclose(file);
	}
	return 1;
}

public LoadBizz()
{
	new arrCoords[19][64];
	new strFromFile2[256];
	new File: file = fopen("bizz.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(BizzInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, '|');
			BizzInfo[idx][bOwned] = strval(arrCoords[0]);
			strmid(BizzInfo[idx][bOwner], arrCoords[1], 0, strlen(arrCoords[1]), 255);
			strmid(BizzInfo[idx][bMessage], arrCoords[2], 0, strlen(arrCoords[2]), 255);
			strmid(BizzInfo[idx][bExtortion], arrCoords[3], 0, strlen(arrCoords[3]), 255);
			BizzInfo[idx][bEntranceX] = floatstr(arrCoords[4]);
			BizzInfo[idx][bEntranceY] = floatstr(arrCoords[5]);
			BizzInfo[idx][bEntranceZ] = floatstr(arrCoords[6]);
			BizzInfo[idx][bExitX] = floatstr(arrCoords[7]);
			BizzInfo[idx][bExitY] = floatstr(arrCoords[8]);
			BizzInfo[idx][bExitZ] = floatstr(arrCoords[9]);
			BizzInfo[idx][bLevelNeeded] = strval(arrCoords[10]);
			BizzInfo[idx][bBuyPrice] = strval(arrCoords[11]);
			BizzInfo[idx][bEntranceCost] = strval(arrCoords[12]);
			BizzInfo[idx][bTill] = strval(arrCoords[13]);
			BizzInfo[idx][bLocked] = strval(arrCoords[14]);
			BizzInfo[idx][bInterior] = strval(arrCoords[15]);
			BizzInfo[idx][bProducts] = strval(arrCoords[16]);
			BizzInfo[idx][bMaxProducts] = strval(arrCoords[17]);
			BizzInfo[idx][bPriceProd] = strval(arrCoords[18]);
			printf("BizzInfo:%d Owner:%s Message:%s Entfee:%d Till:%d Products:%d/%d Interior:%d.\n",
			idx,
			BizzInfo[idx][bOwner],
			BizzInfo[idx][bMessage],
			BizzInfo[idx][bEntranceCost],
			BizzInfo[idx][bTill],
			BizzInfo[idx][bProducts],
			BizzInfo[idx][bMaxProducts],
			BizzInfo[idx][bInterior]);
			idx++;
		}
		fclose(file);
	}
	return 1;
}


public LoadSBizz()
{
	new arrCoords[16][64];
	new strFromFile2[256];
	new File: file = fopen("sbizz.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(SBizzInfo))
		{
			fread(file, strFromFile2);
			split(strFromFile2, arrCoords, '|');
			SBizzInfo[idx][sbOwned] = strval(arrCoords[0]);
			strmid(SBizzInfo[idx][sbOwner], arrCoords[1], 0, strlen(arrCoords[1]), 255);
			strmid(SBizzInfo[idx][sbMessage], arrCoords[2], 0, strlen(arrCoords[2]), 255);
			strmid(SBizzInfo[idx][sbExtortion], arrCoords[3], 0, strlen(arrCoords[3]), 255);
			SBizzInfo[idx][sbEntranceX] = floatstr(arrCoords[4]);
			SBizzInfo[idx][sbEntranceY] = floatstr(arrCoords[5]);
			SBizzInfo[idx][sbEntranceZ] = floatstr(arrCoords[6]);
			SBizzInfo[idx][sbLevelNeeded] = strval(arrCoords[7]);
			SBizzInfo[idx][sbBuyPrice] = strval(arrCoords[8]);
			SBizzInfo[idx][sbEntranceCost] = strval(arrCoords[9]);
			SBizzInfo[idx][sbTill] = strval(arrCoords[10]);
			SBizzInfo[idx][sbLocked] = strval(arrCoords[11]);
			SBizzInfo[idx][sbInterior] = strval(arrCoords[12]);
			SBizzInfo[idx][sbProducts] = strval(arrCoords[13]);
			SBizzInfo[idx][sbMaxProducts] = strval(arrCoords[14]);
			SBizzInfo[idx][sbPriceProd] = strval(arrCoords[15]);
			printf("SBizzInfo:%d Owner:%s Message:%s Entfee:%d Till:%d Products:%d/%d Interior:%d.\n",
			idx,
			SBizzInfo[idx][sbOwner],
			SBizzInfo[idx][sbMessage],
			SBizzInfo[idx][sbEntranceCost],
			SBizzInfo[idx][sbTill],
			SBizzInfo[idx][sbProducts],
			SBizzInfo[idx][sbMaxProducts],
			SBizzInfo[idx][sbInterior]);
			idx++;
		}
		fclose(file);
	}
	return 1;
}

//------------------------------------------------------------------------------------------------------
public OnGameModeInit()
{
    new string[MAX_PLAYER_NAME];
    new string1[MAX_PLAYER_NAME];
	for(new c=0;c<CAR_AMOUNT;c++)
	{
		Gas[c] = GasMax;
	}
	LoadProperty();
	LoadBizz();
	LoadSBizz();
	LoadBoxer();
	LoadStuff();
	LoadIRC();
	LoadFamilies();
	LoadCK();
	LoadTurfs();
	LoadPapers();
	IRCInfo[0][iPlayers] = 0; IRCInfo[1][iPlayers] = 0; IRCInfo[2][iPlayers] = 0;
	IRCInfo[3][iPlayers] = 0; IRCInfo[4][iPlayers] = 0; IRCInfo[5][iPlayers] = 0;
	IRCInfo[6][iPlayers] = 0; IRCInfo[7][iPlayers] = 0; IRCInfo[8][iPlayers] = 0;
	IRCInfo[9][iPlayers] = 0;
	News[hTaken1] = 0; News[hTaken2] = 0; News[hTaken3] = 0; News[hTaken4] = 0; News[hTaken5] = 0;
	format(string, sizeof(string), "Nothing");
	strmid(News[hAdd1], string, 0, strlen(string), 255);
	strmid(News[hAdd2], string, 0, strlen(string), 255);
	strmid(News[hAdd3], string, 0, strlen(string), 255);
	strmid(News[hAdd4], string, 0, strlen(string), 255);
	strmid(News[hAdd5], string, 0, strlen(string), 255);
	format(string1, sizeof(string1), "No-one");
	strmid(News[hContact1], string1, 0, strlen(string1), 255);
	strmid(News[hContact2], string1, 0, strlen(string1), 255);
	strmid(News[hContact3], string1, 0, strlen(string1), 255);
	strmid(News[hContact4], string1, 0, strlen(string1), 255);
	strmid(News[hContact5], string1, 0, strlen(string1), 255);
	PlayerHaul[78][pCapasity] = 100;
	PlayerHaul[79][pCapasity] = 100;
	PlayerHaul[80][pCapasity] = 50;
	PlayerHaul[81][pCapasity] = 50;
	SetGameModeText("The Godfather: LS/SF");
	format(objstore, sizeof(objstore), "MOLE: I got nothing, check back with me later.");
	format(cbjstore, sizeof(cbjstore), "HQ: There is nothing in your Vicinity, Out.");
	format(motd, sizeof(motd), "Welcome to the Role Play - The Godfather Server.");
	gettime(ghour, gminute, gsecond);
	FixHour(ghour);
	ghour = shifthour;
	if(!realtime)
	{
		SetWorldTime(wtime);
	}
	SetPDistance(10);
	EnableTirePopping(1);
	EnableZoneNames(1);
	AllowInteriorWeapons(1);
	AllowAdminTeleport(1);
	UsePlayerPedAnims();
	// CreatedCars check
	for(new i = 0; i < sizeof(CreatedCars); i++)
	{
	    CreatedCars[i] = 0;
	}
	// Zones
	for(new i = 0; i < sizeof(TurfInfo); i++)
	{
	    Turfs[i] = GangZoneCreate(TurfInfo[i][zMinX],TurfInfo[i][zMinY],TurfInfo[i][zMaxX],TurfInfo[i][zMaxY]);
	}
	// Player Class's
	for(new i = 0; i <= sizeof(Peds)-1; i++)
	{
		AddPlayerClass(Peds[i][0],1958.3783,1343.1572,1100.3746,269.1425,-1,-1,-1,-1,-1,-1);
	}
	// Car Spawns
	for(new h = 0; h < sizeof(HouseInfo); h++)
	{
		AddStaticVehicleEx(HouseInfo[h][hVec], HouseCarSpawns[h][0], HouseCarSpawns[h][1], HouseCarSpawns[h][2], HouseCarSpawns[h][3], HouseInfo[h][hVcol1], HouseInfo[h][hVcol2], 60000);
		gCarLock[h+1] = 1;
	}//34
	AddStaticVehicleEx(596,-1381.9910,457.0832,6.9837,0.1452, 44, 86, 60000);/*Patriot cruiser*/
	AddStaticVehicleEx(596,1558.392000,-1710.859000,5.466783,1.0, -1, -1, 60000);/*CopCruiser*/
	AddStaticVehicleEx(596,1569.639000,-1710.859000,5.466783,1.0, -1, -1, 60000);/*CopCruiser*/
	AddStaticVehicleEx(596,-2139.1995,-2393.7671,30.3452,140.7012, 0, 0, 60000);/*CopCruiser*/
	AddStaticVehicleEx(425,-1279.8262,493.3734,18.0309,219.1345, -1, -1, 60000);/*Hunter*/
	AddStaticVehicleEx(425,-1291.0063,492.3819,18.0305,223.8306, -1, -1, 60000);/*Hunter*/
	AddStaticVehicleEx(596,1601.308000,-1621.916000,13.056540,90.0, -1, -1, 60000);/*CopCruiser*/
	AddStaticVehicleEx(596,1535.8275,-1678.0283,13.1680,359.9876, -1, -1, 60000);/*CopCruiser*/
	AddStaticVehicleEx(596,1561.860000,-1694.905000,6.139762,222.0,-1, -1, 60000);/*CopCruiser*/
	AddStaticVehicleEx(470,-1375.1555,457.5534,6.9837,359.8331,-1, -1, 60000);/*Patriot*/
	AddStaticVehicleEx(467,1067.1295,-295.5681,73.7826,179.6040, 90, -1, 60000);/*Hitman Oceanic*/
	AddStaticVehicleEx(467,1077.3829,-295.1148,73.7812,180.2754, 90, -1, 60000);/*Hitman Oceanic*/
	AddStaticVehicleEx(596,614.8,-588.5,17.4,240.0, -1, -1, 60000);/*CopCruiser*/
	AddStaticVehicleEx(596,635.1,-561.5,16.5,180.0, -1, -1, 60000);/*CopCruiser*/
	AddStaticVehicleEx(596,-2177.5759,-2362.5042,30.4296,141.0939, 0, 0, 60000);/*CopCruiser*/
	AddStaticVehicleEx(490,1539.392000,-1646.262000,6.274928,180.0, -1, -1, 60000);/*FBI Rancher*/
	AddStaticVehicleEx(490,1531.254000,-1647.431000,6.274976,200.0, -1, -1, 60000);/*FBI Rancher*/
	AddStaticVehicleEx(470,-1363.1493,457.1042,6.9836,359.6740, -1, -1, 60000);/*Patriot*/
	AddStaticVehicleEx(470,-1355.5931,456.7297,6.9836,0.0286, -1, -1, 60000);/*Patriot*/
	AddStaticVehicleEx(596,1535.8459,-1668.7560,13.2653,359.7447,-1, -1, 60000);/*CopCruiser*/
	AddStaticVehicleEx(407,-2550.1443,610.7148,14.3281,90.6597, -1, -1, 60000);/*FireTruck*/
	AddStaticVehicleEx(596,-2181.2766,-2375.6953,30.3405,231.7148, 0, 0, 60000);/*CopCruiser*/
	AddStaticVehicleEx(596,1545.7845,-1684.4004,5.6342,271.1593, 89, 1, 60000);/*General Car*/
	AddStaticVehicleEx(596,1530.1611,-1676.0326,5.4563,231.7766, 89, 1, 60000);/*General Car*/
	AddStaticVehicleEx(407,-2551.8792,587.1581,14.3281,90.4374,-1, -1, 60000);/*FireTruck*/
	AddStaticVehicleEx(497, 1517.8,-1656.1,13.7,0.0, -1, -1, 60000);/*Police Maveric*/
	AddStaticVehicleEx(416,-2637.0630,617.3499,14.3281,90.1464, -1, -1, 60000);/*Ambulance*/
	AddStaticVehicleEx(416,-2661.4282,617.3460,14.3288,89.2072, -1, -1, 60000);/*Ambulance*/
	AddStaticVehicleEx(416,-2662.4568,595.3354,14.3281,273.2716, -1, -1, 60000);/*Ambulance*/
	AddStaticVehicleEx(431,1172.5,-1795.5,13.1,0.0, -1, -1, 60000);//64/*Bus*/
	AddStaticVehicleEx(431,1182.1,-1795.9,13.1,0.0, -1, -1, 60000);//65/*Bus*/
	AddStaticVehicleEx(430,-1443.4342,427.0862,-0.6994,268.8489,-1, -1, 60000);/*NG BOAT*/
	AddStaticVehicleEx(430,-1442.0721,390.6206,-0.4339,270.1023,-1, -1, 60000);/*NG BOAT*/
	AddStaticVehicleEx(467,1071.9189,-294.9166,73.7250,178.9444,90, -1, 60000);//68/*Hitman Oceanic*/
	AddStaticVehicleEx(405,-2082.3562,-117.3896,34.9299,177.0056,17, 17, 60000);//69 Driving School /*Sentinel*/
	AddStaticVehicleEx(405,-2072.5933,-117.4564,34.9383,178.0982,17, 17, 60000);//Driving School/*Sentinel*/
	AddStaticVehicleEx(405,-2062.4253,-117.6652,34.9347,180.8394,17, 17, 60000);//Driving School/*Sentinel*/
	AddStaticVehicleEx(434,551.7929,-1285.5260,16.9303,0.4147,-1, -1, 60000);//Rent car/*Hotknife*/
	AddStaticVehicleEx(568,536.9888,-1286.5275,16.9993,359.1704,-1, -1, 60000); //Rent car/*Bandito*/
	AddStaticVehicleEx(434,544.1793,-1286.1422,16.9492,7.3116,-1, -1, 60000);//Rent car/*Hotknife*/
	AddStaticVehicleEx(434,-1949.9493,258.1949,35.1922,70.7581,-1, -1, 60000); //Rent car/*Hotknife*/
	AddStaticVehicleEx(568,-1948.1650,264.8094,35.1930,72.6982,-1, -1, 60000); //Rent car/*Bandito*/
	AddStaticVehicleEx(434,-1947.0601,270.3815,35.1954,66.0783,-1, -1, 60000); //Rent car/*Hotknife*/
	AddStaticVehicleEx(456,2795.2,-2417.8,13.4,90.8,-1,-1,60000);//Component Truck/*Yankee*/
	AddStaticVehicleEx(456,2783.9,-2417.9,13.4,90.8,-1,-1,60000);//Component Truck/*Yankee*/
	AddStaticVehicleEx(440,2794.1,-2455.9,13.4,90.8,-1,-1,60000);//Component Truck/*Rumpo*/
	AddStaticVehicleEx(440,2782.9,-2455.6,13.4,90.8,-1,-1,60000);//Component Truck/*Rumpo*/
	AddStaticVehicleEx(420,-1986.4958,115.9394,27.3324,0.1277,-1, -1, 60000);//Taxi/*Taxi*/
	AddStaticVehicleEx(487,-2703.3201,624.0250,14.1766,180.2649, 1, 3, 60000);//Medic Chopper/*Maverick*/
	AddStaticVehicleEx(420,-1986.5049,129.1749,27.3299,359.6938,-1, -1, 60000);//Taxi/*Taxi*/
	AddStaticVehicleEx(420,-1986.4310,150.1195,27.3299,0.0329,-1, -1, 60000);//Taxi //CAR ID 85/*Taxi*/
	AddStaticVehicleEx(452,720.1,-1694.0,-0.4,179.4,-1,-1,60000);//Fishboat/*Speeder*/
	AddStaticVehicleEx(452,721.2,-1629.4,-0.4,180.9,-1,-1,60000);//Fishboat/*Speeder*/
	AddStaticVehicleEx(452,739.5,-1670.5,-0.6,177.5,-1,-1,60000);//Fishboat/*Speeder*/
	AddStaticVehicleEx(452,-1474.4949,693.0169,0.1996,0.0751,-1,-1,60000);//Fishboat SF/*Speeder*/
	AddStaticVehicleEx(452,-1720.0717,1439.6177,-0.4913,357.6789,-1,-1,60000);//Fishboat SF/*Speeder*/
	AddStaticVehicleEx(520,-1430.4078,508.1596,18.9400,269.6329,44,86,60000);//NG Plane id 91
	AddStaticVehicleEx(520,-1419.9038,493.5340,18.9350,269.6848,44,86,60000);//NG Plane id 92
	AddStaticVehicleEx(520,-1398.6207,507.7513,18.9328,269.8143,44,86,60000); //NG Plane id 93
	AddStaticVehicleEx(420,-1986.6089,163.8508,27.4837,359.5881,-1,-1,60000);//Taxi
	AddStaticVehicleEx(487,1088.1736,-294.8004,73.7886,134.9237, 0, 1, 60000); //Hitman Chopper
	AddStaticVehicleEx(488,-2044.1797,479.9963,35.1399,180.0648,-1,-1,60000); // newschopper
	AddStaticVehicleEx(582,-2022.6146,458.6767,35.1414,0.7133,-1,-1,60000); // newsvan
	AddStaticVehicleEx(582,-2031.3779,459.0133,35.1362,359.7429,-1,-1,60000); // newsvan
	AddStaticVehicleEx(593,382.5172,2536.9561,16.5338,179.7261,-1,-1,60000);//Flyschool
	AddStaticVehicleEx(513,348.3660,2536.9792,16.7418,178.8195,-1,-1,60000);//Flyschool
	AddStaticVehicleEx(487,365.4068,2537.0327,16.6645,181.9959,-1,-1,60000);//Flyschool
	AddStaticVehicleEx(593,-1429.2843,-505.8203,13.7824,205.7709,-1,-1,60000);//Airport SF
	AddStaticVehicleEx(593,-1462.4779,-524.2803,13.7832,204.8137,-1,-1,60000);//Airport SF
	AddStaticVehicleEx(593,1907.7614,-2624.4097,13.5416,53.1810,-1,-1,60000);//Airport LS
	AddStaticVehicleEx(593,1887.0736,-2627.6543,13.5394,52.6116,-1,-1,60000);//Airport LS
	AddStaticVehicleEx(513,-1354.3270,-466.5467,13.7827,162.0134,-1,-1,60000);//Airport SF
	AddStaticVehicleEx(513,-1390.3510,-482.7985,13.7883,250.3124,-1,-1,60000);//Airport SF
	AddStaticVehicleEx(513,1835.3215,-2624.1938,13.5405,56.0569,-1,-1,60000);//Airport LS
	AddStaticVehicleEx(513,1813.2893,-2625.6296,13.5394,53.2858,-1,-1,60000);//Airport LS
	AddStaticVehicleEx(571,2286.2141,-2354.5000,12.8306,225.8705,-1,-1,60000); // kart
	AddStaticVehicleEx(571,2279.9412,-2348.4141,12.8312,225.8585,-1,-1,60000); // kart
	AddStaticVehicleEx(571,2291.7932,-2345.5356,12.8305,227.3060,-1,-1,60000); // kart
	AddStaticVehicleEx(571,2287.5615,-2341.6433,12.8306,226.5350,-1,-1,60000); // kart
	AddStaticVehicleEx(571,2299.6785,-2338.3186,12.8307,224.3563,-1,-1,60000); // kart
	AddStaticVehicleEx(571,2295.3887,-2334.9448,12.8307,227.9102,-1,-1,60000); // kart
	CreateVehicle(494,-1401.0436,-210.0052,1042.9913,1.6623,1,0,60000); //hotring 116
	CreateVehicle(494,-1400.4019,-219.9365,1043.0348,5.3554,1,3,60000); //hotring
	CreateVehicle(494,-1394.4932,-207.7917,1042.9963,3.6872,0,6,60000); //hotring
	CreateVehicle(494,-1393.7854,-217.9354,1043.0325,2.9556,1,2,60000); //hotring
	CreateVehicle(468,-1445.6392,-592.3033,1055.7831,90.2133,-1,-1,60000); //bike 120
	CreateVehicle(468,-1433.1708,-592.4930,1055.6533,92.4067,-1,-1,60000); //bike
	CreateVehicle(468,-1448.5325,-584.4943,1055.4949,95.5400,-1,-1,60000); //bike
	CreateVehicle(468,-1434.8973,-585.1266,1055.2488,91.1533,-1,-1,60000); //bike
	CreateVehicle(468,-1449.2814,1610.7823,1052.5313,272.9406,-1,-1,60000); // bike 124
	CreateVehicle(468,-1453.8767,1611.2418,1052.5313,89.0355,-1,-1,60000); // bike
	CreateVehicle(468,-1454.4746,1614.3342,1052.5313,86.8422,-1,-1,60000); // bike
	CreateVehicle(468,-1449.5795,1614.0684,1052.5313,269.2039,-1,-1,60000); // bike
    CreateVehicle(514,-77.5039,-1108.1729,1.6683,161.8915,-1,-1,60000); // truck
	CreateVehicle(514,-72.3507,-1109.7822,1.6670,161.7769,-1,-1,60000); // truck
	CreateVehicle(514,-67.0126,-1111.7156,1.6688,160.4800,-1,-1,60000); // truck
	CreateVehicle(435,-51.0638,-1135.2831,1.0781,68.3320,-1,-1,60000); // trailer
	CreateVehicle(435,-53.6230,-1139.7546,1.0781,67.5604,-1,-1,60000); // trailer
	CreateVehicle(435,-55.0517,-1144.3676,0.8018,68.1347,-1,-1,60000); // trailer
	LinkVehicleToInterior(116, 7);
	LinkVehicleToInterior(117, 7);
	LinkVehicleToInterior(118, 7);
	LinkVehicleToInterior(119, 7);
	LinkVehicleToInterior(120, 4);
	LinkVehicleToInterior(121, 4);
	LinkVehicleToInterior(122, 4);
	LinkVehicleToInterior(123, 4);
	LinkVehicleToInterior(124, 14);
	LinkVehicleToInterior(125, 14);
	LinkVehicleToInterior(126, 14);
	LinkVehicleToInterior(127, 14);
	for(new h = 0; h < sizeof(HouseInfo); h++)
	{
		if(HouseInfo[h][hOwned] == 0)
		{
			AddStaticPickup(1273, 2, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]);
			pickups++;
		}
		if(HouseInfo[h][hOwned] == 1)
		{
			AddStaticPickup(1239, 2, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]);
			pickups++;
		}
	}
	for(new h = 0; h < sizeof(BizzInfo); h++)
	{
		if(BizzInfo[h][bOwned] == 0)
		{
			AddStaticPickup(1272, 2, BizzInfo[h][bEntranceX], BizzInfo[h][bEntranceY], BizzInfo[h][bEntranceZ]);
			pickups++;
		}
		if(BizzInfo[h][bOwned] == 1)
		{
			AddStaticPickup(1239, 2, BizzInfo[h][bEntranceX], BizzInfo[h][bEntranceY], BizzInfo[h][bEntranceZ]);
			pickups++;
		}
	}
	for(new h = 0; h < sizeof(SBizzInfo); h++)
	{
		if(SBizzInfo[h][sbOwned] == 0)
		{
			AddStaticPickup(1272, 2, SBizzInfo[h][sbEntranceX], SBizzInfo[h][sbEntranceY], SBizzInfo[h][sbEntranceZ]);
			pickups++;
		}
		if(SBizzInfo[h][sbOwned] == 1)
		{
			AddStaticPickup(1239, 2, SBizzInfo[h][sbEntranceX], SBizzInfo[h][sbEntranceY], SBizzInfo[h][sbEntranceZ]);
			pickups++;
		}
	}
	AddStaticPickup(1239, 2, 1173.2563,-1323.3102,15.3943); //Hospital 1 near Ammu
	AddStaticPickup(1239, 2, 2029.5945,-1404.6426,17.2512); //Hospital 2 near speedway
	AddStaticPickup(1239, 2, 253.9280,69.6094,1003.6406); //Clear icon in Police Station
	AddStaticPickup(1239, 2, -2162.2554,-2385.9541,30.6250); //City Hall
	AddStaticPickup(1239, 2, 359.5408,206.7693,1008.3828); //Detective Registration
	AddStaticPickup(1239, 2, 347.7374,193.7241,1014.1875); //Lawyer Registration
	AddStaticPickup(1239, 2, 1215.1304,-11.8431,1000.9219); //Whore Registration
	AddStaticPickup(1239, 2, 2166.3772,-1675.3829,15.0859); //DrugDealer Registration
	AddStaticPickup(1239, 2, 1109.3318,-1796.3042,16.5938); //CarJacker Registration
	AddStaticPickup(1239, 2, -2050.8962,460.0262,35.1719); //NewsReporter Registration & /paper
	AddStaticPickup(1239, 2, -2040.9436,456.2395,35.1719); //PaperBoy Registration
	AddStaticPickup(1239, 2, -1932.3859,276.2117,41.0391); //CarMechanic Registration
	AddStaticPickup(1239, 2, 2226.1716,-1718.1792,13.5165); //BodyGuard Registration
	AddStaticPickup(1239, 2, 1366.4325,-1275.2096,13.5469); //ArmsDealer Registration
	AddStaticPickup(1239, 2, 531.7930,-1292.4044,17.2422); //CarDealer Registration
	AddStaticPickup(1239, 2, 766.0804,14.5133,1000.7004); //Boxer Registration
	AddStaticPickup(1239, 2, 1154.2208,-1770.8203,16.5992); //BusDriver Registration
	AddStaticPickup(1239, 2, -77.7288,-1136.3896,1.0781); //Trucker Registration
	AddStaticPickup(1239, 2, 323.0342,1118.5804,1083.8828); //Getting Drugs for DrugDealers
	AddStaticPickup(1239, 2, 1381.0413,-1088.8511,27.3906); //Bill Board (old Job Department)
	AddStaticPickup(1239, 2, 597.1277,-1248.6479,18.2734); //Materials Package building
	AddStaticPickup(1239, 2, -2119.5469,-178.5679,35.3203); //Factory
	AddStaticPickup(1239, 2, 1073.0619,-344.5148,73.9922); //Hitman Agency entrance
	AddStaticPickup(371, 2, 1544.2,-1353.4,329.4); //LS towertop
	AddStaticPickup(371, 2, 1536.0, -1360.0, 1150.0); //LS towertop
	AddStaticPickup(1242, 2, 1527.5,-12.1,1002.0); //binco armor
	AddStaticPickup(1240, 2, 279.3000,1853.5619,8.7649); //area51 health
	pickups=pickups+29;
	printf("Pickups Max = 100, Current Pickups = %d",pickups);
	new randa = random(sizeof(RandCars));
	randa = random(sizeof(RandCars));carselect[0] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[1] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[2] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[3] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[4] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[5] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[6] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[7] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[8] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[9] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[10] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[11] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[12] = RandCars[randa][0];
	randa = random(sizeof(RandCars));carselect[13] = RandCars[randa][0];
	randa = random(sizeof(RandLCars));carselect[14] = RandLCars[randa][0];
	AddStaticVehicleEx(carselect[14], 1279.4,-1337.0,13.5,1.0,-1, -1, -1);//long
	AddStaticVehicleEx(409,1248.6779,-2045.4602,59.6498,268.3867,0,0,60000); // limo LaCosaNostra
	AddStaticVehicleEx(507,1242.7739,-2031.1902,59.7773,178.8082,0,0,60000); // Elegant LaCosaNostra
	AddStaticVehicleEx(507,1242.9808,-2015.0297,59.7788,180.6815,0,0,60000); // Elegant LaCosaNostra
	AddStaticVehicleEx(507,1275.1589,-2046.2448,58.9736,87.6114,0,0,60000); // Elegant LaCosaNostra
	AddStaticVehicleEx(409,-2274.3672,646.6611,49.1778,179.9364,50,50,60000); // limo Yakuza
	AddStaticVehicleEx(421,-2176.6760,636.7382,49.2387,37.7510,50,50,60000); // Washington Yakuza
	AddStaticVehicleEx(421,-2247.8093,649.9500,49.1645,0.0748,50,50,60000); // Washington Yakuza
	AddStaticVehicleEx(421,-2247.4382,667.7339,49.1645,359.8687,50,50,60000); // Washington Yakuza
	AddStaticVehicleEx(409,-2159.6860,-2393.2295,30.5070,52.5176,1,1,60000); // limo mayor
	if (realtime)
	{
		new tmphour;
		new tmpminute;
		new tmpsecond;
		gettime(tmphour, tmpminute, tmpsecond);
		FixHour(tmphour);
		tmphour = shifthour;
		SetWorldTime(tmphour);
	}
	synctimer = SetTimer("SyncUp", 60000, 1);
	unjailtimer = SetTimer("SetPlayerUnjail", 1000, 1);
	othtimer = SetTimer("OtherTimer", 1000, 1);
	cartimer = SetTimer("CarCheck", 30000, 1);
	pickuptimer = SetTimer("CustomPickups", 1000, 1);
	spectatetimer = SetTimer("Spectator", 2000, 1);
	idletimer = SetTimer("IdleKick", idletime, 1);
	productiontimer = SetTimer("Production", 300000, 1); //5 mins (300000)
	accountstimer = SetTimer("SaveAccounts", 1800000, 1); //30 mins every account saved
	checkgastimer = SetTimer("CheckGas", RunOutTime, 1);
    stoppedvehtimer = SetTimer("StoppedVehicle", RunOutTime, 1);
	//for(new i = 0; i < sizeof(CarSpawns); i++)
	for(new i = 0; i < 165; i++)
	{
		AddCar(i);
	}
	CarInit();
	return 1;
}

public SyncUp()
{
	SyncTime();
	DollahScoreUpdate();
}

public SyncTime()
{
	new string[64];
	new tmphour;
	new tmpminute;
	new tmpsecond;
	gettime(tmphour, tmpminute, tmpsecond);
	FixHour(tmphour);
	tmphour = shifthour;
	if ((tmphour > ghour) || (tmphour == 0 && ghour == 23))
	{
		format(string, sizeof(string), "SERVER: The time is now %d:00 hours",tmphour);
		BroadCast(COLOR_WHITE,string);
		ghour = tmphour;
		PayDay();
		if (realtime)
		{
			SetWorldTime(tmphour);
		}
	}
}

public SaveAccounts()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			OnPlayerUpdate(i);
			if(PlayerInfo[i][pJob] > 0)
	    	{
	    	    if(PlayerInfo[i][pContractTime] < 25)
	    	    {
					PlayerInfo[i][pContractTime] ++;
				}
	    	}
		}
	}
}

public IsPlayerInTurf(playerid, turfid)
{
	if(IsPlayerConnected(playerid))
	{
		if(turfid == -1)
		{
			return 0;
		}
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid,x,y,z);
		if(x >= TurfInfo[turfid][zMinX] && x < TurfInfo[turfid][zMaxX] && y >= TurfInfo[turfid][zMinY] && y < TurfInfo[turfid][zMaxY])
		{
	 		return 1;
		}
	}
	return 0;
}

public GetClosestPlayer(p1)
{
	new x,Float:dis,Float:dis2,player;
	player = -1;
	dis = 99999.99;
	for (x=0;x<MAX_PLAYERS;x++)
	{
		if(IsPlayerConnected(x))
		{
			if(x != p1)
			{
				dis2 = GetDistanceBetweenPlayers(x,p1);
				if(dis2 < dis && dis2 != -1.00)
				{
					dis = dis2;
					player = x;
				}
			}
		}
	}
	return player;
}

public Production()
{
	new string[256];
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pFishes] >= 5) { if(FishCount[i] >= 3) { PlayerInfo[i][pFishes] = 0; } else { FishCount[i] += 1; } }
		    if(PlayerDrunk[i] > 0) { PlayerDrunk[i] = 0; PlayerDrunkTime[i] = 0; GameTextForPlayer(i, "~p~Drunk effect~n~~w~Gone", 3500, 1); }
		    if(PlayerInfo[i][pPayDay] < 6) { PlayerInfo[i][pPayDay] += 1; } //+ 5 min to PayDay anti-abuse
		    for(new k = 0; k < MAX_PLAYERS; k++)
			{
				if(IsPlayerConnected(k))
				{
				    if(gTeam[k] == 2 && CrimInRange(80.0, i,k))
				    {
					}
					else
					{
					    WantedPoints[i] -= 3;
					    if(WantedPoints[i] < 0) { WantedPoints[i] = 0; }
					    new points = WantedPoints[i];
					    new wlevel;
					    if(points > 0)
						{
						    new yesno;
							if(points == 3) { if(WantedLevel[i] != 1) { WantedLevel[i] = 1; wlevel = 1; yesno = 1; } }
							else if(points >= 4 && points <= 5) { if(WantedLevel[i] != 2) { WantedLevel[i] = 2; wlevel = 2; yesno = 1; } }
							else if(points >= 6 && points <= 7) { if(WantedLevel[i] != 3) { WantedLevel[i] = 3; wlevel = 3; yesno = 1; } }
							else if(points >= 8 && points <= 9) { if(WantedLevel[i] != 4) { WantedLevel[i] = 4; wlevel = 4; yesno = 1; } }
							else if(points >= 10 && points <= 11) { if(WantedLevel[i] != 5) { WantedLevel[i] = 5; wlevel = 5; yesno = 1; } }
							else if(points >= 12 && points <= 13) { if(WantedLevel[i] != 6) { WantedLevel[i] = 6; wlevel = 6; yesno = 1; } }
							else if(points >= 14) { if(WantedLevel[i] != 10) { WantedLevel[i] = 10; wlevel = 10; yesno = 1; } }
							else if(points <= 0) { if(WantedLevel[i] != 0) { ClearCrime(i); WantedLevel[i] = 0; wlevel = 0; yesno = 1;} }
							if(yesno)
							{
								format(string, sizeof(string), "Current Wanted Level: %d", wlevel);
								SendClientMessage(i, COLOR_YELLOW, string);
							}
						}
					}
				}
			}
		}
	}
}

public DateProp(playerid)
{
	new playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playername, sizeof(playername));
	new curdate = getdate();
	for(new h = 0; h < sizeof(HouseInfo); h++)
	{
		if (strcmp(playername, HouseInfo[h][hOwner], true) == 0)
		{
			HouseInfo[h][hDate] = curdate;
			OnPropUpdate();
		}
	}
	return 1;
}

public Checkprop()
{
	new olddate;
	new string[256];
	new curdate = getdate();
	for(new h = 0; h < sizeof(HouseInfo); h++)
	{
		if(HouseInfo[h][hOwned] == 1 && HouseInfo[h][hDate] > 9)
		{
			olddate = HouseInfo[h][hDate];
			if(curdate-olddate >= 5)
			{
				HouseInfo[h][hHel] = 0;
				HouseInfo[h][hArm] = 0;
				HouseInfo[h][hHealthx] = 0;
				HouseInfo[h][hHealthy] = 0;
				HouseInfo[h][hHealthz] = 0;
				HouseInfo[h][hArmourx] = 0;
				HouseInfo[h][hArmoury] = 0;
				HouseInfo[h][hArmourz] = 0;
				HouseInfo[h][hLock] = 1;
				HouseInfo[h][hOwned] = 0;
				HouseInfo[h][hVec] = 418;
				HouseInfo[h][hVcol1] = -1;
				HouseInfo[h][hVcol2] = -1;
				strmid(HouseInfo[h][hOwner], "The State", 0, strlen("The State"), 255);
				format(string, sizeof(string), "REAL ESTATE: A House is available at a value of $%d",HouseInfo[h][hValue]);
				SendClientMessageToAll(TEAM_BALLAS_COLOR, string);
				OnPropUpdate();
			}
		}
	}
	return 1;
}

public PayDay()
{
	new string[128];
	new account,interest;
	new rent = 0;
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pLevel] > 0)
		    {
			    if(MoneyMessage[i]==1)
				{
				    SendClientMessage(i, COLOR_LIGHTRED, "You failed to pay your debt, Jail time.");
				    GameTextForPlayer(i, "~r~Busted!", 2000, 1);
				    SetPlayerInterior(i, 6);
			   		SetPlayerPos(i, 264.6288,77.5742,1001.0391);
		            PlayerInfo[i][pJailed] = 1;
		            ResetPlayerWeapons(i);
					WantedPoints[i] = 0;
					PlayerInfo[i][pJailTime] = 240;
					format(string, sizeof(string), "You are jailed for %d seconds.   Bail: Unable", PlayerInfo[i][pJailTime]);
					SendClientMessage(i, COLOR_LIGHTBLUE, string);
				}
				new playername2[MAX_PLAYER_NAME];
				GetPlayerName(i, playername2, sizeof(playername2));
				account = PlayerInfo[i][pAccount];
				new key = PlayerInfo[i][pPhousekey];
				if(key != 255)
				{
					rent = HouseInfo[key][hRent];
					if(strcmp(playername2, HouseInfo[key][hOwner], true) == 0)
					{
						rent = 0;
					}
					else if(rent > GetPlayerMoney(i))
					{
						PlayerInfo[i][pPhousekey] = 255;
						SendClientMessage(i, COLOR_WHITE, "You have been evicted.");
						rent = 0;
					}
					HouseInfo[key][hTakings] = HouseInfo[key][hTakings]+rent;
				}
				new tmpintrate;
				if (key != 255 && strcmp(playername2, HouseInfo[key][hOwner], true) == 0)
				{
				    if(PlayerInfo[i][pDonateRank] > 0) { tmpintrate = intrate+4; }
					else { tmpintrate = intrate+2; }//HouseInfo[key][hLevel]
				}
				else
				{
				    if(PlayerInfo[i][pDonateRank] > 0) { tmpintrate = 3; }
					else { tmpintrate = 1; }
				}
				if(PlayerInfo[i][pPayDay] >= 5)
				{
				    Tax += TaxValue;//Should work for every player online
				    PlayerInfo[i][pAccount] -= TaxValue;
				    if(PlayerInfo[i][pDonateRank] > 0)
					{
					    new bonus = PlayerInfo[i][pPayCheck] / 2;
					    PlayerInfo[i][pPayCheck] += bonus;
					}
					new checks = PlayerInfo[i][pPayCheck];
				    new ebill = (PlayerInfo[i][pAccount]/10000)*(PlayerInfo[i][pLevel]);
				    ConsumingMoney[i] = 1;
				    GivePlayerMoney(i, checks);
				    if(PlayerInfo[i][pAccount] > 0)
				    {
				    	PlayerInfo[i][pAccount] -= ebill;
				    	SBizzInfo[4][sbTill] += ebill;
					}
					else
					{
					    ebill = 0;
					}
					interest = (PlayerInfo[i][pAccount]/1000)*(tmpintrate);
					PlayerInfo[i][pExp]++;
					PlayerPlayMusic(i);
					PlayerInfo[i][pAccount] = account+interest;
					SendClientMessage(i, COLOR_WHITE, "|___ BANK STATMENT ___|");
					format(string, sizeof(string), "  Paycheck: $%d   Tax Money: -$%d", checks, TaxValue);
					SendClientMessage(i, COLOR_GRAD1, string);
					if(PlayerInfo[i][pPhousekey] != 255 || PlayerInfo[i][pPbiskey] != 255)
					{
					    format(string, sizeof(string), "  Electricity Bill: -$%d", ebill);
						SendClientMessage(i, COLOR_GRAD1, string);
					}
					format(string, sizeof(string), "  Balance: $%d", account);
					SendClientMessage(i, COLOR_GRAD1, string);
					format(string, sizeof(string), "  Interest Rate: 0.%d percent",tmpintrate);
					SendClientMessage(i, COLOR_GRAD2, string);
					format(string, sizeof(string), "  Interest Gained $%d", interest);
					SendClientMessage(i, COLOR_GRAD3, string);
					SendClientMessage(i, COLOR_GRAD4, "|--------------------------------------|");
					format(string, sizeof(string), "  New Balance: $%d", PlayerInfo[i][pAccount]);
					SendClientMessage(i, COLOR_GRAD5, string);
					format(string, sizeof(string), "  Rent: -$%d", rent);
					SendClientMessage(i, COLOR_GRAD5, string);
					format(string, sizeof(string), "~y~PayDay~n~~w~Paycheck");
					GameTextForPlayer(i, string, 5000, 1);
					rent = 0;
					PlayerInfo[i][pPayDay] = 0;
					PlayerInfo[i][pPayCheck] = 0;
					PlayerInfo[i][pConnectTime] += 1;
					if(PlayerInfo[i][pDonateRank] > 0)
					{
					    PlayerInfo[i][pPayDayHad] += 1;
					    if(PlayerInfo[i][pPayDayHad] >= 5)
					    {
					        PlayerInfo[i][pExp]++;
					        PlayerInfo[i][pPayDayHad] = 0;
					    }
					}
				}
				else
				{
				    SendClientMessage(i, COLOR_LIGHTRED, "* You haven't played long enough to obtain a PayDay.");
				}
			}
		}
	}
	Checkprop();
	return 1;
}

strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

public split(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
	    if(strsrc[i]==delimiter || i==strlen(strsrc)){
	        len = strmid(strdest[aNum], strsrc, li, i, 128);
	        strdest[aNum][len] = 0;
	        li = i+1;
	        aNum++;
		}
		i++;
	}
	return 1;
}

public OnPlayerUpdate(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(gPlayerLogged[playerid])
		{
			new string3[32];
			new playername3[MAX_PLAYER_NAME];
			GetPlayerName(playerid, playername3, sizeof(playername3));
			format(string3, sizeof(string3), "%s.ini", playername3);
			new File: hFile = fopen(string3, io_write);
			if (hFile)
			{
				new var[32];
				format(var, 32, "Key=%s\n", PlayerInfo[playerid][pKey]);fwrite(hFile, var);
				PlayerInfo[playerid][pCash] = GetPlayerMoney(playerid);
				format(var, 32, "Level=%d\n",PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
				format(var, 32, "AdminLevel=%d\n",PlayerInfo[playerid][pAdmin]);fwrite(hFile, var);
				format(var, 32, "DonateRank=%d\n",PlayerInfo[playerid][pDonateRank]);fwrite(hFile, var);
				format(var, 32, "UpgradePoints=%d\n",PlayerInfo[playerid][gPupgrade]);fwrite(hFile, var);
				format(var, 32, "ConnectedTime=%d\n",PlayerInfo[playerid][pConnectTime]);fwrite(hFile, var);
				format(var, 32, "Registered=%d\n",PlayerInfo[playerid][pReg]);fwrite(hFile, var);
				format(var, 32, "Sex=%d\n",PlayerInfo[playerid][pSex]);fwrite(hFile, var);
				format(var, 32, "Age=%d\n",PlayerInfo[playerid][pAge]);fwrite(hFile, var);
				format(var, 32, "Origin=%d\n",PlayerInfo[playerid][pOrigin]);fwrite(hFile, var);
				format(var, 32, "CK=%d\n",PlayerInfo[playerid][pCK]);fwrite(hFile, var);
				format(var, 32, "Muted=%d\n",PlayerInfo[playerid][pMuted]);fwrite(hFile, var);
				format(var, 32, "Respect=%d\n",PlayerInfo[playerid][pExp]);fwrite(hFile, var);
				format(var, 32, "Money=%d\n",PlayerInfo[playerid][pCash]);fwrite(hFile, var);
				format(var, 32, "Bank=%d\n",PlayerInfo[playerid][pAccount]);fwrite(hFile, var);
				format(var, 32, "Crimes=%d\n",PlayerInfo[playerid][pCrimes]);fwrite(hFile, var);
				format(var, 32, "Kills=%d\n",PlayerInfo[playerid][pKills]);fwrite(hFile, var);
				format(var, 32, "Deaths=%d\n",PlayerInfo[playerid][pDeaths]);fwrite(hFile, var);
				format(var, 32, "Arrested=%d\n",PlayerInfo[playerid][pArrested]);fwrite(hFile, var);
				format(var, 32, "WantedDeaths=%d\n",PlayerInfo[playerid][pWantedDeaths]);fwrite(hFile, var);
				format(var, 32, "Phonebook=%d\n",PlayerInfo[playerid][pPhoneBook]);fwrite(hFile, var);
				format(var, 32, "LottoNr=%d\n",PlayerInfo[playerid][pLottoNr]);fwrite(hFile, var);
				format(var, 32, "Fishes=%d\n",PlayerInfo[playerid][pFishes]);fwrite(hFile, var);
				format(var, 32, "BiggestFish=%d\n",PlayerInfo[playerid][pBiggestFish]);fwrite(hFile, var);
				format(var, 32, "Job=%d\n",PlayerInfo[playerid][pJob]);fwrite(hFile, var);
				format(var, 32, "Paycheck=%d\n",PlayerInfo[playerid][pPayCheck]);fwrite(hFile, var);
				format(var, 32, "HeadValue=%d\n",PlayerInfo[playerid][pHeadValue]);fwrite(hFile, var);
				format(var, 32, "Jailed=%d\n",PlayerInfo[playerid][pJailed]);fwrite(hFile, var);
				format(var, 32, "JailTime=%d\n",PlayerInfo[playerid][pJailTime]);fwrite(hFile, var);
				format(var, 32, "Materials=%d\n",PlayerInfo[playerid][pMats]);fwrite(hFile, var);
				format(var, 32, "Drugs=%d\n",PlayerInfo[playerid][pDrugs]);fwrite(hFile, var);
				format(var, 32, "Leader=%d\n",PlayerInfo[playerid][pLeader]);fwrite(hFile, var);
				format(var, 32, "Member=%d\n",PlayerInfo[playerid][pMember]);fwrite(hFile, var);
				format(var, 32, "FMember=%d\n",PlayerInfo[playerid][pFMember]);fwrite(hFile, var);
				format(var, 32, "Rank=%d\n",PlayerInfo[playerid][pRank]);fwrite(hFile, var);
				format(var, 32, "Char=%d\n",PlayerInfo[playerid][pChar]);fwrite(hFile, var);
				format(var, 32, "ContractTime=%d\n",PlayerInfo[playerid][pContractTime]);fwrite(hFile, var);
				format(var, 32, "DetSkill=%d\n",PlayerInfo[playerid][pDetSkill]);fwrite(hFile, var);
				format(var, 32, "SexSkill=%d\n",PlayerInfo[playerid][pSexSkill]);fwrite(hFile, var);
				format(var, 32, "BoxSkill=%d\n",PlayerInfo[playerid][pBoxSkill]);fwrite(hFile, var);
				format(var, 32, "LawSkill=%d\n",PlayerInfo[playerid][pLawSkill]);fwrite(hFile, var);
				format(var, 32, "MechSkill=%d\n",PlayerInfo[playerid][pMechSkill]);fwrite(hFile, var);
				format(var, 32, "JackSkill=%d\n",PlayerInfo[playerid][pJackSkill]);fwrite(hFile, var);
				format(var, 32, "CarSkill=%d\n",PlayerInfo[playerid][pCarSkill]);fwrite(hFile, var);
				format(var, 32, "NewsSkill=%d\n",PlayerInfo[playerid][pNewsSkill]);fwrite(hFile, var);
				format(var, 32, "DrugsSkill=%d\n",PlayerInfo[playerid][pDrugsSkill]);fwrite(hFile, var);
				format(var, 32, "CookSkill=%d\n",PlayerInfo[playerid][pCookSkill]);fwrite(hFile, var);
				format(var, 32, "FishSkill=%d\n",PlayerInfo[playerid][pFishSkill]);fwrite(hFile, var);
				format(var, 32, "pSHealth=%.1f\n",PlayerInfo[playerid][pSHealth]);fwrite(hFile, var);
	            GetPlayerHealth(playerid,PlayerInfo[playerid][pHealth]);
				format(var, 32, "pHealth=%.1f\n",PlayerInfo[playerid][pHealth]);fwrite(hFile, var);
				format(var, 32, "Int=%d\n",PlayerInfo[playerid][pInt]);fwrite(hFile, var);
				format(var, 32, "Local=%d\n",PlayerInfo[playerid][pLocal]);fwrite(hFile, var);
				format(var, 32, "Team=%d\n",PlayerInfo[playerid][pTeam]);fwrite(hFile, var);
				format(var, 32, "Model=%d\n",PlayerInfo[playerid][pModel]);fwrite(hFile, var);
				format(var, 32, "PhoneNr=%d\n",PlayerInfo[playerid][pPnumber]);fwrite(hFile, var);
				format(var, 32, "House=%d\n",PlayerInfo[playerid][pPhousekey]);fwrite(hFile, var);
				format(var, 32, "Bizz=%d\n",PlayerInfo[playerid][pPbiskey]);fwrite(hFile, var);
				if ((PlayerInfo[playerid][pPos_x]==0.0 && PlayerInfo[playerid][pPos_y]==0.0 && PlayerInfo[playerid][pPos_z]==0.0))
				{
					PlayerInfo[playerid][pPos_x] = 1684.9;
					PlayerInfo[playerid][pPos_y] = -2244.5;
					PlayerInfo[playerid][pPos_z] = 13.5;
				}
				if(Spectate[playerid] != 255)
				{
					PlayerInfo[playerid][pPos_x] = Unspec[playerid][sPx];
					PlayerInfo[playerid][pPos_y] = Unspec[playerid][sPy];
					PlayerInfo[playerid][pPos_z] = Unspec[playerid][sPz];
					PlayerInfo[playerid][pInt] = Unspec[playerid][sPint];
					PlayerInfo[playerid][pLocal] = Unspec[playerid][sLocal];
				}
				format(var, 32, "Pos_x=%.1f\n",PlayerInfo[playerid][pPos_x]);fwrite(hFile, var);
				format(var, 32, "Pos_y=%.1f\n",PlayerInfo[playerid][pPos_y]);fwrite(hFile, var);
				format(var, 32, "Pos_z=%.1f\n",PlayerInfo[playerid][pPos_z]);fwrite(hFile, var);
				format(var, 32, "CarLic=%d\n",PlayerInfo[playerid][pCarLic]);fwrite(hFile, var);
                format(var, 32, "FlyLic=%d\n",PlayerInfo[playerid][pFlyLic]);fwrite(hFile, var);
				format(var, 32, "BoatLic=%d\n",PlayerInfo[playerid][pBoatLic]);fwrite(hFile, var);
				format(var, 32, "FishLic=%d\n",PlayerInfo[playerid][pFishLic]);fwrite(hFile, var);
				format(var, 32, "GunLic=%d\n",PlayerInfo[playerid][pGunLic]);fwrite(hFile, var);
				format(var, 32, "Gun1=%d\n",PlayerInfo[playerid][pGun1]);fwrite(hFile, var);
				format(var, 32, "Gun2=%d\n",PlayerInfo[playerid][pGun2]);fwrite(hFile, var);
				format(var, 32, "Gun3=%d\n",PlayerInfo[playerid][pGun3]);fwrite(hFile, var);
				format(var, 32, "Gun4=%d\n",PlayerInfo[playerid][pGun4]);fwrite(hFile, var);
				format(var, 32, "Ammo1=%d\n",PlayerInfo[playerid][pAmmo1]);fwrite(hFile, var);
				format(var, 32, "Ammo2=%d\n",PlayerInfo[playerid][pAmmo2]);fwrite(hFile, var);
				format(var, 32, "Ammo3=%d\n",PlayerInfo[playerid][pAmmo3]);fwrite(hFile, var);
				format(var, 32, "Ammo4=%d\n",PlayerInfo[playerid][pAmmo4]);fwrite(hFile, var);
				format(var, 32, "CarTime=%d\n",PlayerInfo[playerid][pCarTime]);fwrite(hFile, var);
				format(var, 32, "PayDay=%d\n",PlayerInfo[playerid][pPayDay]);fwrite(hFile, var);
				format(var, 32, "PayDayHad=%d\n",PlayerInfo[playerid][pPayDayHad]);fwrite(hFile, var);
				format(var, 32, "CDPlayer=%d\n",PlayerInfo[playerid][pCDPlayer]);fwrite(hFile, var);
				format(var, 32, "Wins=%d\n",PlayerInfo[playerid][pWins]);fwrite(hFile, var);
				format(var, 32, "Loses=%d\n",PlayerInfo[playerid][pLoses]);fwrite(hFile, var);
				format(var, 32, "AlcoholPerk=%d\n",PlayerInfo[playerid][pAlcoholPerk]);fwrite(hFile, var);
				format(var, 32, "DrugPerk=%d\n",PlayerInfo[playerid][pDrugPerk]);fwrite(hFile, var);
				format(var, 32, "MiserPerk=%d\n",PlayerInfo[playerid][pMiserPerk]);fwrite(hFile, var);
				format(var, 32, "PainPerk=%d\n",PlayerInfo[playerid][pPainPerk]);fwrite(hFile, var);
				format(var, 32, "TraderPerk=%d\n",PlayerInfo[playerid][pTraderPerk]);fwrite(hFile, var);
				format(var, 32, "Tutorial=%d\n",PlayerInfo[playerid][pTut]);fwrite(hFile, var);
				format(var, 32, "Mission=%d\n",PlayerInfo[playerid][pMissionNr]);fwrite(hFile, var);
				format(var, 32, "Warnings=%d\n",PlayerInfo[playerid][pWarns]);fwrite(hFile, var);
				format(var, 32, "Adjustable=%d\n",PlayerInfo[playerid][pAdjustable]);fwrite(hFile, var);
				if(PlayerInfo[playerid][pDonateRank] < 1) { PlayerInfo[playerid][pFuel] = 0; }
				format(var, 32, "Fuel=%d\n",PlayerInfo[playerid][pFuel]);fwrite(hFile, var);
				format(var, 32, "Married=%d\n",PlayerInfo[playerid][pMarried]);fwrite(hFile, var);
				format(var, 32, "MarriedTo=%s\n",PlayerInfo[playerid][pMarriedTo]);fwrite(hFile, var);
				fclose(hFile);
			}
		}
	}
	return 1;
}

public OnPlayerLogin(playerid,password[])
{
	new tmp2[256];
    new string2[64];
	new playername2[MAX_PLAYER_NAME];
    GetPlayerName(playerid, playername2, sizeof(playername2));
	format(string2, sizeof(string2), "%s.ini", playername2);
	new File: UserFile = fopen(string2, io_read);
	if ( UserFile )
	{
	    new PassData[256];
	    new keytmp[256], valtmp[256];
	    fread( UserFile , PassData , sizeof( PassData ) );
	    keytmp = ini_GetKey( PassData );
	    if( strcmp( keytmp , "Key" , true ) == 0 )
		{
			valtmp = ini_GetValue( PassData );
			strmid(PlayerInfo[playerid][pKey], valtmp, 0, strlen(valtmp)-1, 255);
		}
		if(strcmp(PlayerInfo[playerid][pKey],password, true ) == 0 )
		{
			    new key[ 256 ] , val[ 256 ];
			    new Data[ 256 ];
			    while ( fread( UserFile , Data , sizeof( Data ) ) )
				{
					key = ini_GetKey( Data );
					if( strcmp( key , "Level" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLevel] = strval( val ); }
			    	if( strcmp( key , "AdminLevel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAdmin] = strval( val ); }
			        if( strcmp( key , "DonateRank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDonateRank] = strval( val ); }
			        if( strcmp( key , "UpgradePoints" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][gPupgrade] = strval( val ); }
			        if( strcmp( key , "ConnectedTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pConnectTime] = strval( val ); }
			        if( strcmp( key , "Registered" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pReg] = strval( val ); }
			        if( strcmp( key , "Sex" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSex] = strval( val ); }
			        if( strcmp( key , "Age" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAge] = strval( val ); }
			        if( strcmp( key , "Origin" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pOrigin] = strval( val ); }
			        if( strcmp( key , "CK" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCK] = strval( val ); }
			        if( strcmp( key , "Muted" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMuted] = strval( val ); }
			        if( strcmp( key , "Respect" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pExp] = strval( val ); }
			        if( strcmp( key , "Money" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCash] = strval( val ); }
			        if( strcmp( key , "Bank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAccount] = strval( val ); }
			        if( strcmp( key , "Crimes" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCrimes] = strval( val ); }
			        if( strcmp( key , "Kills" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pKills] = strval( val ); }
			        if( strcmp( key , "Deaths" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDeaths] = strval( val ); }
			        if( strcmp( key , "Arrested" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pArrested] = strval( val ); }
			        if( strcmp( key , "WantedDeaths" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWantedDeaths] = strval( val ); }
			        if( strcmp( key , "Phonebook" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPhoneBook] = strval( val ); }
			        if( strcmp( key , "LottoNr" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLottoNr] = strval( val ); }
			        if( strcmp( key , "Fishes" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFishes] = strval( val ); }
			        if( strcmp( key , "BiggestFish" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBiggestFish] = strval( val ); }
			        if( strcmp( key , "Job" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJob] = strval( val ); }
			        if( strcmp( key , "Paycheck" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPayCheck] = strval( val ); }
			        if( strcmp( key , "HeadValue" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHeadValue] = strval( val ); }
			        if( strcmp( key , "Jailed" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJailed] = strval( val ); }
			        if( strcmp( key , "JailTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJailTime] = strval( val ); }
			        if( strcmp( key , "Materials" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMats] = strval( val ); }
			        if( strcmp( key , "Drugs" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDrugs] = strval( val ); }
			        if( strcmp( key , "Leader" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLeader] = strval( val ); }
			        if( strcmp( key , "Member" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMember] = strval( val ); }
			        if( strcmp( key , "FMember" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFMember] = strval( val ); }
			        if( strcmp( key , "Rank" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pRank] = strval( val ); }
			        if( strcmp( key , "Char" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pChar] = strval( val ); }
			        if( strcmp( key , "ContractTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pContractTime] = strval( val ); }
			        if( strcmp( key , "DetSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDetSkill] = strval( val ); }
			        if( strcmp( key , "SexSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSexSkill] = strval( val ); }
			        if( strcmp( key , "BoxSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBoxSkill] = strval( val ); }
			        if( strcmp( key , "LawSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLawSkill] = strval( val ); }
			        if( strcmp( key , "MechSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMechSkill] = strval( val ); }
			        if( strcmp( key , "JackSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pJackSkill] = strval( val ); }
			        if( strcmp( key , "CarSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCarSkill] = strval( val ); }
			        if( strcmp( key , "NewsSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pNewsSkill] = strval( val ); }
			        if( strcmp( key , "DrugsSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDrugsSkill] = strval( val ); }
			        if( strcmp( key , "CookSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCookSkill] = strval( val ); }
			        if( strcmp( key , "FishSkill" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFishSkill] = strval( val ); }
			        if( strcmp( key , "pSHealth" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pSHealth] = floatstr( val ); }
			        if( strcmp( key , "pHealth" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pHealth] = floatstr( val ); }
			        if( strcmp( key , "Int" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pInt] = strval( val ); }
			        if( strcmp( key , "Local" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLocal] = strval( val ); }
			        if( strcmp( key , "Team" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTeam] = strval( val ); }
			        if( strcmp( key , "Model" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pModel] = strval( val ); }
			        if( strcmp( key , "PhoneNr" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPnumber] = strval( val ); }
			        if( strcmp( key , "House" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPhousekey] = strval( val ); }
			        if( strcmp( key , "Bizz" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPbiskey] = strval( val ); }
			        if( strcmp( key , "Pos_x" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPos_x] = floatstr( val ); }
			        if( strcmp( key , "Pos_y" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPos_y] = floatstr( val ); }
			        if( strcmp( key , "Pos_z" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPos_z] = floatstr( val ); }
			        if( strcmp( key , "CarLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCarLic] = strval( val ); }
                    if( strcmp( key , "FlyLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFlyLic] = strval( val ); }
					if( strcmp( key , "BoatLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pBoatLic] = strval( val ); }
			        if( strcmp( key , "FishLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFishLic] = strval( val ); }
			        if( strcmp( key , "GunLic" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGunLic] = strval( val ); }
			        if( strcmp( key , "Gun1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun1] = strval( val ); }
			        if( strcmp( key , "Gun2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun2] = strval( val ); }
			        if( strcmp( key , "Gun3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun3] = strval( val ); }
			        if( strcmp( key , "Gun4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pGun4] = strval( val ); }
			        if( strcmp( key , "Ammo1" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAmmo1] = strval( val ); }
			        if( strcmp( key , "Ammo2" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAmmo2] = strval( val ); }
			        if( strcmp( key , "Ammo3" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAmmo3] = strval( val ); }
			        if( strcmp( key , "Ammo4" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAmmo4] = strval( val ); }
			        if( strcmp( key , "CarTime" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCarTime] = strval( val ); }
			        if( strcmp( key , "PayDay" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPayDay] = strval( val ); }
			        if( strcmp( key , "PayDayHad" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPayDayHad] = strval( val ); }
			        if( strcmp( key , "CDPlayer" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pCDPlayer] = strval( val ); }
			        if( strcmp( key , "Wins" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWins] = strval( val ); }
			        if( strcmp( key , "Loses" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pLoses] = strval( val ); }
			        if( strcmp( key , "AlcoholPerk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAlcoholPerk] = strval( val ); }
			        if( strcmp( key , "DrugPerk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pDrugPerk] = strval( val ); }
			        if( strcmp( key , "MiserPerk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMiserPerk] = strval( val ); }
			        if( strcmp( key , "PainPerk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pPainPerk] = strval( val ); }
			        if( strcmp( key , "TraderPerk" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTraderPerk] = strval( val ); }
			        if( strcmp( key , "Tutorial" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pTut] = strval( val ); }
			        if( strcmp( key , "Mission" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMissionNr] = strval( val ); }
			        if( strcmp( key , "Warnings" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pWarns] = strval( val ); }
			        if( strcmp( key , "Adjustable" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pAdjustable] = strval( val ); }
			        if( strcmp( key , "Fuel" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pFuel] = strval( val ); }
			        if( strcmp( key , "Married" , true ) == 0 ) { val = ini_GetValue( Data ); PlayerInfo[playerid][pMarried] = strval( val ); }
			        if( strcmp( key , "MarriedTo" , true ) == 0 ) { val = ini_GetValue( Data ); strmid(PlayerInfo[playerid][pMarriedTo], val, 0, strlen(val)-1, 255); }
                }//end while
                fclose(UserFile);//close the file after everything has been read in the while
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "SERVER: Password does not match your name.");
	        fclose(UserFile);
	        gPlayerLogTries[playerid] += 1;
	        if(gPlayerLogTries[playerid] == 4) { Ban(playerid); }
	        return 1;
		}
		PlayerInfo[playerid][pAdjustable] = 0;
		ResetPlayerMoney(playerid);
		ConsumingMoney[playerid] = 1;
		GivePlayerMoney(playerid,PlayerInfo[playerid][pCash]);
		CurrentMoney[playerid] = PlayerInfo[playerid][pCash];
		if(PlayerInfo[playerid][pReg] == 0)
		{
			PlayerInfo[playerid][pLevel] = 1;
			PlayerInfo[playerid][pSHealth] = 0.0;
			PlayerInfo[playerid][pHealth] = 50.0;
			PlayerInfo[playerid][pPos_x] = 2246.6;
			PlayerInfo[playerid][pPos_y] = -1161.9;
			PlayerInfo[playerid][pPos_z] = 1029.7;
			PlayerInfo[playerid][pInt] = 15;
			PlayerInfo[playerid][pLocal] = 255;
			PlayerInfo[playerid][pTeam] = 3;
			PlayerInfo[playerid][pModel] = 264;
			new randphone = 1000 + random(8999);//minimum 1000  max 9999 //giving one at the start
			PlayerInfo[playerid][pPnumber] = randphone;
			PlayerInfo[playerid][pPhousekey] = 255;
			PlayerInfo[playerid][pPbiskey] = 255;
			PlayerInfo[playerid][pAccount] = 50000;
			PlayerInfo[playerid][pReg] = 1;
			GivePlayerMoney(playerid, 5000);
		}
		if(PlayerInfo[playerid][pLevel] == -999) //autoban
		{
			Ban(playerid);
		}
		else if(PlayerInfo[playerid][pCK] > 0)
		{
		    Kick(playerid);
		}
		format(string2, sizeof(string2), "SERVER: Welcome %s",playername2);
		SendClientMessage(playerid, COLOR_WHITE,string2);
		printf("%s has logged in.",playername2);
		if (PlayerInfo[playerid][pDonateRank] > 0)
		{
			SendClientMessage(playerid, COLOR_WHITE,"SERVER: You are a Premium Account user.");
		}
		if (PlayerInfo[playerid][pAdmin] > 0)
		{
			format(string2, sizeof(string2), "SERVER: You are logged in as a Level %d Admin.",PlayerInfo[playerid][pAdmin]);
			SendClientMessage(playerid, COLOR_WHITE,string2);
		}
		SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pModel], PlayerInfo[playerid][pPos_x], PlayerInfo[playerid][pPos_y], PlayerInfo[playerid][pPos_z], 1.0, -1, -1, -1, -1, -1, -1);
		if(gTeam[playerid] == 0)
		{
			gTeam[playerid] = 3;
		}
		else
		{
			gTeam[playerid] = PlayerInfo[playerid][pTeam];
		}
		gPlayerLogged[playerid] = 1;
		SpawnPlayer(playerid);
		format(tmp2, sizeof(tmp2), "~w~Welcome ~n~~y~   %s", playername2);
		DateProp(playerid);
		GameTextForPlayer(playerid, tmp2, 5000, 1);
		SendClientMessage(playerid, COLOR_YELLOW, motd);
		if(PlayerInfo[playerid][pFMember] < 255)
		{
		    format(tmp2, sizeof(tmp2), "Family MOTD: %s.", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyMOTD]);
		    SendClientMessage(playerid, COLOR_YELLOW, tmp2);
		}
	}
	return 1;
}

stock ini_GetKey( line[] )
{
	new keyRes[256];
	keyRes[0] = 0;
    if ( strfind( line , "=" , true ) == -1 ) return keyRes;
    strmid( keyRes , line , 0 , strfind( line , "=" , true ) , sizeof( keyRes) );
    return keyRes;
}

stock ini_GetValue( line[] )
{
	new valRes[256];
	valRes[0]=0;
	if ( strfind( line , "=" , true ) == -1 ) return valRes;
	strmid( valRes , line , strfind( line , "=" , true )+1 , strlen( line ) , sizeof( valRes ) );
	return valRes;
}

public OnPropUpdate()
{
	new idx;
	new File: file2;
	while (idx < sizeof(HouseInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%f,%f,%f,%f,%f,%f,%d,%d,%d,%d,%d,%d,%s,%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d\n",
		HouseInfo[idx][hEntrancex],
		HouseInfo[idx][hEntrancey],
		HouseInfo[idx][hEntrancez],
		HouseInfo[idx][hExitx],
		HouseInfo[idx][hExity],
		HouseInfo[idx][hExitz],
		HouseInfo[idx][hHealthx],
		HouseInfo[idx][hHealthy],
		HouseInfo[idx][hHealthz],
		HouseInfo[idx][hArmourx],
		HouseInfo[idx][hArmoury],
		HouseInfo[idx][hArmourz],
		HouseInfo[idx][hOwner],
		HouseInfo[idx][hDiscription],
		HouseInfo[idx][hValue],
		HouseInfo[idx][hHel],
		HouseInfo[idx][hArm],
		HouseInfo[idx][hInt],
		HouseInfo[idx][hLock],
		HouseInfo[idx][hOwned],
		HouseInfo[idx][hRooms],
		HouseInfo[idx][hRent],
		HouseInfo[idx][hRentabil],
		HouseInfo[idx][hTakings],
		HouseInfo[idx][hVec],
		HouseInfo[idx][hVcol1],
		HouseInfo[idx][hVcol2],
		HouseInfo[idx][hDate],
		HouseInfo[idx][hLevel]);
		if(idx == 0)
		{
			file2 = fopen("property.cfg", io_write);
		}
		else
		{
			file2 = fopen("property.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	idx = 0;
	while (idx < sizeof(BizzInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%d|%s|%s|%s|%f|%f|%f|%f|%f|%f|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",
		BizzInfo[idx][bOwned],
		BizzInfo[idx][bOwner],
		BizzInfo[idx][bMessage],
		BizzInfo[idx][bExtortion],
		BizzInfo[idx][bEntranceX],
		BizzInfo[idx][bEntranceY],
		BizzInfo[idx][bEntranceZ],
		BizzInfo[idx][bExitX],
		BizzInfo[idx][bExitY],
		BizzInfo[idx][bExitZ],
		BizzInfo[idx][bLevelNeeded],
		BizzInfo[idx][bBuyPrice],
		BizzInfo[idx][bEntranceCost],
		BizzInfo[idx][bTill],
		BizzInfo[idx][bLocked],
		BizzInfo[idx][bInterior],
		BizzInfo[idx][bProducts],
		BizzInfo[idx][bMaxProducts],
		BizzInfo[idx][bPriceProd]);
		if(idx == 0)
		{
			file2 = fopen("bizz.cfg", io_write);
		}
		else
		{
			file2 = fopen("bizz.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	idx = 0;
	while (idx < sizeof(SBizzInfo))
	{
		new coordsstring[256];
		format(coordsstring, sizeof(coordsstring), "%d|%s|%s|%s|%f|%f|%f|%d|%d|%d|%d|%d|%d|%d|%d|%d\n",
		SBizzInfo[idx][sbOwned],
		SBizzInfo[idx][sbOwner],
		SBizzInfo[idx][sbMessage],
		SBizzInfo[idx][sbExtortion],
		SBizzInfo[idx][sbEntranceX],
		SBizzInfo[idx][sbEntranceY],
		SBizzInfo[idx][sbEntranceZ],
		SBizzInfo[idx][sbLevelNeeded],
		SBizzInfo[idx][sbBuyPrice],
		SBizzInfo[idx][sbEntranceCost],
		SBizzInfo[idx][sbTill],
		SBizzInfo[idx][sbLocked],
		SBizzInfo[idx][sbInterior],
		SBizzInfo[idx][sbProducts],
		SBizzInfo[idx][sbMaxProducts],
		SBizzInfo[idx][sbPriceProd]);
		if(idx == 0)
		{
			file2 = fopen("sbizz.cfg", io_write);
		}
		else
		{
			file2 = fopen("sbizz.cfg", io_append);
		}
		fwrite(file2, coordsstring);
		idx++;
		fclose(file2);
	}
	return 1;
}

public BroadCast(color,const string[])
{
	SendClientMessageToAll(color, string);
	return 1;
}

public ABroadCast(color,const string[],level)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if (PlayerInfo[i][pAdmin] >= level)
			{
				SendClientMessage(i, color, string);
				printf("%s", string);
			}
		}
	}
	return 1;
}

public OOCOff(color,const string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(!gOoc[i])
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public OOCNews(color,const string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(!gNews[i])
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public SendTeamMessage(team, color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(gTeam[i] == team)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public SendRadioMessage(member, color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pMember] == member || PlayerInfo[i][pLeader] == member)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public SendJobMessage(job, color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pJob] == job)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public SendNewFamilyMessage(family, color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pFMember] == family)
		    {
                if(!gFam[i])
                {
					SendClientMessage(i, color, string);
				}
			}
		}
	}
}

public SendFamilyMessage(family, color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pMember] == family || PlayerInfo[i][pLeader] == family)
		    {
                if(!gFam[i])
                {
					SendClientMessage(i, color, string);
				}
			}
		}
	}
}

public SendIRCMessage(channel, color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayersChannel[i] == channel)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}

public SendTeamBeepMessage(team, color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(gTeam[i] == team)
		    {
				SendClientMessage(i, color, string);
				RingTone[i] = 20;
			}
		}
	}
}

public SendEnemyMessage(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(gTeam[i] >= 3)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}


public SendAdminMessage(color, string[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pAdmin] >= 1)
		    {
				SendClientMessage(i, color, string);
			}
		}
	}
}



public AddCar(carcoords)
{
	new randcol = random(126);
	new randcol2 = 1;
	if (rccounter == 14)
	{
		rccounter = 0;
	}
	AddStaticVehicleEx(carselect[rccounter], CarSpawns[carcoords][pos_x], CarSpawns[carcoords][pos_y], CarSpawns[carcoords][pos_z], CarSpawns[carcoords][z_angle], randcol, randcol2, 60000);
	rccounter++;
	return 1;
}

public PlayerPlayMusic(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		SetTimer("StopMusic", 5000, 0);
		PlayerPlaySound(playerid, 1068, 0.0, 0.0, 0.0);
	}
}

public StopMusic()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			PlayerPlaySound(i, 1069, 0.0, 0.0, 0.0);
		}
	}
}

public PlayerFixRadio(playerid)
{
    if(IsPlayerConnected(playerid))
	{
	    SetTimer("PlayerFixRadio2", 1000, 0);
		PlayerPlaySound(playerid, 1068, 0.0, 0.0, 0.0);
		Fixr[playerid] = 1;
	}
}

public PlayerFixRadio2()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(Fixr[i])
			{
				PlayerPlaySound(i, 1069, 0.0, 0.0, 0.0);
				Fixr[i] = 0;
			}
		}
	}
}

//---------------------------<[ OnPlayerCommandText ]>--------------------------------------------------------

public OnPlayerCommandText(playerid, cmdtext[])
{
	new string[256];
	new playermoney;
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new playername[MAX_PLAYER_NAME];
	new cmd[256];
	new tmp[256];
	new giveplayerid, moneys, idx;
	cmd = strtok(cmdtext, idx);
//-------------------------------[Pay]--------------------------------------------------------------------------
	if(strcmp(cmd, "/pay", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /pay [playerid/PartOfName] [amount]");
				return 1;
			}
			//giveplayerid = strval(tmp);
	        giveplayerid = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /pay [playerid/PartOfName] [amount]");
				return 1;
			}
			moneys = strval(tmp);
			if(moneys > 1000 && PlayerInfo[playerid][pLevel] < 3)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "You must be level 3 to pay over 1000");
				return 1;
			}
			if(moneys < 1 || moneys > 99999)
			{
			    SendClientMessage(playerid, COLOR_GRAD1, "Dont go below 1, or above 99999 at once.");
			    return 1;
			}
			if (IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if(PlayerInfo[giveplayerid][pLocal] == 106)
					{
						SendClientMessage(playerid, COLOR_GRAD1, "Command not allowed in this location");
						return 1;
					}
					if (ProxDetectorS(5.0, playerid, giveplayerid))
					{
						GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						playermoney = GetPlayerMoney(playerid);
						if (moneys > 0 && playermoney >= moneys)
						{
						    ConsumingMoney[giveplayerid] = 1;
							GivePlayerMoney(playerid, (0 - moneys));
							GivePlayerMoney(giveplayerid, moneys);
							format(string, sizeof(string), "   You have sent %s(player: %d), $%d.", giveplayer,giveplayerid, moneys);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							SendClientMessage(playerid, COLOR_GRAD1, string);
							format(string, sizeof(string), "   You have recieved $%d from %s(player: %d).", moneys, sendername, playerid);
							SendClientMessage(giveplayerid, COLOR_GRAD1, string);
							format(string, sizeof(string), "%s has paid $%d to %s", sendername, moneys, giveplayer);
							PayLog(string);
							if(moneys >= 1000000)
							{
								ABroadCast(COLOR_YELLOW,string,1);
							}
							PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
							format(string, sizeof(string), "* %s takes out some cash, and hands it to %s.", sendername ,giveplayer);
							ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD1, "   Invalid transaction amount.");
						}
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD1, "   Your too far away.");
					}
				}//invalid id
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		}
		return 1;
	}

	if(strcmp(cmd, "/charity", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /charity [amount]");
				return 1;
			}
			if(PlayerInfo[playerid][pLocal] == 106)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "Command not allowed in this location");
				return 1;
			}
			moneys = strval(tmp);
			if(moneys < 0)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "That is not enough.");
				return 1;
			}
			if(GetPlayerMoney(playerid) < moneys)
			{
			    SendClientMessage(playerid, COLOR_GRAD1, "You don't have that much money.");
				return 1;
			}
			GivePlayerMoney(playerid, -moneys);
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "%s Thank you for you donation of, $%d.",sendername, moneys);
			printf("%s", string);
			PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_GRAD1, string);
			PayLog(string);
		}
		return 1;
	}
//-------------------------------[Stats]--------------------------------------------------------------------------
	if (strcmp(cmd, "/stats", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (gPlayerLogged[playerid] != 0)
			{
				ShowStats(playerid,playerid);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not Logged in !");
			}
		}
		return 1;
	}

	if(strcmp(cmd, "/dn", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz-2);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not an Admin !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/up", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz+2);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not an Admin !");
			}
		}
		return 1;
	}
	if (strcmp(cmd, "/fly", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				new Float:px, Float:py, Float:pz, Float:pa;
				GetPlayerFacingAngle(playerid,pa);
				if(pa >= 0.0 && pa <= 22.5) //n1
				{
					GetPlayerPos(playerid, px, py, pz);
					SetPlayerPos(playerid, px, py+30, pz+5);
				}
				if(pa >= 332.5 && pa < 0.0) //n2
				{
					GetPlayerPos(playerid, px, py, pz);
					SetPlayerPos(playerid, px, py+30, pz+5);
				}
				if(pa >= 22.5 && pa <= 67.5) //nw
				{
					GetPlayerPos(playerid, px, py, pz);
					SetPlayerPos(playerid, px-15, py+15, pz+5);
				}
				if(pa >= 67.5 && pa <= 112.5) //w
				{
					GetPlayerPos(playerid, px, py, pz);
					SetPlayerPos(playerid, px-30, py, pz+5);
				}
				if(pa >= 112.5 && pa <= 157.5) //sw
				{
					GetPlayerPos(playerid, px, py, pz);
					SetPlayerPos(playerid, px-15, py-15, pz+5);
				}
				if(pa >= 157.5 && pa <= 202.5) //s
				{
					GetPlayerPos(playerid, px, py, pz);
					SetPlayerPos(playerid, px, py-30, pz+5);
				}
				if(pa >= 202.5 && pa <= 247.5)//se
				{
					GetPlayerPos(playerid, px, py, pz);
					SetPlayerPos(playerid, px+15, py-15, pz+5);
				}
				if(pa >= 247.5 && pa <= 292.5)//e
				{
					GetPlayerPos(playerid, px, py, pz);
					SetPlayerPos(playerid, px+30, py, pz+5);
				}
				if(pa >= 292.5 && pa <= 332.5)//e
				{
					GetPlayerPos(playerid, px, py, pz);
					SetPlayerPos(playerid, px+15, py+15, pz+5);
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not an Admin !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/lt", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly+2, slz);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not an Admin !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/rt", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly-2, slz-2);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not an Admin !");
			}
		}
		return 1;
	}
//-------------------------------[Check]--------------------------------------------------------------------------
	if (strcmp(cmd, "/check", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /check [playerid/PartOfName]");
					return 1;
				}
				//giveplayerid = strval(tmp);
	            giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
						ShowStats(playerid,giveplayerid);
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD1, "   No Such Player");
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not an admin");
			}
		}
		return 1;
	}
	if (strcmp(cmd, "/number", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pPhoneBook] == 1)
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /number [playerid/PartOfName]");
					return 1;
				}
				//giveplayerid = strval(tmp);
				giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
						GetPlayerName(giveplayerid, sendername, sizeof(sendername));
						format(string, 256, "Name: %s, Ph: %d",sendername,PlayerInfo[giveplayerid][pPnumber]);
						SendClientMessage(playerid, COLOR_GRAD1, string);
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD1, "   No Such Player !");
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You do not have a PhoneBook !");
			}
		}
		return 1;
	}
//-------------------------------[BuyLevel]--------------------------------------------------------------------------
	if (strcmp(cmd, "/buylevel", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (gPlayerLogged[playerid] != 0)
			{
				PlayerInfo[playerid][pCash] = GetPlayerMoney(playerid);
				if(PlayerInfo[playerid][pLevel] >= 0)
				{
					new nxtlevel = PlayerInfo[playerid][pLevel]+1;
					new costlevel = nxtlevel*levelcost;//10k for testing purposes
					new expamount = nxtlevel*levelexp;
					new infostring[256];
					if(GetPlayerMoney(playerid) < costlevel)
					{
						format(infostring, 256, "   You do not have enough Cash ($%d) !",costlevel);
						SendClientMessage(playerid, COLOR_GRAD1, infostring);
						return 1;
					}
					else if (PlayerInfo[playerid][pExp] < expamount)
					{
						format(infostring, 256, "   You need %d Respect Points, you curently have [%d] !",expamount,PlayerInfo[playerid][pExp]);
						SendClientMessage(playerid, COLOR_GRAD1, infostring);
						return 1;
					}
					else
					{
						format(string, sizeof(string), "~g~LEVEL UP~n~~w~You Are Now Level %d", nxtlevel);
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						PlayerPlayMusic(playerid);
						GivePlayerMoney(playerid, (-costlevel));
						PlayerInfo[playerid][pLevel]++;
						if(PlayerInfo[playerid][pDonateRank] > 0)
						{
						    PlayerInfo[playerid][pExp] -= expamount;
						    new total = PlayerInfo[playerid][pExp];
						    if(total > 0)
						    {
						        PlayerInfo[playerid][pExp] = total;
						    }
						    else
						    {
						        PlayerInfo[playerid][pExp] = 0;
						    }
						}
						else
						{
							PlayerInfo[playerid][pExp] = 0;
						}
						PlayerInfo[playerid][gPupgrade] = PlayerInfo[playerid][gPupgrade]+2;
						GameTextForPlayer(playerid, string, 5000, 1);
						format(infostring, 256, "   You bought Level %d for ($%d) Type /upgrade", nxtlevel, costlevel);
						SendClientMessage(playerid, COLOR_GRAD1, infostring);
						format(infostring, 256, "   You gave %d unspent Upgrade Points",PlayerInfo[playerid][gPupgrade]);
						SendClientMessage(playerid, COLOR_GRAD2, infostring);
					}
				}
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not Logged in !");
			}
		}
		return 1;
	}
//-------------------------------[UPGRADE]--------------------------------------------------------------------------
	if (strcmp(cmd, "/carcolor", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new house = PlayerInfo[playerid][pPhousekey];
			GetPlayerName(playerid, playername, sizeof(playername));
			if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD3,"($5000) USAGE: /carcolor [color 1 - 2] [color number]");
					return 1;
				}
				new colornum = strval(tmp);
				if(colornum > 2 || colornum < 1)
				{
					SendClientMessage(playerid, COLOR_GRAD3,"Choices are 1 or 2");
					return 1;
				}
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD3,"($5000) USAGE: /carcolor [color 1 - 2] [color number]");
				}
				new color = strval(tmp);
				if(color > 126)
				{
					SendClientMessage(playerid, COLOR_GRAD3,"Maximum is 126");
					return 1;
				}
				if (GetPlayerMoney(playerid) < 5000)
				{
					SendClientMessage(playerid, COLOR_GRAD3,"You can't afford that ($5000)");
				}
				if(colornum == 1)
				{
					HouseInfo[house][hVcol1] = color;
					format(string, sizeof(string), "Car color 1 set to %d -$5000",color);
					SendClientMessage(playerid, COLOR_GRAD3,string);
				}
				else
				{
					HouseInfo[house][hVcol2] = color;
					format(string, sizeof(string), "Car color 2 set to %d -$5000",color);
					SendClientMessage(playerid, COLOR_GRAD3,string);
				}
				SendClientMessage(playerid, COLOR_GRAD6, "Your new paintjob will be complete within 24 hours");
				GivePlayerMoney(playerid,-5000);
				SBizzInfo[5][sbTill] += 5000;
				ExtortionSBiz(5, 5000);
				PlayerPlaySound(giveplayerid, 1134, 0.0, 0.0, 0.0);
				OnPropUpdate();
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house");
				return 1;
			}
		}
		return 1;
	}
	if (strcmp(cmd, "/carupgrade", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new house = PlayerInfo[playerid][pPhousekey];
			GetPlayerName(playerid, playername, sizeof(playername));
			if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
			{
				new gunid[16];
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					format(string, sizeof(string), "USAGE: /carupgrade [carname]");
					SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
					SendClientMessage(playerid, COLOR_WHITE,"*** CAR UPGRADES Cost $100000 ***");
					SendClientMessage(playerid, COLOR_GRAD2,string);
					if(PlayerInfo[playerid][pLevel] >= 3)
					{
						SendClientMessage(playerid, COLOR_GRAD3, "Cars: blistacompact clover elegant emperor glendale greenwood");
						SendClientMessage(playerid, COLOR_GRAD3, "Cars: huntley jester landstalker merit nebula sabre stratum");
						SendClientMessage(playerid, COLOR_GRAD3, "Cars: sunrise tahoma uranus");
						SendClientMessage(playerid, COLOR_GRAD3, "Donation cars: stretch elegy phoenix hotknife bandito sultan");
					}
					SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
					return 1;
				}
				if(SBizzInfo[5][sbProducts] == 0)
				{
					GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
					return 1;
				}
				strmid(gunid, tmp, 0, strlen(cmdtext), 255);
				if (GetPlayerMoney(playerid) > 100000)
				{
					if(strcmp(gunid, "stretch", true, strlen(gunid)) == 0)
					{
					    if(PlayerInfo[playerid][pDonateRank] < 1)
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   You don't have a Premium Account !");
					        return 1;
					    }
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Stretch");
						HouseInfo[house][hVec] = 409;
					}
					else if(strcmp(gunid, "hotknife", true, strlen(gunid)) == 0)
					{
					    if(PlayerInfo[playerid][pDonateRank] < 1)
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   You don't have a Premium Account !");
					        return 1;
					    }
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Hotknife");
						HouseInfo[house][hVec] = 434;
					}
					else if(strcmp(gunid, "bandito", true, strlen(gunid)) == 0)
					{
					    if(PlayerInfo[playerid][pDonateRank] < 1)
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   You don't have a Premium Account !");
					        return 1;
					    }
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Bandito");
						HouseInfo[house][hVec] = 568;
					}
					else if(strcmp(gunid, "sultan", true, strlen(gunid)) == 0)
					{
					    if(PlayerInfo[playerid][pDonateRank] < 1)
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   You don't have a Premium Account !");
					        return 1;
					    }
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Sultan");
						HouseInfo[house][hVec] = 560;
					}
					else if(strcmp(gunid, "elegy", true, strlen(gunid)) == 0)
					{
					    if(PlayerInfo[playerid][pDonateRank] < 1)
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   You don't have a Premium Account !");
					        return 1;
					    }
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Elegy");
						HouseInfo[house][hVec] = 562;
					}
					else if(strcmp(gunid, "phoenix", true, strlen(gunid)) == 0)
					{
					    if(PlayerInfo[playerid][pDonateRank] < 1)
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   You don't have a Premium Account !");
					        return 1;
					    }
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Phoenix");
						HouseInfo[house][hVec] = 603;
					}
					else if(strcmp(gunid, "blistacompact", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Blista Compact");
						HouseInfo[house][hVec] = 496;
					}
					else if(strcmp(gunid, "clover", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Clover");
						HouseInfo[house][hVec] = 542;
					}
					else if(strcmp(gunid, "elegant", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Elegant");
						HouseInfo[house][hVec] = 507;
					}
					else if(strcmp(gunid, "emperor", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Emperor");
						HouseInfo[house][hVec] = 585;
					}
					else if(strcmp(gunid, "glendale", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Glendale");
						HouseInfo[house][hVec] = 466;
					}
					else if(strcmp(gunid, "greenwood", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Greenwood");
						HouseInfo[house][hVec] = 492;
					}
					else if(strcmp(gunid, "huntley", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Huntley");
						HouseInfo[house][hVec] = 579;
					}
					else if(strcmp(gunid, "jester", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Jester");
						HouseInfo[house][hVec] = 559;
					}
					else if(strcmp(gunid, "landstalker", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Landstalker");
						HouseInfo[house][hVec] = 400;
					}
					else if(strcmp(gunid, "merit", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Merit");
						HouseInfo[house][hVec] = 551;
					}
					else if(strcmp(gunid, "nebula", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Nebula");
						HouseInfo[house][hVec] = 516;
					}
					else if(strcmp(gunid, "sabre", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Sabre");
						HouseInfo[house][hVec] = 475;
					}
					else if(strcmp(gunid, "stratum", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Stratum");
						HouseInfo[house][hVec] = 561;
					}
					else if(strcmp(gunid, "sunrise", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Sunrise");
						HouseInfo[house][hVec] = 550;
					}
					else if(strcmp(gunid, "tahoma", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Tahoma");
						HouseInfo[house][hVec] = 566;
					}
					else if(strcmp(gunid, "uranus", true, strlen(gunid)) == 0)
					{
						SendClientMessage(playerid, COLOR_GRAD6, "New Upgrade: Your House Car Is Now A Uranus");
						HouseInfo[house][hVec] = 558;
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD6, "   Unrecognized Car or Donate Rank not High enough.");
						return 1;
					}
					SendClientMessage(playerid, COLOR_GRAD6, "Your new car will be delivered within 24 hours -$100000");
					OnPropUpdate();
					GivePlayerMoney(playerid,-100000);
					SBizzInfo[5][sbTill] += 100000;
					ExtortionSBiz(5, 100000);
					SBizzInfo[5][sbProducts]--;
					PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You can't afford that ($100000)");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house");
				return 1;
			}
		}
		return 1;
	}
	if (strcmp(cmd, "/resetupgrades", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (gPlayerLogged[playerid] == 0)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not Logged in !");
				return 1;
			}
			if (GetPlayerMoney(playerid) < 100000)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   Cost is $100000 !");
				return 1;
			}
			if (PlayerInfo[playerid][pLevel] < 2)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You need to be at least level 2 !");
				return 1;
			}
			PlayerInfo[playerid][gPupgrade] = (PlayerInfo[playerid][pLevel]-1)*2;
			PlayerInfo[playerid][pSHealth] = 0.0;
			PlayerInfo[playerid][pAlcoholPerk] = 0;
			PlayerInfo[playerid][pDrugPerk] = 0;
			PlayerInfo[playerid][pMiserPerk] = 0;
			PlayerInfo[playerid][pPainPerk] = 0;
			PlayerInfo[playerid][pTraderPerk] = 0;
			GivePlayerMoney(playerid,-100000);
			PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
			format(string, 256, "   You have %d unspent Upgrade Points !",PlayerInfo[playerid][gPupgrade]);
			SendClientMessage(playerid, COLOR_GRAD2, string);
		}
		return 1;
	}
	if (strcmp(cmd, "/buygun", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(GetPlayerMoney(playerid) < 1)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You dont have enough money with you !");
			    return 1;
			}
			new gun;
			new gunid[16];
			new gunstring1[256];
			new gunstring2[256];
			new gunstring3[256];
			new gunstring4[256];
			new gunstring5[256];
			new infostring[256];
			new guncharge;
			new ammocharge;
			new location = PlayerInfo[playerid][pLocal];
			if(location == 99 || location == 100 || location == 102)
			{
			    if(BizzInfo[location-99][bProducts] <= 0)
			    {
			        GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
					return 1;
			    }
				new mod = 100;
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					format(string, sizeof(string), "USAGE: /buygun [gunname] [ammoamount]");
					SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
					SendClientMessage(playerid, COLOR_WHITE,"*** Guns & Ammo ***");
					SendClientMessage(playerid, COLOR_GRAD2,string);
					format(gunstring1, 256, "Weapons: parachute ($%d) golfclub ($%d) nightstick ($%d) baseballbat ($%d) shovel ($%d) poolcue ($%d)",
					GunPrice[0][0]/100*mod,GunPrice[1][0]/100*mod,GunPrice[2][0]/100*mod,GunPrice[3][0]/100*mod,GunPrice[4][0]/100*mod,GunPrice[5][0]/100*mod,GunPrice[6][0]/100*mod);
					SendClientMessage(playerid, COLOR_GRAD3, gunstring1);
					format(gunstring2, 256, "Weapons: purpledildo ($%d) whitedildo ($%d) longwhitedildo ($%d) whitedildo2 ($%d) flowers ($%d) cane",
					GunPrice[7][0]/100*mod,GunPrice[8][0]/100*mod,GunPrice[9][0]/100*mod,GunPrice[10][0]/100*mod,GunPrice[11][0]/100*mod,GunPrice[12][0]/100*mod);
					SendClientMessage(playerid, COLOR_GRAD3, gunstring2);
					format(gunstring3, 256, "Weapons: sdpistol ($%d) deagle ($%d) mp5 ($%d)",
					GunPrice[13][0]/100*mod,GunPrice[14][0]/100*mod,GunPrice[15][0]/100*mod,GunPrice[16][0]/100*mod,GunPrice[17][0]/100*mod,GunPrice[18][0]/100*mod);
					SendClientMessage(playerid, COLOR_GRAD3, gunstring3);
					format(gunstring4, 256, "Weapons: shotgun ($%d) ak47 ($%d) m4 ($%d) rifle ($%d)",
					GunPrice[19][0]/100*mod,GunPrice[20][0]/100*mod,GunPrice[21][0]/100*mod,GunPrice[22][0]/100*mod,GunPrice[23][0]/100*mod,GunPrice[24][0]/100*mod);
					SendClientMessage(playerid, COLOR_GRAD3, gunstring4);
					format(gunstring5, 256, "Weapons: pistolammo ($%d) shotgunammo ($%d) smgammo ($%d) assaultammo ($%d) rifleammo ($%d)",
					GunPrice[25][0],GunPrice[26][0],GunPrice[27][0],GunPrice[28][0],GunPrice[29][0]);
					SendClientMessage(playerid, COLOR_GRAD3, gunstring5);
					SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
					return 1;
				}
				strmid(gunid, tmp, 0, strlen(cmdtext), 255);
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					format(string, sizeof(string), "USAGE: /buygun [gunname] [ammoamount]");
					return 1;
				}
				new ammo = strval(tmp);
				if(ammo < 1 || ammo > 999) { SendClientMessage(playerid, COLOR_GREY, "   Ammo ammount not lower then 1 or higher then 999 !"); return 1; }
				if (strcmp(gunid, "parachute", true, strlen(gunid)) == 0)
				{
					gun = 46;
					guncharge = GunPrice[0][0]/100*mod;
					ammocharge = 0;
				}
				else if (strcmp(gunid, "golfclub", true, strlen(gunid)) == 0)
				{
					gun = 2; guncharge = GunPrice[1][0]/100*mod; ammocharge = 0;
					PlayerInfo[playerid][pGun1] = 2; PlayerInfo[playerid][pAmmo1] = 1;
				}
				else if (strcmp(gunid, "nightstick", true, strlen(gunid)) == 0)
				{
					gun = 3; guncharge = GunPrice[2][0]/100*mod; ammocharge = 0;
					PlayerInfo[playerid][pGun1] = 3; PlayerInfo[playerid][pAmmo1] = 1;
				}
				else if (strcmp(gunid, "baseballbat", true, strlen(gunid)) == 0)
				{
					gun = 5; guncharge = GunPrice[4][0]/100*mod; ammocharge = 0;
					PlayerInfo[playerid][pGun1] = 5; PlayerInfo[playerid][pAmmo1] = 1;
				}
				else if (strcmp(gunid, "shovel", true, strlen(gunid)) == 0)
				{
					gun = 6; guncharge = GunPrice[5][0]/100*mod; ammocharge = 0;
					PlayerInfo[playerid][pGun1] = 6; PlayerInfo[playerid][pAmmo1] = 1;
				}
				else if (strcmp(gunid, "poolcue", true, strlen(gunid)) == 0)
				{
					gun = 7; guncharge = GunPrice[6][0]/100*mod; ammocharge = 0;
					PlayerInfo[playerid][pGun1] = 7; PlayerInfo[playerid][pAmmo1] = 1;
				}
				else if (strcmp(gunid, "purpledildo", true, strlen(gunid)) == 0)
				{
					gun = 10; guncharge = GunPrice[7][0]/100*mod; ammocharge = 0;
					PlayerInfo[playerid][pGun1] = 10; PlayerInfo[playerid][pAmmo1] = 1;
				}
				else if (strcmp(gunid, "whitedildo", true, strlen(gunid)) == 0)
				{
					gun = 11; guncharge = GunPrice[8][0]/100*mod; ammocharge = 0;
					PlayerInfo[playerid][pGun1] = 11; PlayerInfo[playerid][pAmmo1] = 1;
				}
				else if (strcmp(gunid, "longwhitedildo", true, strlen(gunid)) == 0)
				{
					gun = 12; guncharge = GunPrice[9][0]/100*mod; ammocharge = 0;
					PlayerInfo[playerid][pGun1] = 12; PlayerInfo[playerid][pAmmo1] = 1;
				}
				else if (strcmp(gunid, "whitedildo2", true, strlen(gunid)) == 0)
				{
					gun = 13; guncharge = GunPrice[10][0]/100*mod; ammocharge = 0;
					PlayerInfo[playerid][pGun1] = 13; PlayerInfo[playerid][pAmmo1] = 1;
				}
				else if (strcmp(gunid, "flowers", true, strlen(gunid)) == 0)
				{
					gun = 14; guncharge = GunPrice[11][0]/100*mod; ammocharge = 0;
					PlayerInfo[playerid][pGun1] = 14; PlayerInfo[playerid][pAmmo1] = 1;
				}
				else if (strcmp(gunid, "cane", true, strlen(gunid)) == 0)
				{
					gun = 15; guncharge = GunPrice[12][0]/100*mod; ammocharge = 0;
					PlayerInfo[playerid][pGun1] = 15; PlayerInfo[playerid][pAmmo1] = 1;
				}
				else if (strcmp(gunid, "sdpistol", true, strlen(gunid)) == 0)
				{
					gun = 23; guncharge = GunPrice[13][0]/100*mod; ammocharge = GunPrice[25][0]*ammo;
					PlayerInfo[playerid][pGun2] = 23; PlayerInfo[playerid][pAmmo2] = ammo;
				}
				else if (strcmp(gunid, "deagle", true, strlen(gunid)) == 0)
				{
					gun = 24; guncharge = GunPrice[15][0]/100*mod; ammocharge = GunPrice[25][0]*ammo;
					PlayerInfo[playerid][pGun2] = 24; PlayerInfo[playerid][pAmmo2] = ammo;
				}
				else if (strcmp(gunid, "mp5", true, strlen(gunid)) == 0)
				{
					gun = 29; guncharge = GunPrice[18][0]/100*mod; ammocharge = GunPrice[27][0]*ammo;
					PlayerInfo[playerid][pGun3] = 29; PlayerInfo[playerid][pAmmo3] = ammo;
				}
				else if (strcmp(gunid, "shotgun", true, strlen(gunid)) == 0)
				{
					gun = 25; guncharge = GunPrice[19][0]/100*mod; ammocharge = GunPrice[26][0]*ammo;
					PlayerInfo[playerid][pGun3] = 25; PlayerInfo[playerid][pAmmo3] = ammo;
				}
				else if (strcmp(gunid, "ak47", true, strlen(gunid)) == 0)
				{
					gun = 30; guncharge = GunPrice[22][0]/100*mod; ammocharge = GunPrice[28][0]*ammo;
					PlayerInfo[playerid][pGun4] = 30; PlayerInfo[playerid][pAmmo4] = ammo;
				}
				else if (strcmp(gunid, "m4", true, strlen(gunid)) == 0)
				{
					gun = 31; guncharge = GunPrice[23][0]/100*mod; ammocharge = GunPrice[28][0]*ammo;
					PlayerInfo[playerid][pGun4] = 31; PlayerInfo[playerid][pAmmo4] = ammo;
				}
				else if (strcmp(gunid, "rifle", true, strlen(gunid)) == 0)
				{
					gun = 33; guncharge = GunPrice[24][0]/100*mod; ammocharge = GunPrice[29][0]*ammo;
					PlayerInfo[playerid][pGun4] = 33; PlayerInfo[playerid][pAmmo4] = ammo;
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD6, "ShopKeeper says: I have never heard of that weapon.");
					return 1;
				}
				if((guncharge+ammocharge) > GetPlayerMoney(playerid))
				{
					format(infostring, 256, "   You don't have $%d !",guncharge+ammocharge);
					SendClientMessage(playerid, COLOR_GRAD3, infostring);
					return 1;
				}
				if(GetPlayerMoney(playerid) < (guncharge+ammocharge))
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Can't afford that !");
				    return 1;
				}
				new payout = guncharge + ammocharge;
				format(infostring, 256, "You have purchased %s with %d ammo for $%d",gunid,ammo,payout);
				SendClientMessage(playerid, COLOR_GRAD3, infostring);
				if(location == 102 && IsACop(playerid)) { }
				else { GivePlayerMoney(playerid, - payout); }
				BizzInfo[location-99][bTill] += payout;
				ExtortionBiz(location-99, payout);
				BizzInfo[location-99][bProducts]--;
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				GivePlayerWeapon(playerid, gun, ammo);
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "%s bought weapons for $%d at biz %d", sendername, payout, location-99);
				printf("%s", string);
				PayLog(string);
			}
			else
			{
			    SendClientMessage(playerid, COLOR_WHITE,"You are not in a store.");
				return 1;
			}
		}
		return 1;
	}
	if (strcmp(cmd, "/upgrade", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new gunid[16];
			new infostring[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				format(string, sizeof(string), "USAGE: /upgrade [upgradename] (You have %d Upgrade points)",PlayerInfo[playerid][gPupgrade]);
				SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
				SendClientMessage(playerid, COLOR_WHITE,"*** UPGRADES ***");
				SendClientMessage(playerid, COLOR_GRAD2,string);
				if(PlayerInfo[playerid][pLevel] == 2)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 2 Perks: Alcoholic, DrugAddict");
				}
				else if(PlayerInfo[playerid][pLevel] == 3)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 3 Perks: Alcoholic, DrugAddict, Miser");
				}
				else if(PlayerInfo[playerid][pLevel] == 3)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 4 Perks: Alcoholic, DrugAddict, Miser, Trader");
				}
				else if(PlayerInfo[playerid][pLevel] >= 5)
				{
					SendClientMessage(playerid, COLOR_GRAD3, "Level 5 Perks: Alcoholic, DrugAddict, Miser, Trader, PainKillers");
				}
				SendClientMessage(playerid, COLOR_GRAD5, "Extra Health: health");
				SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
				return 1;
			}
			strmid(gunid, tmp, 0, strlen(cmdtext), 255);
			if (PlayerInfo[playerid][gPupgrade] > 1)
			{
				if (PlayerInfo[playerid][pLevel] >= 1 && (strcmp(gunid, "health", true, strlen(gunid)) == 0))
				{
					if (PlayerInfo[playerid][pSHealth] < 50)
					{
						PlayerInfo[playerid][pSHealth] = PlayerInfo[playerid][pSHealth]+5.0;
						format(infostring, 256, "New Upgrade: You Will Now Spawn With %.2f Health (+5)",PlayerInfo[playerid][pSHealth]+50);
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD6, "   You Have Maximum Spawn Health");
						return 1;
					}
				}
				else if (PlayerInfo[playerid][pLevel] >= 2 && (strcmp(gunid, "alcoholic", true, strlen(gunid)) == 0))
				{
					if (PlayerInfo[playerid][pAlcoholPerk] < 3)
					{
						PlayerInfo[playerid][pAlcoholPerk] += 1;
						format(infostring, 256, "New Perk Upgrade: Your Alcoholic Perk is now Level %d.",PlayerInfo[playerid][pAlcoholPerk]);
						PlayerInfo[playerid][gPupgrade]--;
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD6, "   Your Alcoholic Perk is maxed out !");
						return 1;
					}
				}
				else if (PlayerInfo[playerid][pLevel] >= 2 && (strcmp(gunid, "drugaddict", true, strlen(gunid)) == 0))
				{
					if (PlayerInfo[playerid][pDrugPerk] < 3)
					{
						PlayerInfo[playerid][pDrugPerk] += 1;
						format(infostring, 256, "New Perk Upgrade: Your Drug Addict Perk is now Level %d.",PlayerInfo[playerid][pDrugPerk]);
						PlayerInfo[playerid][gPupgrade]--;
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD6, "   Your Drug Addict Perk is maxed out !");
						return 1;
					}
				}
				else if (PlayerInfo[playerid][pLevel] >= 3 && (strcmp(gunid, "miser", true, strlen(gunid)) == 0))
				{
					if (PlayerInfo[playerid][pMiserPerk] < 3)
					{
						PlayerInfo[playerid][pMiserPerk] += 1;
						format(infostring, 256, "New Perk Upgrade: Your Miser Perk is now Level %d.",PlayerInfo[playerid][pMiserPerk]);
						PlayerInfo[playerid][gPupgrade]--;
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD6, "   Your Miser Perk is maxed out !");
						return 1;
					}
				}
				else if (PlayerInfo[playerid][pLevel] >= 4 && (strcmp(gunid, "trader", true, strlen(gunid)) == 0))
				{
					if (PlayerInfo[playerid][pTraderPerk] < 3)
					{
						PlayerInfo[playerid][pTraderPerk] += 1;
						format(infostring, 256, "New Perk Upgrade: Your Trader Perk is now Level %d.",PlayerInfo[playerid][pTraderPerk]);
						PlayerInfo[playerid][gPupgrade]--;
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD6, "   Your Trader Perk is maxed out !");
						return 1;
					}
				}
				else if (PlayerInfo[playerid][pLevel] >= 5 && (strcmp(gunid, "painkillers", true, strlen(gunid)) == 0))
				{
					if (PlayerInfo[playerid][pPainPerk] < 3)
					{
						PlayerInfo[playerid][pPainPerk] += 1;
						format(infostring, 256, "New Perk Upgrade: Your Pain Killers Perk is now Level %d.",PlayerInfo[playerid][pPainPerk]);
						PlayerInfo[playerid][gPupgrade]--;
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD6, "   Your Pain Killers Perk is maxed out !");
						return 1;
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD6, "   Unrecognized Upgrade");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD6, "   You Have 0 Upgrade Points");
				return 1;
			}
			SendClientMessage(playerid, COLOR_GRAD6, infostring);
			PlayerInfo[playerid][gPupgrade]--;
		}
		return 1;
	}
//-------------------------------[Login]--------------------------------------------------------------------------
	if (strcmp(cmd, "/login", true) ==0 )
	{
	    if(IsPlayerConnected(playerid))
	    {
	        new tmppass[64];
			if(gPlayerLogged[playerid] == 1)
			{
				SendClientMessage(playerid, COLOR_WHITE, "SERVER: You are already logged in.");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /login [password]");
				return 1;
			}
			strmid(tmppass, tmp, 0, strlen(cmdtext), 255);
			Encrypt(tmppass);
			OnPlayerLogin(playerid,tmppass);
		}
		return 1;
	}
//----------------------------------[ooc]-----------------------------------------------
	if(strcmp(cmd, "/ooc", true) == 0 || strcmp(cmd, "/o", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(gPlayerLogged[playerid] == 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You havent logged in yet !");
	            return 1;
	        }
			if ((noooc) && PlayerInfo[playerid][pAdmin] < 1)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   The OOC channel has been disabled by an Admin !");
				return 1;
			}
			if(PlayerInfo[playerid][pMuted] == 1)
			{
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "   You can't speak, you have been silenced !");
				return 1;
			}
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/o)oc [ooc chat]");
				return 1;
			}
			format(string, sizeof(string), "(( %s: %s ))", sendername, result);
			OOCOff(COLOR_OOC,string);
			printf("%s", string);
		}
		return 1;
	}
	if(strcmp(cmd, "/noooc", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 3 && (!noooc))
			{
				noooc = 1;
				BroadCast(COLOR_GRAD2, "   OOC chat channel disabled by an Admin !");
			}
			else if (PlayerInfo[playerid][pAdmin] >= 3 && (noooc))
			{
				noooc = 0;
				BroadCast(COLOR_GRAD2, "   OOC chat channel enabled by an Admin !");
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/speedo", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (gSpeedo[playerid] == 1)
			{
				gSpeedo[playerid] = 2;
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~g~on", 5000, 5);
				PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			}
			else if (gSpeedo[playerid] == 2)
			{
				gSpeedo[playerid] = 1;
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~r~off", 5000, 5);
				PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "you dont have a speedometer");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/fuel", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (gGas[playerid] == 0)
			{
				gGas[playerid] = 1;
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~g~Fuel Info on", 5000, 5);
				PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			}
			else if (gGas[playerid] == 1)
			{
				gGas[playerid] = 0;
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~r~Fuel Info off", 5000, 5);
				PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			}
		}
		return 1;
	}
//----------------------------------[advertise]-----------------------------------------------
	if(strcmp(cmd, "/advertise", true) == 0 || strcmp(cmd, "/ad", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(gPlayerLogged[playerid] == 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You havent logged in yet !");
	            return 1;
	        }
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/ad)vertise [advert text]");
				return 1;
			}
			if ((!adds) && (PlayerInfo[playerid][pAdmin] < 1))
			{
				format(string, sizeof(string), "   Please try again later %d seconds between Advertisements !",  (addtimer/1000));
				SendClientMessage(playerid, COLOR_GRAD2, string);
				return 1;

			}
			new payout = idx * 25;
			if(GetPlayerMoney(playerid) < payout)
	        {
	            format(string, sizeof(string), "* You used %d characters which cost $%d, you don't have enough.", offset, payout);
	            SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	            return 1;
	        }
			GivePlayerMoney(playerid, - payout);
			SBizzInfo[7][sbTill] += payout;
			ExtortionSBiz(7, payout);
			format(string, sizeof(string), "Advertisement: %s, Contact: %s Ph: %d",  result, sendername,PlayerInfo[playerid][pPnumber]);
			OOCNews(TEAM_GROVE_COLOR,string);
			format(string, sizeof(string), "~r~Paid $%d~n~~w~Message contained: %d Characters", payout, idx);
			GameTextForPlayer(playerid, string, 5000, 5);
			if (PlayerInfo[playerid][pAdmin] < 1){SetTimer("AddsOn", addtimer, 0);adds = 0;}
		}
		return 1;
	}
//----------------------------------[government]-----------------------------------------------
	if(strcmp(cmd, "/government", true) == 0 || strcmp(cmd, "/gov", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(gTeam[playerid] != 2)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not a Cop !");
			    return 1;
			}
			if(PlayerInfo[playerid][pRank] < 5)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You need to be Rank 5 to be able to use this !");
			    return 1;
			}
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/gov)ernment [text]");
				return 1;
			}
			SendClientMessageToAll(COLOR_WHITE, "|___________ Government News Announcement ___________|");
			format(string, sizeof(string), "Officer %s: %s", sendername, result);
			SendClientMessageToAll(COLOR_DBLUE, string);
		}
		return 1;
	}
//----------------------------------[togooc]-----------------------------------------------

	if(strcmp(cmd, "/togooc", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (!gOoc[playerid])
			{
				gOoc[playerid] = 1;
				SendClientMessage(playerid, COLOR_GRAD2, "   OOC chat channel Disabled !");
			}
			else if (gOoc[playerid])
			{
				gOoc[playerid] = 0;
				SendClientMessage(playerid, COLOR_GRAD2, "   OOC chat channel Enabled !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/tognews", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (!gNews[playerid])
			{
				gNews[playerid] = 1;
				SendClientMessage(playerid, COLOR_GRAD2, "   News chat channel Disabled !");
			}
			else if (gNews[playerid])
			{
				gNews[playerid] = 0;
				SendClientMessage(playerid, COLOR_GRAD2, "   News chat channel Enabled !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/togfam", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (!gFam[playerid])
			{
				gFam[playerid] = 1;
				SendClientMessage(playerid, COLOR_GRAD2, "   Family chat channel Disabled !");
			}
			else if (gFam[playerid])
			{
				gFam[playerid] = 0;
				SendClientMessage(playerid, COLOR_GRAD2, "   Family chat channel Enabled !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/togwhisper", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pDonateRank] > 0 || PlayerInfo[playerid][pAdmin] > 1)
	        {
				if (!HidePM[playerid])
				{
					HidePM[playerid] = 1;
					SendClientMessage(playerid, COLOR_GRAD2, "   Whisper chat channel Disabled !");
				}
				else if (HidePM[playerid])
				{
					HidePM[playerid] = 0;
					SendClientMessage(playerid, COLOR_GRAD2, "   Whisper chat channel Enabled !");
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   Not an Admin / Premium Account User !");
	            return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/togphone", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pDonateRank] > 0 || PlayerInfo[playerid][pAdmin] > 1)
	        {
				if (!PhoneOnline[playerid])
				{
					PhoneOnline[playerid] = 1;
					SendClientMessage(playerid, COLOR_GRAD2, "   Your Phone is Offline !");
				}
				else if (PhoneOnline[playerid])
				{
					PhoneOnline[playerid] = 0;
					SendClientMessage(playerid, COLOR_GRAD2, "   Your Phone is Online !");
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   Not an Admin / Premium Account User !");
	            return 1;
			}
		}
		return 1;
	}
//----------------------------------[Emote]-----------------------------------------------
	if(strcmp(cmd, "/me", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(gPlayerLogged[playerid] == 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You havent logged in yet !");
	            return 1;
	        }
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /me [action]");
				return 1;
			}
			format(string, sizeof(string), "* %s %s", sendername, result);
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			printf("%s", string);
		}
		return 1;
	}
//----------------------------------[Local]-----------------------------------------------
	if(strcmp(cmd, "/local", true) == 0 || strcmp(cmd, "/l", true) == 0 || strcmp(cmd, "/say", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(gPlayerLogged[playerid] == 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You havent logged in yet !");
	            return 1;
	        }
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/l)ocal [local chat]");
				return 1;
			}
			format(string, sizeof(string), "%s Says: %s", sendername, result);
			ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
			printf("%s", string);
		}
		return 1;
	}
	if(strcmp(cmd, "/b", true) == 0)//local ooc
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(gPlayerLogged[playerid] == 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You havent logged in yet !");
	            return 1;
	        }
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /b [local ooc chat]");
				return 1;
			}
			format(string, sizeof(string), "%s Says: (( %s ))", sendername, result);
			ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
			printf("%s", string);
		}
		return 1;
	}
	if(strcmp(cmd, "/close", true) == 0 || strcmp(cmd, "/c", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(gPlayerLogged[playerid] == 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You havent logged in yet !");
	            return 1;
	        }
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /(c)lose [close chat text]");
				return 1;
			}
			format(string, sizeof(string), "%s Says: %s", sendername, result);
			ProxDetector(3.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
			printf("%s", string);
		}
		return 1;
	}
//----------------------------------[Shout]-----------------------------------------------
	if(strcmp(cmd, "/shout", true) == 0 || strcmp(cmd, "/s", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(gPlayerLogged[playerid] == 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You havent logged in yet !");
	            return 1;
	        }
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/s)hout [local chat]");
				return 1;
			}
			format(string, sizeof(string), "%s Shouts: %s!!", sendername, result);
			ProxDetector(30.0, playerid, string,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_FADE1,COLOR_FADE2);
			printf("%s", string);
		}
		return 1;
	}
//----------------------------------[Shout]-----------------------------------------------
	if(strcmp(cmd, "/megaphone", true) == 0 || strcmp(cmd, "/m", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new tmpcar = GetPlayerVehicleID(playerid);
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/m)egaphone [megaphone chat]");
				return 1;
			}
			if(gTeam[playerid] == 2 || IsACop(playerid))
			{
				if(!IsACopCar(tmpcar))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You are not in a Police Vehicle !");
					return 1;
				}
				if(PlayerInfo[playerid][pMember] == 1||PlayerInfo[playerid][pLeader] == 1)
				{
					format(string, sizeof(string), "[Officer %s:o< %s]", sendername, result);
					ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
				}
				else if(PlayerInfo[playerid][pMember] == 2||PlayerInfo[playerid][pLeader] == 2)
				{
					format(string, sizeof(string), "[Agent %s:o< %s]", sendername, result);
					ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
				}
				else if(PlayerInfo[playerid][pMember] == 3||PlayerInfo[playerid][pLeader] == 3)
				{
				    format(string, sizeof(string), "[Soldier %s:o< %s]", sendername, result);
				    ProxDetector(60.0, playerid, string,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW,COLOR_YELLOW);
				}
				printf("%s", string);
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GRAD2, "   You are not part of a Team !");
				return 1;
			}
		}
		return 1;
	}
//----------------------------------[Team]-----------------------------------------------
	if(strcmp(cmd, "/radio", true) == 0 || strcmp(cmd, "/r", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/r)adio [radio chat]");
				return 1;
			}
			if(PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pLeader] == 1)
			{
				if(PlayerInfo[playerid][pRank] == 6) { format(string, sizeof(string), "** Chief %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 5) { format(string, sizeof(string), "** Captain %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 4) { format(string, sizeof(string), "** Lieutenant %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 3) { format(string, sizeof(string), "** Sergeant %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 2) { format(string, sizeof(string), "** Officer %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 1) { format(string, sizeof(string), "** Cadet %s: %s, over. **", sendername, result); }
				else
				{
					format(string, sizeof(string), "** Cadet %s: %s, over. **", sendername, result);
				}
				SendRadioMessage(1, TEAM_BLUE_COLOR, string);
				printf("%s", string);
				return 1;
			}
			else if(PlayerInfo[playerid][pMember] == 2 || PlayerInfo[playerid][pLeader] == 2)
			{
			    if(PlayerInfo[playerid][pRank] == 6) { format(string, sizeof(string), "** Director %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 5) { format(string, sizeof(string), "** Assistant Director in Charge %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 4) { format(string, sizeof(string), "** Special Agent in Charge %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 3) { format(string, sizeof(string), "** Special Agent %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 2) { format(string, sizeof(string), "** Special Agent Trainee %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 1) { format(string, sizeof(string), "** Professional Staff %s: %s, over. **", sendername, result); }
				else
				{
					format(string, sizeof(string), "** Intern %s: %s, over. **", sendername, result);
				}
				SendRadioMessage(2, TEAM_BLUE_COLOR, string);
				printf("%s", string);
				return 1;
			}
			else if(PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLeader] == 3)
			{
			    if(PlayerInfo[playerid][pRank] == 6) { format(string, sizeof(string), "** General %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 5) { format(string, sizeof(string), "** Lieutenant %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 4) { format(string, sizeof(string), "** Captain %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 3) { format(string, sizeof(string), "** Major %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 2) { format(string, sizeof(string), "** Sergeant %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 1) { format(string, sizeof(string), "** Private %s: %s, over. **", sendername, result); }
				else
				{
					format(string, sizeof(string), "** Private %s: %s, over. **", sendername, result);
				}
				SendRadioMessage(3, TEAM_BLUE_COLOR, string);
				printf("%s", string);
				return 1;
			}
			else if(gTeam[playerid] == 1||PlayerInfo[playerid][pMember]==4||PlayerInfo[playerid][pLeader]==4)
			{
				format(string, sizeof(string), "** Paramedic %s: %s, over. **", sendername, result);
				SendRadioMessage(4, TEAM_CYAN_COLOR, string);
				printf("%s", string);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are not part of a Team !");
				return 1;
			}
		}
		return 1;
	}
//----------------------------------[offduty]-----------------------------------------------
	if(strcmp(cmd, "/duty", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			GetPlayerName(playerid, sendername, sizeof(sendername));
			if(PlayerInfo[playerid][pMember] == 1)
			{
				if (PlayerToPoint(3, playerid,255.3,77.4,1003.6) || PlayerToPoint(3,playerid,-1616.1294,681.1594,7.1875) || PlayerInfo[playerid][pLocal] != 255)
				{
					if(OnDuty[playerid]==0)
			        {
				    	format(string, sizeof(string), "* Officer %s took a Badge and a Gun from his locker.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						GivePlayerWeapon(playerid, 24, 70);
						GivePlayerWeapon(playerid, 3, 0);
						OnDuty[playerid] = 1;
					}
					else if(OnDuty[playerid]==1)
					{
						format(string, sizeof(string), "* Officer %s places his Badge and Gun in his locker.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						GivePlayerWeapon(playerid, 23, 150);
						GivePlayerWeapon(playerid, 5, 0);
						OnDuty[playerid] = 0;
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You are not in a locker room !");
					return 1;
				}
			}
			else if(PlayerInfo[playerid][pMember] == 4||PlayerInfo[playerid][pLeader] == 4)
			{
			    if(JobDuty[playerid] == 1)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are now Off Duty from your Medic Job and will not receive calls anymore.");
			        JobDuty[playerid] = 0;
			        Medics -= 1;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are now On Duty with your Medic Job and will receive calls from people in need.");
			        JobDuty[playerid] = 1;
			        Medics += 1;
			    }
			}
			else if(PlayerInfo[playerid][pJob] == 7)
			{
			    if(JobDuty[playerid] == 1)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are now Off Duty from your Car Mechanic Job and will not receive calls anymore.");
			        JobDuty[playerid] = 0;
			        Mechanics -= 1;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are now On Duty with your Car Mechanic Job and will receive calls from people in need.");
			        JobDuty[playerid] = 1;
			        Mechanics += 1;
			    }
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GRAD1, "   You are not a Cop !");
			}
		}
		return 1;
	}
//----------------------------------[departments]-----------------------------------------------
	if(strcmp(cmd, "/departments", true) == 0 || strcmp(cmd, "/d", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/d)epartments [department chat]");
				return 1;
			}
			if(PlayerInfo[playerid][pMember] == 1 || PlayerInfo[playerid][pLeader] == 1)
			{
			    if(PlayerInfo[playerid][pRank] == 6) { format(string, sizeof(string), "** Chief %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 5) { format(string, sizeof(string), "** Captain %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 4) { format(string, sizeof(string), "** Lieutenant %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 3) { format(string, sizeof(string), "** Sergeant %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 2) { format(string, sizeof(string), "** Officer %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 1) { format(string, sizeof(string), "** Cadet %s: %s, over. **", sendername, result); }
				else
				{
					format(string, sizeof(string), "** Officer %s: %s, over. **", sendername, result);
				}
				SendTeamMessage(2, COLOR_ALLDEPT, string);
				SendTeamMessage(1, COLOR_ALLDEPT, string);
				printf("%s", string);
				return 1;
			}
			else if(PlayerInfo[playerid][pMember] == 2 || PlayerInfo[playerid][pLeader] == 2)
			{
			    if(PlayerInfo[playerid][pRank] == 6) { format(string, sizeof(string), "** Director %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 5) { format(string, sizeof(string), "** Assistant Director in Charge %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 4) { format(string, sizeof(string), "** Special Agent in Charge %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 3) { format(string, sizeof(string), "** Special Agent %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 2) { format(string, sizeof(string), "** Special Agent Trainee %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 1) { format(string, sizeof(string), "** Professional Staff %s: %s, over. **", sendername, result); }
				else
				{
					format(string, sizeof(string), "** Intern %s: %s, over. **", sendername, result);
				}
				SendTeamMessage(2, COLOR_ALLDEPT, string);
				SendTeamMessage(1, COLOR_ALLDEPT, string);
				printf("%s", string);
				return 1;
			}
			else if(PlayerInfo[playerid][pMember] == 3 || PlayerInfo[playerid][pLeader] == 3)
			{
			    if(PlayerInfo[playerid][pRank] == 6) { format(string, sizeof(string), "** General %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 5) { format(string, sizeof(string), "** Lieutenant %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 4) { format(string, sizeof(string), "** Captain %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 3) { format(string, sizeof(string), "** Major %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 2) { format(string, sizeof(string), "** Sergeant %s: %s, over. **", sendername, result); }
				else if(PlayerInfo[playerid][pRank] == 1) { format(string, sizeof(string), "** Private %s: %s, over. **", sendername, result); }
				else
				{
					format(string, sizeof(string), "** Private %s: %s, over. **", sendername, result);
				}
				SendTeamMessage(2, COLOR_ALLDEPT, string);
				SendTeamMessage(1, COLOR_ALLDEPT, string);
				printf("%s", string);
				return 1;
			}
			else if(gTeam[playerid] == 1||PlayerInfo[playerid][pMember]==4||PlayerInfo[playerid][pLeader]==4)
			{
				format(string, sizeof(string), "** Paramedic %s: %s, over. **", sendername, result);
				SendTeamMessage(2, COLOR_ALLDEPT, string);
				SendTeamMessage(1, COLOR_ALLDEPT, string);
				printf("%s", string);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are not part of a Team !");
				return 1;
			}
		}
		return 1;
	}
//----------------------------------[mdc]-----------------------------------------------
	if(strcmp(cmd, "/mdc", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(!IsACop(playerid))
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not a Cop !");
	            return 1;
	        }
			new tmpcar = GetPlayerVehicleID(playerid);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /mdc [playerid/PartOfName]");
				return 1;
			}
			//giveplayerid = strval(tmp);
			giveplayerid = ReturnUser(tmp);
			if(IsACopCar(tmpcar)||PlayerToPoint(5.0, playerid, 253.9280,69.6094,1003.6406))
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        GetPlayerName(giveplayerid, sendername, sizeof(sendername));
						SendClientMessage(playerid, TEAM_BLUE_COLOR,"______-=MOBILE DATA COMPUTER=-_______");
						format(string, sizeof(string), "Name : %s", sendername);
						SendClientMessage(playerid, COLOR_WHITE,string);
						format(string, sizeof(string), "Crime : %s", PlayerCrime[giveplayerid][pAccusedof]);
						SendClientMessage(playerid, COLOR_GRAD2,string);
						format(string, sizeof(string), "Claimant : %s", PlayerCrime[giveplayerid][pVictim]);
						SendClientMessage(playerid, COLOR_GRAD3,string);
						format(string, sizeof(string), "Reported : %s", PlayerCrime[giveplayerid][pAccusing]);
						SendClientMessage(playerid, COLOR_GRAD4,string);
						format(string, sizeof(string), "Accused : %s", PlayerCrime[giveplayerid][pBplayer]);
						SendClientMessage(playerid, COLOR_GRAD5,string);
						SendClientMessage(playerid, TEAM_BLUE_COLOR,"_______________________________________");
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GRAD2, "   You are not in a Police Vehicle or in the Police Department.");
				return 1;
			}
		}
		return 1;
	}
//----------------------------------[SetCrim]-----------------------------------------------
	if(strcmp(cmd, "/suspect", true) == 0 || strcmp(cmd, "/su", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(OnDuty[playerid] != 1  && PlayerInfo[playerid][pMember] == 1)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not on Duty!");
			    return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/su)spect [playerid/PartOfName] [crime discription]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if (gTeam[playerid] == 2 || IsACop(playerid))
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
						if (gTeam[giveplayerid] != 2)
						{
							GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							new length = strlen(cmdtext);
							while ((idx < length) && (cmdtext[idx] <= ' '))
							{
								idx++;
							}
							new offset = idx;
							new result[64];
							while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
							{
								result[idx - offset] = cmdtext[idx];
								idx++;
							}
							result[idx - offset] = EOS;
							if(!strlen(result))
							{
								SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/su)spect [playerid/PartOfName] [crime text]");
								return 1;
							}
							if(WantedPoints[giveplayerid] == 0) { WantedPoints[giveplayerid] = 3; }
							else { WantedPoints[giveplayerid]+= 2; }
							SetPlayerCriminal(giveplayerid,playerid, result);
							return 1;
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD2, "   You can't suspect a Cop !");
						}
					}
				}
				else
				{
						format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
						SendClientMessage(playerid, COLOR_GRAD1, string);
						return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are not a Cop / FBI / National Guard !");
			}
		}
		return 1;
	}
//----------------------------------[LOCK]-----------------------------------------------
	if(strcmp(cmd, "/lock", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new carid;
			if (gTeam[playerid] == 2 || gTeam[playerid] == 1)
			{
				if(gLastCar[playerid] == 0 && PlayerInfo[playerid][pPhousekey] == 255)
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You dont have a Vehicle.");
					return 1;
				}
				else if(gLastCar[playerid] != 0 && gLastCar[playerid] != PlayerInfo[playerid][pPhousekey]+1)
				{
					if (HireCar[playerid] != gLastCar[playerid] && HireCar[playerid] != 299)
					{
						gLastDriver[HireCar[playerid]] = 300;
						gCarLock[HireCar[playerid]] = 0;
						UnLockCar(HireCar[playerid]);
					}
					HireCar[playerid] = gLastCar[playerid];
				}
			}
			if (PlayerInfo[playerid][pPhousekey] == 255)
			{
				if(HireCar[playerid] == 299)
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You dont have a Vehicle.");
					return 1;
				}
			}
			carid = PlayerInfo[playerid][pPhousekey]+1;
			if(HireCar[playerid] != 299 && !SwitchKey[playerid])
			{
				carid = HireCar[playerid];
			}
			//new driver = gLastDriver[carid];
			new lockstatus = gCarLock[carid];
			new Float:cx,Float:cy,Float:cz;
			GetVehiclePos(carid, cx, cy, cz);
			switch (lockstatus)
			{
				case 0:
				{
					if(HireCar[playerid] == 299 && PlayerInfo[playerid][pPhousekey] == 255)
					{
						SendClientMessage(playerid, COLOR_GRAD2, "   You dont have a Vehicle");
						return 1;
					}
					if(HireCar[playerid] == carid && !SwitchKey[playerid])
					{
						GameTextForPlayer(playerid, "~w~Hire Vehicle ~r~Locked", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						gCarLock[carid] = 1;
						LockCar(carid);
					}
					else if (PlayerInfo[playerid][pPhousekey] == carid-1)
					{
						GameTextForPlayer(playerid, "~w~House Vehicle ~r~Locked", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						gCarLock[carid] = 1;
						LockCar(carid);
						return 1;
					}
				}
				case 1:
				{
					if(HireCar[playerid] == 299 && PlayerInfo[playerid][pPhousekey] == 255)
					{
						SendClientMessage(playerid, COLOR_GRAD2, "   You dont have a Vehicle");
						return 1;
					}
					if(HireCar[playerid] == carid && !SwitchKey[playerid])
					{
						GameTextForPlayer(playerid, "~w~Hire Vehicle ~g~Unlocked", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						gCarLock[carid] = 0;
						UnLockCar(carid);
					}
					if (PlayerInfo[playerid][pPhousekey] == carid-1)
					{
						GameTextForPlayer(playerid, "~w~House Vehicle ~g~Unlocked", 5000, 6);
						PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
						gCarLock[carid] = 0;
						UnLockCar(carid);
						return 1;
					}
				}
				default:
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   Error");
				}
			}
			if(carid == 256)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You dont have a Vehicle !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/open", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        for(new i = 0; i < sizeof(HouseInfo); i++)
			{
				if (PlayerToPoint(3, playerid,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]) || PlayerToPoint(3, playerid,HouseInfo[i][hExitx], HouseInfo[i][hExity], HouseInfo[i][hExitz]))
				{
					if(PlayerInfo[playerid][pPhousekey] == i)
					{
						if(HouseInfo[i][hLock] == 1)
						{
							HouseInfo[i][hLock] = 0;
							GameTextForPlayer(playerid, "~w~Door ~g~Unlocked", 5000, 6);
							PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
							return 1;
						}
						if(HouseInfo[i][hLock] == 0)
						{
							HouseInfo[i][hLock] = 1;
							GameTextForPlayer(playerid, "~w~Door ~r~Locked", 5000, 6);
							PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
							return 1;
						}
					}
					else
					{
						GameTextForPlayer(playerid, "~r~You Dont Have A Key", 5000, 6);
						return 1;
					}
				}
			}
			for(new i = 0; i < sizeof(BizzInfo); i++)
			{
				if (PlayerToPoint(3, playerid,BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ]) || PlayerToPoint(3, playerid,BizzInfo[i][bExitX], BizzInfo[i][bExitY], BizzInfo[i][bExitZ]))
				{
					if(PlayerInfo[playerid][pPbiskey] == i)
					{
						if(BizzInfo[i][bLocked] == 1)
						{
							BizzInfo[i][bLocked] = 0;
							GameTextForPlayer(playerid, "~w~Bussiness ~g~Open", 5000, 6);
							PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
							return 1;
						}
						if(BizzInfo[i][bLocked] == 0)
						{
							BizzInfo[i][bLocked] = 1;
							GameTextForPlayer(playerid, "~w~Bussiness ~r~Closed", 5000, 6);
							PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
							return 1;
						}
					}
					else
					{
						GameTextForPlayer(playerid, "~r~You Dont Have A Key", 5000, 6);
						return 1;
					}
				}
			}
			for(new i = 0; i < sizeof(SBizzInfo); i++)
			{
				if (PlayerToPoint(3, playerid,SBizzInfo[i][sbEntranceX], SBizzInfo[i][sbEntranceY], SBizzInfo[i][sbEntranceZ]))
				{
					if(PlayerInfo[playerid][pPbiskey] == i+100)
					{
						if(SBizzInfo[i][sbLocked] == 1)
						{
							SBizzInfo[i][sbLocked] = 0;
							GameTextForPlayer(playerid, "~w~Bussiness ~g~Open", 5000, 6);
							PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
							return 1;
						}
						if(SBizzInfo[i][sbLocked] == 0)
						{
							SBizzInfo[i][sbLocked] = 1;
							GameTextForPlayer(playerid, "~w~Bussiness ~r~Closed", 5000, 6);
							PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
							return 1;
						}
					}
					else
					{
						GameTextForPlayer(playerid, "~r~You Dont Have A Key", 5000, 6);
						return 1;
					}
				}
			}
	    }
	    return 1;
	}
//----------------------------------[Wisper]-----------------------------------------------
	if(strcmp(cmd, "/wisper", true) == 0 || strcmp(cmd, "/w", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(gPlayerLogged[playerid] == 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You havent logged in yet !");
	            return 1;
	        }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/w)isper [playerid/PartOfName] [whisper text]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if (IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if(HidePM[giveplayerid] > 0)
			        {
			            SendClientMessage(playerid, COLOR_GREY, "   That player is blocking Whispers !");
			            return 1;
			        }
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					if(giveplayerid == playerid)
					{
						format(string, sizeof(string), "* %s mutters somthing.", sendername);
						ProxDetector(5.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					}
					new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' '))
					{
						idx++;
					}
					new offset = idx;
					new result[64];
					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
					{
						result[idx - offset] = cmdtext[idx];
						idx++;
					}
					result[idx - offset] = EOS;
					if(!strlen(result))
					{
						SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/w)isper [playerid/PartOfName] [whisper text]");
						return 1;
					}
					format(string, sizeof(string), "%s(ID: %d) whispers: %s", sendername, playerid, (result));
					SendClientMessage(giveplayerid, COLOR_YELLOW, string);
					format(string, sizeof(string), "Wisper sent to %s(ID: %d).", giveplayer, giveplayerid);
					SendClientMessage(playerid,  COLOR_YELLOW, string);
					SBizzInfo[2][sbTill] += txtcost / 2;
					ExtortionSBiz(2, txtcost / 2);
					return 1;
				}
			}
			else
			{
					format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
					SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		}
		return 1;
	}
//----------------------------------[Bank System]-----------------------------------------------
    if(strcmp(cmd, "/withdraw", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pLocal] != 103)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not at the Bank !");
	            return 1;
	        }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /withdraw [amount]");
				format(string, sizeof(string), "  You Have $%d in your account.", PlayerInfo[playerid][pAccount]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
				return 1;
			}
			new cashdeposit = strval(tmp);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /withdraw [amount]");
				format(string, sizeof(string), "  You Have $%d in your account.", PlayerInfo[playerid][pAccount]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
				return 1;
			}
			if (cashdeposit > PlayerInfo[playerid][pAccount] || cashdeposit < 1)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much !");
				return 1;
			}
		    ConsumingMoney[playerid] = 1;
			GivePlayerMoney(playerid,cashdeposit);
			PlayerInfo[playerid][pAccount]=PlayerInfo[playerid][pAccount]-cashdeposit;
			format(string, sizeof(string), "  You Have Withdrawn $%d from your account Total: $%d ", cashdeposit,PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/bank", true) == 0 || strcmp(cmd, "/deposit", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pLocal] != 103)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not at the Bank !");
	            return 1;
	        }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /bank [amount]");
				format(string, sizeof(string), "  You Have $%d in your account.", PlayerInfo[playerid][pAccount]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
				return 1;
			}
			new cashdeposit = strval(tmp);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /bank [amount]");
				format(string, sizeof(string), "  You Have $%d in your account.", PlayerInfo[playerid][pAccount]);
				SendClientMessage(playerid, COLOR_GRAD3, string);
				return 1;
			}
			if (cashdeposit > GetPlayerMoney(playerid) || cashdeposit < 1)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much");
				return 1;
			}
			GivePlayerMoney(playerid,-cashdeposit);
			new curfunds = PlayerInfo[playerid][pAccount];
			PlayerInfo[playerid][pAccount]=cashdeposit+PlayerInfo[playerid][pAccount];
			SendClientMessage(playerid, COLOR_WHITE, "|___ BANK STATMENT ___|");
			format(string, sizeof(string), "  Old Balance: $%d", curfunds);
			SendClientMessage(playerid, COLOR_GRAD2, string);
			format(string, sizeof(string), "  Deposit: $%d",cashdeposit);
			SendClientMessage(playerid, COLOR_GRAD4, string);
			SendClientMessage(playerid, COLOR_GRAD6, "|-----------------------------------------|");
			format(string, sizeof(string), "  New Balance: $%d", PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/balance", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(PlayerInfo[playerid][pLocal] != 103)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not at the Bank !");
	            return 1;
	        }
			format(string, sizeof(string), "  You Have $%d in your account.",PlayerInfo[playerid][pAccount]);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/dice", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new dice = random(6)+1;
			if (gDice[playerid] == 1)
			{
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "* %s Throws a Dice that lands on %d", sendername,dice);
				ProxDetector(5.0, playerid, string, TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR,TEAM_GREEN_COLOR);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You Don't Have A Dice");
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/transfer", true) == 0 || strcmp(cmd, "/wiretransfer", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(PlayerInfo[playerid][pLevel] < 3)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You must be level 3 !");
				return 1;
			}
			if(PlayerInfo[playerid][pLocal] != 103)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not at the Bank !");
	            return 1;
	        }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /transfer [playerid/PartOfName] [amount]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /transfer [playerid/PartOfName] [amount]");
				return 1;
			}
			moneys = strval(tmp);
			if (IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					playermoney = PlayerInfo[playerid][pAccount] ;
					if (moneys > 0 && playermoney >= moneys)
					{
						PlayerInfo[playerid][pAccount] -= moneys;
						PlayerInfo[giveplayerid][pAccount] += moneys;
						format(string, sizeof(string), "   You have transferd $%d to %s's account", moneys, giveplayer,giveplayerid);
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						SendClientMessage(playerid, COLOR_GRAD1, string);
						format(string, sizeof(string), "   You have recieved $%d to into your account from %s", moneys, sendername, playerid);
						SendClientMessage(giveplayerid, COLOR_GRAD1, string);
						format(string, sizeof(string), "%s transferd $%d to %s", sendername, moneys, giveplayer);
		                if(moneys >= 500000)
						{
							ABroadCast(COLOR_YELLOW,string,1);
						}
						printf("%s", string);
						PayLog(string);
						PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD1, "   Invalid transaction amount.");
					}
				}
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/buy", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (!PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53))//centerpoint 24-7
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are not in a 24-7 !");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /buy [item number]");
				SendClientMessage(playerid, COLOR_GREEN, "|_______ 24-7 _______|");
				SendClientMessage(playerid, COLOR_GRAD1, "| 1: Cell Phone $500			2: Scratch Card $7500");
				SendClientMessage(playerid, COLOR_GRAD2, "| 3: Phone Book $5000			4: Dice $500");
				SendClientMessage(playerid, COLOR_GRAD3, "| 5: Vehicle Key $5000		6: Vehicle Lock $10000");
				SendClientMessage(playerid, COLOR_GRAD4, "| 7: Speedometer $5000		8: Condom $50");
				SendClientMessage(playerid, COLOR_GRAD5, "| 9: CD-Player $2500			10: Chicken $10	");
				SendClientMessage(playerid, COLOR_GRAD5, "| 11: Hamburger $10			12: Frozen Pizza $10");
				return 1;
			}
			new item = strval(tmp);
			if(SBizzInfo[9][sbProducts] == 0)
			{
				GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
				return 1;
			}
			if (item == 1 && GetPlayerMoney(playerid) > 500)
			{
			    if(PlayerInfo[playerid][pTraderPerk] > 0)
			    {
					new skill = 500 / 100;
					new price = (skill)*(PlayerInfo[playerid][pTraderPerk]);
					new payout = 500 - price;
			        format(string, sizeof(string), "~r~-$%d", payout);
					GameTextForPlayer(playerid, string, 5000, 1);
					GivePlayerMoney(playerid,- payout);
					SBizzInfo[9][sbTill] += payout;
					ExtortionSBiz(9, payout);
			    }
			    else
			    {
			        format(string, sizeof(string), "~r~-$%d", 500);
					GameTextForPlayer(playerid, string, 5000, 1);
					GivePlayerMoney(playerid,-500);
					SBizzInfo[9][sbTill] += 500;
					ExtortionSBiz(9, 500);
			    }
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				new randphone = 1000 + random(8999);//minimum 1000  max 9999
				PlayerInfo[playerid][pPnumber] = randphone;
				format(string, sizeof(string), "   Mobile Phone Purchased your new Number is %d", randphone);
				SendClientMessage(playerid, COLOR_GRAD4, string);
				SendClientMessage(playerid, COLOR_GRAD5, "You can check this anytime by Typing /stats");
				SendClientMessage(playerid, COLOR_WHITE, "HINT: You can now type /help to see your cell phone commands.");
				return 1;
			}
			else if (item == 2 && GetPlayerMoney(playerid) > 7500)
			{
			    if(PlayerInfo[playerid][pTraderPerk] > 0)
			    {
					new skill = 7500 / 100;
					new price = (skill)*(PlayerInfo[playerid][pTraderPerk]);
					new payout = 7500 - price;
					GivePlayerMoney(playerid,- payout);
					SBizzInfo[9][sbTill] += payout;
					ExtortionSBiz(9, payout);
					format(string, sizeof(string), "~r~-$%d", payout);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				else
				{
				    GivePlayerMoney(playerid,-7500);
					SBizzInfo[9][sbTill] += 7500;
					ExtortionSBiz(9, 7500);
					format(string, sizeof(string), "~r~-$%d", 1000);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				new prize;
				new symb1[32]; new symb2[32]; new symb3[32];
				new randcard1 = random(10);//minimum 1000  max 9999
				new randcard2 = random(10);//minimum 1000  max 9999
				new randcard3 = random(10);//minimum 1000  max 9999
				if(randcard1 >= 5)
				{
					format(symb1, sizeof(symb1), "~b~]");
					randcard1 = 1;
				}
				else if(randcard1 <= 4 && randcard1 >= 2)
				{
					format(symb1, sizeof(symb1), "~g~]");
					randcard1 = 2;
				}
				else if(randcard1 < 2)
				{
					format(symb1, sizeof(symb1), "~y~]");
					randcard1 = 3;
				}
				if(randcard2 >= 5)
				{
					format(symb2, sizeof(symb2), "~b~]");
					randcard2 = 1;
				}
				else if(randcard2 <= 4 && randcard2 >= 2)
				{
					format(symb2, sizeof(symb2), "~g~]");
					randcard2 = 2;
				}
				else if(randcard2 < 2)
				{
					format(symb2, sizeof(symb2), "~y~]");
					randcard2 = 3;
				}
				if(randcard3 >= 5)
				{
					format(symb3, sizeof(symb3), "~b~]");
					randcard3 = 1;
				}
				else if(randcard3 <= 4 && randcard3 >= 2)
				{
					format(symb3, sizeof(symb3), "~g~]");
					randcard3 = 2;
				}
				else if(randcard3 < 2)
				{
					format(symb3, sizeof(symb3), "~y~]");
					randcard3 = 3;
				}
				if(randcard1 == randcard2 && randcard1 == randcard3)
				{
					if(randcard1 > 5)
					{
						prize = 2500;
					}
					if(randcard1 <= 4 && randcard1 >= 2)
					{
						prize = 1500;
					}
					if(randcard1 < 2)
					{
						prize = 500;
					}
					GivePlayerMoney(playerid,prize);
					SBizzInfo[9][sbTill] -= prize;
					ExtortionSBiz(9, prize);
					format(string, sizeof(string), "%s %s %s ~n~~n~~w~~g~$%d",symb1,symb2,symb3, prize);
				}
				else
				{
					format(string, sizeof(string), "%s %s %s ~n~~n~~w~~r~$0",symb1,symb2,symb3);
				}
				GameTextForPlayer(playerid, string, 3000, 3);
				return 1;
			}
			else if (item == 3 && GetPlayerMoney(playerid) > 5000)
			{
			    if(PlayerInfo[playerid][pTraderPerk] > 0)
			    {
					new skill = 5000 / 100;
					new price = (skill)*(PlayerInfo[playerid][pTraderPerk]);
					new payout = 5000 - price;
					GivePlayerMoney(playerid,- payout);
					SBizzInfo[9][sbTill] += payout;
					ExtortionSBiz(9, payout);
					format(string, sizeof(string), "~r~-$%d", payout);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				else
				{
				    GivePlayerMoney(playerid,-5000);
					SBizzInfo[9][sbTill] += 5000;
					ExtortionSBiz(9, 5000);
					format(string, sizeof(string), "~r~-$%d", 5000);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
                PlayerInfo[playerid][pPhoneBook] = 1;
				format(string, sizeof(string), "   Phone Book Purchased you can look up any Players Number !");
				SendClientMessage(playerid, COLOR_GRAD4, string);
				SendClientMessage(playerid, COLOR_WHITE, "HINT: Type /number <id/name>.");
				return 1;
			}
			else if (item == 4 && GetPlayerMoney(playerid) > 500)
			{
			    if(PlayerInfo[playerid][pTraderPerk] > 0)
			    {
					new skill = 500 / 100;
					new price = (skill)*(PlayerInfo[playerid][pTraderPerk]);
					new payout = 500 - price;
					GivePlayerMoney(playerid,- payout);
					SBizzInfo[9][sbTill] += payout;
					ExtortionSBiz(9, payout);
					format(string, sizeof(string), "~r~-$%d", payout);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				else
				{
				    GivePlayerMoney(playerid,-500);
					SBizzInfo[9][sbTill] += 500;
					ExtortionSBiz(9, 500);
					format(string, sizeof(string), "~r~-$%d", 500);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				gDice[playerid] = 1;
				format(string, sizeof(string), "   Dice Purchased you can throw your Dice.");
				SendClientMessage(playerid, COLOR_GRAD4, string);
				SendClientMessage(playerid, COLOR_WHITE, "HINT: Type /dice ");
				return 1;
			}
			else if(item == 5 && GetPlayerMoney(playerid) > 5000)
			{
				if (gLastCar[playerid] != 0)
				{
					if(HireCar[playerid] != 299)
					{
						gCarLock[HireCar[playerid]] = 0;
						UnLockCar(HireCar[playerid]);
						HireCar[playerid] = 299;
					}
					if(PlayerInfo[playerid][pTraderPerk] > 0)
			    	{
						new skill = 5000 / 100;
						new price = (skill)*(PlayerInfo[playerid][pTraderPerk]);
						new payout = 5000 - price;
						GivePlayerMoney(playerid,- payout);
						SBizzInfo[9][sbTill] += payout;
						ExtortionSBiz(9, payout);
						format(string, sizeof(string), "~r~-$%d", payout);
						GameTextForPlayer(playerid, string, 5000, 1);
					}
					else
					{
					    GivePlayerMoney(playerid,-5000);
						SBizzInfo[9][sbTill] += 5000;
						ExtortionSBiz(9, 5000);
						format(string, sizeof(string), "~r~-$%d", 5000);
						GameTextForPlayer(playerid, string, 5000, 1);
					}
					SBizzInfo[9][sbProducts]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					HireCar[playerid] = gLastCar[playerid];
					format(string, sizeof(string), "Key Purchased You Can Lock Your Last Vehicle.");
					SendClientMessage(playerid, COLOR_GRAD4, string);
					SendClientMessage(playerid, COLOR_WHITE, "HINT: Type /lock ");
				}
				else
				{
					SendClientMessage(playerid, COLOR_WHITE, "   You don't have a Vehicle to fit it to !");
				}
				return 1;
			}
			else if (item == 6 && GetPlayerMoney(playerid) > 10000)
			{
				if(PlayerInfo[playerid][pPhousekey] != 255)
				{
					for(new i = 0; i < MAX_PLAYERS; i++)
					{
						if(IsPlayerConnected(i) == 1 && HireCar[PlayerInfo[playerid][pPhousekey]+1])
						{
							HireCar[i] = 299;
						}
					}
					if(PlayerInfo[playerid][pTraderPerk] > 0)
			    	{
						new skill = 10000 / 100;
						new price = (skill)*(PlayerInfo[playerid][pTraderPerk]);
						new payout = 10000 - price;
						GivePlayerMoney(playerid,- payout);
						SBizzInfo[9][sbTill] += payout;
						ExtortionSBiz(9, payout);
						format(string, sizeof(string), "~r~-$%d", payout);
						GameTextForPlayer(playerid, string, 5000, 1);
					}
					else
					{
					    GivePlayerMoney(playerid,-10000);
						SBizzInfo[9][sbTill] += 10000;
						ExtortionSBiz(9, 10000);
						format(string, sizeof(string), "~r~-$%d", 10000);
						GameTextForPlayer(playerid, string, 5000, 1);
					}
					SBizzInfo[9][sbProducts]--;
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "New Locks Purchased.");
					SendClientMessage(playerid, COLOR_GRAD4, string);
					SendClientMessage(playerid, COLOR_WHITE, "HINT: Type /lock ");
				}
				else
				{
					SendClientMessage(playerid, COLOR_WHITE, "   You don't have a Vehicle to fit it to !");
				}
				return 1;
			}
			else if (item == 7 && GetPlayerMoney(playerid) > 5000)
			{
				gSpeedo[playerid] = 1;
				if(PlayerInfo[playerid][pTraderPerk] > 0)
		    	{
					new skill = 5000 / 100;
					new price = (skill)*(PlayerInfo[playerid][pTraderPerk]);
					new payout = 5000 - price;
					GivePlayerMoney(playerid,- payout);
					SBizzInfo[9][sbTill] += payout;
					ExtortionSBiz(9, payout);
					format(string, sizeof(string), "~r~-$%d", payout);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				else
				{
				    GivePlayerMoney(playerid,-5000);
					SBizzInfo[9][sbTill] += 5000;
					ExtortionSBiz(9, 5000);
					format(string, sizeof(string), "~r~-$%d", 5000);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				SBizzInfo[9][sbProducts]--;
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "Speedometer Purchased.");
				SendClientMessage(playerid, COLOR_GRAD4, string);
				SendClientMessage(playerid, COLOR_WHITE, "HINT: Type /speedo ");
				return 1;
			}
			else if (item == 8 && GetPlayerMoney(playerid) > 49)
			{
			    if(PlayerInfo[playerid][pTraderPerk] > 0)
		    	{
					new skill = 50 / 100;
					new price = (skill)*(PlayerInfo[playerid][pTraderPerk]);
					new payout = 50 - price;
					GivePlayerMoney(playerid,- payout);
					format(string, sizeof(string), "~r~-$%d", payout);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				else
				{
				    GivePlayerMoney(playerid,-50);
					format(string, sizeof(string), "~r~-$%d", 50);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				Condom[playerid] ++;
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "Condom Purchased.");
				SendClientMessage(playerid, COLOR_GRAD4, string);
				return 1;
			}
			else if (item == 9 && GetPlayerMoney(playerid) > 2500)
			{
			    if(PlayerInfo[playerid][pTraderPerk] > 0)
		    	{
					new skill = 2500 / 100;
					new price = (skill)*(PlayerInfo[playerid][pTraderPerk]);
					new payout = 2500 - price;
					GivePlayerMoney(playerid, - payout);
					format(string, sizeof(string), "~r~-$%d", payout);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				else
				{
				    GivePlayerMoney(playerid, - 2500);
					format(string, sizeof(string), "~r~-$%d", 2500);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "CD-Player Purchased.");
				SendClientMessage(playerid, COLOR_GRAD4, string);
				SendClientMessage(playerid, COLOR_WHITE, "HINT: Type /music");
				PlayerInfo[playerid][pCDPlayer] = 1;
				return 1;
			}
			else if (item == 10 && GetPlayerMoney(playerid) > 10)
			{
			    if(Groceries[playerid][pChickens] >= 3)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You have to many Chickens, Cook some first !");
			        return 1;
			    }
			    if(PlayerInfo[playerid][pTraderPerk] > 0)
		    	{
					new skill = 10 / 100;
					new price = (skill)*(PlayerInfo[playerid][pTraderPerk]);
					new payout = 10 - price;
					GivePlayerMoney(playerid, - payout);
					format(string, sizeof(string), "~r~-$%d", payout);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				else
				{
				    GivePlayerMoney(playerid, - 10);
					format(string, sizeof(string), "~r~-$%d", 10);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
			    GivePlayerMoney(playerid, - 10);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "Chicken Purchased.");
				SendClientMessage(playerid, COLOR_GRAD4, string);
				format(string, sizeof(string), "~r~-$%d", 10);
				GameTextForPlayer(playerid, string, 5000, 1);
				new rand = random(15);
				Groceries[playerid][pChickens] += 1;
				Groceries[playerid][pChicken] += rand;
				return 1;
			}
			else if (item == 11 && GetPlayerMoney(playerid) > 10)
			{
			    if(Groceries[playerid][pHamburgers] >= 3)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You have to many Hamburgers, Cook some first !");
			        return 1;
			    }
			    if(PlayerInfo[playerid][pTraderPerk] > 0)
		    	{
					new skill = 10 / 100;
					new price = (skill)*(PlayerInfo[playerid][pTraderPerk]);
					new payout = 10 - price;
					GivePlayerMoney(playerid, - payout);
					format(string, sizeof(string), "~r~-$%d", payout);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				else
				{
				    GivePlayerMoney(playerid, - 10);
					format(string, sizeof(string), "~r~-$%d", 10);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
			    GivePlayerMoney(playerid, - 10);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "Hamburger Purchased.");
				SendClientMessage(playerid, COLOR_GRAD4, string);
				format(string, sizeof(string), "~r~-$%d", 10);
				GameTextForPlayer(playerid, string, 5000, 1);
				new rand = random(15);
				Groceries[playerid][pHamburgers] += 1;
				Groceries[playerid][pHamburger] += rand;
				return 1;
			}
			else if (item == 12 && GetPlayerMoney(playerid) > 10)
			{
			    if(Groceries[playerid][pPizzas] >= 3)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You have to many Pizzas, Cook some first !");
			        return 1;
			    }
			    if(PlayerInfo[playerid][pTraderPerk] > 0)
		    	{
					new skill = 10 / 100;
					new price = (skill)*(PlayerInfo[playerid][pTraderPerk]);
					new payout = 10 - price;
					GivePlayerMoney(playerid, - payout);
					format(string, sizeof(string), "~r~-$%d", payout);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				else
				{
				    GivePlayerMoney(playerid, - 10);
					format(string, sizeof(string), "~r~-$%d", 10);
					GameTextForPlayer(playerid, string, 5000, 1);
				}
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "Frozen Pizza Purchased.");
				SendClientMessage(playerid, COLOR_GRAD4, string);
				new rand = random(15);
				Groceries[playerid][pPizzas] += 1;
				Groceries[playerid][pPizza] += rand;
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_WHITE, "   You don't have the cash for that !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/buyhouse", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new Float:oldposx, Float:oldposy, Float:oldposz;
			GetPlayerName(playerid, playername, sizeof(playername));
			GetPlayerPos(playerid, oldposx, oldposy, oldposz);
			for(new h = 0; h < sizeof(HouseInfo); h++)
			{
				if(PlayerToPoint(2.0, playerid, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]) && HouseInfo[h][hOwned] == 0)
				{
					if(PlayerInfo[playerid][pLevel] < HouseInfo[h][hLevel])
					{
						format(string, sizeof(string), "   You must be Level %d to purchase this !", HouseInfo[h][hLevel]);
						SendClientMessage(playerid, COLOR_GRAD5, string);
						return 1;
					}
					if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
					{
						SendClientMessage(playerid, COLOR_WHITE, "   You already own a house, type /sellhouse if you want to buy this one !");
						return 1;
					}
					if(GetPlayerMoney(playerid) > HouseInfo[h][hValue])
					{
						PlayerInfo[playerid][pPhousekey] = h;
						HouseInfo[h][hOwned] = 1;
						GetPlayerName(playerid, sendername, sizeof(sendername));
						strmid(HouseInfo[h][hOwner], sendername, 0, strlen(sendername), 255);
						GivePlayerMoney(playerid,-HouseInfo[h][hValue]);
						PlayerPlayMusic(playerid);
						SetPlayerInterior(playerid,HouseInfo[h][hInt]);
						SetPlayerPos(playerid,HouseInfo[h][hExitx],HouseInfo[h][hExity],HouseInfo[h][hExitz]);
						GameTextForPlayer(playerid, "~w~Welcome Home~n~You can exit at any time by moving to this door and typing /exit", 5000, 3);
						PlayerInfo[playerid][pInt] = HouseInfo[h][hInt];
						PlayerInfo[playerid][pLocal] = h;
						SendClientMessage(playerid, COLOR_WHITE, "Congratulations, on your new Purchase !");
						SendClientMessage(playerid, COLOR_WHITE, "Type /help to review the new property help section !");
                        DateProp(playerid);
						OnPropUpdate();
						OnPlayerUpdate(playerid);
						return 1;
					}
					else
					{
						SendClientMessage(playerid, COLOR_WHITE, "   You don't have the cash for that !");
						return 1;
					}
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/rentroom", true) == 0)
	{
		if(IsPlayerConnected(playerid))
		{
			new Float:oldposx, Float:oldposy, Float:oldposz;
			GetPlayerName(playerid, playername, sizeof(playername));
			GetPlayerPos(playerid, oldposx, oldposy, oldposz);
			for(new h = 0; h < sizeof(HouseInfo); h++)
			{
				if(PlayerToPoint(2.0, playerid, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]) && HouseInfo[h][hOwned] == 1 &&  HouseInfo[h][hRentabil] == 1)
				{
					if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
					{
						SendClientMessage(playerid, COLOR_WHITE, "   You already own a house, type /sellhouse if you want to rent this one.");
						return 1;
					}
					if(GetPlayerMoney(playerid) > HouseInfo[h][hRent])
					{
						PlayerInfo[playerid][pPhousekey] = h;
						GivePlayerMoney(playerid,-HouseInfo[h][hRent]);
						HouseInfo[h][hTakings] = HouseInfo[h][hTakings]+HouseInfo[h][hRent];
						PlayerPlayMusic(playerid);
						SetPlayerInterior(playerid,HouseInfo[h][hInt]);
						SetPlayerPos(playerid,HouseInfo[h][hExitx],HouseInfo[h][hExity],HouseInfo[h][hExitz]);
						GameTextForPlayer(playerid, "~w~Welcome Home~n~You can exit at any time by moving to this door and typing /exit", 5000, 3);
						PlayerInfo[playerid][pInt] = HouseInfo[h][hInt];
						PlayerInfo[playerid][pLocal] = h;
						SendClientMessage(playerid, COLOR_WHITE, "Congratulations, You can enter and exit here anytime.");
						SendClientMessage(playerid, COLOR_WHITE, "Type /help to review the new property help section.");
						OnPlayerUpdate(playerid);
						return 1;
					}
					else
					{
						SendClientMessage(playerid, COLOR_WHITE, "You don't have the cash for that");
						return 1;
					}
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/rentcar", true) == 0)
	{
        if(IsPlayerConnected(playerid))
		{
			if(GetPlayerVehicleID(playerid) >= 72 && GetPlayerVehicleID(playerid) <= 77)
			{
				new hirefee = HireCost(GetPlayerVehicleID(playerid));
				if(GetPlayerVehicleID(playerid) >= 72 && GetPlayerVehicleID(playerid) <= 74)
				{
					if(SBizzInfo[0][sbProducts] == 0)
					{
						GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
						return 1;
					}
					if(PlayerInfo[playerid][pPbiskey] == 0)
					{
						GameTextForPlayer(playerid, "~w~No charge for the boss", 5000, 3);
						TogglePlayerControllable(playerid, 1);
						return 1;
					}
					if (GetPlayerMoney(playerid) <  SBizzInfo[0][sbEntranceCost])
					{
						SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much cash !");
						return 1;
					}
					GivePlayerMoney(playerid,-SBizzInfo[0][sbEntranceCost]);
					SBizzInfo[0][sbTill] += SBizzInfo[0][sbEntranceCost];
					ExtortionSBiz(0, SBizzInfo[0][sbEntranceCost]);
					SBizzInfo[0][sbProducts]--;
				}
				if(GetPlayerVehicleID(playerid) >= 75 && GetPlayerVehicleID(playerid) <= 77)
				{
					if(SBizzInfo[1][sbProducts] == 0)
					{
						GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
						return 1;
					}
					if(PlayerInfo[playerid][pPbiskey] == 1)
					{
						GameTextForPlayer(playerid, "~w~No charge for the boss", 5000, 3);
						TogglePlayerControllable(playerid, 1);
						return 1;
					}
					if (GetPlayerMoney(playerid) <  SBizzInfo[1][sbEntranceCost])
					{
						SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much cash !");
						return 1;
					}
					GivePlayerMoney(playerid,-SBizzInfo[1][sbEntranceCost]);
					SBizzInfo[1][sbTill] += SBizzInfo[1][sbEntranceCost];
					ExtortionSBiz(1, SBizzInfo[1][sbEntranceCost]);
					SBizzInfo[1][sbProducts]--;
				}
				if(HireCar[playerid] != 299)
				{
					gCarLock[HireCar[playerid]] = 0;
					UnLockCar(HireCar[playerid]);
				}
				HireCar[playerid] = GetPlayerVehicleID(playerid);
				OnPropUpdate();
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "~w~We hope you enjoy ~n~the use of this car~n~To lock or unlock your car~n~type ~g~/lock~n~~w~please drive safely",hirefee);
				TogglePlayerControllable(playerid, 1);
				GameTextForPlayer(playerid, string, 5000, 3);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/hirecar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			if (PlayerInfo[playerid][pAdmin] >= 1337)
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /hirecar [key id]");
					return 1;
				}
				new car = strval(tmp);
				HireCar[playerid] = car;
				format(string, sizeof(string), "Key Fashioned You Can Lock Car %d.",car);
				SendClientMessage(playerid, COLOR_GRAD4, string);
				SendClientMessage(playerid, COLOR_WHITE, "HINT: Type /lock ");
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/switchkey", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			if(!SwitchKey[playerid])
			{
				if(HireCar[playerid] != 299)
				{
					SwitchKey[playerid] = 1;
					GameTextForPlayer(playerid, "~w~You control now your house car", 5000, 6);
				}
				else
				{
					GameTextForPlayer(playerid, "~w~You do not hire a car", 5000, 6);
				}
				return 1;
			}
			else
			{
				SwitchKey[playerid] = 0;
				GameTextForPlayer(playerid, "~w~You control now your hire car", 5000, 6);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/givekey", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			tmp = strtok(cmdtext, idx);
			new car;
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /givekey [playerid/PartOfName]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if(HireCar[playerid] == 299 && PlayerInfo[playerid][pPhousekey] == 255)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "  You dont have a key to give");
				return 1;
			}
			else
			{
				if(HireCar[playerid] != 299 && SwitchKey[playerid] == 0)
				{
					car = HireCar[playerid];
					gCarLock[car] = 0;
					UnLockCar(car);
					HireCar[playerid] = 299;
				}
				else
				{
					car = PlayerInfo[playerid][pPhousekey]+1;
				}
			}
			if (IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
					if(ProxDetectorS(5.0, playerid, giveplayerid))
					{
						if(HireCar[giveplayerid] != 299)
						{
							gCarLock[HireCar[giveplayerid]] = 0;
							UnLockCar(HireCar[giveplayerid]);
						}
						HireCar[giveplayerid] = car;
						GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "   You have given %s the key to your vehicle", giveplayer);
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						SendClientMessage(playerid, COLOR_GRAD1, string);
						format(string, sizeof(string), "   You have recieved the key to a vehicle from %s", sendername);
						SendClientMessage(giveplayerid, COLOR_GRAD1, string);
						format(string, sizeof(string), "* %s takes out a set of keys, and tosses them to %s.", sendername ,giveplayer);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					}
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/unrentcar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			if(HireCar[playerid] != 299)
			{
				gCarLock[HireCar[playerid]] = 0;
				UnLockCar(HireCar[playerid]);
				HireCar[playerid] = 299;
				GameTextForPlayer(playerid, "~w~You no longer rent a car", 5000, 3);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/unrent", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			GetPlayerName(playerid, playername, sizeof(playername));
			if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
			{
				SendClientMessage(playerid, COLOR_WHITE, "   You own this house !");
				return 1;
			}
			PlayerInfo[playerid][pPhousekey] = 255;
			SendClientMessage(playerid, COLOR_WHITE, "You are now homeless.");
		}
		return 1;
	}
	if(strcmp(cmd, "/housewithdraw", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			GetPlayerName(playerid, playername, sizeof(playername));
			new bouse = PlayerInfo[playerid][pPhousekey];
			if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /housewithdraw [amount]");
					format(string, sizeof(string), "  You Have $%d in your cashbox.", HouseInfo[bouse][hTakings]);
					SendClientMessage(playerid, COLOR_GRAD3, string);
					return 1;
				}
				new cashdeposit = strval(tmp);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /housewithdraw [amount]");
					format(string, sizeof(string), "  You Have $%d in your cashbox.", HouseInfo[bouse][hTakings]);
					SendClientMessage(playerid, COLOR_GRAD3, string);
					return 1;
				}
				if (cashdeposit >  HouseInfo[bouse][hTakings] || cashdeposit < 1)
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much !");
					return 1;
				}
				if (!PlayerToPoint(100, playerid,HouseInfo[bouse][hExitx],HouseInfo[bouse][hExity],HouseInfo[bouse][hExitz]))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your house !");
					return 1;
				}
				else
				{
				    ConsumingMoney[playerid] = 1;
					GivePlayerMoney(playerid,cashdeposit);
					HouseInfo[bouse][hTakings]=HouseInfo[bouse][hTakings]-cashdeposit;
					format(string, sizeof(string), "  You Have Withdrawn $%d from your cashbox Total: $%d ", cashdeposit,HouseInfo[bouse][hTakings]);
					OnPropUpdate();
					SendClientMessage(playerid, COLOR_YELLOW, string);
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_WHITE, "You don't own a house.");
			}
		}
		return 1;

	}
	if(strcmp(cmd, "/asellbiz", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			GetPlayerName(playerid, playername, sizeof(playername));
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /asellbiz [bizid]");
				return 1;
			}
			new biz = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 4)
			{
				BizzInfo[biz][bLocked] = 1;
				BizzInfo[biz][bOwned] = 0;
				strmid(BizzInfo[biz][bOwner], "The State", 0, strlen("The State"), 255);
				strmid(BizzInfo[biz][bExtortion], "No-one", 0, strlen("No-one"), 255);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "~w~You have sold the Business");
				GameTextForPlayer(playerid, string, 10000, 3);
				OnPropUpdate();
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_WHITE, "You are not an admin.");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/asellsbiz", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			GetPlayerName(playerid, playername, sizeof(playername));
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /asellsbiz [sbizid]");
				return 1;
			}
			new sbiz = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 4)
			{
				SBizzInfo[sbiz][sbLocked] = 1;
				SBizzInfo[sbiz][sbOwned] = 0;
				strmid(SBizzInfo[sbiz][sbOwner], "The State", 0, strlen("The State"), 255);
				strmid(SBizzInfo[sbiz][sbExtortion], "No-one", 0, strlen("No-one"), 255);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "~w~You have sold the Business");
				GameTextForPlayer(playerid, string, 10000, 3);
				OnPropUpdate();
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_WHITE, "You are not an admin.");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/asellhouse", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			GetPlayerName(playerid, playername, sizeof(playername));
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /asellhouse [houseid]");
				return 1;
			}
			new house = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 4)
			{
				HouseInfo[house][hHel] = 0;
				HouseInfo[house][hArm] = 0;
				HouseInfo[house][hHealthx] = 0;
				HouseInfo[house][hHealthy] = 0;
				HouseInfo[house][hHealthz] = 0;
				HouseInfo[house][hArmourx] = 0;
				HouseInfo[house][hArmoury] = 0;
				HouseInfo[house][hArmourz] = 0;
				HouseInfo[house][hLock] = 1;
				HouseInfo[house][hOwned] = 0;
				HouseInfo[house][hVec] = 418;
				HouseInfo[house][hVcol1] = -1;
				HouseInfo[house][hVcol2] = -1;
				strmid(HouseInfo[house][hOwner], "The State", 0, strlen("The State"), 255);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "~w~You have sold this property", HouseInfo[house][hValue]);
				GameTextForPlayer(playerid, string, 10000, 3);
				OnPropUpdate();
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_WHITE, "You are not an admin.");
			}
		}
		return 1;
	}

	if(strcmp(cmd, "/sellhouse", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			GetPlayerName(playerid, playername, sizeof(playername));
			if(PlayerInfo[playerid][pPhousekey] == 255)
			{
				SendClientMessage(playerid, COLOR_WHITE, "You don't own a house.");
				return 1;
			}
			if(PlayerInfo[playerid][pMarried] > 0)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "   You are Married, can't sell the House !");
		        return 1;
		    }
			if(PlayerInfo[playerid][pPhousekey] != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
			{
				new house = PlayerInfo[playerid][pPhousekey];
				HouseInfo[house][hHel] = 0;
				HouseInfo[house][hArm] = 0;
				HouseInfo[house][hHealthx] = 0;
				HouseInfo[house][hHealthy] = 0;
				HouseInfo[house][hHealthz] = 0;
				HouseInfo[house][hArmourx] = 0;
				HouseInfo[house][hArmoury] = 0;
				HouseInfo[house][hArmourz] = 0;
				HouseInfo[house][hLock] = 1;
				HouseInfo[house][hOwned] = 0;
				HouseInfo[house][hVec] = 418;
				HouseInfo[house][hVcol1] = -1;
				HouseInfo[house][hVcol2] = -1;
				GetPlayerName(playerid, sendername, sizeof(sendername));
				strmid(HouseInfo[house][hOwner], "The State", 0, strlen("The State"), 255);
				ConsumingMoney[playerid] = 1;
				GivePlayerMoney(playerid,HouseInfo[house][hValue]);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "~w~Congratulations~n~ You have sold your property for ~n~~g~$%d", HouseInfo[house][hValue]);
				GameTextForPlayer(playerid, string, 10000, 3);
				PlayerInfo[playerid][pPhousekey] = 255;
				if(PlayerInfo[playerid][pLocal] == house)
				{
					SetPlayerInterior(playerid,0);
					SetPlayerPos(playerid,HouseInfo[house][hEntrancex],HouseInfo[house][hEntrancey],HouseInfo[house][hEntrancez]);
					PlayerInfo[playerid][pInt] = 0;
				}
				OnPropUpdate();
				OnPlayerUpdate(playerid);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_WHITE, "You don't own a house.");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/houseupgrade", true) == 0 || strcmp(cmd, "/hu", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new house = PlayerInfo[playerid][pPhousekey];
			GetPlayerName(playerid, playername, sizeof(playername));
			if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /houseupgrade [item number]");
					SendClientMessage(playerid, COLOR_GRAD1, "|_______ Home Supplys _______|");
					SendClientMessage(playerid, COLOR_GRAD2, "| 1: Health Upgrade $50000");
					SendClientMessage(playerid, COLOR_GRAD3, "| 2: Armour Upgrade $100000");
					SendClientMessage(playerid, COLOR_GRAD5, "| 3: TV $500");
					return 1;
				}
				new item = strval(tmp);
				switch (item)
				{
					case 1:
					{
						if(SBizzInfo[6][sbProducts] == 0)
						{
							GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
							return 1;
						}
						if(PlayerInfo[playerid][pLevel] < 5)
						{
							SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 5 To Purchase This");
							return 1;
						}
						if(GetPlayerMoney(playerid) < 50000)
						{
							SendClientMessage(playerid, COLOR_GRAD5, "You Don't Have The Cash To Purchase This");
							return 1;
						}
						HouseInfo[house][hHel] = 1;
						GivePlayerMoney(playerid,-50000);
						SBizzInfo[6][sbTill] += 50000;//heal buisness
						ExtortionSBiz(6, 50000);
						SBizzInfo[6][sbProducts]--;
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						SendClientMessage(playerid, COLOR_GRAD5, "You Can Now Heal Yourself At Home, Type /heal.");
					}
					case 2:
					{
					    if(!IsACop(playerid))
					    {
							SendClientMessage(playerid, COLOR_GREY, "   You can't buy this, you are not a Cop !");
							return 1;
					    }
						if(SBizzInfo[6][sbProducts] == 0)
						{
							GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
							return 1;
						}
						if (PlayerInfo[playerid][pLevel] < 7)
						{
							SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 7 To Purchase This");
							return 1;
						}
						if(GetPlayerMoney(playerid) < 100000)
						{
							SendClientMessage(playerid, COLOR_GRAD5, "You Don't Have The Cash To Purchase This");
							return 1;
						}
						HouseInfo[house][hArm] = 1;
						GivePlayerMoney(playerid,-100000);
						SBizzInfo[6][sbTill] += 100000;//heal buisness
						ExtortionSBiz(6, 100000);
						SBizzInfo[6][sbProducts]--;
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						SendClientMessage(playerid, COLOR_GRAD5, "You Can Now Get Armour At Home, Type /heal.");
					}
					case 3:
					{
						if(SBizzInfo[6][sbProducts] == 0)
						{
							GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
							return 1;
						}
						if (PlayerInfo[playerid][pLevel] < 3)
						{
							SendClientMessage(playerid, COLOR_GRAD5, "You Must Be Level 3 To Purchase This");
							return 1;
						}
						if(GetPlayerMoney(playerid) < 500)
						{
							SendClientMessage(playerid, COLOR_GRAD5, "You Don't Have The Cash To Purchase This");
							return 1;
						}
						HouseInfo[house][hHealthx] = 1;
						GivePlayerMoney(playerid,-500);
						SBizzInfo[6][sbTill] += 500;
						ExtortionSBiz(6, 500);
						SBizzInfo[6][sbProducts]--;
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
						SendClientMessage(playerid, COLOR_GRAD5, "You can now use your TV set, type /tv.");
					}
				}
				OnPropUpdate();
				OnPlayerUpdate(playerid);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house");
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/setrent", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new bouse = PlayerInfo[playerid][pPhousekey];
			GetPlayerName(playerid, playername, sizeof(playername));
			if (bouse != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setrent [RentFee]");
					return 1;
				}
				if(strval(tmp) < 1 || strval(tmp) > 99999)
				{
					SendClientMessage(playerid, COLOR_WHITE, "Minimum rent is $1, Maximum rent is $99999.");
					return 1;
				}
				HouseInfo[bouse][hRent] = strval(tmp);
				OnPropUpdate();
				format(string, sizeof(string), "House rent set to $%d", HouseInfo[bouse][hRent]);
				SendClientMessage(playerid, COLOR_WHITE, string);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house");
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/evictall", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new bouse = PlayerInfo[playerid][pPhousekey];
			if (bouse != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
			{
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
						if(i != playerid)
						{
							if (PlayerInfo[i][pPhousekey] == PlayerInfo[playerid][pPhousekey] )
							{
								SendClientMessage(i, COLOR_WHITE, "You have been evicted from your house.");
								SendClientMessage(playerid, COLOR_WHITE, "Everyone have been evicted.");
								PlayerInfo[i][pPhousekey] = 255;
								return 1;
							}
						}
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house !");
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/evict", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new bouse = PlayerInfo[playerid][pPhousekey];
			GetPlayerName(playerid, playername, sizeof(playername));
			if (bouse != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /evict [playerid/PartOfName]");
				}
				new target;
				//target = strval(tmp);
				target = ReturnUser(tmp);
				if (target == playerid)
				{
					SendClientMessage(target, COLOR_WHITE, "You cant evict yourself.");
					return 1;
				}
				if(IsPlayerConnected(target))
				{
				    if(target != INVALID_PLAYER_ID)
				    {
						if(PlayerInfo[target][pPhousekey] == PlayerInfo[playerid][pPhousekey])
						{
							SendClientMessage(target, COLOR_WHITE, "You have been evicted");
							SendClientMessage(playerid, COLOR_WHITE, "Player has been evicted");
							PlayerInfo[target][pPhousekey] = 255;
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_WHITE, "Player doesn't rent at your House !");
						    return 1;
						}
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house !");
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/setrentable", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new bouse = PlayerInfo[playerid][pPhousekey];
			GetPlayerName(playerid, playername, sizeof(playername));
			if (bouse != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setrentable [0/1]");
				}
				HouseInfo[bouse][hRentabil] = strval(tmp);
				OnPropUpdate();
				format(string, sizeof(string), "House rentable set to %d.", HouseInfo[bouse][hRentabil]);
				SendClientMessage(playerid, COLOR_WHITE, string);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a house !");
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/call", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /call [phonenumber]");
				return 1;
			}
			if(PlayerInfo[playerid][pPnumber] == 0)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "  You dont't have a cell phone !");
				return 1;
			}
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "* %s takes out a cellphone.", sendername);
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			new phonenumb = strval(tmp);
			if(phonenumb == 911)
			{
				SendClientMessage(playerid, COLOR_WHITE, "HINT: You now use T to talk on your cellphone, type /hangup to hang up");
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: Which Service Do You Require, Police or Paramedic?");
				Mobile[playerid] = 911;
				return 1;
			}
			if(phonenumb == PlayerInfo[playerid][pPnumber])
			{
				SendClientMessage(playerid, COLOR_GRAD2, "  You just get a busy tone...");
				return 1;
			}
			if(Mobile[playerid] != 255)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "  You are already on a call...");
				return 1;
			}
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
					{
						giveplayerid = i;
						Mobile[playerid] = giveplayerid; //caller connecting
						if(IsPlayerConnected(giveplayerid))
						{
						    if(giveplayerid != INVALID_PLAYER_ID)
						    {
						        if(PhoneOnline[giveplayerid] > 0)
						        {
						            SendClientMessage(playerid, COLOR_GREY, "   That players Phone is Offline !");
						            return 1;
						        }
								if (Mobile[giveplayerid] == 255)
								{
									format(string, sizeof(string), "Your Mobile is Ringing Type (/Pickup) CallerID: %s", sendername);
									SendClientMessage(giveplayerid, COLOR_YELLOW, string);
									GetPlayerName(giveplayerid, sendername, sizeof(sendername));
									RingTone[giveplayerid] = 10;
									format(string, sizeof(string), "* %s's phone begins to ring.", sendername);
									SendClientMessage(playerid, COLOR_WHITE, "HINT: You now use T to talk on your cellphone, type /hangup to hang up");
									ProxDetector(30.0, i, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
									CellTime[playerid] = 1;
									return 1;
								}
							}
						}
					}
				}
			}
			SendClientMessage(playerid, COLOR_GRAD2, "  You just get a Busy tone...");
		}
		return 1;
	}
	if(strcmp(cmd, "/txt", true) == 0 || strcmp(cmd, "/t", true) == 0 || strcmp(cmd, "/sms", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
		    if(gPlayerLogged[playerid] == 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You havent logged in yet !");
	            return 1;
	        }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/t)ext [phonenumber] [text chat]");
				return 1;
			}
			if(PlayerInfo[playerid][pPnumber] == 0)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "  You dont't have a cell phone...");
				return 1;
			}
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "* %s takes out a cellphone.", sendername);
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			new phonenumb = strval(tmp);
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/t)ext [phonenumber] [text chat]");
				return 1;
			}
			if(phonenumb == 555)
			{
				if ((strcmp("yes", result, true, strlen(result)) == 0) && (strlen(result) == strlen("yes")))
				{
					SendClientMessage(playerid, COLOR_WHITE, "Text Message Delivered.");
					if (gTeam[playerid] == 2 || gTeam[playerid] == 1)
					{
						SendClientMessage(playerid, COLOR_YELLOW, "SMS: I have no idea what you're talking about, Sender: MOLE (555)");
						RingTone[playerid] = 20;
						return 1;
					}
					return 1;
				}
				else
				{
					SendClientMessage(playerid, COLOR_YELLOW, "SMS: A simple Yes will do, Sender: MOLE (555)");
					RingTone[playerid] = 20;
					return 1;
				}
			}
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(PlayerInfo[i][pPnumber] == phonenumb && phonenumb != 0)
					{
						giveplayerid = i;
						Mobile[playerid] = giveplayerid; //caller connecting
						if(IsPlayerConnected(giveplayerid))
						{
						    if(giveplayerid != INVALID_PLAYER_ID)
						    {
						        if(PhoneOnline[giveplayerid] > 0)
						        {
						            SendClientMessage(playerid, COLOR_GREY, "   That players Phone is Offline !");
						            return 1;
						        }
								format(string, sizeof(string), "SMS: %s, Sender: %s (%d)", result,sendername,PlayerInfo[playerid][pPnumber]);
								GetPlayerName(giveplayerid, sendername, sizeof(sendername));
								//format(string, sizeof(string), "* %s's phone beeps.", sendername);
								RingTone[giveplayerid] =20;
								SendClientMessage(playerid, COLOR_WHITE, "Text Message Delivered");
								SendClientMessage(giveplayerid, COLOR_YELLOW, string);
								SendClientMessage(playerid,  COLOR_YELLOW, string);
								format(string, sizeof(string), "~r~$-%d", txtcost);
								GameTextForPlayer(playerid, string, 5000, 1);
								GivePlayerMoney(playerid,-txtcost);
								SBizzInfo[2][sbTill] += txtcost;
								ExtortionSBiz(2, txtcost);
					           	PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					           	Mobile[playerid] = 255;
								return 1;
							}
						}
					}
				}
			}
			SendClientMessage(playerid, COLOR_GRAD2, "  Message Delivery Failed...");
		}
		return 1;
	}
//----------------------------------[pickup]-----------------------------------------------

	if(strcmp(cmd, "/pickup", true) == 0 || strcmp(cmd, "/p", true) == 0)
	{
        if(IsPlayerConnected(playerid))
		{
			if(Mobile[playerid] != 255)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "  You are already on a call...");
				return 1;
			}
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(Mobile[i] == playerid)
					{
						Mobile[playerid] = i; //caller connecting
						SendClientMessage(i,  COLOR_GRAD2, "   They Picked up the call.");
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "* %s answers his cellphone.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						RingTone[playerid] = 0;
					}

				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/hangup", true) == 0 || strcmp(cmd, "/h", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new caller = Mobile[playerid];
			if(IsPlayerConnected(caller))
			{
			    if(caller != INVALID_PLAYER_ID)
			    {
					if(caller != 255)
					{
						if(caller < 255)
						{
							SendClientMessage(caller,  COLOR_GRAD2, "   They hung up.");
							CellTime[caller] = 0;
							CellTime[playerid] = 0;
							SendClientMessage(playerid,  COLOR_GRAD2, "   You hung up.");
							Mobile[caller] = 255;
						}
						Mobile[playerid] = 255;
						CellTime[playerid] = 0;
						RingTone[playerid] = 0;
						return 1;
					}
				}
			}
			SendClientMessage(playerid,  COLOR_GRAD2, "   Your phone is in your pocket.");
		}
		return 1;
	}
//----------------------------------[TIME]-----------------------------------------------
    if(strcmp(cmd, "/fixr", true) == 0)
    {
        if(IsPlayerConnected(playerid))
		{
			PlayerFixRadio(playerid);
		}
		return 1;
	}
	if(strcmp(cmd, "/time", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
		    new mtext[20];
			new year, month,day;
			getdate(year, month, day);
			if(month == 1) { mtext = "January"; }
			else if(month == 2) { mtext = "February"; }
			else if(month == 3) { mtext = "March"; }
			else if(month == 4) { mtext = "April"; }
			else if(month == 5) { mtext = "May"; }
			else if(month == 6) { mtext = "June"; }
			else if(month == 7) { mtext = "Juli"; }
			else if(month == 8) { mtext = "August"; }
			else if(month == 9) { mtext = "September"; }
			else if(month == 10) { mtext = "October"; }
			else if(month == 11) { mtext = "November"; }
			else if(month == 12) { mtext = "December"; }
		    new hour,minuite,second;
			gettime(hour,minuite,second);
			FixHour(hour);
			hour = shifthour;
			if (minuite < 10)
			{
				if (PlayerInfo[playerid][pJailTime] > 0)
				{
					format(string, sizeof(string), "~y~%d %s~n~~g~|~w~%d:0%d~g~|~n~~w~Jail Time Left: %d sec", day, mtext, hour, minuite, PlayerInfo[playerid][pJailTime]-10);
				}
				else
				{
					format(string, sizeof(string), "~y~%d %s~n~~g~|~w~%d:0%d~g~|", day, mtext, hour, minuite);
				}
			}
			else
			{
				if (PlayerInfo[playerid][pJailTime] > 0)
				{
					format(string, sizeof(string), "~y~%d %s~n~~g~|~w~%d:%d~g~|~n~~w~Jail Time Left: %d sec", day, mtext, hour, minuite, PlayerInfo[playerid][pJailTime]-10);
				}
				else
				{
					format(string, sizeof(string), "~y~%d %s~n~~g~|~w~%d:%d~g~|", day, mtext, hour, minuite);
				}
			}
			GameTextForPlayer(playerid, string, 5000, 1);
		}
		return 1;
	}
//----------------------{HOUSES}-------------------
	if(strcmp(cmd, "/house", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
		    if(PlayerInfo[playerid][pAdmin] >= 1337)
		    {
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /house [housenumber]");
					return 1;
				}
				new housenum = strval(tmp);
				SetPlayerInterior(playerid,HouseInfo[housenum][hInt]);
				SetPlayerPos(playerid,HouseInfo[housenum][hExitx],HouseInfo[housenum][hExity],HouseInfo[housenum][hExitz]);
				GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
				PlayerInfo[playerid][pInt] = HouseInfo[housenum][hInt];
				PlayerInfo[playerid][pLocal] = housenum;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/houseo", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
		    if(PlayerInfo[playerid][pAdmin] >= 1337)
		    {
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /houseo [housenumber]");
					return 1;
				}
				new housenum = strval(tmp);
				SetPlayerPos(playerid,HouseInfo[housenum][hEntrancex],HouseInfo[housenum][hEntrancey],HouseInfo[housenum][hEntrancez]);
				GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/biz", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
		    if(PlayerInfo[playerid][pAdmin] >= 1337)
		    {
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /biz [biznumber]");
					return 1;
				}
				new housenum = strval(tmp);
				SetPlayerInterior(playerid,BizzInfo[housenum][bInterior]);
				SetPlayerPos(playerid,BizzInfo[housenum][bExitX],BizzInfo[housenum][bExitY],BizzInfo[housenum][bExitZ]);
				GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
				PlayerInfo[playerid][pInt] = BizzInfo[housenum][bInterior];
				PlayerInfo[playerid][pLocal] = housenum+99;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/sbiz", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
		    if(PlayerInfo[playerid][pAdmin] >= 1337)
		    {
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /sbiz [biznumber]");
					return 1;
				}
				new housenum = strval(tmp);
				SetPlayerInterior(playerid,SBizzInfo[housenum][sbInterior]);
				SetPlayerPos(playerid,SBizzInfo[housenum][sbEntranceX],SBizzInfo[housenum][sbEntranceY],SBizzInfo[housenum][sbEntranceZ]);
				GameTextForPlayer(playerid, "~w~Teleporting", 5000, 1);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/resethousecars", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			if(PlayerInfo[playerid][pAdmin] < 1337)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are not an Admin !");
				return 1;
			}
			HouseInfo[0][hVec] = 499; HouseInfo[1][hVec] = 499; HouseInfo[2][hVec] = 499;
			HouseInfo[3][hVec] = 499; HouseInfo[4][hVec] = 499; HouseInfo[5][hVec] = 499;
			HouseInfo[6][hVec] = 499; HouseInfo[7][hVec] = 499; HouseInfo[8][hVec] = 499;
			HouseInfo[9][hVec] = 499; HouseInfo[10][hVec] = 499; HouseInfo[11][hVec] = 499;
			HouseInfo[12][hVec] = 499; HouseInfo[13][hVec] = 499; HouseInfo[14][hVec] = 499;
			HouseInfo[15][hVec] = 499; HouseInfo[16][hVec] = 499; HouseInfo[17][hVec] = 499;
			HouseInfo[18][hVec] = 499; HouseInfo[19][hVec] = 499; HouseInfo[20][hVec] = 499;
			HouseInfo[21][hVec] = 499; HouseInfo[22][hVec] = 499; HouseInfo[23][hVec] = 499;
			HouseInfo[24][hVec] = 499; HouseInfo[25][hVec] = 499; HouseInfo[26][hVec] = 499;
			HouseInfo[27][hVec] = 499; HouseInfo[28][hVec] = 499; HouseInfo[29][hVec] = 499;
			HouseInfo[30][hVec] = 499; HouseInfo[31][hVec] = 499; HouseInfo[32][hVec] = 499;
			HouseInfo[33][hVec] = 499;
			OnPropUpdate();
			SendClientMessage(playerid, COLOR_GREY, "   All House Cars resetted !");
		}
		return 1;
	}
	if(strcmp(cmd, "/edithousecar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			if(PlayerInfo[playerid][pAdmin] < 4)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are not an Admin !");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /edithousecar [vecid]");
				return 1;
			}
			new proplev = strval(tmp);
			for(new i = 0; i < sizeof(HouseInfo); i++)
			{
				if (PlayerToPoint(3, playerid,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]))
				{
					HouseInfo[i][hVec] = proplev;
					format(string, sizeof(string), "House Car: %d is now %d", i,HouseInfo[i][hVec]);
					SendClientMessage(playerid, COLOR_GRAD2, string);
				}
			}
			OnPropUpdate();
		}
		return 1;
	}
	if(strcmp(cmd, "/edit", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			if(PlayerInfo[playerid][pAdmin] < 4)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You are not an Admin !");
				return 1;
			}
			new x_job[256];
			x_job = strtok(cmdtext, idx);
			if(!strlen(x_job)) {
				SendClientMessage(playerid, COLOR_WHITE, "|__________________ Edit __________________|");
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /edit [name] [ammount] (Used for Houses and Businesses)");
				SendClientMessage(playerid, COLOR_GREY, "Available names: Level, Price, Funds, Products");
				SendClientMessage(playerid, COLOR_WHITE, "|____________________________________________|");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /edit [name] [ammount]");
				return 1;
			}
			new proplev = strval(tmp);
	        //if(strcmp(x_job,"car",true) == 0)
	        for(new i = 0; i < sizeof(HouseInfo); i++)
			{
				if (PlayerToPoint(3, playerid,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]))
				{
					format(string, sizeof(string), "House: %d", i);
					SendClientMessage(playerid, COLOR_GRAD2, string);
					if(proplev > 0)
					{
					    if(strcmp(x_job,"level",true) == 0)
					    {
							HouseInfo[i][hLevel] = proplev;
						}
						else if(strcmp(x_job,"price",true) == 0)
					    {
							HouseInfo[i][hValue] = proplev;
						}
					}
				}
			}
			for(new i = 0; i < sizeof(BizzInfo); i++)
			{
				if (PlayerToPoint(3, playerid,BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ]))
				{
					format(string, sizeof(string), "Biz: %d", i);
					SendClientMessage(playerid, COLOR_GRAD2, string);
					if(proplev > 0)
					{
					    if(strcmp(x_job,"level",true) == 0)
					    {
							BizzInfo[i][bLevelNeeded] = proplev;
						}
						else if(strcmp(x_job,"price",true) == 0)
					    {
							BizzInfo[i][bBuyPrice] = proplev;
						}
						else if(strcmp(x_job,"funds",true) == 0)
					    {
							BizzInfo[i][bTill] = proplev;
						}
						else if(strcmp(x_job,"products",true) == 0)
					    {
							BizzInfo[i][bProducts] = proplev;
						}
					}
				}
			}
			for(new i = 0; i < sizeof(SBizzInfo); i++)
			{
				if (PlayerToPoint(3, playerid,SBizzInfo[i][sbEntranceX], SBizzInfo[i][sbEntranceY], SBizzInfo[i][sbEntranceZ]))
				{
					format(string, sizeof(string), "SBiz: %d", i);
					SendClientMessage(playerid, COLOR_GRAD2, string);
					if(proplev > 0)
					{
					    if(strcmp(x_job,"level",true) == 0)
					    {
							SBizzInfo[i][sbLevelNeeded] = proplev;
						}
						else if(strcmp(x_job,"price",true) == 0)
					    {
							SBizzInfo[i][sbBuyPrice] = proplev;
						}
						else if(strcmp(x_job,"funds",true) == 0)
					    {
							SBizzInfo[i][sbTill] = proplev;
						}
						else if(strcmp(x_job,"products",true) == 0)
					    {
							SBizzInfo[i][sbProducts] = proplev;
						}
					}
				}
			}
			format(string, sizeof(string), "You've adjusted the: %s.", x_job);
			SendClientMessage(playerid, COLOR_WHITE, string);
			OnPropUpdate();
		}
		return 1;
	}
	if(strcmp(cmd, "/load", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			if(tmpcar < 78 || tmpcar > 81)
			{
				GameTextForPlayer(playerid, "~r~You are not in a delivery truck", 5000, 1);
				return 1;
			}
			format(string, sizeof(string), "Products: %d/%d.", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
			SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/buyprods", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new tmpcar = GetPlayerVehicleID(playerid);
			new compcost = 50;
			if(PlayerToPoint(60.0, playerid, 2787.8,-2436.3,13.7))
			{
				if(IsATruck(tmpcar))
				{
					if(PlayerHaul[tmpcar][pLoad] < PlayerHaul[tmpcar][pCapasity])
					{
					    new amount;
					    tmp = strtok(cmdtext, idx);
						if(!strlen(tmp))
						{
							SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /buyprods [amount]");
							return 1;
						}
						amount = strval(tmp);
						if(amount < 1 || amount > 500) { SendClientMessage(playerid, COLOR_GREY, "   Can't buy less then 1 Product or more then 500 !"); return 1; }
						new check= PlayerHaul[tmpcar][pLoad] + amount;
						if(check > PlayerHaul[tmpcar][pCapasity])
						{
						    format(string, sizeof(string), "   You went over the Truck Products Carry Limit of %d, you currently carry %d.",PlayerHaul[tmpcar][pCapasity],PlayerHaul[tmpcar][pLoad]);
						    SendClientMessage(playerid, COLOR_GREY, string);
						    return 1;
						}
						new cost = amount*compcost;
						if(GetPlayerMoney(playerid) >= cost)
						{
							PlayerHaul[tmpcar][pLoad] += amount;
							format(string, sizeof(string), "Products: %d/%d.", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
							format(string, sizeof(string), "You bought %d Products for $%d.", amount,cost);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
							GivePlayerMoney(playerid,-cost);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							return 1;
						}
						else
						{
							format(string, sizeof(string), "You cant afford %d Products at $%d !", amount,cost);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
							return 1;
						}
					}
					else
					{
							format(string, sizeof(string), "Products: %d/%d.", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
							return 1;
					}
				}
				else
				{
					SendClientMessage(playerid, TEAM_GROVE_COLOR, "This Vehicle does not deliver Products.");
					return 1;
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/sellprods", true) == 0)
	{
	    new cashmade;
	    new tmpcar;
	    if(IsPlayerConnected(playerid))
		{
			tmpcar = GetPlayerVehicleID(playerid);
			if(!IsATruck(tmpcar))
			{
				GameTextForPlayer(playerid, "~r~You are not in a delivery truck", 5000, 1);
				return 1;
			}
			if(PlayerHaul[tmpcar][pLoad] == 0)
			{
				GameTextForPlayer(playerid, "~r~Truck is empty, return to the stock house", 5000, 1);
				format(string, sizeof(string), "Products: %d/%d.", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
				SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
				return 1;
			}
			for(new i = 0; i < sizeof(BizzInfo); i++)
			{
				if (PlayerToPoint(10, playerid,BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ]))
				{
					//printf("Found House :%d",i);
					for(new l = PlayerHaul[tmpcar][pLoad]; l > 0; l--)
					{
						if(BizzInfo[i][bProducts] == BizzInfo[i][bMaxProducts])
						{
							GameTextForPlayer(playerid, "~r~Our stores are full", 5000, 1);
							format(string, sizeof(string), "Cash Earned $%d.", cashmade);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
							format(string, sizeof(string), "Products: %d/%d.", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							return 1;
						}
						if(BizzInfo[i][bPriceProd] > BizzInfo[i][bTill])
						{
							GameTextForPlayer(playerid, "~r~We Cant Afford The Deal", 5000, 1);
							format(string, sizeof(string), "Cash Earned $%d.", cashmade);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
							format(string, sizeof(string), "Products: %d/%d.", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							return 1;
						}
						PlayerHaul[tmpcar][pLoad]--;
						BizzInfo[i][bProducts]++;
						cashmade = cashmade+BizzInfo[i][bPriceProd];
						ConsumingMoney[playerid] = 1;
						GivePlayerMoney(playerid,BizzInfo[i][bPriceProd]);
						BizzInfo[i][bTill] -= BizzInfo[i][bPriceProd];
						if(PlayerHaul[tmpcar][pLoad] == 0)
						{
							GameTextForPlayer(playerid, "~r~Truck is empty, return to the stock house", 5000, 1);
							format(string, sizeof(string), "Cash Earned $%d.", cashmade);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
							format(string, sizeof(string), "Products: %d/%d.", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
							SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
							PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
							return 1;
						}
					}
					OnPropUpdate();
					return 1;
				}
			}
		}
		for(new i = 0; i < sizeof(SBizzInfo); i++)
		{
			if (PlayerToPoint(10, playerid,SBizzInfo[i][sbEntranceX], SBizzInfo[i][sbEntranceY], SBizzInfo[i][sbEntranceZ]))
			{
				//printf("Found House :%d",i);
				for(new l = PlayerHaul[tmpcar][pLoad]; l > 0; l--)
				{
					if(SBizzInfo[i][sbProducts] == SBizzInfo[i][sbMaxProducts])
					{
						GameTextForPlayer(playerid, "~r~Our stores are full", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d.", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Products: %d/%d.", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						return 1;
					}
					if(SBizzInfo[i][sbPriceProd] > SBizzInfo[i][sbTill])
					{
						GameTextForPlayer(playerid, "~r~We Cant Afford The Deal", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d.", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Products: %d/%d.", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						return 1;
					}
					PlayerHaul[tmpcar][pLoad]--;
					SBizzInfo[i][sbProducts]++;
					cashmade = cashmade+SBizzInfo[i][sbPriceProd];
					ConsumingMoney[playerid] = 1;
					GivePlayerMoney(playerid,SBizzInfo[i][sbPriceProd]);
					SBizzInfo[i][sbTill] -= SBizzInfo[i][sbPriceProd];
					if(PlayerHaul[tmpcar][pLoad] == 0)
					{
						GameTextForPlayer(playerid, "~r~Truck is empty, return to the stock house", 5000, 1);
						format(string, sizeof(string), "Cash Earned $%d.", cashmade);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						format(string, sizeof(string), "Products: %d/%d.", PlayerHaul[tmpcar][pLoad],PlayerHaul[tmpcar][pCapasity]);
						SendClientMessage(playerid, TEAM_GROVE_COLOR, string);
						return 1;
					}
				}
				OnPropUpdate();
				return 1;
			}
		}
		GameTextForPlayer(playerid, "~r~To Far From A Business", 5000, 1);
		return 1;
	}
	if(strcmp(cmd, "/enter", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			for(new i = 0; i < sizeof(HouseInfo); i++)
			{
				if (PlayerToPoint(3, playerid,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]))
				{
					//printf("Found House :%d",i);
					if(PlayerInfo[playerid][pPhousekey] == i || HouseInfo[i][hLock] == 0)
					{
						SetPlayerInterior(playerid,HouseInfo[i][hInt]);
						SetPlayerPos(playerid,HouseInfo[i][hExitx],HouseInfo[i][hExity],HouseInfo[i][hExitz]);
						GameTextForPlayer(playerid, "~w~Welcome Home", 5000, 1);
						PlayerInfo[playerid][pInt] = HouseInfo[i][hInt];
						PlayerInfo[playerid][pLocal] = i;
					}
					else
					{
						GameTextForPlayer(playerid, "~r~Locked", 5000, 1);
					}
				}
			}
			for(new i = 0; i < sizeof(BizzInfo); i++)
			{
				if (PlayerToPoint(3, playerid,BizzInfo[i][bEntranceX], BizzInfo[i][bEntranceY], BizzInfo[i][bEntranceZ]))
				{
					//printf("Found House :%d",i);
					if(!IsACop(playerid) && i == 3)
					{
					    SendClientMessage(playerid, COLOR_GREY, "   Cops only !");
					    return 1;
					}
					if(PlayerInfo[playerid][pPbiskey] == i || GetPlayerMoney(playerid) >= BizzInfo[i][bEntranceCost])
					{
						if(PlayerInfo[playerid][pPbiskey] != i)
						{
							if(BizzInfo[i][bLocked] == 1)
							{
								GameTextForPlayer(playerid, "~r~Closed", 5000, 1);
								return 1;
							}
							if(BizzInfo[i][bProducts] == 0)
							{
								GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
								return 1;
							}
							GivePlayerMoney(playerid,-BizzInfo[i][bEntranceCost]);
							format(string, sizeof(string), "~r~-$%d~n~~w~type /exit~n~to get out", BizzInfo[i][bEntranceCost]);
							BizzInfo[i][bTill] += BizzInfo[i][bEntranceCost];
							ExtortionBiz(i, BizzInfo[i][bEntranceCost]);
							BizzInfo[i][bProducts]--;
							OnPropUpdate();
							GameTextForPlayer(playerid, string, 5000, 3);
						}
						SetPlayerInterior(playerid,BizzInfo[i][bInterior]);
						SetPlayerPos(playerid,BizzInfo[i][bExitX],BizzInfo[i][bExitY],BizzInfo[i][bExitZ]);
						PlayerInfo[playerid][pInt] = BizzInfo[i][bInterior];
						PlayerInfo[playerid][pLocal] = i+99;
						new dood[MAX_PLAYER_NAME];
						GetPlayerName(playerid, dood, sizeof(dood));
						format(string, sizeof(string), "%s payed $%d to enter biz %d", dood, BizzInfo[i][bEntranceCost], i);
						printf("%s", string);
						PayLog(string);
						//PlayerInfo[playerid][pLocal] = i;
					}
					else
					{
						GameTextForPlayer(playerid, "~r~You dont have the cash", 5000, 1);
					}
				}
			}
			for(new i = 0; i < sizeof(SBizzInfo); i++)
			{
				if (PlayerToPoint(3, playerid,SBizzInfo[i][sbEntranceX], SBizzInfo[i][sbEntranceY], SBizzInfo[i][sbEntranceZ]))
				{
					if(PlayerInfo[playerid][pPbiskey] == i || GetPlayerMoney(playerid) >= SBizzInfo[i][sbEntranceCost])
					{
						if(PlayerInfo[playerid][pPbiskey] != i)
						{
							if(SBizzInfo[i][sbLocked] == 1)
							{
								GameTextForPlayer(playerid, "~r~Closed", 5000, 1);
								return 1;
							}
							if(SBizzInfo[i][sbProducts] == 0)
							{
								GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
								return 1;
							}
							if(i == 10)
							{
							    PaintballPlayers ++;
							    PlayerPaintballing[playerid] = 1;
							    new rand = random(sizeof(PaintballSpawns));
								SetPlayerPos(playerid, PaintballSpawns[rand][0], PaintballSpawns[rand][1], PaintballSpawns[rand][2]);
								TogglePlayerControllable(playerid, 0);
							}
							else if(i == 11)
							{
							    PlayerKarting[playerid] = 1;
							    SendClientMessage(playerid, TEAM_GROVE_COLOR, "You can now parcipitate in a Karting Race, grab a Kart.");
							}
							else
							{
							    return 1;
							}
							GivePlayerMoney(playerid,-SBizzInfo[i][sbEntranceCost]);
							gSpentCash[playerid] = GetPlayerMoney(playerid);
							SBizzInfo[i][sbProducts]--;
							SBizzInfo[i][sbTill] += SBizzInfo[i][sbEntranceCost];
							ExtortionSBiz(i, SBizzInfo[i][sbEntranceCost]);
							new dood[MAX_PLAYER_NAME];
							GetPlayerName(playerid, dood, sizeof(dood));
							format(string, sizeof(string), "%s payed $%d to enter sbiz %d", dood, SBizzInfo[i][sbEntranceCost], i);
							printf("%s", string);
							PayLog(string);
							OnPropUpdate();
						}
					}
					else
					{
						GameTextForPlayer(playerid, "~r~You dont have the cash", 5000, 1);
					}
				}
			}
			if (PlayerToPoint(3.0, playerid,-2162.2554,-2385.9541,30.6250))
			{
			    SetPlayerInterior(playerid,3);
				SetPlayerPos(playerid,387.7978,173.8582,1008.3828);
				GameTextForPlayer(playerid, "~w~Welcome to the City Hall", 5000, 1);
				PlayerInfo[playerid][pInt] = 3;
				PlayerInfo[playerid][pLocal] = 241;
			}
			else if (PlayerToPoint(3.0, playerid,1073.0619,-344.5148,73.9922))
			{
			    if(PlayerInfo[playerid][pMember] == 8 || PlayerInfo[playerid][pLeader] == 8)
			    {
				    SetPlayerInterior(playerid,2);
					SetPlayerPos(playerid,1205.0947,-10.1685,1000.9219);
					PlayerInfo[playerid][pInt] = 2;
					PlayerInfo[playerid][pLocal] = 242;
				}
			}
			else if (PlayerToPoint(3.0, playerid,2695.6235,-1704.6960,11.8438))
			{
			    GameTextForPlayer(playerid, "~w~Welcome to the 8ball Track", 5000, 1);
			    SetPlayerInterior(playerid,7);
				SetPlayerPos(playerid,-1404.5299,-259.0602,1043.6563);
			}
			else if (PlayerToPoint(8.0, playerid,-2111.5686,-443.9720,38.7344))
			{
			    GameTextForPlayer(playerid, "~w~Welcome to the Dirt Track", 5000, 1);
			    SetPlayerInterior(playerid,4);
				SetPlayerPos(playerid,-1443.0554,-581.1879,1055.0472);
			}
			else if (PlayerToPoint(8.0, playerid,-2080.3079,-406.0309,38.7344))
			{
			    GameTextForPlayer(playerid, "~w~Welcome to the Stunting Track", 5000, 1);
			    SetPlayerInterior(playerid,14);
				SetPlayerPos(playerid,-1464.7732,1557.5533,1052.5313);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/exit", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			for(new i = 0; i <  sizeof(HouseInfo); i++)
			{
				//printf("House :%d",i);
				if (PlayerToPoint(3, playerid,HouseInfo[i][hExitx], HouseInfo[i][hExity], HouseInfo[i][hExitz]))
				{
					SetPlayerInterior(playerid,0);
					SetPlayerPos(playerid,HouseInfo[i][hEntrancex],HouseInfo[i][hEntrancey],HouseInfo[i][hEntrancez]);
					PlayerInfo[playerid][pInt] = 0;
					PlayerInfo[playerid][pLocal] = 255;
					if(HouseInfo[i][hHel] == 1)
					{
						new Float:tempheal;
						GetPlayerHealth(playerid,tempheal);
						if(tempheal < 100.0)
						{
							SetPlayerHealth(playerid,100.0);
						}
					}
				}
			}
			for(new i = 0; i <  sizeof(BizzInfo); i++)
			{
				//printf("Bizz :%d",i);
				if (PlayerToPoint(3, playerid,BizzInfo[i][bExitX], BizzInfo[i][bExitY], BizzInfo[i][bExitZ]))
				{
					SetPlayerInterior(playerid,0);
					PlayerInfo[playerid][pInt] = 0;
					SetPlayerPos(playerid,BizzInfo[i][bEntranceX],BizzInfo[i][bEntranceY],BizzInfo[i][bEntranceZ]);
					PlayerInfo[playerid][pLocal] = 255;
				}
			}
			if(GetPlayerVehicleID(playerid) >= 71 && GetPlayerVehicleID(playerid) <= 77)
			{
				TogglePlayerControllable(playerid, 1);
				RemovePlayerFromVehicle(playerid);
			}
			else if (PlayerToPoint(3.0, playerid,387.7978,173.8582,1008.3828))
			{
			    SetPlayerInterior(playerid,0);
				SetPlayerPos(playerid,-2162.2554,-2385.9541,30.6250);
				PlayerInfo[playerid][pInt] = 0;
				PlayerInfo[playerid][pLocal] = 255;
			}
			else if (PlayerToPoint(6.0, playerid,-1404.5299,-259.0602,1043.6563))
			{
			    SetPlayerInterior(playerid,0);
				SetPlayerPos(playerid,2695.6235,-1704.6960,11.8438);
			}
			else if (PlayerToPoint(8.0, playerid,-1443.0554,-581.1879,1055.0472))
			{
			    SetPlayerInterior(playerid,0);
				SetPlayerPos(playerid,-2111.5686,-443.9720,38.7344);
			}
			else if (PlayerToPoint(8.0, playerid,-1464.7732,1557.5533,1052.5313))
			{
			    SetPlayerInterior(playerid,0);
				SetPlayerPos(playerid,-2080.3079,-406.0309,38.7344);
			}
			else if(NoFuel[playerid] == 1)
			{
			    TogglePlayerControllable(playerid, 1);
				RemovePlayerFromVehicle(playerid);
				NoFuel[playerid] = 0;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/home", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			if(PlayerInfo[playerid][pPhousekey] != 255)
			{
			    if(PlayerOnMission[playerid] > 0)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   On a mission right now, can't use this command !");
			        return 1;
			    }
				SetPlayerCheckpoint(playerid,HouseInfo[PlayerInfo[playerid][pPhousekey]][hEntrancex], HouseInfo[PlayerInfo[playerid][pPhousekey]][hEntrancey], HouseInfo[PlayerInfo[playerid][pPhousekey]][hEntrancez], 4.0);
				GameTextForPlayer(playerid, "~w~Waypoint set ~r~Home", 5000, 1);
				gPlayerCheckpointStatus[playerid] = CHECKPOINT_HOME;
			}
			else
			{
				GameTextForPlayer(playerid, "~w~You are homeless", 5000, 1);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/towcar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new house = PlayerInfo[playerid][pPhousekey];
			GetPlayerName(playerid, playername, sizeof(playername));
			if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
			{
				if(SBizzInfo[8][sbProducts] == 0)
				{
					GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
					return 1;
				}
				if(CarTow(house+1))
				{
					GameTextForPlayer(playerid, "~w~Car~n~~g~Towed Home~n~~r~$-1000", 5000, 1);
					GivePlayerMoney(playerid,-1000);
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SBizzInfo[8][sbTill] += 1000;//towcar buisness
					ExtortionSBiz(8, 1000);
					SBizzInfo[8][sbProducts]--;
				}
				else
				{
					GameTextForPlayer(playerid, "~w~Car is~n~in ~r~use", 5000, 1);
				}
			}
			else
			{
				GameTextForPlayer(playerid, "~w~You are not a home owner", 5000, 1);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/fixcar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new house = PlayerInfo[playerid][pPhousekey];
			GetPlayerName(playerid, playername, sizeof(playername));
			if (house != 255 && strcmp(playername, HouseInfo[PlayerInfo[playerid][pPhousekey]][hOwner], true) == 0)
			{
				if(SBizzInfo[8][sbProducts] == 0)
				{
					GameTextForPlayer(playerid, "~r~Out Of Stock", 5000, 1);
					return 1;
				}
				if(CarRespawn(house+1))
				{
					GameTextForPlayer(playerid, "~w~Car~n~~g~Repaired~n~~r~$-1000", 5000, 1);
					GivePlayerMoney(playerid,-1000);
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SBizzInfo[8][sbTill] += 1000;//towcar buisness
					ExtortionSBiz(8, 1000);
					SBizzInfo[8][sbProducts]--;
				}
				else
				{
					GameTextForPlayer(playerid, "~w~Car is~n~in ~r~use", 5000, 1);
				}
			}
			else
			{
				GameTextForPlayer(playerid, "~w~You are not a home owner", 5000, 1);
			}
		}
		return 1;
	}
//----------------------------------[BIZZ]-----------------------------------------------
	if(strcmp(cmd, "/buybiz", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new Float:oldposx, Float:oldposy, Float:oldposz;
			GetPlayerName(playerid, playername, sizeof(playername));
			GetPlayerPos(playerid, oldposx, oldposy, oldposz);
			if(PlayerInfo[playerid][pPbiskey] != 255)
			{
				SendClientMessage(playerid, COLOR_WHITE, "   You already own a business, type /sellbiz if you want to buy this one.");
				return 1;
			}
			for(new b = 0; b < sizeof(SBizzInfo); b++)
			{
				if(PlayerToPoint(2.0, playerid, SBizzInfo[b][sbEntranceX], SBizzInfo[b][sbEntranceY], SBizzInfo[b][sbEntranceZ]) && SBizzInfo[b][sbOwned] == 0)
				{
					if(PlayerInfo[playerid][pLevel] < SBizzInfo[b][sbLevelNeeded])
					{
						format(string, sizeof(string), "You Must Be Level %d To Purchase This",SBizzInfo[b][sbLevelNeeded]);
						SendClientMessage(playerid, COLOR_GRAD5, string);
						return 1;
					}
					if(GetPlayerMoney(playerid) > SBizzInfo[b][sbBuyPrice])
					{
						PlayerInfo[playerid][pPbiskey] = b+100;
						SBizzInfo[b][sbOwned] = 1;
						GetPlayerName(playerid, sendername, sizeof(sendername));
						strmid(SBizzInfo[b][sbOwner], sendername, 0, strlen(sendername), 255);
						GivePlayerMoney(playerid,-SBizzInfo[b][sbBuyPrice]);
						PlayerPlayMusic(playerid);
						SendClientMessage(playerid, COLOR_WHITE, "Congratulations, On Your New Purchase.");
						SendClientMessage(playerid, COLOR_WHITE, "Type /help to review the new business help section.");
                        DateProp(playerid);
						OnPropUpdate();
						OnPlayerUpdate(playerid);
						return 1;
					}
					else
					{
						SendClientMessage(playerid, COLOR_WHITE, "You don't have the cash for that");
						return 1;
					}
				}
			}
			for(new b = 0; b < sizeof(BizzInfo); b++)
			{
				if(PlayerToPoint(2.0, playerid, BizzInfo[b][bEntranceX], BizzInfo[b][bEntranceY], BizzInfo[b][bEntranceZ]) && BizzInfo[b][bOwned] == 0)
				{
					if(PlayerInfo[playerid][pLevel] < BizzInfo[b][bLevelNeeded])
					{
						format(string, sizeof(string), "You Must Be Level %d To Purchase This",BizzInfo[b][bLevelNeeded]);
						SendClientMessage(playerid, COLOR_GRAD5, string);
						return 1;
					}
					if(GetPlayerMoney(playerid) > BizzInfo[b][bBuyPrice])
					{
						PlayerInfo[playerid][pPbiskey] = b;
						BizzInfo[b][bOwned] = 1;
						GetPlayerName(playerid, sendername, sizeof(sendername));
						strmid(BizzInfo[b][bOwner], sendername, 0, strlen(sendername), 255);
						GivePlayerMoney(playerid,-BizzInfo[b][bBuyPrice]);
						PlayerPlayMusic(playerid);
						SetPlayerInterior(playerid,BizzInfo[b][bInterior]);
						PlayerInfo[playerid][pInt] = BizzInfo[b][bInterior];
						SetPlayerPos(playerid,BizzInfo[b][bExitX],BizzInfo[b][bExitY],BizzInfo[b][bExitZ]);
						GameTextForPlayer(playerid, "~w~Welcome~n~You can exit at any time by moving to this door and typing /exit", 5000, 3);
						PlayerInfo[playerid][pInt] = BizzInfo[b][bInterior];
						PlayerInfo[playerid][pLocal] = b ;
						SendClientMessage(playerid, COLOR_WHITE, "Congratulations, On Your New Purchase.");
						SendClientMessage(playerid, COLOR_WHITE, "Type /help to review the new business help section.");
                        DateProp(playerid);
						OnPropUpdate();
						OnPlayerUpdate(playerid);
						return 1;
					}
					else
					{
						SendClientMessage(playerid, COLOR_WHITE, "You don't have the cash for that");
						return 1;
					}
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/sellbiz", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			GetPlayerName(playerid, playername, sizeof(playername));
			if(PlayerInfo[playerid][pPbiskey] == 255)
			{
				SendClientMessage(playerid, COLOR_WHITE, "You don't own a bizz.");
				return 1;
			}
			if(PlayerInfo[playerid][pMarried] > 0)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "   You are Married, can't sell the House !");
		        return 1;
		    }
			if(PlayerInfo[playerid][pPbiskey] >= 100 && strcmp(playername, SBizzInfo[PlayerInfo[playerid][pPbiskey]-100][sbOwner], true) == 0)
			{
				new bouse = PlayerInfo[playerid][pPbiskey]-100;
				GivePlayerMoney(playerid,SBizzInfo[bouse][sbTill]);
				SBizzInfo[bouse][sbLocked] = 1;
				SBizzInfo[bouse][sbOwned] = 0;
				GetPlayerName(playerid, sendername, sizeof(sendername));
				strmid(SBizzInfo[bouse][sbOwner], "The State", 0, strlen("The State"), 255);
				strmid(SBizzInfo[bouse][sbExtortion], "No-one", 0, strlen("No-one"), 255);
				ConsumingMoney[playerid] = 1;
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "~w~Congratulations~n~ You have sold your property for ~n~~g~$%d", SBizzInfo[bouse][sbTill]);
				GameTextForPlayer(playerid, string, 10000, 3);
				SBizzInfo[bouse][sbTill] = 0;
				PlayerInfo[playerid][pPbiskey] = 255;
				OnPropUpdate();
				OnPlayerUpdate(playerid);
				return 1;
			}
			if(strcmp(playername, BizzInfo[PlayerInfo[playerid][pPbiskey]][bOwner], true) == 0)
			{
				new bouse = PlayerInfo[playerid][pPbiskey];
				BizzInfo[bouse][bLocked] = 1;
				BizzInfo[bouse][bOwned] = 0;
				GetPlayerName(playerid, sendername, sizeof(sendername));
				strmid(BizzInfo[bouse][bOwner], "The State", 0, strlen("The State"), 255);
				strmid(BizzInfo[bouse][bExtortion], "No-one", 0, strlen("No-one"), 255);
				ConsumingMoney[playerid] = 1;
				GivePlayerMoney(playerid,BizzInfo[bouse][bTill]);
				PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
				format(string, sizeof(string), "~w~Congratulations~n~ You have sold your property for ~n~~g~$%d", BizzInfo[bouse][bTill]);
				GameTextForPlayer(playerid, string, 10000, 3);
				BizzInfo[bouse][bTill] = 0;
				PlayerInfo[playerid][pPbiskey] = 255;
				OnPropUpdate();
				OnPlayerUpdate(playerid);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_WHITE, "You don't own a business.");
			}
		}
		return 1;
	}
	if (strcmp(cmd, "/bizinfo", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new bouse = PlayerInfo[playerid][pPbiskey];
			if(bouse == 255)
			{
				SendClientMessage(playerid, COLOR_WHITE, "You don't own a business.");
				return 1;
			}
			if (bouse >= 100)
			{

				PrintSBizInfo(playerid,bouse-100);
			}
			else
			{
				PrintBizInfo(playerid,bouse);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/prodprice", true) == 0)
	{
		new bouse = PlayerInfo[playerid][pPbiskey];
		if (bouse == 255)
		{
			SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
			return 1;
		}
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /prodprice [amount to pay per Product]");
		}
		if(strval(tmp) < 1 || strval(tmp) > 99999)
		{
			SendClientMessage(playerid, COLOR_WHITE, "Minimum amount is $1, Maximum amount is $99999.");
			return 1;
		}
		if (bouse >= 100)
		{
			if(strval(tmp) > SBizzInfo[bouse-100][sbTill])
			{
				SendClientMessage(playerid, COLOR_WHITE, "You dont have that much in your Till.");
				return 1;
			}
			SBizzInfo[bouse-100][sbPriceProd] = strval(tmp);
			format(string, sizeof(string), "Buying Products for $%d.", SBizzInfo[bouse-100][sbPriceProd]);
		}
		else
		{
			if(strval(tmp) > BizzInfo[bouse][bTill])
			{
				SendClientMessage(playerid, COLOR_WHITE, "You dont have that much in your Till.");
				return 1;
			}
			BizzInfo[bouse][bPriceProd] = strval(tmp);
			format(string, sizeof(string), "Buying Products for $%d.", BizzInfo[bouse][bPriceProd]);
		}
		OnPropUpdate();
		SendClientMessage(playerid, COLOR_WHITE, string);
		return 1;
	}
	if(strcmp(cmd, "/bizfee", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new bouse = PlayerInfo[playerid][pPbiskey];
			if (bouse == 255)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business !");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /bizfee [EntranceFee]");
			}
			if(strval(tmp) < 0 || strval(tmp) > 99999)
			{
				SendClientMessage(playerid, COLOR_WHITE, "Minimum entrance is $0, Maximum entrance is $99999.");
				return 1;
			}
			if (bouse >= 100)
			{
				SBizzInfo[bouse-100][sbEntranceCost] = strval(tmp);
				format(string, sizeof(string), "Entrance fee set to $%d.", SBizzInfo[bouse-100][sbEntranceCost]);
			}
			else
			{
				BizzInfo[bouse][bEntranceCost] = strval(tmp);
				format(string, sizeof(string), "Entrance fee set to $%d.", BizzInfo[bouse][bEntranceCost]);
			}
			OnPropUpdate();
			SendClientMessage(playerid, COLOR_WHITE, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/extortion", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new bouse = PlayerInfo[playerid][pPbiskey];
			if (bouse == 255)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /extortion [playerid/PartOfName] (or 555 for No-one)");
			    return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        GetPlayerName(playerid, sendername, sizeof(sendername));
			        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			        format(string, sizeof(string), "* %s is know Extortioning your Business.",giveplayer);
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			        format(string, sizeof(string), "* %s has adjusted his Business, you are now Extortioning his Business.",sendername);
			        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
			        if (bouse >= 100)
					{
					    format(string, sizeof(string), "%s",giveplayer);
						strmid(SBizzInfo[bouse-100][sbExtortion], string, 0, sizeof(string), 255);
						format(string, sizeof(string), "Business Extortion Name set to %s",SBizzInfo[bouse-100][sbExtortion]);
					}
					else
					{
					    format(string, sizeof(string), "%s",giveplayer);
						strmid(BizzInfo[bouse][bExtortion], string, 0, sizeof(string), 255);
						format(string, sizeof(string), "Business Extortion Name set to %s",BizzInfo[bouse][bExtortion]);
					}
					OnPropUpdate();
					SendClientMessage(playerid, COLOR_WHITE, string);
			    }
			}
			else if(giveplayerid == 555)
			{
			    if (bouse >= 100)
				{
				    format(string, sizeof(string), "No-one");
					strmid(SBizzInfo[bouse-100][sbExtortion], string, 0, sizeof(string), 255);
					format(string, sizeof(string), "Business Extortion Name set to %s",SBizzInfo[bouse-100][sbExtortion]);
				}
				else
				{
				    format(string, sizeof(string), "No-one");
					strmid(BizzInfo[bouse][bExtortion], string, 0, sizeof(string), 255);
					format(string, sizeof(string), "Business Extortion Name set to %s",BizzInfo[bouse][bExtortion]);
				}
				OnPropUpdate();
				SendClientMessage(playerid, COLOR_WHITE, string);
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
			    return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/bizname", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new bouse = PlayerInfo[playerid][pPbiskey];
			if (bouse == 255)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
				return 1;
			}
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /bizname [Name]");
			}
			if (bouse >= 100)
			{
				strmid(SBizzInfo[bouse-100][sbMessage], result, 0, 64, 255);
				format(string, sizeof(string), "Business name set to %s",SBizzInfo[bouse-100][sbMessage]);
			}
			else
			{
				strmid(BizzInfo[bouse][bMessage], result, 0, 64, 255);
				format(string, sizeof(string), "Business name set to %s",BizzInfo[bouse][bMessage]);
			}
			OnPropUpdate();
			SendClientMessage(playerid, COLOR_WHITE, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/bizwithdraw", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new bouse = PlayerInfo[playerid][pPbiskey];
			if (bouse == 255)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				if (bouse >= 100)
				{
					format(string, sizeof(string), "  You Have $%d in your till.", SBizzInfo[bouse-100][sbTill]);
					SendClientMessage(playerid, COLOR_GRAD3, string);
				}
				else
				{
					format(string, sizeof(string), "  You Have $%d in your till.", BizzInfo[bouse][bTill]);
					SendClientMessage(playerid, COLOR_GRAD3, string);
				}
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /bizwithdraw [amount]");
				return 1;
			}
			new cashdeposit = strval(tmp);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /bizwithdraw [amount]");
				return 1;
			}
			if (bouse >= 100)
			{
				if(cashdeposit > SBizzInfo[bouse-100][sbTill] || cashdeposit < 1)
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much");
					return 1;
				}
			}
			else
			{
				if (cashdeposit > BizzInfo[bouse][bTill] || cashdeposit < 1)
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much");
					return 1;
				}
			}
			if (bouse >= 100)
			{
				if(!PlayerToPoint(100, playerid,SBizzInfo[bouse-100][sbEntranceX],SBizzInfo[bouse-100][sbEntranceY],SBizzInfo[bouse-100][sbEntranceZ]))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your business");
					return 1;
				}
				else
				{
				    ConsumingMoney[playerid] = 1;
					GivePlayerMoney(playerid,cashdeposit);
					SBizzInfo[bouse-100][sbTill] -= cashdeposit;
					format(string, sizeof(string), "  You Have Withdrawn $%d from your till Total: $%d ", cashdeposit,SBizzInfo[bouse-100][sbTill]);
					OnPropUpdate();
					SendClientMessage(playerid, COLOR_YELLOW, string);
					return 1;
				}
			}
			else
			{
				if (!PlayerToPoint(100, playerid,BizzInfo[bouse][bExitX],BizzInfo[bouse][bExitY],BizzInfo[bouse][bExitZ]))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your business");
					return 1;
				}
				else
				{
				    ConsumingMoney[playerid] = 1;
					GivePlayerMoney(playerid,cashdeposit);
					BizzInfo[bouse][bTill] -= cashdeposit;
					format(string, sizeof(string), "  You Have Withdrawn $%d from your till Total: $%d ", cashdeposit,BizzInfo[bouse][bTill]);
					OnPropUpdate();
					SendClientMessage(playerid, COLOR_YELLOW, string);
					return 1;
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/bizbank", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			new bouse = PlayerInfo[playerid][pPbiskey];
			if (bouse == 255)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You don't own a business");
				return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				if (bouse >= 100)
				{
					format(string, sizeof(string), "  You Have $%d in your till.", SBizzInfo[bouse-100][sbTill]);
					SendClientMessage(playerid, COLOR_GRAD3, string);
				}
				else
				{
					format(string, sizeof(string), "  You Have $%d in your till.", BizzInfo[bouse][bTill]);
					SendClientMessage(playerid, COLOR_GRAD3, string);
				}
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /bizbank [amount]");
				return 1;
			}
			new cashdeposit = strval(tmp);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /bizbank [amount]");
				SendClientMessage(playerid, COLOR_GRAD3, string);
				return 1;
			}
			if (cashdeposit > GetPlayerMoney(playerid) || cashdeposit < 1)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   You dont have that much");
				return 1;
			}
			if (bouse >= 100)
			{
				if(!PlayerToPoint(100, playerid,SBizzInfo[bouse-100][sbEntranceX],SBizzInfo[bouse-100][sbEntranceY],SBizzInfo[bouse-100][sbEntranceZ]))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your business");
					return 1;
				}
				else
				{
					GivePlayerMoney(playerid,-cashdeposit);
					SBizzInfo[bouse-100][sbTill] += cashdeposit;
					ExtortionSBiz(bouse-100, cashdeposit);
					format(string, sizeof(string), "  You Have Banked $%d to your till Total: $%d ", cashdeposit,SBizzInfo[bouse-100][sbTill]);
					OnPropUpdate();
					SendClientMessage(playerid, COLOR_YELLOW, string);
					return 1;
				}
			}
			else
			{
				if (!PlayerToPoint(100, playerid,BizzInfo[bouse][bExitX],BizzInfo[bouse][bExitY],BizzInfo[bouse][bExitZ]))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You are to far from your business");
					return 1;
				}
				else
				{
					GivePlayerMoney(playerid,-cashdeposit);
					BizzInfo[bouse][bTill] += cashdeposit;
					ExtortionBiz(bouse, cashdeposit);
					format(string, sizeof(string), "  You Have Banked $%d to your till Total: $%d ", cashdeposit,BizzInfo[bouse][bTill]);
					OnPropUpdate();
					SendClientMessage(playerid, COLOR_YELLOW, string);
					return 1;
				}
			}
		}
		return 1;
	}
//-----------------------------------[HEAL]-------------------------------------------------------------------------
	if(strcmp(cmd, "/heal", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
		{
			tmp = strtok(cmdtext, idx);
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new location = PlayerInfo[playerid][pLocal];
			if(!strlen(tmp))
			{
				if(location != 255)
				{
					if(location < 99)
					{
						if(HouseInfo[location][hArm] == 1 && IsACop(playerid))
						{
							format(string, sizeof(string), "* %s puts on body armour.", sendername);
							ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
							TogglePlayerControllable(playerid, 0);
							GetPlayerPos(playerid, Unspec[playerid][sPx], Unspec[playerid][sPy], Unspec[playerid][sPz]);
							Unspec[playerid][sPint] = PlayerInfo[playerid][pInt];
							Unspec[playerid][sLocal] = PlayerInfo[playerid][pLocal];
							SetPlayerPos(playerid,1527.5,-12.1,1002.0);
							PlayerInfo[playerid][pLocal] = 255;
							SetPlayerInterior(playerid,99);
							Spectate[playerid] = 257;
						}
						else
						{
							format(string, sizeof(string), "This place does not have armour upgrades.");
							SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
						}
						if(HouseInfo[location][hHel] == 1)
						{
							new Float:tempheal;
							GetPlayerHealth(playerid,tempheal);
							if ( tempheal < 100.0)
							{
								SetPlayerHealth(playerid,100.0);
								PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
								format(string, sizeof(string), "You have been healed to 100 health.");
								SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
							}
							else
							{
								SendClientMessage(playerid, TEAM_GREEN_COLOR,"You are already healed to 100.");
							}
						}
						else
						{
							format(string, sizeof(string), "This place does not have healing upgrades.");
							SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
						}
						return 1;
					}
					else if(location == 101)//Restaurant
					{
					    new Float:tempheal;
						GetPlayerHealth(playerid,tempheal);
						if ( tempheal < 100.0)
						{
							SetPlayerHealth(playerid,100.0);
							PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
							format(string, sizeof(string), "You have been healed to 100 health.");
							SendClientMessage(playerid, TEAM_GREEN_COLOR,string);
						}
						else
						{
							SendClientMessage(playerid, TEAM_GREEN_COLOR,"You are already healed to 100.");
						}
					}
					else if(location == 102 && IsACop(playerid))//Police Armoury
					{
					    SetPlayerHealth(playerid,100.0);
					    format(string, sizeof(string), "* %s puts on body armour.", sendername);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						TogglePlayerControllable(playerid, 0);
						GetPlayerPos(playerid, Unspec[playerid][sPx], Unspec[playerid][sPy], Unspec[playerid][sPz]);
						Unspec[playerid][sPint] = PlayerInfo[playerid][pInt];
						Unspec[playerid][sLocal] = PlayerInfo[playerid][pLocal];
						SetPlayerPos(playerid,1527.5,-12.1,1002.0);
						PlayerInfo[playerid][pLocal] = 255;
						SetPlayerInterior(playerid,99);
						Spectate[playerid] = 257;
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /heal [playerid/PartOfName] [price]");
					return 1;
				}
			}
			giveplayerid = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /heal [playerid/PartOfName] [price]");
				return 1;
			}
			moneys = strval(tmp);
			if(moneys < 1 || moneys > 1000) { SendClientMessage(playerid, COLOR_GREY, "   Healing price not below 1 or above 1000 !"); return 1; }
			if (giveplayerid == playerid)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You can not heal yourself!");
				return 1;
			}
			if (IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					new giveambu = GetPlayerVehicleID(giveplayerid);
					new playambu = GetPlayerVehicleID(playerid);
					if(gTeam[playerid] == TEAM_CYAN||PlayerInfo[playerid][pMember]==4||PlayerInfo[playerid][pLeader]==4)//model
					{
						if (IsAnAmbulance(playambu) && playambu == giveambu)
						{
							new Float:tempheal;
							GetPlayerHealth(giveplayerid,tempheal);
							if(tempheal >= 100.0)
							{
								SendClientMessage(playerid, TEAM_GREEN_COLOR,"   That person is fully healed.");
								return 1;
							}
							format(string, sizeof(string), "~y~You healed ~n~~w~%s~n~~g~$%d", giveplayer,moneys);
							GameTextForPlayer(playerid, string, 5000, 1);
							GivePlayerMoney(playerid,moneys);
							GivePlayerMoney(giveplayerid,-moneys);
							new hp = 0;
						    if(PlayerInfo[playerid][pPainPerk] > 0)
						    {
						        hp = 20 * PlayerInfo[playerid][pPainPerk]; hp += 100;
								SetPlayerHealth(giveplayerid, hp);
						    }
						    else
						    {
						        hp = 100;
						        SetPlayerHealth(giveplayerid, 100);
						    }
							PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
							PlayerPlaySound(giveplayerid, 1150, 0.0, 0.0, 0.0);
							format(string, sizeof(string), "You have been healed to %d health -$%d",hp,moneys);
							SendClientMessage(giveplayerid, TEAM_GREEN_COLOR,string);
							if(STDPlayer[giveplayerid] > 0)
				            {
								STDPlayer[giveplayerid] = 0;
								SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, "* You are no longer infected with a STD anymore because of the Medics help !");
							}
						}
						else
						{
							SendClientMessage(playerid, COLOR_GRAD1, "   One of you is not in the Ambulance / Chopper !");
							return 1;
						}
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD1, "   You are not authorized to use that command !");
						return 1;
					}
				}
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		}
		return 1;
	}
//----------------------------------[ADMINADMIN]-----------------------------------------------
//----------------------------------[mole]-----------------------------------------------
	if(strcmp(cmd, "/mole", true) == 0 && PlayerInfo[playerid][pAdmin] >= 4)
	{
	    if(IsPlayerConnected(playerid))
	    {
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				//SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /mole [mole text]");
				return 1;
			}
			format(string, sizeof(string), "SMS: %s, Sender: MOLE (555)",result);
			if (gTeam[playerid] < 3){SendClientMessage(playerid, COLOR_YELLOW, string);}
			SendEnemyMessage(COLOR_YELLOW, string);
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(gTeam[i] >= 3 && gPlayerSpawned[i])
					{
						RingTone[i] =20;
					}
				}
			}
			printf("MOLE: %s", result);
		}
		return 1;
	}
//----------------------------------[HQ]-----------------------------------------------
	if(strcmp(cmd, "/hq", true) == 0 && PlayerInfo[playerid][pAdmin] >= 4)
	{
	    if(IsPlayerConnected(playerid))
	    {
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				//SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /hq [hq text]");
				return 1;
			}
			format(string, sizeof(string), "HQ: %s, over", result);
			if (gTeam[playerid] != 2 ){SendClientMessage(playerid, COLOR_DBLUE, string);}
			SendTeamBeepMessage(2, COLOR_DBLUE, string);
			printf("HQ: %s", result);
		}
		return 1;
	}
//----------------------------------[RECON]-----------------------------------------------
	if(strcmp(cmd, "/bigears", true) == 0 && PlayerInfo[playerid][pAdmin] >= 2)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (!BigEar[playerid])
			{
				BigEar[playerid] = 1;
				SendClientMessage(playerid, COLOR_GRAD2, "   Your Ears Have Grown");
			}
			else if (BigEar[playerid])
			{
				(BigEar[playerid] = 0);
				SendClientMessage(playerid, COLOR_GRAD2, "   Your Ears Have Shrank");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/id", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /id [playerid/PartOfName]");
				return 1;
			}
			new target;
			target = ReturnUser(tmp);
			new sstring[256];
			if(IsPlayerConnected(target))
			{
			    if(target != INVALID_PLAYER_ID)
			    {
					GetPlayerName(target, giveplayer, sizeof(giveplayer));
					format(sstring, sizeof(sstring), "ID: (%d) %s",target,giveplayer);
					SendClientMessage(playerid, COLOR_GRAD1, sstring);
				}
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/tv", true) == 0 || strcmp(cmd, "/recon", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pDonateRank] > 0)
	        {
	            if(WatchingTV[playerid] < 1)
			    {
		        	GetPlayerPos(playerid, Unspec[playerid][Coords][0],Unspec[playerid][Coords][1],Unspec[playerid][Coords][2]);
		        }
	        }
            new hkey = PlayerInfo[playerid][pPhousekey];
			new house = PlayerInfo[playerid][pLocal];
			if(Spectate[playerid] == 255 && PlayerInfo[playerid][pLocal] != 255 || Spectate[playerid] == 255 && PlayerInfo[playerid][pAdmin] > 0)
			{
				GetPlayerPos(playerid, Unspec[playerid][sPx], Unspec[playerid][sPy], Unspec[playerid][sPz]);
				Unspec[playerid][sPint] = PlayerInfo[playerid][pInt];
				Unspec[playerid][sLocal] = PlayerInfo[playerid][pLocal];
				PlayerInfo[playerid][pLocal] = 255;
				gTeam[playerid] = 0;
			}
			tmp = strtok(cmdtext, idx);
			if(strcmp("off", tmp, true, strlen(tmp)) == 0)
			{
			    if(WatchingTV[playerid] > 0)
			    {
			        WatchingTV[playerid] = 0;
					Spectate[playerid] = 253;
					GameTextForPlayer(playerid, "~w~                TV~n~~r~                Off", 5000, 6);
					PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
					return 1;
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not watching TV !");
				    return 1;
				}
			}
			if(PlayerInfo[playerid][pAdmin] < 1)
			{
				if(house == 255)
				{
					GameTextForPlayer(playerid, "~r~There is no tv here", 5000, 1);
					return 1;
				}
			}
			if(PlayerInfo[playerid][pAdmin] > 1 || PlayerToPoint(12.0, playerid, HouseInfo[hkey][hExitx], HouseInfo[hkey][hExity],HouseInfo[hkey][hExitz]))
			{
			    if(HouseInfo[hkey][hHealthx] != 1)
			    {
			        GameTextForPlayer(playerid, "~r~This upgrade isn't installed", 5000, 1);
			        return 1;
			    }
				giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        Spectate[playerid] = giveplayerid;
						new Float:health;
						GetPlayerHealth(Spectate[playerid], health);
						GetPlayerName(Spectate[playerid], giveplayer, sizeof(giveplayer));
						new cash =  GetPlayerMoney(Spectate[playerid]);
						if (PlayerInfo[playerid][pAdmin] >= 1)
						{
							format(string, sizeof(string), "Recon: (%d) %s $%d H:%.0f",Spectate[playerid],giveplayer,cash,health);
						}
						else
						{
							format(string, sizeof(string), "UAV: (%d) %s",Spectate[playerid],giveplayer);
						}
						SendClientMessage(playerid, COLOR_GREEN, string);
						WatchingTV[playerid] = 1;
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GREEN, "Target is not available.");
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREEN, "   You are not in your House !");
				return 1;
			}
		}
		return 1;
	}
//----------------------------------[UNCON]-----------------------------------------------

	if(strcmp(cmd, "/uncon", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			SetCamBack(playerid);
		}
		return 1;
	}

//----------------------------------[AdminChat]-----------------------------------------------
	if(strcmp(cmd, "/admin", true) == 0 || strcmp(cmd, "/a", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/a)dmin [admin chat]");
				return 1;
			}
			format(string, sizeof(string), "*%d Admin %s: %s", PlayerInfo[playerid][pAdmin], sendername, result);
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				SendAdminMessage(COLOR_YELLOW, string);
			}
			printf("Admin %s: %s", sendername, result);
		}
		return 1;
	}
//-------------------------------[Logout]--------------------------------------------------------------------------
	if (strcmp(cmd, "/logout", true) ==0 )
	{
        if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 4)
			{
				OnPlayerUpdate(playerid);
				gPlayerLogged[playerid] = 0;
				SendClientMessage(playerid, COLOR_GRAD1, "   It is now safe to quit.");
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not authorized to use that command !");
			}
		}
		return 1;
	}
	if (strcmp(cmd, "/logoutpl", true) ==0 )
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /logoutpl [playerid/PartOfName]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 4)
			{
			    if(IsPlayerConnected(giveplayerid)&&giveplayerid != INVALID_PLAYER_ID)
			    {
					OnPlayerUpdate(giveplayerid);
					gPlayerLogged[giveplayerid] = 0;
					SendClientMessage(playerid, COLOR_GRAD1, "   player was logged out.");
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not authorized to use that command !");
			}
		}
		return 1;
	}
//-------------------------------[Logoutall]--------------------------------------------------------------------------
	if (strcmp(cmd, "/logoutall", true) ==0 )
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 4)
			{
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
						OnPlayerUpdate(i);
						gPlayerLogged[i] = 0;
					}
				}
				SendClientMessage(playerid, COLOR_GRAD1, "   All Players Logged out.");
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not authorized to use that command !");
			}
		}
		return 1;
	}
//--------------------------------------------------------------------------------------
//----------------------------------[cnn]-----------------------------------------------
	if(strcmp(cmd, "/cnn", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				GetPlayerName(playerid, sendername, sizeof(sendername));
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' '))
				{
					idx++;
				}
				new offset = idx;
				new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
				{
					result[idx - offset] = cmdtext[idx];
					idx++;
				}
				result[idx - offset] = EOS;
				if(!strlen(result))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /cnn [cnn textformat ~n~=Newline ~r~=Red ~g~=Green ~b~=Blue ~w~=White ~y~=Yellow]");
					return 1;
				}
				format(string, sizeof(string), "~b~%s: ~w~%s",sendername,result);
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
						GameTextForPlayer(i, string, 5000, 6);
					}
				}
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/cnnn", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1337)
			{
				tmp = strtok(cmdtext, idx);
				new txtid;
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /cnnn <type> ");
					return 1;
				}
				txtid = strval(tmp);
				if(txtid == 2)
				{
					SendClientMessage(playerid, COLOR_GRAD2, "You can not select 2");
					return 1;
				}
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' '))
				{
					idx++;
				}
				new offset = idx;
				new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
				{
					result[idx - offset] = cmdtext[idx];
					idx++;
				}
				result[idx - offset] = EOS;
				if(!strlen(result))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /cnnn <type> [cnnc textformat ~n~=Newline ~r~=Red ~g~=Green ~b~=Blue ~w~=White ~y~=Yellow]");
					return 1;
				}
				format(string, sizeof(string), "~w~%s",result);
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i) == 1)
					{
						GameTextForPlayer(i, string, 5000, txtid);
					}
				}
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
				return 1;
			}
		}
		return 1;
	}
//[ADMIN]______________________________________________________________________________
//-----------------------------------[JAIL]-------------------------------------------------------------------------
	if(strcmp(cmd, "/prison",true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] < 2)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   you are not authorized to use this command !");
	            return 1;
	        }
	        tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /prison [playerid/PartOfName]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
		    if(IsPlayerConnected(giveplayerid))
		    {
		        if(giveplayerid != INVALID_PLAYER_ID)
		        {
		            GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					format(string, sizeof(string), "* You placed %s in Fort DeMorgan.", giveplayer);
					SendClientMessage(playerid, COLOR_LIGHTRED, string);
					format(string, sizeof(string), "* You were placed in Fort DeMorgan by Admin %s.", sendername);
					SendClientMessage(giveplayerid, COLOR_LIGHTRED, string);
					GameTextForPlayer(giveplayerid, "~w~Welcome to ~n~~r~Fort DeMorgan", 5000, 3);
					WantedPoints[giveplayerid] = 0;
					WantedLevel[giveplayerid] = 0;
					PlayerInfo[giveplayerid][pJailed] = 2;
					PlayerInfo[giveplayerid][pJailTime] = 3600;
		            SetPlayerPos(giveplayerid, 107.2300,1920.6311,18.5208);
					SetPlayerWorldBounds(giveplayerid, 337.5694,101.5826,1940.9759,1798.7453); //285.3481,96.9720,1940.9755,1799.0811
		        }
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
			    return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/jail", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /jail [playerid/PartOfName] [time(minutes)]");
				return 1;
			}
			new playa;
			new money;
			playa = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			money = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 2)
			{
			    if(IsPlayerConnected(playa))
			    {
			        if(playa != INVALID_PLAYER_ID)
			        {
				        GetPlayerName(playa, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "* You Jailed %s.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTRED, string);
						format(string, sizeof(string), "* You were Jailed by Admin %s.", sendername);
						SendClientMessage(playa, COLOR_LIGHTRED, string);
						ResetPlayerWeapons(playa);
						WantedPoints[playa] = 0;
						PlayerInfo[playa][pJailed] = 1;
						PlayerInfo[playa][pJailTime] = money*60;
						SetPlayerInterior(playa, 6);
						SetPlayerPos(playa, 264.6288,77.5742,1001.0391);
						format(string, sizeof(string), "You are jailed for %d minutes.   Bail: Unable", money);
						SendClientMessage(playa, COLOR_LIGHTBLUE, string);
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
//----------------------------------[TOD]-----------------------------------------------

	if(strcmp(cmd, "/tod", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /tod [timeofday] (0-23)");
				return 1;
			}
			new hour;
			hour = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 1337)
			{
	            SetWorldTime(hour);
				format(string, sizeof(string), "   Time set to %d Hours.", hour);
				BroadCast(COLOR_GRAD1, string);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not authorized to use that command !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/startlotto", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] >= 1337)
	        {
	            format(string, sizeof(string), "Lottery News: We have started the Lottery Election.");
	            OOCOff(COLOR_WHITE, string);
	            new rand = random(80);
	            if(rand < 77) { rand += 3; }
	            Lotto(rand);
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not an Admin !");
	            return 1;
	        }
	    }
		return 1;
	}
//-----------------------------------editstat---------------------------------------
	if(strcmp(cmd, "/setstat", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /setstat [playerid/PartOfName] [statcode] [amount]");
				SendClientMessage(playerid, COLOR_GRAD4, "|1 Level |2 SpawnHealth |3 UpgradePoints |4 Model ");
				SendClientMessage(playerid, COLOR_GRAD3, "|5 BankAccount |6 PhoneNumber |7 RespectPoints ");
				SendClientMessage(playerid, COLOR_GRAD2, "|8 HouseKey |9 BizKey |10 DonateRank |11 FMember");
				SendClientMessage(playerid, COLOR_GRAD2, "|12 Det |13 Lawyer |14 Fixer |15 News |16 Jack |17 Drug |18 Sex |19 Box |20 PassKey");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
            if(IsPlayerConnected(giveplayerid))
	    	{
	    	    if(giveplayerid != INVALID_PLAYER_ID)
	    	    {
					tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
						SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /setstat [playerid/PartOfName] [statcode] [amount]");
						SendClientMessage(playerid, COLOR_GRAD4, "|1 Level |2 SpawnHealth |3 UpgradePoints |4 Model ");
						SendClientMessage(playerid, COLOR_GRAD3, "|5 BankAccount |6 PhoneNumber |7 RespectPoints ");
						SendClientMessage(playerid, COLOR_GRAD2, "|8 HouseKey |9 BizKey |10 DonateRank");
						SendClientMessage(playerid, COLOR_GRAD2, "|12 Det |13 Lawyer |14 Fixer |15 News |16 Jack |17 Drug |18 Sex |19 Box");
						return 1;
					}
					new stat;
					stat = strval(tmp);
					tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
						SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /setstat [playerid/PartOfName] [statcode] [amount]");
						SendClientMessage(playerid, COLOR_GRAD4, "|1 Level |2 SpawnHealth |3 UpgradePoints |4 Model ");
						SendClientMessage(playerid, COLOR_GRAD3, "|5 BankAccount |6 PhoneNumber |7 RespectPoints ");
						SendClientMessage(playerid, COLOR_GRAD2, "|8 HouseKey |9 BizKey |10 DonateRank");
						SendClientMessage(playerid, COLOR_GRAD2, "|12 Det |13 Lawyer |14 Fixer |15 News |16 Jack |17 Drug |18 Sex |19 Box");
						return 1;
					}
					new amount;
					amount = strval(tmp);
					if (PlayerInfo[playerid][pAdmin] >= 4)
					{
						switch (stat)
						{
							case 1:
							{
								PlayerInfo[giveplayerid][pLevel] = amount;
								format(string, sizeof(string), "   The Player Was Set To Level %d", amount);
							}
							case 2:
							{
								PlayerInfo[giveplayerid][pSHealth] = amount;
								format(string, sizeof(string), "   The Player Was Set To %d Spawnhealth ", amount);
							}
							case 3:
							{
								PlayerInfo[giveplayerid][gPupgrade] = amount;
								format(string, sizeof(string), "   The Player Was Set To %d Upgrade Points", amount);
							}
							case 4:
							{
								PlayerInfo[giveplayerid][pModel] = amount;
								format(string, sizeof(string), "   The Player Was Set To Model %d", amount);
							}
							case 5:
							{
								PlayerInfo[giveplayerid][pAccount] = amount;
								format(string, sizeof(string), "   The Player Account Was Set To $%d", amount);
							}
							case 6:
							{
								PlayerInfo[giveplayerid][pPnumber] = amount;
								format(string, sizeof(string), "   The Player Phone Number Was Set To %d", amount);
							}
							case 7:
							{
								PlayerInfo[giveplayerid][pExp] = amount;
								format(string, sizeof(string), "   The Player Respect Points Were Set To %d", amount);
							}
							case 8:
							{
								PlayerInfo[giveplayerid][pPhousekey] = amount;
								format(string, sizeof(string), "   The Player House Key Was Set To %d", amount);
							}
							case 9:
							{
								PlayerInfo[giveplayerid][pPbiskey] = amount;
								format(string, sizeof(string), "   The Player Business Key Was Set To %d", amount);
							}
							case 10:
							{
								PlayerInfo[giveplayerid][pDonateRank] = amount;
								format(string, sizeof(string), "   The Player DonateRank Was Set To %d", amount);
							}
							case 11:
							{
								PlayerInfo[giveplayerid][pFMember] = amount;
								format(string, sizeof(string), "   The Player Family Member Was Set To %d", amount);
							}
							case 12:
							{
								PlayerInfo[giveplayerid][pDetSkill] = amount;
								format(string, sizeof(string), "   The Player Detective Skill Set To %d", amount);
							}
							case 13:
							{
								PlayerInfo[giveplayerid][pLawSkill] = amount;
								format(string, sizeof(string), "   The Player Lawyer Skill Set To %d", amount);
							}
							case 14:
							{
								PlayerInfo[giveplayerid][pMechSkill] = amount;
								format(string, sizeof(string), "   The Player Car Mechanic Skill Set To %d", amount);
							}
							case 15:
							{
								PlayerInfo[giveplayerid][pNewsSkill] = amount;
								format(string, sizeof(string), "   The Player News Reporter Skill Set To %d", amount);
							}
							case 16:
							{
								PlayerInfo[giveplayerid][pJackSkill] = amount;
								format(string, sizeof(string), "   The Player Car Jacker Skill Set To %d", amount);
							}
							case 17:
							{
								PlayerInfo[giveplayerid][pDrugsSkill] = amount;
								format(string, sizeof(string), "   The Player Drug Dealer Skill Set To %d", amount);
							}
							case 18:
							{
								PlayerInfo[giveplayerid][pSexSkill] = amount;
								format(string, sizeof(string), "   The Player Sex Skill Set To %d", amount);
							}
							case 19:
							{
								PlayerInfo[giveplayerid][pBoxSkill] = amount;
								format(string, sizeof(string), "   The Player Box Skill Set To %d", amount);
							}
							case 77:
							{
								PlayerInfo[giveplayerid][pJob] = amount;
								format(string, sizeof(string), "   The Player Job Set To %d", amount);
							}
							case 88:
							{
								PlayerInfo[giveplayerid][pContractTime] = amount;
								format(string, sizeof(string), "   The Player Job Contract Time Set To %d", amount);
							}
							default:
							{
								format(string, sizeof(string), "   Invalid Stat Code", amount);
							}

						}
						SendClientMessage(playerid, COLOR_GRAD1, string);
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
					}
				}//not valid id
			}//not connected
		}
		return 1;
	}
	if(strcmp(cmd, "/setfamily", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4)
			{
			    SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			    return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /setfamily [Family] [code] [amount]");
				SendClientMessage(playerid, COLOR_GRAD4, "|1 Members");
				return 1;
			}
			new family;
			family = strval(tmp);
			if(family < 1 || family > 10) { SendClientMessage(playerid, COLOR_GREY, "   FamilyNr can't be below 1 or above 10 !"); return 1; }
			family -= 1;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /setfamily [Family] [code] [amount]");
				SendClientMessage(playerid, COLOR_GRAD4, "|1 Members");
				return 1;
			}
			new stat;
			stat = strval(tmp);
			if(stat < 1 || stat > 1) { SendClientMessage(playerid, COLOR_GREY, "   Stat Code can't be below 1 or above 1 !"); return 1; }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /setfamily [Family] [code] [amount]");
				SendClientMessage(playerid, COLOR_GRAD4, "|1 Members");
				return 1;
			}
			new amount;
			amount = strval(tmp);
			if(amount < 1 || amount > 10) { SendClientMessage(playerid, COLOR_GREY, "   Amount can't be below 1 or above 10 !"); return 1; }
			switch (stat)
			{
			    case 1:
			    {
					FamilyInfo[family][FamilyMembers] = amount;
					format(string, sizeof(string), "   Family %s set to %d members", FamilyInfo[family][FamilyName], amount);
			    }
			    default:
			    {
			    	format(string, sizeof(string), "   Invalid Stat Code");
			    }
			}
			SendClientMessage(playerid, COLOR_GREY, string);
		}
		return 1;
	}
//----------------------------------[SETINT]-----------------------------------------------
	if(strcmp(cmd, "/setint", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /setint [interiorid]");
				return 1;
			}
			new intid;
			intid = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				SetPlayerInterior(playerid,intid);
				PlayerInfo[playerid][pInt] = intid;
				format(string, sizeof(string), "   interiorid %d.", intid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not authorized to use that command !");
			}
		}
		return 1;
	}
//----------------------------------[SKYDIVE]------------------------------------------------
	if(strcmp(cmd, "/skydive", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 2)
			{
				GetPlayerPos(playerid, rx, ry, rz);
				if (IsPlayerConnected(playerid))
				{
					GivePlayerWeapon(playerid, 46, 0);
					SetPlayerPos(playerid,rx, ry, rz+1500);
					SendClientMessage(playerid, COLOR_WHITE, "GO!! GO!! GO!!");
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
//----------------------------------[FOURDIVE]------------------------------------------------
	if(strcmp(cmd, "/fourdive", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /fourdive [playerid1] [playerid2] [playerid3] [playerid4]");
				return 1;
			}
			new para1;
			new para2;
			new para3;
			new para4;
			para1 = strval(tmp);
			tmp = strtok(cmdtext, idx);
			para2 = strval(tmp);
			tmp = strtok(cmdtext, idx);
			para3 = strval(tmp);
			tmp = strtok(cmdtext, idx);
			para4 = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 1337)
			{
				if (IsPlayerConnected(para1)){ GivePlayerWeapon(para1, 46, 0); SetPlayerPos(para1,1536.0, -1360.0, 1350.0);SetPlayerInterior(para1,0);PlayerInfo[para1][pInt] = 0;SendClientMessage(para1, COLOR_WHITE, "GO!! GO!! GO!!");}
				if ((IsPlayerConnected(para2)) && (para2>0)) { GivePlayerWeapon(para2, 46, 0); SetPlayerPos(para2,1536.0, -1345.0, 1350.0);SetPlayerInterior(para2,0);PlayerInfo[para2][pInt] = 0;SendClientMessage(para2, COLOR_RED, "GO!! GO!! GO!!");}
				if ((IsPlayerConnected(para3)) && (para3>0)) { GivePlayerWeapon(para3, 46, 0); SetPlayerPos(para3,1552.0, -1345.0, 1350.0);SetPlayerInterior(para3,0);PlayerInfo[para3][pInt] = 0;SendClientMessage(para3, COLOR_RED, "GO!! GO!! GO!!");}
				if ((IsPlayerConnected(para4)) && (para4>0)) { GivePlayerWeapon(para4, 46, 0); SetPlayerPos(para4,1552.0, -1360.0, 1350.0);SetPlayerInterior(para4,0);PlayerInfo[para4][pInt] = 0;SendClientMessage(para4, COLOR_RED, "GO!! GO!! GO!!");}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
//----------------------------------[INVITE]------------------------------------------------
	if(strcmp(cmd, "/invite", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /invite [playerid/PartOfName]");
				return 1;
			}
			new para1;
			new ftext[20];
			para1 = ReturnUser(tmp);
			if (PlayerInfo[playerid][pLeader] >= 1)
			{
			    if(IsPlayerConnected(para1))
			    {
			        if(para1 != INVALID_PLAYER_ID)
			        {
					    if (gTeam[para1]==TEAM_GREEN && PlayerInfo[para1][pMember] == 0 && PlayerInfo[para1][pFMember] == 255)
					    {
					        if(PlayerInfo[para1][pJob] > 0)
					        {
					            SendClientMessage(playerid, COLOR_GREY, "   Can't invite him, player has a Job !");
					            return 1;
					        }
					        if(PlayerInfo[playerid][pLeader] == 1) { PlayerInfo[para1][pTeam] = 2; gTeam[para1] = 2; ftext = "Police Force"; ChosenSkin[para1] = 280; SetPlayerSkin(para1, 280); }
					        else if(PlayerInfo[playerid][pLeader] == 2) { PlayerInfo[para1][pTeam] = 2; gTeam[para1] = 2; ftext = "FBI/ATF"; ChosenSkin[para1] = 286; SetPlayerSkin(para1, 286); }
					        else if(PlayerInfo[playerid][pLeader] == 3) { PlayerInfo[para1][pTeam] = 2; gTeam[para1] = 2; ftext = "National Guard"; ChosenSkin[para1] = 287; SetPlayerSkin(para1, 287); }
					        else if(PlayerInfo[playerid][pLeader] == 4) { PlayerInfo[para1][pTeam] = 1; gTeam[para1] = 1; ftext = "Firemen/Ambulance"; ChosenSkin[para1] = 70; SetPlayerSkin(para1, 70); }
					        else if(PlayerInfo[playerid][pLeader] == 5) { PlayerInfo[para1][pTeam] = 5; gTeam[para1] = 5; ftext = "La Cosa Nostra"; ChosenSkin[para1] = 258; SetPlayerSkin(para1, 120); }
					        else if(PlayerInfo[playerid][pLeader] == 6) { PlayerInfo[para1][pTeam] = 5; gTeam[para1] = 5; ftext = "Yakuza"; ChosenSkin[para1] = 120; SetPlayerSkin(para1, 258); }
					        else if(PlayerInfo[playerid][pLeader] == 7) { return 1; }
					        else if(PlayerInfo[playerid][pLeader] == 8) { PlayerInfo[para1][pTeam] = 10; gTeam[para1] = 12; ftext = "Hitman Agency"; ChosenSkin[para1] = 127; SetPlayerSkin(para1, 127); }
					        else if(PlayerInfo[playerid][pLeader] == 9) { PlayerInfo[para1][pTeam] = 12; gTeam[para1] = 12; ftext = "CNN Studio"; ChosenSkin[para1] = 148; SetPlayerSkin(para1, 148); }
					        else if(PlayerInfo[playerid][pLeader] == 10) { PlayerInfo[para1][pTeam] = 12; gTeam[para1] = 12; ftext = "Taxi Cab Company"; ChosenSkin[para1] = 255; SetPlayerSkin(para1, 255); }
					        else if(PlayerInfo[playerid][pLeader] == 11) { PlayerInfo[para1][pTeam] = 12; gTeam[para1] = 12; ftext = "School Instructors"; ChosenSkin[para1] = 59; SetPlayerSkin(para1, 59); }
					        else { return 1; }
							GetPlayerName(para1, giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							PlayerInfo[para1][pMember] = PlayerInfo[playerid][pLeader];
							PlayerInfo[para1][pRank] = 1;
							printf("AdmCmd: %s has invited %s to join %s.", sendername, giveplayer, ftext);
							format(string, sizeof(string), "   You have Joined the %s, you were invited by Leader %s", ftext, sendername);
							SendClientMessage(para1, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "   You have Invited %s to join the %s.", giveplayer,ftext);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							SetPlayerInterior(para1,0);
							new rand = random(sizeof(gInviteSpawns));
							SetPlayerPos(para1, gInviteSpawns[rand][0], gInviteSpawns[rand][1], gInviteSpawns[rand][2]); // Warp the player
							SetPlayerFacingAngle(para1, gInviteSpawns[rand][3]);
							SetPlayerCameraPos(para1,gInviteSpawns[rand][0] + 3, gInviteSpawns[rand][1], gInviteSpawns[rand][2]);
							SetPlayerCameraLookAt(para1,gInviteSpawns[rand][0], gInviteSpawns[rand][1], gInviteSpawns[rand][2]);
							TogglePlayerControllable(para1, 0);
						    SelectChar[para1] = 255;
						    SelectCharID[para1] = PlayerInfo[para1][pMember];
						    SelectCharPlace[para1] = 1;
						    PlayerInfo[para1][pModel] = ChosenSkin[para1];
					    	PlayerInfo[para1][pChar] = ChosenSkin[para1];
						    SendClientMessage(para1, COLOR_LIGHTRED, "* Use 'next' to Select the char you want to use.");
						    SendClientMessage(para1, COLOR_LIGHTRED, "* If you've found the Char you want to use, type 'done'.");
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "  That player is currently Wanted / a Different Team / or already a Family Member.");
						    return 1;
						}
					}
				}//not connected
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command(leaders only)!");
			}
		}
		return 1;
	}
//----------------------------------[UNINVITE]------------------------------------------------
	if(strcmp(cmd, "/uninvite", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /uninvite [playerid/PartOfName]");
				return 1;
			}
			new para1;
			para1 = ReturnUser(tmp);
			if (PlayerInfo[playerid][pLeader] >= 1)
			{
			    if(IsPlayerConnected(para1))
			    {
			        if(para1 != INVALID_PLAYER_ID)
			        {
					    if (PlayerInfo[para1][pMember] > 0)
					    {
							GetPlayerName(para1, giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							printf("AdmCmd: %s has uninvited %s.", sendername, giveplayer);
							format(string, sizeof(string), "* You have been kicked from a Family / Police Force, by Leader %s.", sendername);
							SendClientMessage(para1, COLOR_LIGHTBLUE, string);
							SendClientMessage(para1, COLOR_LIGHTBLUE, "* You are now a Civilian again.");
			                gTeam[para1] = 3;
							PlayerInfo[para1][pTeam] = 3;
							PlayerInfo[para1][pMember] = 0;
							PlayerInfo[para1][pRank] = 0;
							PlayerInfo[para1][pChar] = 0;
							new rand = random(sizeof(CIV));
							SetSpawnInfo(para1, gTeam[para1], CIV[rand],0.0,0.0,0.0,0,0,0,0,0,0,0);
							PlayerInfo[para1][pModel] = CIV[rand];
							MedicBill[para1] = 0;
							SpawnPlayer(para1);
							format(string, sizeof(string), "   You have kicked %s from his Family / Police Force.", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						}
					}
				}//not connected
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command(Leaders only)!");
			}
		}
		return 1;
	}
//----------------------------------[MAKEADMIN]------------------------------------------------
	if(strcmp(cmd, "/makeadmin", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /makeadmin [playerid/PartOfName] [level(1-3)]");
				return 1;
			}
			new para1;
			new level;
			para1 = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			level = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 1337)
			{
			    if(IsPlayerConnected(para1))
			    {
			        if(para1 != INVALID_PLAYER_ID)
			        {
						GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						PlayerInfo[para1][pAdmin] = level;
						printf("AdmCmd: %s has promoted %s to a level %d admin.", sendername, giveplayer, level);
						format(string, sizeof(string), "   You have been promoted to a level %d admin by %s", level, sendername);
						SendClientMessage(para1, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "   You have promoted %s to a level %d admin.", giveplayer,level);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
//----------------------------------[MAKEIRCADMIN]----------------------------------------------
    if(strcmp(cmd, "/makeircadmin", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /makeircadmin [playerid/PartOfName] [ChannelNr]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /makeircadmin [playerid/PartOfName] [ChannelNr]");
				return 1;
			}
			new channel = strval(tmp);
			if(channel > 10 || channel < 0) { SendClientMessage(playerid, COLOR_GREY, "   Dont go below number 0, or above number 10!"); return 1; }
			if (PlayerInfo[playerid][pAdmin] >= 1337)
			{
			    if(IsPlayerConnected(giveplayerid))
			    {
			        if(giveplayerid != INVALID_PLAYER_ID)
			        {
						GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "* You've made %s an IRC Admin over Channel %d.", giveplayer, channel);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* %s has made you an IRC Admin over Channel %d.", sendername, channel);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "%s", giveplayer);
						switch(channel)
						{
						    case 1:
						    {
						        strmid(IRCInfo[0][iAdmin], string, 0, strlen(string), 255);
						        IRCInfo[0][iNeedPass] = 0; IRCInfo[0][iLock] = 0;
						    }
						    case 2:
						    {
						        strmid(IRCInfo[1][iAdmin], string, 0, strlen(string), 255);
						        IRCInfo[1][iNeedPass] = 0; IRCInfo[1][iLock] = 0;
						    }
						    case 3:
						    {
						        strmid(IRCInfo[2][iAdmin], string, 0, strlen(string), 255);
						        IRCInfo[2][iNeedPass] = 0; IRCInfo[2][iLock] = 0;
						    }
						    case 4:
						    {
						        strmid(IRCInfo[3][iAdmin], string, 0, strlen(string), 255);
						        IRCInfo[3][iNeedPass] = 0; IRCInfo[3][iLock] = 0;
						    }
						    case 5:
						    {
						        strmid(IRCInfo[4][iAdmin], string, 0, strlen(string), 255);
						        IRCInfo[4][iNeedPass] = 0; IRCInfo[4][iLock] = 0;
						    }
						    case 6:
						    {
						        strmid(IRCInfo[5][iAdmin], string, 0, strlen(string), 255);
						        IRCInfo[5][iNeedPass] = 0; IRCInfo[5][iLock] = 0;
						    }
						    case 7:
						    {
						        strmid(IRCInfo[6][iAdmin], string, 0, strlen(string), 255);
						        IRCInfo[6][iNeedPass] = 0; IRCInfo[6][iLock] = 0;
						    }
						    case 8:
						    {
						        strmid(IRCInfo[7][iAdmin], string, 0, strlen(string), 255);
						        IRCInfo[7][iNeedPass] = 0; IRCInfo[7][iLock] = 0;
						    }
						    case 9:
						    {
						        strmid(IRCInfo[8][iAdmin], string, 0, strlen(string), 255);
						        IRCInfo[8][iNeedPass] = 0; IRCInfo[8][iLock] = 0;
						    }
						    case 10:
						    {
						        strmid(IRCInfo[9][iAdmin], string, 0, strlen(string), 255);
						        IRCInfo[9][iNeedPass] = 0; IRCInfo[9][iLock] = 0;
						    }
						}
						SaveIRC();
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   you are not authorized to do that !");
			    return 1;
			}
		}
		return 1;
	}
//----------------------------------[MAKELEADER]------------------------------------------------
	if(strcmp(cmd, "/makeleader", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /makeleader [playerid/PartOfName] [Number(1-10)]");
				return 1;
			}
			new para1;
			new level;
			para1 = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			level = strval(tmp);
			if(level > 11 || level < 0) { SendClientMessage(playerid, COLOR_GREY, "   Dont go below number 0, or above number 11!"); return 1; }
			if (PlayerInfo[playerid][pAdmin] >= 1337)
			{
			    if(IsPlayerConnected(para1))
			    {
			        if(para1 != INVALID_PLAYER_ID)
			        {
			            if(PlayerInfo[para1][pMember] > 0 || PlayerInfo[para1][pFMember] < 255)
			            {
			                SendClientMessage(playerid, COLOR_GREY, "   That player is in a Faction / Family !");
			                return 1;
			            }
						GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						PlayerInfo[para1][pLeader] = level;
						format(string, sizeof(string), "   You have been promoted to Leader to your requested Faction by Admin %s", sendername);
						SendClientMessage(para1, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "   You have given %s control to run Faction Number %d.", giveplayer,level);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						if(level == 0) { PlayerInfo[para1][pChar] = 0; }
						else if(level == 1) { PlayerInfo[para1][pChar] = 288; } //Police Force
						else if(level == 2) { PlayerInfo[para1][pChar] = 286; } //FBI/ATF
						else if(level == 3) { PlayerInfo[para1][pChar] = 287; } //National Guard
						else if(level == 4) { PlayerInfo[para1][pChar] = 228; } //Fire/Ambulance
						else if(level == 5) { PlayerInfo[para1][pChar] = 113; } //La Cosa Nostra
						else if(level == 6) { PlayerInfo[para1][pChar] = 120; } //Yakuza
						else if(level == 7) { PlayerInfo[para1][pChar] = 147; } //Mayor
						else if(level == 8) { PlayerInfo[para1][pChar] = 294; } //Hitmans
						else if(level == 9) { PlayerInfo[para1][pChar] = 227; } //News Reporters
						else if(level == 10) { PlayerInfo[para1][pChar] = 61; } //Taxi Cab Company
						else if(level == 11) { PlayerInfo[para1][pChar] = 171; } //Driving/Flying School
					    gTeam[para1] = 11;
					    PlayerInfo[para1][pTeam] = 11;
					    SetPlayerSkin(para1, PlayerInfo[para1][pChar]);
					}
				}//not connected
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/forceskin", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /forceskin [playerid/PartOfName]");
				return 1;
			}
			new para1;
			para1 = ReturnUser(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 4)
			{
			    if(IsPlayerConnected(para1))
			    {
			        if(para1 != INVALID_PLAYER_ID)
			        {
				        if(PlayerInfo[para1][pMember] < 1)
				        {
				            SendClientMessage(playerid, COLOR_GREY, "   That player is not in a Family / Force !");
				            return 1;
				        }
						GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "* You are forced to Change your Skin by Admin %s.", sendername);
						SendClientMessage(para1, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* You have forced %s To change his Skin.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						if(PlayerInfo[para1][pMember] == 1) { PlayerInfo[para1][pTeam] = 5; ChosenSkin[para1] = 59; }
				        else if(PlayerInfo[para1][pMember] == 2) { PlayerInfo[para1][pTeam] = 6; ChosenSkin[para1] = 121; }
				        else if(PlayerInfo[para1][pMember] == 3) { PlayerInfo[para1][pTeam] = 7; ChosenSkin[para1] = 98; }
				        else if(PlayerInfo[para1][pMember] == 4) { PlayerInfo[para1][pTeam] = 8; ChosenSkin[para1] = 46; }
				        else if(PlayerInfo[para1][pMember] == 5) { PlayerInfo[para1][pTeam] = 9; ChosenSkin[para1] = 174; }
				        else if(PlayerInfo[para1][pMember] == 6) { PlayerInfo[para1][pTeam] = 2; ChosenSkin[para1] = 280; }
				        else if(PlayerInfo[para1][pMember] == 7) { PlayerInfo[para1][pTeam] = 2; ChosenSkin[para1] = 164; }
				        else if(PlayerInfo[para1][pMember] == 8) { PlayerInfo[para1][pTeam] = 10; ChosenSkin[para1] = 186; }
				        else { return 1; }
                        SetPlayerInterior(para1,0);
						new rand = random(sizeof(gInviteSpawns));
						SetPlayerPos(para1, gInviteSpawns[rand][0], gInviteSpawns[rand][1], gInviteSpawns[rand][2]); // Warp the player
						SetPlayerFacingAngle(para1, gInviteSpawns[rand][3]);
						SetPlayerCameraPos(para1,gInviteSpawns[rand][0] + 3, gInviteSpawns[rand][1], gInviteSpawns[rand][2]);
						SetPlayerCameraLookAt(para1,gInviteSpawns[rand][0], gInviteSpawns[rand][1], gInviteSpawns[rand][2]);
						TogglePlayerControllable(para1, 0);
					    SelectChar[para1] = 255;
					    SelectCharID[para1] = PlayerInfo[para1][pMember];
					    SelectCharPlace[para1] = 1;
					    PlayerInfo[para1][pModel] = ChosenSkin[para1];
				    	PlayerInfo[para1][pChar] = ChosenSkin[para1];
					    SendClientMessage(para1, COLOR_LIGHTRED, "* Use 'next' to Select the char you want to use.");
					    SendClientMessage(para1, COLOR_LIGHTRED, "* If you've found the Char you want to use, type 'done'.");
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
//----------------------------------[GIVERANK]------------------------------------------------
	if(strcmp(cmd, "/giverank", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /giverank [playerid/PartOfName] [Number(1-6)]");
				return 1;
			}
			new para1;
			new level;
			para1 = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			level = strval(tmp);
			if(level > 6 || level < 0) { SendClientMessage(playerid, COLOR_GREY, "   Dont go below number 0, or above number 6!"); return 1; }
			if (PlayerInfo[playerid][pLeader] >= 1)
			{
			    if(IsPlayerConnected(para1))
			    {
			        if(para1 != INVALID_PLAYER_ID)
			        {
						GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						PlayerInfo[para1][pRank] = level;
						format(string, sizeof(string), "   You have been promoted to a higher Rank by Leader %s", sendername);
						SendClientMessage(para1, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "   You have given %s Rank %d.", giveplayer,level);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command(Leaders Only)!");
			}
		}
		return 1;
	}
//----------------------------------[setteam]------------------------------------------------
	if(strcmp(cmd, "/setteam", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /setteam [playerid/PartOfName] [team 1(civ) - 2(cop)]");
				return 1;
			}
			new para1;
			new level;
			para1 = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			level = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 2)
			{
			    if(IsPlayerConnected(para1))
			    {
			        if(para1 != INVALID_PLAYER_ID)
			        {
						GetPlayerName(para1, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						PlayerInfo[para1][pTeam] = level;
						gTeam[para1] = level;
						SetPlayerWeapons(para1);
						SetPlayerSpawn(para1);
						ClearCrime(para1);
						printf("AdmCmd: %s has switched %s to team %d.", sendername, giveplayer, level);
						format(string, sizeof(string), "   You have been switched to team %d by %s", level, sendername);
						SendClientMessage(para1, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "   You have switched %s to team %d.", giveplayer,level);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
//----------------------------------[GOTO]-----------------------------------------------
	if(strcmp(cmd, "/gotols", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(PlayerInfo[playerid][pAdmin] >= 3)
			{
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, 1529.6,-1691.2,13.3);
					TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
				}
				else
				{
					SetPlayerPos(playerid, 1529.6,-1691.2,13.3);
				}
				SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported !");
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not authorized to use that command !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/gotolv", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 3)
			{
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, 1699.2, 1435.1, 10.7);
					TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
				}
				else
				{
					SetPlayerPos(playerid, 1699.2,1435.1, 10.7);
				}
				SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/gotosf", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 3)
			{
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, -1417.0,-295.8,14.1);
					TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
				}
				else
				{
					SetPlayerPos(playerid, -1417.0,-295.8,14.1);
				}
				SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
				SetPlayerInterior(playerid,0);
				PlayerInfo[playerid][pInt] = 0;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/entercar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /entercar [carid]");
				return 1;
			}
			new testcar = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 3)
			{
				PutPlayerInVehicle(playerid, testcar, 1);
				SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/gotocar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /gotocar [carid]");
				return 1;
			}
			new testcar = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 3)
			{
				new Float:cwx2,Float:cwy2,Float:cwz2;
				GetVehiclePos(testcar, cwx2, cwy2, cwz2);
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, cwx2, cwy2, cwz2);
					TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
				}
				else
				{
					SetPlayerPos(playerid, cwx2, cwy2, cwz2);
				}
				SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
				SetPlayerInterior(playerid,0);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/mark", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 3)
			{
				GetPlayerPos(playerid, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
				SendClientMessage(playerid, COLOR_GRAD1, "   teleporter destination set");
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/gotomark", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 3)
			{
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
					TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
				}
				else
				{
					SetPlayerPos(playerid, TeleportDest[playerid][0],TeleportDest[playerid][1],TeleportDest[playerid][2]);
				}
				SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
				SetPlayerInterior(playerid,0);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/gotoin", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 3)
			{
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, 1416.107000,0.268620,1000.926000);
				}
				else
				{
					SetPlayerPos(playerid, 1416.107000,0.268620,1000.926000);
				}
				SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
				SetPlayerInterior(playerid,1);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/gotostad", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 3)
			{
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, -1435.75, -652.664, 1054.94);
				}
				else
				{
					SetPlayerPos(playerid, -1435.75, -652.664, 1054.94);
				}
				SetPlayerInterior(playerid,4);
				SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/gotojet", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 3)
			{
				if (GetPlayerState(playerid) == 2)
				{
					new tmpcar = GetPlayerVehicleID(playerid);
					SetVehiclePos(tmpcar, 1.71875, 30.4062, 1200.34);
				}
				else
				{
					SetPlayerPos(playerid, 1.71875, 30.4062, 1200.34);
				}
				SetPlayerInterior(playerid,1);
				SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/goto", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /goto [playerid/PartOfName]");
				return 1;
			}
			new Float:plocx,Float:plocy,Float:plocz;
			new plo;
			plo = ReturnUser(tmp);
			if (IsPlayerConnected(plo))
			{
			    if(plo != INVALID_PLAYER_ID)
			    {
					if (PlayerInfo[playerid][pAdmin] >= 1)
					{
						if(Spectate[playerid] != 255)
						{
							Spectate[playerid] = 256;
						}
						GetPlayerPos(plo, plocx, plocy, plocz);
						if(PlayerInfo[plo][pInt] > 0)
						{
							SetPlayerInterior(playerid,PlayerInfo[plo][pInt]);
							PlayerInfo[playerid][pInt] = PlayerInfo[plo][pInt];
							PlayerInfo[playerid][pLocal] = PlayerInfo[plo][pLocal];
						}
						if(PlayerInfo[playerid][pInt] == 0)
						{
							SetPlayerInterior(playerid,0);
						}
						if(plocz > 530.0 && PlayerInfo[plo][pInt] == 0) //the highest land point in sa = 526.8
						{
							SetPlayerInterior(playerid,1);
							PlayerInfo[playerid][pInt] = 1;
						}
						if (GetPlayerState(playerid) == 2)
						{
							new tmpcar = GetPlayerVehicleID(playerid);
							SetVehiclePos(tmpcar, plocx, plocy+4, plocz);
							TelePos[playerid][0] = 0.0;TelePos[playerid][1] = 0.0;
						}
						else
						{
							SetPlayerPos(playerid,plocx,plocy+2, plocz);
						}
						SendClientMessage(playerid, COLOR_GRAD1, "   You have been teleported");
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
					}
				}
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", plo);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		}
		return 1;
	}
//----------------------------------[GETHERE]-----------------------------------------------
	if(strcmp(cmd, "/gethere", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /gethere [playerid/PartOfName]");
				return 1;
			}
			new Float:plocx,Float:plocy,Float:plocz;
			new plo;
			plo = ReturnUser(tmp);
			if (IsPlayerConnected(plo))
			{
			    if(plo != INVALID_PLAYER_ID)
			    {
					if (PlayerInfo[plo][pAdmin] > 1337)
					{
						SendClientMessage(playerid, COLOR_GRAD1, "Ask the admin to goto you.");
						return 1;
					}
					if (PlayerInfo[playerid][pAdmin] >= 3)
					{
						GetPlayerPos(playerid, plocx, plocy, plocz);
						if(PlayerInfo[playerid][pInt] > 0)
						{
							SetPlayerInterior(plo,PlayerInfo[playerid][pInt]);
							PlayerInfo[plo][pInt] = PlayerInfo[playerid][pInt];
							PlayerInfo[plo][pLocal] = PlayerInfo[playerid][pLocal];
						}
						if(PlayerInfo[playerid][pInt] == 0)
						{
							SetPlayerInterior(plo,0);
						}
						if(plocz > 930.0 && PlayerInfo[playerid][pInt] == 0) //the highest land point in sa = 526.8
						{
							SetPlayerInterior(plo,1);
							PlayerInfo[plo][pInt] = 1;
						}
						if (GetPlayerState(plo) == 2)
						{
							TelePos[plo][0] = 0.0;
							TelePos[plo][1] = 0.0;
							new tmpcar = GetPlayerVehicleID(plo);
							SetVehiclePos(tmpcar, plocx, plocy+4, plocz);
						}
						else
						{
							SetPlayerPos(plo,plocx,plocy+2, plocz);
						}
						SendClientMessage(plo, COLOR_GRAD1, "   You have been teleported");
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
					}
				}
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", plo);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/getcar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /getcar [carid]");
				return 1;
			}
			new Float:plocx,Float:plocy,Float:plocz;
			new plo;
			plo = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 3)
			{
				GetPlayerPos(playerid, plocx, plocy, plocz);
				SetVehiclePos(plo,plocx,plocy+4, plocz);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/oldcar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    format(string, sizeof(string), "Your old car was: %d",gLastCar[playerid]);
		    SendClientMessage(playerid, COLOR_GREY, string);
	    }
	    return 1;
	}
	if(strcmp(cmd, "/fuelcars", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] >= 4)
	        {
	            for(new c=0;c<CAR_AMOUNT;c++)
				{
					Gas[c] = GasMax;
				}
				SendClientMessage(playerid, COLOR_GREY, "   All cars filled with Fuel ! ");
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not an Admin ! ");
	            return 1;
	        }
	    }
	    return 1;
	}
//----------------------------------[GiveGun]------------------------------------------------
	if(strcmp(cmd, "/givegun", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /givegun [playerid/PartOfName] [weaponid(eg. 46 = Parachute)] [ammo]");
				return 1;
			}
			new playa;
			new gun;
			new ammo;
			playa = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			gun = strval(tmp);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /givegun [playerid/PartOfName] [weaponid] [ammo]");
				SendClientMessage(playerid, COLOR_GRAD4, "3(Club) 4(knife) 5(bat) 6(Shovel) 7(Cue) 8(Katana) 10-13(Dildo) 14(Flowers) 16(Grenades) 18(Molotovs) 22(Pistol) 23(SPistol)");
				SendClientMessage(playerid, COLOR_GRAD3, "24(Eagle) 25(shotgun) 29(MP5) 30(AK47) 31(M4) 33(Rifle) 34(Sniper) 37(Flamethrower) 41(spray) 42(exting) 43(Camera) 46(Parachute)");
				return 1;
			}
			if(gun < 1||gun > 46||gun==27||gun==1||gun==2||gun==9||gun==17||gun==19||gun==20||gun==21||gun==36||gun==38||gun==39||gun==40||gun==44||gun==45)
			{ SendClientMessage(playerid, COLOR_GRAD1, "   wrong WeaponID!"); return 1; }
			tmp = strtok(cmdtext, idx);
			ammo = strval(tmp);
			if(ammo <1||ammo > 999)
			{ SendClientMessage(playerid, COLOR_GRAD1, "   dont go below 1 or above 999 bullets!"); return 1; }
			if (PlayerInfo[playerid][pAdmin] >= 4)
			{
			    if(IsPlayerConnected(playa))
			    {
			        if(playa != INVALID_PLAYER_ID)
			        {
						GivePlayerWeapon(playa, gun, ammo);
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
//----------------------------------[sethp]------------------------------------------------
	if(strcmp(cmd, "/sethp", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /sethp [playerid/PartOfName] [health]");
				return 1;
			}
			new playa;
			new health;
			playa = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			health = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 4)
			{
			    if(IsPlayerConnected(playa))
			    {
			        if(playa != INVALID_PLAYER_ID)
			        {
						SetPlayerHealth(playa, health);
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/setarmor", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /setarmor [playerid/PartOfName] [armor]");
				return 1;
			}
			new playa;
			new health;
			playa = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			health = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 4)
			{
			    if(IsPlayerConnected(playa))
			    {
			        if(playa != INVALID_PLAYER_ID)
			        {
						SetPlayerArmour(playa, health);
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/veh", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if (PlayerInfo[playerid][pAdmin] < 4)
			{
			    SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			    return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /veh [carid] [color1] [color2]");
				return 1;
			}
			new car;
			car = strval(tmp);
			if(car < 400 || car > 611) { SendClientMessage(playerid, COLOR_GREY, "   Vehicle Number can't be below 400 or above 611 !"); return 1; }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /veh [carid] [color1] [color2]");
				return 1;
			}
			new color1;
			color1 = strval(tmp);
			if(color1 < 0 || color1 > 126) { SendClientMessage(playerid, COLOR_GREY, "   Color Number can't be below 0 or above 126 !"); return 1; }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /veh [carid] [color1] [color2]");
				return 1;
			}
			new color2;
			color2 = strval(tmp);
			if(color2 < 0 || color2 > 126) { SendClientMessage(playerid, COLOR_GREY, "   Color Number can't be below 0 or above 126 !"); return 1; }
			new Float:X,Float:Y,Float:Z;
			GetPlayerPos(playerid, X,Y,Z);
			new carid = CreateVehicle(car, X,Y,Z, 0.0, color1, color2, 60000);
			CreatedCars[CreatedCar] = carid;
			CreatedCar ++;
			format(string, sizeof(string), "   Vehicle %d spawned.", carid);
			SendClientMessage(playerid, COLOR_GREY, string);
		}
		return 1;
	}
	if(strcmp(cmd, "/fixveh", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4)
			{
			    SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			    return 1;
			}
			if(IsPlayerInAnyVehicle(playerid))
			{
			    SetVehicleHealth(GetPlayerVehicleID(playerid), 1000.0);
			    SendClientMessage(playerid, COLOR_GREY, "   Vehicle Fixed !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/destroycars", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4)
			{
			    SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			    return 1;
			}
			for(new i = 0; i < sizeof(CreatedCars); i++)
			{
				if(i != 0)
				{
			    	DestroyVehicle(i);
				}
			}
			SendClientMessage(playerid, COLOR_GREY, "   Created Vehicles destroyed !");
		}
		return 1;
	}
	if(strcmp(cmd, "/weather", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] < 1337)
			{
			    SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			    return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /weather [weatherid]");
			    return 1;
			}
			new weather;
			weather = strval(tmp);
			if(weather < 0||weather > 45) { SendClientMessage(playerid, COLOR_GREY, "   Weather ID can't be below 0 or above 45 !"); return 1; }
			SetPlayerWeather(playerid, weather);
			SendClientMessage(playerid, COLOR_GREY, "   Weather Set !");
		}
		return 1;
	}
	if(strcmp(cmd, "/weatherall", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] < 1337)
			{
			    SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			    return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /weatherall [weatherid]");
			    return 1;
			}
			new weather;
			weather = strval(tmp);
			if(weather < 0||weather > 45) { SendClientMessage(playerid, COLOR_GREY, "   Weather ID can't be below 0 or above 45 !"); return 1; }
			SetWeather(weather);
			SendClientMessage(playerid, COLOR_GREY, "   Weather Set to everyone !");
		}
		return 1;
	}
//----------------------------------[Money]------------------------------------------------
	if(strcmp(cmd, "/money", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /money [playerid/PartOfName] [money]");
				return 1;
			}
			new playa;
			new money;
			playa = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			money = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 4)
			{
			    if(IsPlayerConnected(playa))
			    {
			        if(playa != INVALID_PLAYER_ID)
			        {
						ResetPlayerMoney(playa);
						ConsumingMoney[playa] = 1;
						GivePlayerMoney(playa, money);
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
//----------------------------------[GiveMoney]------------------------------------------------
	if(strcmp(cmd, "/givemoney", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /givemoney [playerid/PartOfName] [money]");
				return 1;
			}
			new playa;
			new money;
			playa = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			money = strval(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 4)
			{
			    if(IsPlayerConnected(playa))
			    {
			        if(playa != INVALID_PLAYER_ID)
			        {
			            ConsumingMoney[playa] = 1;
						GivePlayerMoney(playa, money);
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
//-----------------------------------[Slap]-----------------------------------------------
	if(strcmp(cmd, "/slap", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /slap [playerid/PartOfName]");
				return 1;
			}
			new playa;
			new Float:shealth;
			new Float:slx, Float:sly, Float:slz;
			playa = ReturnUser(tmp);
			if (PlayerInfo[playerid][pAdmin] >=1)
			{
			    if(IsPlayerConnected(playa))
			    {
			        if(playa != INVALID_PLAYER_ID)
			        {
				        GetPlayerName(playa, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						GetPlayerHealth(playa, shealth);
						SetPlayerHealth(playa, shealth-5);
						GetPlayerPos(playa, slx, sly, slz);
						SetPlayerPos(playa, slx, sly, slz+5);
						PlayerPlaySound(playa, 1130, slx, sly, slz+5);
						printf("AdmCmd: %s slapped %s",sendername,  giveplayer);
						format(string, sizeof(string), "AdmCmd: %s was slapped by %s",giveplayer ,sendername);
						ABroadCast(COLOR_LIGHTRED,string,1);
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/mute", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /mute [playerid/PartOfName]");
				return 1;
			}
			new playa;
			playa = ReturnUser(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
			    if(IsPlayerConnected(playa))
			    {
			        if(playa != INVALID_PLAYER_ID)
			        {
					    GetPlayerName(playa, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						if(PlayerInfo[playa][pMuted] == 0)
						{
							PlayerInfo[playa][pMuted] = 1;
							printf("AdmCmd: %s silenced %s",sendername,  giveplayer);
							format(string, sizeof(string), "AdmCmd: %s was silenced by %s",giveplayer ,sendername);
							ABroadCast(COLOR_LIGHTRED,string,1);
						}
						else
						{
							PlayerInfo[playa][pMuted] = 0;
							printf("AdmCmd: %s unsilenced %s",sendername,  giveplayer);
							format(string, sizeof(string), "AdmCmd: %s was unsilenced by %s",giveplayer ,sendername);
							ABroadCast(COLOR_LIGHTRED,string,1);
						}
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}

//----------------------------------[Kick]------------------------------------------------
    if(strcmp(cmd, "/kick", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	    	tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /kick [playerid/PartOfName] [reason]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						new length = strlen(cmdtext);
						while ((idx < length) && (cmdtext[idx] <= ' '))
						{
							idx++;
						}
						new offset = idx;
						new result[64];
						while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
						{
							result[idx - offset] = cmdtext[idx];
							idx++;
						}
						result[idx - offset] = EOS;
						if(!strlen(result))
						{
							SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /kick [playerid/PartOfName] [reason]");
							return 1;
						}
						new year, month,day;
						getdate(year, month, day);
						format(string, sizeof(string), "AdmCmd: %s was kicked by %s, reason: %s (%d-%d-%d)", giveplayer, sendername, (result),month,day,year);
						KickLog(string);
						Kick(giveplayerid);
						format(string, sizeof(string), "AdmCmd: %s was kicked by %s, reason: %s", giveplayer, sendername, (result));
						SendClientMessageToAll(COLOR_LIGHTRED, string);
						return 1;
					}
				}
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/skick", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	    	tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /skick [playerid/PartOfName]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        Kick(giveplayerid);
				    }
				}
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/kickres", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if (PlayerInfo[playerid][pAdmin] < 1)
			{
				return 1;
			}
	    	tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /kickres [level] [ammount]");
				return 1;
			}
			new level = strval(tmp);
			if(level < 0 || level > 5) { SendClientMessage(playerid, COLOR_GREY, "   Can only Reserved Slots Kick from level 0 to 5 !"); return 1; }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /kickres [level] [ammount]");
				return 1;
			}
			new ammount = strval(tmp);
			if(ammount < 1 || ammount > 10) { SendClientMessage(playerid, COLOR_GREY, "   Can only Reserved Slots Kick of a maximum of 10 players !"); return 1; }
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
			    if(IsPlayerConnected(i))
			    {
			        if(PlayerInfo[i][pLevel] == level && PlayerInfo[i][pAdmin] < 1 && PlayerInfo[i][pDonateRank] < 1 && ammount > 0)
			        {
			            ammount -= 1;
						Kick(i);
			        }
			    }
			}
 		}
		return 1;
	}
	if(strcmp(cmd, "/warn", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	    	tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /warn [playerid/PartOfName] [reason]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
			    if(IsPlayerConnected(giveplayerid))
			    {
			        if(giveplayerid != INVALID_PLAYER_ID)
			        {
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						new length = strlen(cmdtext);
						while ((idx < length) && (cmdtext[idx] <= ' '))
						{
							idx++;
						}
						new offset = idx;
						new result[64];
						while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
						{
							result[idx - offset] = cmdtext[idx];
							idx++;
						}
						result[idx - offset] = EOS;
						if(!strlen(result))
						{
							SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /warn [playerid/PartOfName] [reason]");
							return 1;
						}
						PlayerInfo[giveplayerid][pWarns] += 1;
						if(PlayerInfo[giveplayerid][pWarns] >= 3)
						{
						    new year, month,day;
							getdate(year, month, day);
							format(string, sizeof(string), "AdmCmd: %s was banned by %s, reason: %s (%d-%d-%d)", giveplayer, sendername, (result),month,day,year);
							BanLog(string);
							format(string, sizeof(string), "AdmCmd: %s was banned by %s (had 3 Warnings), reason: %s", giveplayer, sendername, (result));
							SendClientMessageToAll(COLOR_LIGHTRED, string);
							PlayerInfo[giveplayerid][pAdmin] = PlayerInfo[giveplayerid][pLevel];
							PlayerInfo[giveplayerid][pLevel] = -999;
							Ban(giveplayerid);
							return 1;
						}
						format(string, sizeof(string), "You warned %s, reason: %s", giveplayer, (result));
						SendClientMessage(playerid, COLOR_LIGHTRED, string);
						format(string, sizeof(string), "You were warned by %s, reason: %s", sendername, (result));
						SendClientMessage(giveplayerid, COLOR_LIGHTRED, string);
						return 1;
					}
				}//not connected
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/sban", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	    	tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /sban [playerid/PartOfName] [reason]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
			    if(IsPlayerConnected(giveplayerid))
			    {
			        if(giveplayerid != INVALID_PLAYER_ID)
			        {
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						new length = strlen(cmdtext);
						while ((idx < length) && (cmdtext[idx] <= ' '))
						{
							idx++;
						}
						new offset = idx;
						new result[64];
						while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
						{
							result[idx - offset] = cmdtext[idx];
							idx++;
						}
						result[idx - offset] = EOS;
						if(!strlen(result))
						{
							SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /sban [playerid/PartOfName] [reason]");
							return 1;
						}
						new year, month,day;
						getdate(year, month, day);
						format(string, sizeof(string), "AdmCmd: %s was banned by %s, reason: %s (%d-%d-%d)", giveplayer, sendername, (result),month,day,year);
						BanLog(string);
						PlayerInfo[giveplayerid][pAdmin] = PlayerInfo[giveplayerid][pLevel];
						PlayerInfo[giveplayerid][pLevel] = -999;
						Ban(giveplayerid);
						return 1;
					}
				}//not connected
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/ban", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	    	tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /ban [playerid/PartOfName] [reason]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
			    if(IsPlayerConnected(giveplayerid))
			    {
			        if(giveplayerid != INVALID_PLAYER_ID)
			        {
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						new length = strlen(cmdtext);
						while ((idx < length) && (cmdtext[idx] <= ' '))
						{
							idx++;
						}
						new offset = idx;
						new result[64];
						while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
						{
							result[idx - offset] = cmdtext[idx];
							idx++;
						}
						result[idx - offset] = EOS;
						if(!strlen(result))
						{
							SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /ban [playerid/PartOfName] [reason]");
							return 1;
						}
						new year, month,day;
						getdate(year, month, day);
						format(string, sizeof(string), "AdmCmd: %s was banned by %s, reason: %s (%d-%d-%d)", giveplayer, sendername, (result),month,day,year);
						BanLog(string);
						format(string, sizeof(string), "AdmCmd: %s was banned by %s, reason: %s", giveplayer, sendername, (result));
						SendClientMessageToAll(COLOR_LIGHTRED, string);
						PlayerInfo[giveplayerid][pAdmin] = PlayerInfo[giveplayerid][pLevel];
						PlayerInfo[giveplayerid][pLevel] = -999;
						Ban(giveplayerid);
						return 1;
					}
				}//not connected
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		}
		return 1;
	}
//----------------------------------[Freeze]------------------------------------------------
	if(strcmp(cmd, "/freeze", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /freeze [playerid/PartOfName]");
				return 1;
			}
			new playa;
			playa = ReturnUser(tmp);
			if(PlayerInfo[playa][pAdmin] > 0)
			{
				SendClientMessage(playerid, COLOR_GRAD2, "Admins can not be frozen");
				return 1;
			}
			if (PlayerInfo[playerid][pAdmin] >= 2)
			{
			    if(IsPlayerConnected(playa))
			    {
			        if(playa != INVALID_PLAYER_ID)
			        {
				        GetPlayerName(playa, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						TogglePlayerControllable(playa, 0);
						format(string, sizeof(string), "AdmCmd: %s Freezes %s",sendername,  giveplayer);
						printf("%s",string);
						format(string, sizeof(string), "AdmCmd: %s was Frozen by %s",giveplayer ,sendername);
						ABroadCast(COLOR_LIGHTRED,string,1);
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}

//----------------------------------[unfreeze]------------------------------------------------
	if(strcmp(cmd, "/unfreeze", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /unfreeze [playerid]");
				return 1;
			}
			new playa;
			playa = ReturnUser(tmp);
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
			    if(IsPlayerConnected(playa))
			    {
			        if(playa != INVALID_PLAYER_ID)
			        {
			    	    GetPlayerName(playa, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						TogglePlayerControllable(playa, 1);
						format(string, sizeof(string), "AdmCmd: %s UnFroze %s",sendername,  giveplayer);
						printf("%s",string);
						format(string, sizeof(string), "AdmCmd: %s was UnFrozen by %s",giveplayer ,sendername);
						ABroadCast(COLOR_LIGHTRED,string,1);
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
//----------------------------------[EndRound]-----------------------------------------------

	if(strcmp(cmd, "/endround", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	  		if (PlayerInfo[playerid][pAdmin] >= 3)
			{
				GameModeInitExitFunc();
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command !");
			}
		}
		return 1;
	}
//----------------------------------[EndRound]-----------------------------------------------

//----------------------------------[GMX]-----------------------------------------------

	if(strcmp(cmd, "/gmx", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1337)
			{
				GameModeExit();
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   You are not authorized to use that command !");
			}
		}
		return 1;
	}
	if (strcmp(cmd, "/cam", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /cam [1/2/3/4]");
				return 1;
			}
			Unspec[playerid][sCam] = strval(tmp);
			format(string, sizeof(string), "Switching to cam %d",Unspec[playerid][sCam]);
			SendClientMessage(playerid, COLOR_GRAD1, string);
		}
		return 1;
	}
	if (strcmp(cmd, "/admins", true) == 0)
	{
        if(IsPlayerConnected(playerid))
	    {
			SendClientMessage(playerid, COLOR_GRAD1, "Admins Online:");
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
				    if(PlayerInfo[i][pAdmin] >= 1 && PlayerInfo[i][pAdmin] < 1338)
				    {
						GetPlayerName(i, sendername, sizeof(sendername));
						format(string, 256, "Admin: %s", sendername);
						SendClientMessage(playerid, COLOR_GRAD2, string);
					}
				}
			}
		}
		return 1;
	}
//----------------------------------[HELP]-----------------------------------------------
	if(strcmp(cmd, "/help", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    SendClientMessage(playerid, COLOR_GRAD1,"*** ACCOUNT *** /rules /login /stats /buylevel /upgrade");
			SendClientMessage(playerid, COLOR_GRAD2,"*** GENERAL *** /pay /charity /time /buy /unrentcar /givekey /switchkey /id /drink /music /showlicenses /clothes");
			SendClientMessage(playerid, COLOR_GRAD2,"*** GENERAL *** /resetupgrades(100k) /buygun /lock /skill /portable /licenses /lotto /spawnchange /stopani");
			SendClientMessage(playerid, COLOR_GRAD2,"*** GENERAL *** /report /cancel /accept /eject /usedrugs /contract /fill /fillcar /clear /service /families");
	  		SendClientMessage(playerid, COLOR_GRAD3,"*** CHAT *** (/w)hisper (/o)oc (/s)hout (/c)lose (/l)ocal (/b) (/ad)vertise (/f)amily /me /togooc /tognews /togfam /togwhisper /map /fuel");
			SendClientMessage(playerid, COLOR_GRAD4,"*** BANK *** /balance /withdraw /deposit /wiretransfer");
            if(PlayerInfo[playerid][pJob] == 1) {
		    SendClientMessage(playerid,COLOR_GRAD5,"*** JOB *** /find"); }
		    else if(PlayerInfo[playerid][pJob] == 2) {
		    SendClientMessage(playerid,COLOR_GRAD5,"*** JOB *** /free"); }
		    else if(PlayerInfo[playerid][pJob] == 3) {
		    SendClientMessage(playerid,COLOR_GRAD5,"*** JOB *** /sex"); }
		    else if(PlayerInfo[playerid][pJob] == 4) {
		    SendClientMessage(playerid,COLOR_GRAD5,"*** JOB *** /selldrugs"); }
		    else if(PlayerInfo[playerid][pJob] == 5) {
		    SendClientMessage(playerid,COLOR_GRAD5,"*** JOB *** /dropcar"); }
		    else if(PlayerInfo[playerid][pMember] == 9) {
		    SendClientMessage(playerid,COLOR_GRAD5,"*** JOB *** /paper /papers /live /news [text]"); }
		    else if(PlayerInfo[playerid][pJob] == 7) {
		    SendClientMessage(playerid,COLOR_GRAD5,"*** JOB *** /repair /refill /duty"); }
		    else if(PlayerInfo[playerid][pJob] == 8) {
		    SendClientMessage(playerid,COLOR_GRAD5,"*** JOB *** /guard"); }
		    else if(PlayerInfo[playerid][pJob] == 9) {
		    SendClientMessage(playerid,COLOR_GRAD5,"*** JOB *** /materials /sellgun"); }
		    else if(PlayerInfo[playerid][pJob] == 10) {
		    SendClientMessage(playerid,COLOR_GRAD5,"*** JOB *** /sellcar"); }
		    else if(PlayerInfo[playerid][pJob] == 12) {
		    SendClientMessage(playerid,COLOR_GRAD5,"*** JOB *** /fight /boxstats"); }
		    else if(PlayerInfo[playerid][pMember] == 10 || PlayerInfo[playerid][pLeader] == 10|| PlayerInfo[playerid][pJob] == 14) {
		    SendClientMessage(playerid,COLOR_GRAD5,"*** JOB *** /fare"); }
		    else if(PlayerInfo[playerid][pJob] == 15) {
		    SendClientMessage(playerid,COLOR_GRAD5,"*** JOB *** /papers /bring /deliver"); }
		    if(PlayerInfo[playerid][pMember] == 11||PlayerInfo[playerid][pLeader] == 11||PlayerInfo[playerid][pMember] == 12||PlayerInfo[playerid][pLeader] == 12){
		    SendClientMessage(playerid,COLOR_GRAD5,"*** LESSON *** /startlesson /stoplesson /givelicense"); }
			if (gTeam[playerid] == 2)
			{
				SendClientMessage(playerid, COLOR_GRAD5, "*** SAPD *** (/r)adio (/d)epartments (/m)egaphone (/su)spect /mdc /arrest /duty /wanted /cuff /tazer");
				SendClientMessage(playerid, COLOR_GRAD5, "*** SAPD *** /frisk /take /ticket (/gov)ernment /deliver /camera /ram");
			}
			if (gTeam[playerid] == 1 || PlayerInfo[playerid][pMember] == 4 || PlayerInfo[playerid][pLeader] == 4)
			{
				SendClientMessage(playerid, COLOR_GRAD5, "*** SAMD *** (/r)adio (/d)epartments /heal /duty");
			}
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				SendClientMessage(playerid, COLOR_GRAD6, "*** ADMIN *** (/a)dmin (/ah)elp");
			}
			SendClientMessage(playerid, COLOR_GRAD6,"*** OTHER *** /cellphonehelp /househelp /renthelp /businesshelp /leaderhelp /fishhelp /cookhelp /irchelp");
		}
		return 1;
	}

//------------------------------------------------------------------------------------------------------
//----------------------------------[HELP]-----------------------------------------------
	if(strcmp(cmd, "/rules", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    SendClientMessage(playerid, COLOR_LIGHTRED,"INFO: Read our forum for all our rules and information.");
		}
		return 1;
	}
//----------------------------------[HELP]-----------------------------------------------
	if(strcmp(cmd, "/cellphonehelp", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			if (PlayerInfo[playerid][pPnumber] > 0)
			{
				SendClientMessage(playerid, COLOR_WHITE,"*** HELP *** type a command for more help");
				SendClientMessage(playerid, COLOR_GRAD3,"*** CELLPHONE *** /call 'eg: /call 911' /sms (/p)ickup (/h)angup /number");
				SendClientMessage(playerid, COLOR_GRAD4,"*** OTHER *** /help /househelp /renthelp /businesshelp /leaderhelp /fishhelp /cookhelp /irchelp");
			}
			else
			{
				SendClientMessage(playerid, COLOR_WHITE,"You can buy a cell phone in any 24-7");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/househelp", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			SendClientMessage(playerid, COLOR_WHITE,"*** HOUSE HELP *** type a command for more help");
			SendClientMessage(playerid, COLOR_GRAD3,"*** HOUSE *** /enter /exit /open /home /heal /houseupgrade (/hu) /setrentable /tv (off/player)");
			SendClientMessage(playerid, COLOR_GRAD3,"*** HOUSE *** /carupgrade /carcolor /evictall /towcar /fixcar /modcar /modst /modlr /setrent /evict /housewithdraw");
			SendClientMessage(playerid, COLOR_GRAD4,"*** OTHER *** /cellphonehelp /help /renthelp /businesshelp /leaderhelp /fishhelp /cookhelp /irchelp");
		}
		return 1;
	}
	if(strcmp(cmd, "/renthelp", true) == 0)
	{
		if(IsPlayerConnected(playerid))
	    {
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			SendClientMessage(playerid, COLOR_WHITE,"*** RENTING HELP *** type a command for more help");
			SendClientMessage(playerid, COLOR_GRAD3,"*** RENT *** /unrent /enter /exit /lock /home");
			SendClientMessage(playerid, COLOR_GRAD4,"*** OTHER *** /cellphonehelp /househelp /help /businesshelp /leaderhelp /fishhelp /cookhelp /irchelp");
		}
		return 1;
	}
	if(strcmp(cmd, "/businesshelp", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			SendClientMessage(playerid, COLOR_WHITE,"*** BUSINESS HELP *** type a command for more help");
			SendClientMessage(playerid, COLOR_GRAD3,"*** BUSINESS *** /bizinfo /bizfee /bizname /prodprice /extortion");
			SendClientMessage(playerid, COLOR_GRAD4,"*** BUSINESS *** /enter /exit /open /sellbiz /bizbank /bizwithdraw");
			SendClientMessage(playerid, COLOR_GRAD4,"*** OTHER *** /cellphonehelp /househelp /renthelp /help");
		}
		return 1;
	}
	if(strcmp(cmd, "/leaderhelp", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if (PlayerInfo[playerid][pLeader] >= 1)
		    {
				SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
				SendClientMessage(playerid, COLOR_WHITE,"*** LEADER HELP *** type a command for more help");
				SendClientMessage(playerid, COLOR_GRAD3,"*** LEADERS *** /invite /uninvite /giverank");
				if(PlayerInfo[playerid][pLeader] == 5 || PlayerInfo[playerid][pLeader] == 6)
				{
				    SendClientMessage(playerid, COLOR_GRAD3,"*** LEADERS *** /allowcreation /deletecreation /giveturf");
				}
				if(PlayerInfo[playerid][pLeader] == 7)
				{
					SendClientMessage(playerid, COLOR_GRAD3,"*** LEADERS *** /settax /givetax (Give some money to the Cops)");
				}
				SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not a Leader!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/irchelp", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
	        SendClientMessage(playerid, COLOR_WHITE,"*** IRC HELP *** Type a command for more help");
	        SendClientMessage(playerid, COLOR_WHITE,"*** IRC *** (/irc join [channelnr] or /irc join [channelnr] [password])  (/irc leave)");
			SendClientMessage(playerid, COLOR_WHITE,"*** IRC *** (/irc Password [channelnr])  (/irc NeedPass [channelnr])  (/irc Lock [channelnr])");
			SendClientMessage(playerid, COLOR_WHITE,"*** IRC *** (/irc Admins)  (/irc MOTD [motdtext])  (/irc status [channelnr])  (/i [text])");
	    }
	    return 1;
	}
	if(strcmp(cmd, "/fishhelp", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			SendClientMessage(playerid, COLOR_WHITE,"*** FISH HELP *** type a command for more help");
			SendClientMessage(playerid, COLOR_GRAD3,"*** FISHING *** /fish (Try to catch a fish)   /fishes (Show the fishes you have caught)");
			SendClientMessage(playerid, COLOR_GRAD3,"*** FISHING *** /throwback (Throw the last fish you caught back)   /throwbackall");
			SendClientMessage(playerid, COLOR_GRAD3,"*** FISHING *** /releasefish (Release one of your fishes)");
		}
		return 1;
	}
	if(strcmp(cmd, "/cookhelp", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			SendClientMessage(playerid, COLOR_WHITE,"*** COOK HELP *** type a command for more help");
			SendClientMessage(playerid, COLOR_GRAD3,"*** COOKING *** /cook (See all the options available)   /cooked (See everything that you have Cooked)");
			SendClientMessage(playerid, COLOR_GRAD3,"*** COOKING *** /eat (Eat something that you have Cooked)");
		}
		return 1;
	}
	if(strcmp(cmd, "/ahelp", true) == 0 || strcmp(cmd, "/ah", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
			if (PlayerInfo[playerid][pAdmin] >= 1)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "*1* MODERATOR *** /check /setint /mute /kick /kickres /warn /ban /sban /goto /cnn /a(dmin) chat");
			}
			if (PlayerInfo[playerid][pAdmin] >= 2)
			{
				SendClientMessage(playerid, COLOR_GRAD2,"*2* ADMIN *** /skydive /setteam /bigears /cnn /freeze /unfreeze /recon /cam");
			}
			if (PlayerInfo[playerid][pAdmin] >= 3)
			{
				SendClientMessage(playerid, COLOR_GRAD3,"*3* ADMIN *** /noooc /fourdive /sp /gotols /jail /prison");
				SendClientMessage(playerid, COLOR_GRAD4,"*3* ADMIN *** /endround /mark /gotomark /gotolv /gotosf /gethere /oldcar /gotocar /getcar");
			}
			if (PlayerInfo[playerid][pAdmin] >= 4)
			{
			    SendClientMessage(playerid, COLOR_GRAD4,"*4* ADMIN *** /mole /hq /logout /logoutpl /logoutall /edit /fuelcars /asellhouse /asellbiz /sellsbiz /setchamp /mk");
			    SendClientMessage(playerid, COLOR_GRAD4,"*4* ADMIN *** /veh /fixveh /destroycars /sethp /setarmor /givegun /givemoney /money(sets money) /forceskin /setstat /setfamily");
			}
			if (PlayerInfo[playerid][pAdmin] >= 1337)
			{
				SendClientMessage(playerid, COLOR_GRAD5,"*** 1337+ *** /weather /weatherall /makeadmin /makeleader /tod /savemission /loadmission /startlotto");
			}
			if (PlayerInfo[playerid][pAdmin] >= 1338)
			{
				SendClientMessage(playerid, COLOR_GRAD6,"***1338 This makes you invisible in the admin list");
			}
			SendClientMessage(playerid, COLOR_GREEN,"_______________________________________");
		}
		return 1;
	}
//----------------------------- Gravity -------------------------------------------
	/*if(strcmp(cmd,"/gravity",true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not an Admin !");
	            return 1;
	        }
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gravity [value Default: 0.008]");
	            return 1;
			}
			new Float:gravity;
			floatstr(tmp);
			SetGravity(gravity);
			format(string, sizeof(string), "* Gravity changed to %f.",gravity);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		}
		return 1;
	}*/
//------------------------------ Mission Making -----------------------------------
    if(strcmp(cmd,"/mk",true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] < 4)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not an Admin !");
	            return 1;
	        }
	        new x_mk[256];
			x_mk = strtok(cmdtext, idx);
			if(!strlen(x_mk)) {
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /mk [name]");
				SendClientMessage(playerid, COLOR_GREY, "Available names: (/mk text [number] [text]) (/mk game [number] [text]) (/mk cp [number])");
				SendClientMessage(playerid, COLOR_GREY, "Available names: (/mk title [text]) (/mk reward [price]) (/mk usecp)");
				return 1;
			}
	        if(strcmp(x_mk,"text",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
			    if(!strlen(x_mk))
				{
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /mk text [number] [text]");
					return 1;
				}
				new number = strval(tmp);
				if(number < 1 || number > 18) { SendClientMessage(playerid, COLOR_GREY, "   Number can't be below 1 or above 18 !"); return 1; }
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' '))
				{
					idx++;
				}
				new offset = idx;
				new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
				{
					result[idx - offset] = cmdtext[idx];
					idx++;
				}
				result[idx - offset] = EOS;
				if(!strlen(result))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/mk text [number] [text]");
					return 1;
				}
				switch(number)
				{
				    case 1:
				    {
						strmid(MissionInfo[mText1], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 1st Text Line of the Mission.");
				    }
				    case 2:
				    {
				        strmid(MissionInfo[mText2], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 2nd Text Line of the Mission.");
				    }
				    case 3:
				    {
				        strmid(MissionInfo[mText3], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 3rd Text Line of the Mission.");
				    }
				    case 4:
				    {
				        strmid(MissionInfo[mText4], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 4th Text Line of the Mission.");
				    }
				    case 5:
				    {
				        strmid(MissionInfo[mText5], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 5th Text Line of the Mission.");
				    }
				    case 6:
				    {
				        strmid(MissionInfo[mText6], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 6th Text Line of the Mission.");
				    }
				    case 7:
				    {
				        strmid(MissionInfo[mText7], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 7th Text Line of the Mission.");
				    }
				    case 8:
				    {
				        strmid(MissionInfo[mText8], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 8th Text Line of the Mission.");
				    }
				    case 9:
				    {
				        strmid(MissionInfo[mText9], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 9th Text Line of the Mission.");
				    }
				    case 10:
				    {
				        strmid(MissionInfo[mText10], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 10th Text Line of the Mission.");
				    }
				    case 11:
				    {
				        strmid(MissionInfo[mText11], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 11th Text Line of the Mission.");
				    }
				    case 12:
				    {
				        strmid(MissionInfo[mText12], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 12th Text Line of the Mission.");
				    }
				    case 13:
				    {
				        strmid(MissionInfo[mText13], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 13th Text Line of the Mission.");
				    }
				    case 14:
				    {
				        strmid(MissionInfo[mText14], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 14th Text Line of the Mission.");
				    }
				    case 15:
				    {
				        strmid(MissionInfo[mText15], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 15th Text Line of the Mission.");
				    }
				    case 16:
				    {
				        strmid(MissionInfo[mText16], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 16th Text Line of the Mission.");
				    }
				    case 17:
				    {
				        strmid(MissionInfo[mText17], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 17th Text Line of the Mission.");
				    }
				    case 18:
				    {
				        strmid(MissionInfo[mText18], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 18th Text Line of the Mission.");
				    }
				}
			}
			else if(strcmp(x_mk,"game",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
			    if(!strlen(x_mk))
				{
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /mk game [number] [text]");
					return 1;
				}
				new number = strval(tmp);
				if(number < 1 || number > 6) { SendClientMessage(playerid, COLOR_GREY, "   Number can't be below 1 or above 6 !"); return 1; }
				new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' '))
				{
					idx++;
				}
				new offset = idx;
				new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
				{
					result[idx - offset] = cmdtext[idx];
					idx++;
				}
				result[idx - offset] = EOS;
				if(!strlen(result))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/mk game [number] [text]");
					return 1;
				}
				switch(number)
				{
				    case 1:
				    {
				        strmid(MissionInfo[mGText1], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 1st GameText Line of the Mission.");
				    }
				    case 2:
				    {
				        strmid(MissionInfo[mGText2], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 2nd GameText Line of the Mission.");
				    }
				    case 3:
				    {
				        strmid(MissionInfo[mGText3], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 3rd GameText Line of the Mission.");
				    }
				    case 4:
				    {
				        strmid(MissionInfo[mGText4], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 4th GameText Line of the Mission.");
				    }
				    case 5:
				    {
				        strmid(MissionInfo[mGText5], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 5th GameText Line of the Mission.");
				    }
				    case 6:
				    {
				        strmid(MissionInfo[mGText6], result, 0, strlen(result), 255);
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 6th GameText Line of the Mission.");
				    }
				}
			}
			else if(strcmp(x_mk,"cp",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
			    if(!strlen(x_mk))
				{
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /mk cp [number]");
					return 1;
				}
			    new number = strval(tmp);
				if(number < 1 || number > 6) { SendClientMessage(playerid, COLOR_GREY, "   Number can't be below 1 or above 6 !"); return 1; }
				new Float:X,Float:Y,Float:Z;
				GetPlayerPos(playerid, X,Y,Z);
                switch(number)
				{
				    case 1:
				    {
				        MissionInfo[mCP1][0] = X; MissionInfo[mCP1][1] = Y; MissionInfo[mCP1][2] = Z;
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 1st Checkpoint of the Mission.");
				    }
				    case 2:
				    {
				        MissionInfo[mCP2][0] = X; MissionInfo[mCP2][1] = Y; MissionInfo[mCP2][2] = Z;
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 2nd Checkpoint Line of the Mission.");
				    }
				    case 3:
				    {
				        MissionInfo[mCP3][0] = X; MissionInfo[mCP3][1] = Y; MissionInfo[mCP3][2] = Z;
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 3rd Checkpoint Line of the Mission.");
				    }
				    case 4:
				    {
				        MissionInfo[mCP4][0] = X; MissionInfo[mCP4][1] = Y; MissionInfo[mCP4][2] = Z;
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 4th Checkpoint Line of the Mission.");
				    }
				    case 5:
				    {
				        MissionInfo[mCP5][0] = X; MissionInfo[mCP5][1] = Y; MissionInfo[mCP5][2] = Z;
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 5th Checkpoint Line of the Mission.");
				    }
				    case 6:
				    {
				        MissionInfo[mCP6][0] = X; MissionInfo[mCP6][1] = Y; MissionInfo[mCP6][2] = Z;
				        SendClientMessage(playerid, COLOR_WHITE, "You've made the 6th Checkpoint Line of the Mission.");
				    }
				}
			}
			else if(strcmp(x_mk,"usecp",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
			    if(!strlen(x_mk))
				{
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /mk usecp [0/1]");
					return 1;
				}
			    new toggle = strval(tmp);
				if(toggle == 0 || toggle == 1) { }
				else { SendClientMessage(playerid, COLOR_GREY, "   CheckpointUse number must be 0 (OFF) or 1 (ON) !"); return 1; }
				MissionInfo[mToggle] = toggle;
				if(toggle == 0) { SendClientMessage(playerid, COLOR_WHITE, "You've set the Use of Checkpoints to 0 (OFF)."); }
				else if(toggle == 1) { SendClientMessage(playerid, COLOR_WHITE, "You've set the Use of Checkpoints to 1 (ON)."); }
			}
			else if(strcmp(x_mk,"title",true) == 0)
			{
			    new length = strlen(cmdtext);
				while ((idx < length) && (cmdtext[idx] <= ' '))
				{
					idx++;
				}
				new offset = idx;
				new result[64];
				while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
				{
					result[idx - offset] = cmdtext[idx];
					idx++;
				}
				result[idx - offset] = EOS;
				if(!strlen(result))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/mk title [text]");
					return 1;
				}
				strmid(MissionInfo[mTitle], result, 0, strlen(result), 255);
		        SendClientMessage(playerid, COLOR_WHITE, "You've made the Title of the Mission.");
			}
			else if(strcmp(x_mk,"reward",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
			    if(!strlen(x_mk))
				{
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /mk reward [price]");
					return 1;
				}
			    new price = strval(tmp);
				if(price < 1 || price > 50000) { SendClientMessage(playerid, COLOR_GREY, "   Reward Price can't be below 1 or above 50000 !"); return 1; }
				MissionInfo[mReward] = price;
				SendClientMessage(playerid, COLOR_WHITE, "You've made the Reward Price for the Mission.");
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "   Invalid Mission Making name !");
				return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/savemission", true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1337)
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /savemission [missionname]");
					return 1;
				}
				SaveMission(playerid,tmp);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/loadmission", true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if (PlayerInfo[playerid][pAdmin] >= 1337)
			{
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /loadmission [missionname]");
					return 1;
				}
				LoadMission(playerid,tmp);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd,"/stopani",true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        ClearAnimations(playerid);
	    }
	    return 1;
	}
	if(strcmp(cmd,"/skill",true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        new x_nr[256];
			x_nr = strtok(cmdtext, idx);
			if(!strlen(x_nr)) {
				SendClientMessage(playerid, COLOR_WHITE, "|__________________ Skill Info __________________|");
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /skill [number]");
		  		SendClientMessage(playerid, COLOR_GREY, "| 1: Detective            7: Car Mechanic");
		  		SendClientMessage(playerid, COLOR_GREY, "| 2: Lawyer               8: Car Dealer");
		  		SendClientMessage(playerid, COLOR_GREY, "| 3: Whore                9: Boxer");
		  		SendClientMessage(playerid, COLOR_GREY, "| 4: Drugs Dealer		  10: Fishing");
		  		SendClientMessage(playerid, COLOR_GREY, "| 5: Car Jacker");
		  		SendClientMessage(playerid, COLOR_GREY, "| 6: News Reporter");
				SendClientMessage(playerid, COLOR_WHITE, "|________________________________________________|");
				return 1;
			}
		    if(strcmp(x_nr,"1",true) == 0)//Detective
			{
			    new level = PlayerInfo[playerid][pDetSkill];
				if(level >= 0 && level <= 50) { SendClientMessage(playerid, COLOR_YELLOW, "Your Detective Skill Level = 1."); format(string, sizeof(string), "You need to find %d more people to Level up.", 50 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 51 && level <= 100) { SendClientMessage(playerid, COLOR_YELLOW, "Your Detective Skill Level = 2."); format(string, sizeof(string), "You need to find %d more people to Level up.", 100 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 101 && level <= 200) { SendClientMessage(playerid, COLOR_YELLOW, "Your Detective Skill Level = 3."); format(string, sizeof(string), "You need to find %d more people to Level up.", 200 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 201 && level <= 400) { SendClientMessage(playerid, COLOR_YELLOW, "Your Detective Skill Level = 4."); format(string, sizeof(string), "You need to find %d more people to Level up.", 400 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 401) { SendClientMessage(playerid, COLOR_YELLOW, "Your Detective Skill Level = 5."); }
			}
			else if(strcmp(x_nr,"2",true) == 0)//Lawyer
			{
			    new level = PlayerInfo[playerid][pLawSkill];
				if(level >= 0 && level <= 50) { SendClientMessage(playerid, COLOR_YELLOW, "Your Lawyer Skill Level = 1."); format(string, sizeof(string), "You need to free %d more people to Level up.", 50 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 51 && level <= 100) { SendClientMessage(playerid, COLOR_YELLOW, "Your Lawyer Skill Level = 2."); format(string, sizeof(string), "You need to free %d more people to Level up.", 100 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 101 && level <= 200) { SendClientMessage(playerid, COLOR_YELLOW, "Your Lawyer Skill Level = 3."); format(string, sizeof(string), "You need to free %d more people to Level up.", 200 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 201 && level <= 400) { SendClientMessage(playerid, COLOR_YELLOW, "Your Lawyer Skill Level = 4."); format(string, sizeof(string), "You need to free %d more people to Level up.", 400 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 401) { SendClientMessage(playerid, COLOR_YELLOW, "Your Lawyer Skill Level = 5."); }
			}
			else if(strcmp(x_nr,"3",true) == 0)//Whore
			{
			    new level = PlayerInfo[playerid][pSexSkill];
				if(level >= 0 && level <= 50) { SendClientMessage(playerid, COLOR_YELLOW, "Your Whore Skill Level = 1."); format(string, sizeof(string), "You need to have sex %d times more to Level up.", 50 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 51 && level <= 100) { SendClientMessage(playerid, COLOR_YELLOW, "Your Whore Skill Level = 2."); format(string, sizeof(string), "You need to have sex %d times more to Level up.", 100 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 101 && level <= 200) { SendClientMessage(playerid, COLOR_YELLOW, "Your Whore Skill Level = 3."); format(string, sizeof(string), "You need to have sex %d times more to Level up.", 200 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 201 && level <= 400) { SendClientMessage(playerid, COLOR_YELLOW, "Your Whore Skill Level = 4."); format(string, sizeof(string), "You need to have sex %d times more to Level up.", 400 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 401) { SendClientMessage(playerid, COLOR_YELLOW, "Your Whore Skill Level = 5."); }
			}
			else if(strcmp(x_nr,"4",true) == 0)//Drugs Dealer
			{
			    new level = PlayerInfo[playerid][pDrugsSkill];
				if(level >= 0 && level <= 50) { SendClientMessage(playerid, COLOR_YELLOW, "Your Drug Dealer Skill Level = 1."); format(string, sizeof(string), "You need to sell drugs %d times more to Level up.", 50 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 51 && level <= 100) { SendClientMessage(playerid, COLOR_YELLOW, "Your Drug Dealer Skill Level = 2."); format(string, sizeof(string), "You need to sell drugs %d times more to Level up.", 100 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 101 && level <= 200) { SendClientMessage(playerid, COLOR_YELLOW, "Your Drug Dealer Skill Level = 3."); format(string, sizeof(string), "You need to sell drugs %d times more to Level up.", 200 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 201 && level <= 400) { SendClientMessage(playerid, COLOR_YELLOW, "Your Drug Dealer Skill Level = 4."); format(string, sizeof(string), "You need to sell drugs %d times more to Level up.", 400 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 401) { SendClientMessage(playerid, COLOR_YELLOW, "Your Drug Dealer Skill Level = 5."); }
			}
			else if(strcmp(x_nr,"5",true) == 0)//Car Jacker
			{
			    new level = PlayerInfo[playerid][pJackSkill];
				if(level >= 0 && level <= 50) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Jacker Skill Level = 1."); format(string, sizeof(string), "You need to drop %d cars more to Level up.", 50 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 51 && level <= 100) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Jacker Skill Level = 2."); format(string, sizeof(string), "You need to drop %d cars more to Level up.", 100 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 101 && level <= 200) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Jacker Skill Level = 3."); format(string, sizeof(string), "You need to drop %d cars more to Level up.", 200 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 201 && level <= 400) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Jacker Skill Level = 4."); format(string, sizeof(string), "You need to drop %d cars more to Level up.", 400 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 401) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Jacker Skill Level = 5."); }
			}
			else if(strcmp(x_nr,"6",true) == 0)//News Reporter
			{
			    new level = PlayerInfo[playerid][pNewsSkill];
				if(level >= 0 && level <= 50) { SendClientMessage(playerid, COLOR_YELLOW, "Your New Reporter Skill Level = 1."); format(string, sizeof(string), "You need to use /news %d times more to Level up.", 50 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 51 && level <= 100) { SendClientMessage(playerid, COLOR_YELLOW, "Your New Reporter Skill Level = 2."); format(string, sizeof(string), "You need to use /news %d times people to Level up.", 100 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 101 && level <= 200) { SendClientMessage(playerid, COLOR_YELLOW, "Your New Reporter Skill Level = 3."); format(string, sizeof(string), "You need to use /news %d times people to Level up.", 200 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 201 && level <= 400) { SendClientMessage(playerid, COLOR_YELLOW, "Your New Reporter Skill Level = 4."); format(string, sizeof(string), "You need to use /news %d times people to Level up.", 400 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 401) { SendClientMessage(playerid, COLOR_YELLOW, "Your New Reporter Skill Level = 5."); }
			}
			else if(strcmp(x_nr,"7",true) == 0)//Car Mechanic
			{
			    new level = PlayerInfo[playerid][pMechSkill];
				if(level >= 0 && level <= 50) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Mechanic Skill Level = 1."); format(string, sizeof(string), "You need to fix/fill a car for %d times more to Level up.", 50 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 51 && level <= 100) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Mechanic Skill Level = 2."); format(string, sizeof(string), "You need to fix/fill a car for %d times people to Level up.", 100 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 101 && level <= 200) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Mechanic Skill Level = 3."); format(string, sizeof(string), "You need to fix/fill a car for %d times people to Level up.", 200 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 201 && level <= 400) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Mechanic Skill Level = 4."); format(string, sizeof(string), "You need to fix/fill a car for %d times people to Level up.", 400 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 401) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Mechanic Skill Level = 5."); }
			}
			else if(strcmp(x_nr,"8",true) == 0)//Car Dealer
			{
			    new level = PlayerInfo[playerid][pCarSkill];
				if(level >= 0 && level <= 50) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Dealer Skill Level = 1."); format(string, sizeof(string), "You need to sell %d more cars to people to Level up.", 50 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 51 && level <= 100) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Dealer Skill Level = 2."); format(string, sizeof(string), "You need to sell %d more cars to people to Level up.", 100 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 101 && level <= 200) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Dealer Skill Level = 3."); format(string, sizeof(string), "You need to sell %d more cars to people to Level up.", 200 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 201 && level <= 400) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Dealer Skill Level = 4."); format(string, sizeof(string), "You need to sell %d more cars to people to Level up.", 400 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 401) { SendClientMessage(playerid, COLOR_YELLOW, "Your Car Dealer Skill Level = 5."); }
			}
			else if(strcmp(x_nr,"9",true) == 0)//Boxer
			{
			    new level = PlayerInfo[playerid][pBoxSkill];
				if(level >= 0 && level <= 50) { SendClientMessage(playerid, COLOR_YELLOW, "Your Boxing Skill Level = 1."); format(string, sizeof(string), "You need to Win %d more Matches to Level up.", 50 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 51 && level <= 100) { SendClientMessage(playerid, COLOR_YELLOW, "Your Boxing Skill Level = 2."); format(string, sizeof(string), "You need to Win %d more Matches to Level up.", 100 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 101 && level <= 200) { SendClientMessage(playerid, COLOR_YELLOW, "Your Boxing Skill Level = 3."); format(string, sizeof(string), "You need to Win %d more Matches to Level up.", 200 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 201 && level <= 400) { SendClientMessage(playerid, COLOR_YELLOW, "Your Boxing Skill Level = 4."); format(string, sizeof(string), "You need to Win %d more Matches to Level up.", 400 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 401) { SendClientMessage(playerid, COLOR_YELLOW, "Your Boxing Skill Level = 5."); }
			}
			else if(strcmp(x_nr,"10",true) == 0)//Fishing
			{
			    new level = PlayerInfo[playerid][pFishSkill];
				if(level >= 0 && level <= 50) { SendClientMessage(playerid, COLOR_YELLOW, "Your Fishing Skill Level = 1."); format(string, sizeof(string), "You need to Fish %d more Fishes to Level up.", 50 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 51 && level <= 250) { SendClientMessage(playerid, COLOR_YELLOW, "Your Fishing Skill Level = 2."); format(string, sizeof(string), "You need to Fish %d more Fishes to Level up.", 100 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 251 && level <= 500) { SendClientMessage(playerid, COLOR_YELLOW, "Your Fishing Skill Level = 3."); format(string, sizeof(string), "You need to Fish %d more Fishes to Level up.", 200 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 501 && level <= 999) { SendClientMessage(playerid, COLOR_YELLOW, "Your Fishing Skill Level = 4."); format(string, sizeof(string), "You need to Fish %d more Fishes to Level up.", 400 - level); SendClientMessage(playerid, COLOR_YELLOW, string); }
				else if(level >= 1000) { SendClientMessage(playerid, COLOR_YELLOW, "Your Fishing Skill Level = 5."); }
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   Invalid Skill Number !");
			    return 1;
			}
	    }
	    return 1;
	}
	/*if(strcmp(cmd,"/agreementbroken",true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        SendClientMessage(playerid, COLOR_YELLOW, "Agreement Violation Security has been activated.");
	        Security = 1;
	        SaveStuff();
	        GameModeExit();
	    }
	    return 1;
	}*/
	if(strcmp(cmd, "/cks", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] < 3)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not an Admin !");
	            return 1;
	        }
	        new ck;
	        new number = 0;
	        new x_nr[256];
			x_nr = strtok(cmdtext, idx);
			if(!strlen(x_nr))
			{
			    for(new i = 0; i < sizeof(CKInfo); i++)
			    {
					number ++;
					if(CKInfo[i][cUsed] != 0)
					{
				        format(string, sizeof(string), "%d| %s wants to Character Kill %s.",number,CKInfo[i][cSendername],CKInfo[i][cGiveplayer]);
				        SendClientMessage(playerid, COLOR_WHITE, string);
			        }
			    }
				return 1;
			}
		    if(strcmp(x_nr,"accept",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /cks accept [cknumber]");
					return 1;
				}
				ck = strval(tmp);
				if(ck < 1 || ck > 10) { SendClientMessage(playerid, COLOR_GREY, "   CK Number can't be below 1 or above 10 !"); return 1; }
				ck -= 1;
				new found1 = 255;
				new found2 = 255;
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
				    if(IsPlayerConnected(i))
				    {
				        if(found1 != 255 && found2 != 255)
				        {
							new wstring[MAX_PLAYER_NAME];
							GetPlayerName(i, giveplayer, sizeof(giveplayer));
							format(string, sizeof(string), "%s", giveplayer);
							strmid(wstring, string, 0, strlen(string), 255);
							if(strcmp(CKInfo[ck][cSendername] ,wstring, true ) == 0 )
							{
							    found1 = i;
							}
							else if(strcmp(CKInfo[ck][cGiveplayer] ,wstring, true ) == 0 )
							{
							    found2 = i;
							}
						}
					}
				}
				if(found1 != 255 && found2 != 255)
    			{
    			    GetPlayerName(found2, giveplayer, sizeof(giveplayer));
    			    format(string, sizeof(string), "* An Admin has accepted your Character Kill, you can now perform your kill on %s.", giveplayer);
    			    SendClientMessage(found1, COLOR_LIGHTBLUE, string);
    			    OnCK[found1] = found2;
    			    GettingCK[found2] = found1;
    			    return 1;
    			}
    			else
    			{
    			    SendClientMessage(playerid, COLOR_YELLOW2, "Sorry, the Killer or Dieer ain't Online.");
    			    return 1;
    			}
			}
			else if(strcmp(x_nr,"delete",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /cks delete [cknumber]");
					return 1;
				}
				ck = strval(tmp);
				if(ck < 1 || ck > 10) { SendClientMessage(playerid, COLOR_GREY, "   CK Number can't be below 1 or above 10 !"); return 1; }
				ck -= 1;
				ClearCK(ck);
				ck += 1;
				format(string, sizeof(string), "* You've cleared Character Kill nr: %d", ck);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				return 1;
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   Invalid CK command name !");
			    return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/ck", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pLevel] < 5)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You must be Level 5 in order to request a Character Kill !");
	            return 1;
	        }
	        tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /ck [playerid/PartOfName]");
				return 1;
			}
	        giveplayerid = ReturnUser(tmp);
	        if(IsPlayerConnected(giveplayerid))
	        {
	            if(giveplayerid != INVALID_PLAYER_ID)
	            {
	                if(PlayerInfo[giveplayerid][pAdmin] >= 1)
	                {
	                    SendClientMessage(playerid, COLOR_GREY, "   Can't perform Character Kills on Admins !");
	                    return 1;
	                }
	                else if(PlayerInfo[giveplayerid][pLevel] < 5)
			        {
			            SendClientMessage(playerid, COLOR_GREY, "   The Player you want to Character Kill must be Level 5 !");
			            return 1;
			        }
					ABroadCast(COLOR_YELLOW, "* A New Character Kill request has come in, use /cks.", 3);
					new found = 0;
					for(new i = 0; i < sizeof(CKInfo); i++)
			    	{
			    	    if(found != 1)
			    	    {
							if(CKInfo[i][cUsed] != 1)
							{
							    found = 1;
							    GetPlayerName(playerid, sendername, sizeof(sendername));
							    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
							    format(string, sizeof(string), "%s", sendername);
							    strmid(CKInfo[i][cSendername], string, 0, strlen(string), 255);
							    format(string, sizeof(string), "%s", giveplayer);
								strmid(CKInfo[i][cGiveplayer], string, 0, strlen(string), 255);
								CKInfo[i][cUsed] = 1;
								SaveCK();
							}
						}
			    	}
			    	if(found != 1)
			    	{
			    	    SendClientMessage(playerid, COLOR_YELLOW2, "Sorry, all the Character Kill Slots are used, try again later.");
			    	}
			    	else
			    	{
			    	    SendClientMessage(playerid, COLOR_YELLOW2, "Your Character Kill Request has been added to the list, you'll hear from an Admin soon.");
			    	}
			    	return 1;
	            }
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
	            return 1;
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/givelicense", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(IsAnInstructor(playerid))
	        {
	            if(PlayerInfo[playerid][pRank] < 3)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   Only Rank 3 or higher can give away a License !");
	                return 1;
	            }
	            new x_nr[256];
				x_nr = strtok(cmdtext, idx);
				if(!strlen(x_nr)) {
				    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givelicense [name] [playerid/PartOfName]");
				    SendClientMessage(playerid, COLOR_WHITE, "Available names: Driving, Flying, Sailing, Fishing, Weapon.");
					return 1;
				}
			    if(strcmp(x_nr,"driving",true) == 0)
				{
		            tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givelicense driverslicense [playerid/PartOfName]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        GetPlayerName(playerid, sendername, sizeof(sendername));
					        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				            format(string, sizeof(string), "* You've given a Drivers License to %s.",giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Instructor %s has given you a Drivers License.",sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        PlayerInfo[giveplayerid][pCarLic] = 1;
					        return 1;
				        }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else if(strcmp(x_nr,"flying",true) == 0)
				{
		            tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givelicense flyinglicense [playerid/PartOfName]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        GetPlayerName(playerid, sendername, sizeof(sendername));
					        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				            format(string, sizeof(string), "* You've given a Flying License to %s.",giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Instructor %s has given you a Flying License.",sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        PlayerInfo[giveplayerid][pFlyLic] = 1;
					        return 1;
						}
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else if(strcmp(x_nr,"sailing",true) == 0)
				{
		            tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givelicense sailinglicense [playerid/PartOfName]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        GetPlayerName(playerid, sendername, sizeof(sendername));
					        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				            format(string, sizeof(string), "* You've given a Sailing License to %s.",giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Instructor %s has given you a Sailing License.",sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        PlayerInfo[giveplayerid][pBoatLic] = 1;
					        return 1;
						}
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else if(strcmp(x_nr,"fishing",true) == 0)
				{
		            tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givelicense fishinglicense [playerid/PartOfName]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        GetPlayerName(playerid, sendername, sizeof(sendername));
					        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				            format(string, sizeof(string), "* You've given a Fishing License to %s.",giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Instructor %s has given you a Fishing License.",sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        PlayerInfo[giveplayerid][pFishLic] = 1;
					        return 1;
						}
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else if(strcmp(x_nr,"weapon",true) == 0)
				{
		            tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
					    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givelicense weaponlicense [playerid/PartOfName]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        GetPlayerName(playerid, sendername, sizeof(sendername));
					        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				            format(string, sizeof(string), "* You've given a Weapon License to %s.",giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Instructor %s has given you a Weapon License.",sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        PlayerInfo[giveplayerid][pGunLic] = 1;
					        return 1;
						}
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not a School Instructor !");
	            return 1;
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/startlesson", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(IsAnInstructor(playerid))
	        {
	            tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /startlesson [playerid/PartOfName]");
				    return 1;
				}
				giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				        format(string, sizeof(string), "* You've started %s's Lesson.",giveplayer);
				        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				        format(string, sizeof(string), "* Instructor %s has started your Lesson.",sendername);
				        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				        TakingLesson[giveplayerid] = 1;
				    }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
				    return 1;
				}
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not a School Instructor !");
	            return 1;
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/stoplesson", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(IsAnInstructor(playerid))
	        {
	            tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /stoplesson [playerid/PartOfName]");
				    return 1;
				}
				giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        if(TakingLesson[giveplayerid] != 1)
				        {
				            SendClientMessage(playerid, COLOR_GREY, "   That player is not taking a Lesson !");
				            return 1;
				        }
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				        format(string, sizeof(string), "* You've stopped %s's Lesson.",giveplayer);
				        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				        format(string, sizeof(string), "* Instructor %s has stopped your Lesson.",sendername);
				        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				        TakingLesson[giveplayerid] = 0;
				    }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
				    return 1;
				}
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not a School Instructor !");
	            return 1;
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/families", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
			    new number = 0;
		        for(new i = 0; i < sizeof(FamilyInfo); i++)
		        {
		            number ++;
		            format(string, sizeof(string), "Family %d| Name: %s | Leader: %s | Members: %d.",number,FamilyInfo[i][FamilyName],FamilyInfo[i][FamilyLeader],FamilyInfo[i][FamilyMembers]);
		            SendClientMessage(playerid, COLOR_WHITE, string);
		        }
		        return 1;
	        }
	        new family = strval(tmp);
	        if(family < 1 || family > 10) { SendClientMessage(playerid, COLOR_GREY, "   FamilyNr can't be below 1 or above 10 !"); return 1; }
			family -= 1;
			if(FamilyInfo[family][FamilyTaken] != 1)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That FamilyNr hasn't been Taken yet !");
			    return 1;
			}
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
			    if(IsPlayerConnected(i))
			    {
			        if(PlayerInfo[i][pFMember] == family)
			        {
			            GetPlayerName(i, giveplayer, sizeof(giveplayer));
			            format(string, sizeof(string), "* Family %d: %s | Rank: %d.",family,giveplayer,PlayerInfo[i][pRank]);
			            SendClientMessage(playerid, COLOR_GREY, string);
			        }
			    }
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/adjust", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pFMember] == 255)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not in a Family !");
	            return 1;
	        }
	        new family = PlayerInfo[playerid][pFMember];
	        new wstring[128];
			GetPlayerName(playerid, sendername, sizeof(sendername));
			format(string, sizeof(string), "%s", sendername);
			strmid(wstring, string, 0, strlen(string), 255);
	        if(strcmp(FamilyInfo[family][FamilyLeader],wstring, true ) == 0 )
			{
			    new x_nr[256];
				x_nr = strtok(cmdtext, idx);
				if(!strlen(x_nr)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /adjust [name]");
					SendClientMessage(playerid, COLOR_WHITE, "Available Names: Name, MOTD, Color, Spawn, Invite, Uninvite, Rank");
					return 1;
				}
			    if(strcmp(x_nr,"name",true) == 0)
				{
				    new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' '))
					{
						idx++;
					}
					new offset = idx;
					new result[64];
					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
					{
						result[idx - offset] = cmdtext[idx];
						idx++;
					}
					result[idx - offset] = EOS;
					if(!strlen(result))
					{
						SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /adjust Name [Family Name]");
						return 1;
					}
					strmid(FamilyInfo[family][FamilyName], result, 0, strlen(result), 255);
					SaveFamilies();
				    SendClientMessage(playerid, COLOR_WHITE, "You've adjusted your Family's Name.");
				}
				else if(strcmp(x_nr,"motd",true) == 0)
				{
				    new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' '))
					{
						idx++;
					}
					new offset = idx;
					new result[64];
					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
					{
						result[idx - offset] = cmdtext[idx];
						idx++;
					}
					result[idx - offset] = EOS;
					if(!strlen(result))
					{
						SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /adjust MOTD [Family MOTD Text]");
						return 1;
					}
					strmid(FamilyInfo[family][FamilyMOTD], result, 0, strlen(result), 255);
					SaveFamilies();
				    SendClientMessage(playerid, COLOR_WHITE, "You've adjusted your Family's MOTD.");
				}
				else if(strcmp(x_nr,"color",true) == 0)
				{
				    new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' '))
					{
						idx++;
					}
					new offset = idx;
					new result[64];
					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
					{
						result[idx - offset] = cmdtext[idx];
						idx++;
					}
					result[idx - offset] = EOS;
					if(!strlen(result))
					{
						SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /adjust color [Family Color Sample: 0xFFFFFFAA]");
						return 1;
					}
					if(offset < 10)
					{
					    SendClientMessage(playerid, COLOR_GREY, "   Wrong Color number, take a look at the Sample ! (0xFFFFFFAA)");
					    return 1;
					}
					strmid(FamilyInfo[family][FamilyMOTD], result, 0, strlen(result), 255);
					SaveFamilies();
				    SendClientMessage(playerid, COLOR_WHITE, "You've adjusted your Family's Color.");
				}
				else if(strcmp(x_nr,"spawn",true) == 0)
				{
				    GetPlayerPos(playerid, FamilyInfo[family][FamilySpawn][0],FamilyInfo[family][FamilySpawn][1],FamilyInfo[family][FamilySpawn][2]);
				    GetPlayerFacingAngle(playerid, FamilyInfo[family][FamilySpawn][3]);
				    FamilyInfo[family][FamilyInterior] = GetPlayerInterior(playerid);
				    SaveFamilies();
				    SendClientMessage(playerid, COLOR_WHITE, "You've adjusted your Family's Spawnplace.");
				}
				else if(strcmp(x_nr,"invite",true) == 0)
				{
				    if(FamilyInfo[family][FamilyMembers] >= 10)
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   Your Family has reached the Maximum of 10 Family Members, can't invite more !");
				        return 1;
				    }
					tmp = strtok(cmdtext, idx);
					if(!strlen(x_nr)) {
					    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /adjust invite [playerid/PartOfName]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        if(PlayerInfo[giveplayerid][pFMember] != 255)
					        {
					            SendClientMessage(playerid, COLOR_GREY, "   That player is already in a Family !");
					            return 1;
					        }
					        GetPlayerName(playerid, sendername, sizeof(sendername));
					        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					        format(string, sizeof(string), "* You've invited %s to join '%s'.",giveplayer, FamilyInfo[family][FamilyName]);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* %s has invited you to join '%s', you are now a Member of it.",sendername, FamilyInfo[family][FamilyName]);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        PlayerInfo[giveplayerid][pFMember] = family;
					        PlayerInfo[giveplayerid][pRank] = 1;
					        FamilyInfo[family][FamilyMembers] ++;
					        SaveFamilies();
					        return 1;
					    }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else if(strcmp(x_nr,"uninvite",true) == 0)
				{
				    tmp = strtok(cmdtext, idx);
					if(!strlen(x_nr)) {
					    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /adjust uninvite [playerid/PartOfName]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        if(PlayerInfo[giveplayerid][pFMember] != family)
					        {
					            SendClientMessage(playerid, COLOR_GREY, "   That player is not in your Family !");
					            return 1;
					        }
					        GetPlayerName(playerid, sendername, sizeof(sendername));
					        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					        format(string, sizeof(string), "* You've kicked %s out of your Family.",giveplayer);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Family Leader %s has kicked your out of the Family.",sendername);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        PlayerInfo[giveplayerid][pFMember] = 255;
					        PlayerInfo[giveplayerid][pRank] = 0;
					        FamilyInfo[family][FamilyMembers] --;
					        SaveFamilies();
					        return 1;
					    }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else if(strcmp(x_nr,"rank",true) == 0)
				{
				    tmp = strtok(cmdtext, idx);
					if(!strlen(x_nr)) {
					    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /adjust rank [RankNr] [playerid/PartOfName]");
					    return 1;
					}
					new rank = strval(tmp);
					if(rank < 1 || rank > 6) { SendClientMessage(playerid, COLOR_GREY, "   RankNr can't be below 1 or above 6 !"); return 1; }
					tmp = strtok(cmdtext, idx);
					if(!strlen(x_nr)) {
					    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /adjust rank [RankNr] [playerid/PartOfName]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        if(PlayerInfo[giveplayerid][pFMember] != family)
					        {
					            SendClientMessage(playerid, COLOR_GREY, "   That player is not in your Family !");
					            return 1;
					        }
					        GetPlayerName(playerid, sendername, sizeof(sendername));
					        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					        format(string, sizeof(string), "* You've given %s Rank %d.",giveplayer,rank);
					        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					        format(string, sizeof(string), "* Family Leader %s has given you Rank %d.",sendername,rank);
					        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        PlayerInfo[giveplayerid][pRank] = rank;
					        return 1;
					    }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Invalid Adjust name !");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not the Leader of your Family !");
			    return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/giveturf", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pLeader] == 5 || PlayerInfo[playerid][pLeader] == 6)
	        {
	            tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /giveturf [FamilyNr]");
					return 1;
				}
				new family = strval(tmp);
				if(family < 1 || family > 10) { SendClientMessage(playerid, COLOR_GREY, "   FamilyNr can't be below 1 or above 10 !"); return 1; }
				if(PlayerInfo[playerid][pLeader] == 5 && family > 5) { SendClientMessage(playerid, COLOR_GREY, "   La Cosa Nostra Leader can only take FamilyNr 1 till 5 !"); return 1; }
				else if(PlayerInfo[playerid][pLeader] == 6 && family < 6) { SendClientMessage(playerid, COLOR_GREY, "   Yakuza Leader can only take FamilyNr 6 till 10 !"); return 1; }
				family -= 1;
				if(FamilyInfo[family][FamilyTaken] != 1)
				{
				    SendClientMessage(playerid, COLOR_GREY, "   That FamilyNr hasn't been Taken yet !");
				    return 1;
				}
				new Found = 0;
				for(new j=0; j<sizeof(TurfInfo);j++)
				{
					if(IsPlayerInTurf(playerid,j))
					{
					    Found = 1;
         				format(string, sizeof(string), "%s", FamilyInfo[family][FamilyName]);
						strmid(TurfInfo[j][zOwner], string, 0, strlen(string), 255);
						format(string, sizeof(string), "%s", FamilyInfo[family][FamilyColor]);
						strmid(TurfInfo[j][zColor], string, 0, strlen(string), 255);
					}
				}
				if(Found)
				{
				    SaveTurfs();
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Turf adjusted.");
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not in a Turf !");
				}
			}
			else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not the Leader of one of the Organisations !");
	            return 1;
	        }
		}
		return 1;
	}
	if(strcmp(cmd, "/allowcreation", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pLeader] == 5 || PlayerInfo[playerid][pLeader] == 6)
	        {
	            tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /allowcreation [FamilyNr] [playerid/PartOfName]");
					return 1;
				}
				new family = strval(tmp);
				if(family < 1 || family > 10) { SendClientMessage(playerid, COLOR_GREY, "   FamilyNr can't be below 1 or above 10 !"); return 1; }
				if(PlayerInfo[playerid][pLeader] == 5 && family > 5) { SendClientMessage(playerid, COLOR_GREY, "   La Cosa Nostra Leader can only take FamilyNr 1 till 5 !"); return 1; }
				else if(PlayerInfo[playerid][pLeader] == 6 && family < 6) { SendClientMessage(playerid, COLOR_GREY, "   Yakuza Leader can only take FamilyNr 6 till 10 !"); return 1; }
	            tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /allowcreation [FamilyNr] [playerid/PartOfName]");
					return 1;
				}
				giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        family -= 1;
				        if(FamilyInfo[family][FamilyTaken] == 1)
				        {
				            SendClientMessage(playerid, COLOR_GREY, "   That FamilyNr is already taken !" );
				            return 1;
				        }
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
				        format(string, sizeof(string), "* You've made %s the Leader of FamilyNr %d.",giveplayer,family);
				        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				        if(PlayerInfo[playerid][pLeader] == 5)
				        {
				            format(string, sizeof(string), "* La Cosa Nostra Leader %s has made you a Family Leader of FamilyNr %d.",sendername,family);
				        	SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				        }
				        else if(PlayerInfo[playerid][pLeader] == 6)
				        {
				            format(string, sizeof(string), "* Yakuza Leader %s has made you a Family Leader of FamilyNr %d.",sendername,family);
				        	SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				        }
				        format(string, sizeof(string), "%s",giveplayer);
				        strmid(FamilyInfo[family][FamilyLeader], string, 0, strlen(string), 255);
				        FamilyInfo[family][FamilyMembers] ++;
				        FamilyInfo[family][FamilyTaken] = 1;
				        PlayerInfo[giveplayerid][pFMember] = family;
				        SaveFamilies();
				    }
				}
				else
				{
                    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
                    return 1;
				}
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not the Leader of one of the Organisations !");
	            return 1;
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/deletecreation", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pLeader] == 5 || PlayerInfo[playerid][pLeader] == 6)
	        {
	            tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /deletecreation [FamilyNr]");
					return 1;
				}
				new family = strval(tmp);
				if(family < 1 || family > 10) { SendClientMessage(playerid, COLOR_GREY, "   FamilyNr can't be below 1 or above 10 !"); return 1; }
				if(PlayerInfo[playerid][pLeader] == 5 && family > 5) { SendClientMessage(playerid, COLOR_GREY, "   La Cosa Nostra Leader can only take FamilyNr 1 till 5 !"); return 1; }
				else if(PlayerInfo[playerid][pLeader] == 6 && family < 6) { SendClientMessage(playerid, COLOR_GREY, "   Yakuza Leader can only take FamilyNr 6 till 10 !"); return 1; }
				family -= 1;
				if(FamilyInfo[family][FamilyTaken] != 1)
				{
				    SendClientMessage(playerid, COLOR_GREY, "   That FamilyNr isn't taken !");
				    return 1;
				}
				ClearFamily(family);
				SaveFamilies();
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not the Leader of one of the Organisations !");
	            return 1;
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/ram", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
            if(gTeam[playerid] == 2 || PlayerInfo[playerid][pLeader] == 6 || PlayerInfo[playerid][pLeader] == 10)
            {
                for(new i = 0; i < sizeof(HouseInfo); i++)
				{
					if (PlayerToPoint(3, playerid,HouseInfo[i][hEntrancex], HouseInfo[i][hEntrancey], HouseInfo[i][hEntrancez]))
					{
					    SetPlayerInterior(playerid,HouseInfo[i][hInt]);
						SetPlayerPos(playerid,HouseInfo[i][hExitx],HouseInfo[i][hExity],HouseInfo[i][hExitz]);
						GameTextForPlayer(playerid, "~r~Breached the door", 5000, 1);
						PlayerInfo[playerid][pInt] = HouseInfo[i][hInt];
						PlayerInfo[playerid][pLocal] = i;
					}
				}
            }
            else
            {
                SendClientMessage(playerid, COLOR_GREY, "   You are not a Cop / Soldier !");
			    return 1;
            }
		}
		return 1;
	}
	if(strcmp(cmd, "/camera", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
            if(IsACop(playerid))
            {
                if(!PlayerToPoint(8.0,playerid,211.6222,1811.9565,21.8594))
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not at the Area51 Security Panel !");
				    return 1;
				}
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /camera [number 1 - 6]  (6 = OFF)");
					return 1;
				}
				new number = strval(tmp);
				if(number < 1 || number > 6) { SendClientMessage(playerid, COLOR_GREY, "   Camera Number can't be below 1 or above 6 !"); return 1; }
				TogglePlayerControllable(playerid, 0);
				GetPlayerPos(playerid, Unspec[playerid][Coords][0],Unspec[playerid][Coords][1],Unspec[playerid][Coords][2]);
				if(number == 1) { SetPlayerCameraPos(playerid, 118.1011,1931.3221,22.5527); SetPlayerCameraLookAt(playerid, 98.9656,1920.9819,18.2180); }
				else if(number == 2) { SetPlayerCameraPos(playerid, 213.5340,1875.3075,17.6406); SetPlayerCameraLookAt(playerid, 213.8679,1884.1714,13.8945); }
				else if(number == 3) { SetPlayerCameraPos(playerid, 266.0640,1894.8856,38.6459); SetPlayerCameraLookAt(playerid, 224.0039,1887.1532,17.6406); }
				else if(number == 4) { SetPlayerCameraPos(playerid, 260.8112,1808.0175,38.6303); SetPlayerCameraLookAt(playerid, 227.5645,1818.4778,17.6406); }
				else if(number == 5) { SetPlayerCameraPos(playerid, 114.5196,1814.3483,38.6029); SetPlayerCameraLookAt(playerid, 123.6176,1846.4792,17.6549); }
				else if(number == 6)
				{
				    MedicBill[playerid] = 0;
					TogglePlayerControllable(playerid, 1);
					SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pModel], Unspec[playerid][Coords][0], Unspec[playerid][Coords][1], Unspec[playerid][Coords][2], 10.0, -1, -1, -1, -1, -1, -1);
					SpawnPlayer(playerid);
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not a Cop / Soldier !");
			    return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd,"/divorce",true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pMarried] < 1)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You aren't Married !");
				return 1;
	        }
	        tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /divorce [Playerid/PartOfName]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
		    if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if (ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Propose to yourself!"); return 1; }
					    new dstring[MAX_PLAYER_NAME];
						new wstring[MAX_PLAYER_NAME];
						GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "%s", giveplayer);
						strmid(wstring, string, 0, strlen(string), 255);
						format(string, sizeof(string), "%s", PlayerInfo[playerid][pMarriedTo]);
						strmid(dstring, string, 0, strlen(string), 255);
						if(strcmp(dstring ,wstring, true ) == 0 )
						{
						    format(string, sizeof(string), "* You've sent Divorce Papers to %s.", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s just sent you his Divorce Papers (type /accept divorce) to accept.", sendername);
							SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					        DivorceOffer[giveplayerid] = playerid;
					        return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   That player is not Married to you !");
						    return 1;
						}
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
						return 1;
					}
			    }
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
			    return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd,"/propose",true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(GetPlayerMoney(playerid) < 100000)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   The Marriage & Reception costs $100000 !");
	            return 1;
	        }
	        if(PlayerInfo[playerid][pMarried] > 0)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are already Married !");
				return 1;
	        }
	        if(PlayerInfo[playerid][pPhousekey] == 255)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You don't have a House to let your Wife / Husband live somewhere !");
				return 1;
	        }
	        tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /propose [Playerid/PartOfName]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
		    if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if(PlayerInfo[giveplayerid][pMarried] > 0)
			        {
			            SendClientMessage(playerid, COLOR_GREY, "   That player is already Married !");
			            return 1;
			        }
			        if(PlayerInfo[giveplayerid][pPhousekey] != 255)
			        {
			            SendClientMessage(playerid, COLOR_GREY, "   That player has a House, can't be Married !");
			            return 1;
			        }
			        if(PlayerInfo[giveplayerid][pPbiskey] != 255)
			        {
			            SendClientMessage(playerid, COLOR_GREY, "   That player has a Business, can't be Married !");
			            return 1;
			        }
			        if (ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Propose to yourself!"); return 1; }
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "* You proposed to %s.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* %s just proposed to you (type /accept marriage) to accept.", sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				        ProposeOffer[giveplayerid] = playerid;
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
						return 1;
					}
			    }
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
			    return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd,"/witness",true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /witness [Playerid/PartOfName]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
		    if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if (ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Propose to yourself!"); return 1; }
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "* You requested %s to be your Marriage Witness.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* %s just requested you to be his Marriage Witness (type /accept witness) to accept.", sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				        MarryWitnessOffer[giveplayerid] = playerid;
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
						return 1;
					}
			    }
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
			    return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd,"/irc",true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        new x_nr[256];
			x_nr = strtok(cmdtext, idx);
			if(!strlen(x_nr)) {
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: (/irc join [channelnr] or /irc join [channelnr] [password])  (/irc Leave)  (/irc Admins)");
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /irc [name] [channelnr]");
				SendClientMessage(playerid, COLOR_WHITE, "Available names: MOTD, Password, NeedPass, Lock, Kick, Status");
				return 1;
			}
		    if(strcmp(x_nr,"join",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
			    if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /irc join [channelnr] or /irc join [channelnr] [password]");
				    return 1;
				}
				new channel = strval(tmp);
				if(channel < 1 || channel > 10) { SendClientMessage(playerid, COLOR_GREY, "   Channel Number can't be below 1 or above 10 !"); return 1; }
				channel -= 1;
			    if(IRCInfo[channel][iLock] == 0)
			    {
			        if(IRCInfo[channel][iNeedPass] == 0)
			        {
			            JoinChannelNr(playerid, channel);
				    }
				    else
				    {
				        tmp = strtok(cmdtext, idx);
				        if(!strlen(tmp))
						{
						    SendClientMessage(playerid, COLOR_WHITE, "There's a password required to join this Channel.");
							SendClientMessage(playerid, COLOR_WHITE, "USAGE: /irc join [channelnr] [password]");
							return 1;
						}
						JoinChannel(playerid,channel,tmp);
				    }
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   That Channel is Locked, please choose a different one !");
				    return 1;
			    }
			}
			else if(strcmp(x_nr,"status",true) == 0)
			{
			    for(new i = 0; i < sizeof(IRCInfo); i++)
			    {
			        format(string, sizeof(string), "Channel %d: %d Players Connected.",i + 1, IRCInfo[i][iPlayers]);
				    SendClientMessage(playerid, COLOR_WHITE, string);
			    }
			    return 1;
			}
			else if(strcmp(x_nr,"password",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
			    if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /irc password [channelnr] [password]");
				    return 1;
				}
				new channel = strval(tmp);
				if(channel < 1 || channel > 10) { SendClientMessage(playerid, COLOR_GREY, "   Channel Number can't be below 1 or above 10 !"); return 1; }
				channel -= 1;
				new wstring[128];
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "%s", sendername);
				strmid(wstring, string, 0, strlen(string), 255);
				if(strcmp(IRCInfo[channel][iAdmin],wstring, true ) == 0 )
				{
				    tmp = strtok(cmdtext, idx);
				    if(!strlen(tmp))
					{
					    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /irc password [channelnr] [password]");
					    return 1;
					}
					strmid(IRCInfo[channel][iPassword], tmp, 0, strlen(tmp), 255);
					format(string, sizeof(string), "You've changed the IRC Channel's Password to: %s.",IRCInfo[channel][iPassword]);
					SendClientMessage(playerid, COLOR_YELLOW, string);
					SaveIRC();
					return 1;
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not the Admin of that Channel !");
				    return 1;
				}
			}
			else if(strcmp(x_nr,"needpass",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
			    if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /irc needpass [channelnr]");
				    return 1;
				}
				new channel = strval(tmp);
				if(channel < 1 || channel > 10) { SendClientMessage(playerid, COLOR_GREY, "   Channel Number can't be below 1 or above 10 !"); return 1; }
				channel -= 1;
				new wstring[128];
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "%s", sendername);
				strmid(wstring, string, 0, strlen(string), 255);
				if(strcmp(IRCInfo[channel][iAdmin],wstring, true ) == 0 )
				{
				    if(IRCInfo[channel][iNeedPass] != 0)
				    {
				        IRCInfo[channel][iNeedPass] = 0;
				        SendClientMessage(playerid, COLOR_YELLOW, "Players won't have to fill in a password in order to join the IRC Channel now.");
				    }
					else
					{
					    IRCInfo[channel][iNeedPass] = 1;
						SendClientMessage(playerid, COLOR_YELLOW, "Players must fill in a password in order to join the IRC Channel now.");
					}
					SaveIRC();
					return 1;
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not the Admin of that Channel !");
				    return 1;
				}
			}
			else if(strcmp(x_nr,"lock",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
			    if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /irc lock [channelnr]");
				    return 1;
				}
				new channel = strval(tmp);
				if(channel < 1 || channel > 10) { SendClientMessage(playerid, COLOR_GREY, "   Channel Number can't be below 1 or above 10 !"); return 1; }
				channel -= 1;
				new wstring[128];
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "%s", sendername);
				strmid(wstring, string, 0, strlen(string), 255);
				if(strcmp(IRCInfo[channel][iAdmin],wstring, true ) == 0 )
				{
				    if(IRCInfo[channel][iLock] != 0)
				    {
				        IRCInfo[channel][iLock] = 0;
				        SendClientMessage(playerid, COLOR_YELLOW, "You've unlocked the IRC Channel.");
				    }
					else
					{
					    IRCInfo[channel][iLock] = 1;
						SendClientMessage(playerid, COLOR_YELLOW, "You've locked the IRC Channel.");
					}
					SaveIRC();
					return 1;
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not the Admin of that Channel !");
				    return 1;
				}
			}
			else if(strcmp(x_nr,"motd",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
			    if(!strlen(tmp))
				{
				    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /irc motd [channelnr] [motdtext]");
				    return 1;
				}
				new channel = strval(tmp);
				if(channel < 1 || channel > 10) { SendClientMessage(playerid, COLOR_GREY, "   Channel Number can't be below 1 or above 10 !"); return 1; }
				channel -= 1;
				new wstring[128];
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "%s", sendername);
				strmid(wstring, string, 0, strlen(string), 255);
				if(strcmp(IRCInfo[channel][iAdmin],wstring, true ) == 0 )
				{
				    new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' '))
					{
						idx++;
					}
					new offset = idx;
					new result[64];
					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
					{
						result[idx - offset] = cmdtext[idx];
						idx++;
					}
					result[idx - offset] = EOS;
					if(!strlen(result))
					{
						SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /irc motd [motdtext]");
						return 1;
					}
					strmid(IRCInfo[channel][iMOTD], result, 0, strlen(result), 255);
					SendClientMessage(playerid, COLOR_YELLOW, "You've adjusted the IRC Channel's MOTD Text.");
					SaveIRC();
					return 1;
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not the Admin of that Channel !");
				    return 1;
				}
			}
			else if(strcmp(x_nr,"leave",true) == 0)
			{
			    if(PlayersChannel[playerid] < 999)
			    {
			        GetPlayerName(playerid, sendername, sizeof(sendername));
			        format(string, sizeof(string), "* %s has left the Channel.", sendername);
			        SendIRCMessage(PlayersChannel[playerid], COLOR_GREEN, string);
			        IRCInfo[PlayersChannel[playerid]][iPlayers] -= 1;
			        PlayersChannel[playerid] = 999;
			        return 1;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You are not in an IRC Channel !");
			        return 1;
			    }
			}
			else if(strcmp(x_nr,"admins",true) == 0)
			{
				for(new i = 0; i < sizeof(IRCInfo); i++)
			    {
				    format(string, sizeof(string), "Channel %d: %s.", i + 1, IRCInfo[i][iAdmin]);
				    SendClientMessage(playerid, COLOR_WHITE, string);
			    }
			    return 1;
			}
			else if(strcmp(x_nr,"kick",true) == 0)
			{
			    if(PlayersChannel[playerid] == 999)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You are not in an IRC Channel !");
			        return 1;
			    }
			    new wstring[128];
				GetPlayerName(playerid, sendername, sizeof(sendername));
				format(string, sizeof(string), "%s", sendername);
				strmid(wstring, string, 0, strlen(string), 255);
				if(strcmp(IRCInfo[PlayersChannel[playerid]][iAdmin],wstring, true ) == 0 )
				{
				    tmp = strtok(cmdtext, idx);
				    if(!strlen(tmp))
					{
					    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /irc kick [playerid/PartOfName]");
					    return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        if(PlayersChannel[giveplayerid] == PlayersChannel[playerid])
					        {
					            GetPlayerName(playerid, sendername, sizeof(sendername));
					            GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					            format(string, sizeof(string), "* You've kicked %s out of your IRC Channel.",giveplayer);
					            SendClientMessage(playerid, COLOR_YELLOW, string);
					            format(string, sizeof(string), "* You've been kicked out of the IRC Channel by Channel Admin: %s.",sendername);
					            SendClientMessage(giveplayerid, COLOR_YELLOW, string);
					            format(string, sizeof(string), "* %s has left the Channel (Kicked).", sendername);
						        SendIRCMessage(PlayersChannel[playerid], COLOR_GREEN, string);
					            IRCInfo[PlayersChannel[giveplayerid]][iPlayers] -= 1;
					            PlayersChannel[giveplayerid] = 999;
					        }
					        else
					        {
					            SendClientMessage(playerid, COLOR_GREY, "   That player is not in your IRC Channel !");
							    return 1;
					        }
					    }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
                }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not the Admin of the Channel !");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   Invalid IRC Channel Number ! ");
			    return 1;
			}
		}
		return 1;
 	}
 	if(strcmp(cmd,"/i",true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayersChannel[playerid] == 999)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not in an IRC Channel !");
	            return 1;
	        }
	        if(PlayerInfo[playerid][pMuted] == 1)
			{
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "You cannot speak, you have been silenced");
				return 1;
			}
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /i [irc chat]");
				return 1;
			}
			format(string, sizeof(string), "** IRC %s: %s. **", sendername, result);
			SendIRCMessage(PlayersChannel[playerid], COLOR_YELLOW2, string);
	    }
	    return 1;
	}
	if(strcmp(cmd,"/mission",true)==0)
    {
        if(IsPlayerConnected(playerid))
        {
			if(!PlayerToPoint(3.0,playerid,1381.0413,-1088.8511,27.3906))
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not at the Bill Board !");
			    return 1;
			}
			if(MissionPlayable == 0)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   No Mission has been Activated !");
			    return 1;
			}
			if(PlayerInfo[playerid][pMissionNr] == MissionPlayable)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You've already completed the Active Mission !");
			    return 1;
			}
			RingTone[playerid] = 20;
			PlayerOnMission[playerid] = PlayMission[kNumber];
			MissionCheckpoint[playerid] = 1;
			format(string, sizeof(string), "~w~Mission started: ~n~~r~%s", PlayMission[kTitle]);
			GameTextForPlayer(playerid, string, 5000, 3);
			format(string, sizeof(string), "%s", PlayMission[kText1]);
			SendClientMessage(playerid, COLOR_YELLOW2, string);
			format(string, sizeof(string), "%s", PlayMission[kText2]);
			SendClientMessage(playerid, COLOR_YELLOW2, string);
			format(string, sizeof(string), "%s", PlayMission[kText3]);
			SendClientMessage(playerid, COLOR_YELLOW2, string);
			if(PlayMission[kToggle] == 1)
			{
				SetPlayerCheckpoint(playerid, PlayMission[kCP1][0], PlayMission[kCP1][1], PlayMission[kCP1][2], 8);
			}
        }
        return 1;
    }
	if(strcmp(cmd,"/settax",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pLeader] != 7)
	        {
				SendClientMessage(playerid, COLOR_GREY, "   You are not the Mayor !");
				return 1;
	        }
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /settax [ammount]");
				return 1;
			}
			moneys = strval(tmp);
			if(moneys < 1 || moneys > 5000) { SendClientMessage(playerid, COLOR_GREY, "   Tax may not be below 1 or above 5000 !"); return 1; }
			Tax = moneys;
			SaveStuff();
			format(string, sizeof(string), "* The Tax is $%d per player, from now on.", Tax);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	    }
	    return 1;
	}
	if(strcmp(cmd,"/givetax",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pLeader] != 7)
	        {
				SendClientMessage(playerid, COLOR_GREY, "   You are not the Mayor !");
				return 1;
	        }
	        if(Tax < 1)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   There is no Money left in the Tax Fault !");
				return 1;
			}
			new Cops = 0;
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
			    if(IsPlayerConnected(i))
			    {
			        if(gTeam[i] == 2 && PlayerInfo[i][pMember] == 1)
			        {
			            Cops += 1;
			        }
			    }
			}
			if(Cops >= 1)
			{
			    new value = Tax / 2;
			    new price = value / Cops;
			    for(new i = 0; i < MAX_PLAYERS; i++)
				{
				    if(IsPlayerConnected(i))
				    {
				        if(gTeam[i] == 2 && PlayerInfo[i][pMember] == 1)
				        {
				            format(string, sizeof(string), "* You received $%d from the Tax Fault from the Mayor.",price);
							SendClientMessage(i, COLOR_LIGHTBLUE, string);
							GivePlayerMoney(i, price);
							Tax -= price;
				        }
				    }
				}
				SaveStuff();
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   There are no Cops Online at the moment !");
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd,"/read",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
			new x_job[256];
			x_job = strtok(cmdtext, idx);
			if(!strlen(x_job)) {
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /read [name]");
				SendClientMessage(playerid, COLOR_GREY, "Available names: Paper, TestPaper");
				return 1;
			}
	        if(strcmp(x_job,"paper",true) == 0)
			{
			    if(GotPaper[playerid] > 0)
			    {
			        SendClientMessage(playerid, COLOR_WHITE, "|_______________ Role Play - The Godfather: Newspaper _______________|");
			        format(string, sizeof(string), "| %s  |  By News Reporter: %s.",Paper[playerid][pTitle],Paper[playerid][pMaker]);
			        SendClientMessage(playerid, COLOR_GREEN, string);
			        format(string, sizeof(string), "%s",Paper[playerid][pLine1]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        format(string, sizeof(string), "%s",Paper[playerid][pLine2]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        format(string, sizeof(string), "%s",Paper[playerid][pLine3]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        format(string, sizeof(string), "%s",Paper[playerid][pLine4]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        format(string, sizeof(string), "%s",Paper[playerid][pLine5]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        format(string, sizeof(string), "%s",Paper[playerid][pLine6]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        format(string, sizeof(string), "%s",Paper[playerid][pLine7]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        SendClientMessage(playerid, COLOR_WHITE, "|____________________________________________________________________|");
			        return 1;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You don't have a Newspaper !");
			        return 1;
			    }
			}
			else if(strcmp(x_job,"testpaper",true) == 0)
			{
			    if(PlayerInfo[playerid][pMember] == 9 || PlayerInfo[playerid][pLeader] == 9)
			    {
				    tmp = strtok(cmdtext, idx);
					if(!strlen(tmp)) {
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: /read testpaper [papernr]");
						return 1;
					}
					new paper = strval(tmp);
					if(paper < 1 || paper > 10) { SendClientMessage(playerid, COLOR_GREY, "   Paper Number can't be below 1 or above 10 !"); return 1; }
					paper -= 1;
					if(PaperInfo[paper][PaperUsed] == 0)
					{
					    SendClientMessage(playerid, COLOR_GREY, "   There is no Newspaper written on that number !");
					    return 1;
					}
			        SendClientMessage(playerid, COLOR_WHITE, "|_______________ Role Play - The Godfather: Newspaper _______________|");
			        format(string, sizeof(string), "| %s  |  By News Reporter: %s.",PaperInfo[paper][PaperTitle],PaperInfo[paper][PaperMaker]);
			        SendClientMessage(playerid, COLOR_GREEN, string);
			        format(string, sizeof(string), "%s",PaperInfo[paper][PaperText1]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        format(string, sizeof(string), "%s",PaperInfo[paper][PaperText2]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        format(string, sizeof(string), "%s",PaperInfo[paper][PaperText3]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        format(string, sizeof(string), "%s",PaperInfo[paper][PaperText4]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        format(string, sizeof(string), "%s",PaperInfo[paper][PaperText5]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        format(string, sizeof(string), "%s",PaperInfo[paper][PaperText6]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        format(string, sizeof(string), "%s",PaperInfo[paper][PaperText7]);
			        SendClientMessage(playerid, COLOR_GREY, string);
			        SendClientMessage(playerid, COLOR_WHITE, "|____________________________________________________________________|");
			        return 1;
				}
				else
				{
        			SendClientMessage(playerid, COLOR_GREY, "   You are not a News Reporter !");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /read testpaper [papernr]");
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/deliver", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pJob] == 15 || gTeam[playerid] == 2 || PlayerInfo[playerid][pLeader] == 6 || PlayerInfo[playerid][pLeader] == 10)
	        {
	            if(gTeam[playerid] == 2 || IsACop(playerid))
	            {
	                if(!PlayerToPoint(8.0,playerid,96.9123,1920.5088,18.1473))
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You are not at the Area51 Delivery Gate !");
					    return 1;
					}
					tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
						SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /deliver [playerid/PartOfName]");
						return 1;
					}
			        giveplayerid = ReturnUser(tmp);
					if (IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "   Can't throw yourself into Fort DeMorgan !"); return 1; }
					        if(WantedLevel[giveplayerid] < 1) { SendClientMessage(playerid, COLOR_GREY, "   The player needs at least Wanted Level 1 to be thrown into Fort DeMorgan !"); return 1; }
					        if(gTeam[giveplayerid] == 2 || PlayerInfo[giveplayerid][pLeader] == 6 || PlayerInfo[giveplayerid][pLeader] == 10) { return 1; }
							if (ProxDetectorS(8.0, playerid, giveplayerid))
							{
								GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								format(string, sizeof(string), "* You've brought %s to Fort DeMorgan.", giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* %s brought you to Fort DeMorgan.", sendername);
								SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								GameTextForPlayer(giveplayerid, "~w~Welcome to ~n~~r~Fort DeMorgan", 5000, 3);
								WantedPoints[giveplayerid] = 0;
								WantedLevel[giveplayerid] = 0;
								PlayerInfo[giveplayerid][pJailed] = 2;
								PlayerInfo[giveplayerid][pJailTime] = 3600;
								SetPlayerPos(giveplayerid, 107.2300,1920.6311,18.5208);
								SetPlayerWorldBounds(giveplayerid, 337.5694,101.5826,1940.9759,1798.7453); //285.3481,96.9720,1940.9755,1799.0811
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
					    	return 1;
						}
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}

	            }
	            else if(PlayerInfo[playerid][pJob] == 15)
	            {
			        if(BringingPaper[playerid] != 1)
			        {
			            SendClientMessage(playerid, COLOR_GREY, "   You haven't picked up a Newspaper from the News Reporters Building yet !");
			            return 1;
			        }
			        tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
						SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /deliver [playerid/PartOfName]");
						return 1;
					}
			        giveplayerid = ReturnUser(tmp);
					if (IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
							if (ProxDetectorS(8.0, playerid, giveplayerid))
							{
								GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								format(string, sizeof(string), "* You offerd one of your Newspapers to %s.", giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* Paper Boy %s wants to give you a Newspaper (use /accept paper, to accept).", sendername);
								SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								PaperOffer[giveplayerid] = playerid;
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
					    	return 1;
						}
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not a Paper Boy !");
	            return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/bring", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pJob] != 15)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not a Paper Boy !");
	            return 1;
	        }
			if(PlayerToPoint(3.0,playerid,-2050.8962,460.0262,35.1719))
			{
			    tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /bring [papernr]");
					return 1;
				}
		        new paper = strval(tmp);
		        if(paper < 1 || paper > 10) { SendClientMessage(playerid, COLOR_GREY, "   Paper Number can't be below 1 or above 10 !"); return 1; }
				paper -= 1;
				if(PaperInfo[paper][PaperUsed] == 0)
				{
				    SendClientMessage(playerid, COLOR_GREY, "   There is no written Newspaper on that number !");
				    return 1;
				}
		        GetPlayerName(playerid, sendername, sizeof(sendername));
		        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		        format(string, sizeof(string), "* You can now deliver Newspapers to people, Newspaper: %s, By: %s.",PaperInfo[paper][PaperTitle],PaperInfo[paper][PaperMaker]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "%s", PaperInfo[paper][PaperTitle]);
				strmid(Paper[playerid][pTitle], string, 0, strlen(string), 255);
				format(string, sizeof(string), "%s", PaperInfo[paper][PaperMaker]);
				strmid(Paper[playerid][pMaker], string, 0, strlen(string), 255);
				format(string, sizeof(string), "%s", PaperInfo[paper][PaperText1]);
				strmid(Paper[playerid][pLine1], string, 0, strlen(string), 255);
				format(string, sizeof(string), "%s", PaperInfo[paper][PaperText2]);
				strmid(Paper[playerid][pLine2], string, 0, strlen(string), 255);
				format(string, sizeof(string), "%s", PaperInfo[paper][PaperText3]);
				strmid(Paper[playerid][pLine3], string, 0, strlen(string), 255);
				format(string, sizeof(string), "%s", PaperInfo[paper][PaperText4]);
				strmid(Paper[playerid][pLine4], string, 0, strlen(string), 255);
				format(string, sizeof(string), "%s", PaperInfo[paper][PaperText5]);
				strmid(Paper[playerid][pLine5], string, 0, strlen(string), 255);
				format(string, sizeof(string), "%s", PaperInfo[paper][PaperText6]);
				strmid(Paper[playerid][pLine6], string, 0, strlen(string), 255);
				format(string, sizeof(string), "%s", PaperInfo[paper][PaperText7]);
				strmid(Paper[playerid][pLine7], string, 0, strlen(string), 255);
				BringingPaper[playerid] = 1;
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not at the News Reporter Building !");
			    return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/papers", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pMember] == 9 || PlayerInfo[playerid][pLeader] == 9 || PlayerInfo[playerid][pJob] == 15)
	        {
				if(PlayerToPoint(3.0,playerid,-2050.8962,460.0262,35.1719))
				{
				    new number = 0;
				    for(new i = 0; i < sizeof(PaperInfo); i++)
				    {
				        number ++;
				        if(PaperInfo[i][PaperUsed] == 1)
				    	{
				        	format(string, sizeof(string), "|%d| Newspaper: %s, By: %s",number,PaperInfo[i][PaperTitle],PaperInfo[i][PaperMaker]);
							SendClientMessage(playerid, COLOR_WHITE, string);
						}
				    }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not at the News Reporter Building !");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not a Paper Boy / News Reporter !");
	            return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/paper", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pMember] == 9 || PlayerInfo[playerid][pLeader] == 9)
	        {
	            if(!PlayerToPoint(3.0,playerid,-2050.8962,460.0262,35.1719))
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not at the News Reporter Building !");
				    return 1;
				}
				new x_nr[256];
				x_nr = strtok(cmdtext, idx);
				if(!strlen(x_nr)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /paper write [papernr] or /paper delete [papernr]");
				    return 1;
				}
			    if(strcmp(x_nr,"write",true) == 0)
				{
		            tmp = strtok(cmdtext, idx);
				    if(!strlen(tmp))
					{
					    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /paper write [papernr]");
					    return 1;
					}
					new paper = strval(tmp);
					if(paper < 1 || paper > 10) { SendClientMessage(playerid, COLOR_GREY, "   Paper Number can't be below 1 or above 10 !"); return 1; }
					paper -= 1;
					if(PaperInfo[paper][PaperUsed] == 1)
					{
					    SendClientMessage(playerid, COLOR_GREY, "   There is already a Newspaper on that number !");
					    return 1;
					}
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are producing a new Newspaper.");
					SendClientMessage(playerid, COLOR_LIGHTRED, "* Everything you type now will be added to the Newspaper, you have 7 lines available.");
					SendClientMessage(playerid, COLOR_LIGHTRED, "* Please type in the Title of your Newspaper.");
					WritingPaper[playerid] = 1;
					WritingPaperNumber[playerid] = paper;
					WritingLine[playerid] = 1;
				}
				else if(strcmp(x_nr,"delete",true) == 0)
				{
				    if(PlayerInfo[playerid][pRank] >= 4)
				    {
				        tmp = strtok(cmdtext, idx);
					    if(!strlen(tmp))
						{
						    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /paper delete [papernr]");
						    return 1;
						}
						new paper = strval(tmp);
						if(paper < 1 || paper > 10) { SendClientMessage(playerid, COLOR_GREY, "   Paper Number can't be below 1 or above 10 !"); return 1; }
						paper -= 1;
						ClearPaper(paper);
						new number = paper; number += 1;
						format(string, sizeof(string), "You've deleted Newspaper %d.",number);
						SendClientMessage(playerid, COLOR_YELLOW, string);
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   You need Rank 4 in order to Delete Newspapers !");
				        return 1;
				    }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_WHITE, "USAGE: /paper write [papernr] or /paper delete [papernr]");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not a News Reporter !");
	            return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/spawnchange", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pPhousekey] != 255)
	        {
	            if(Spectate[playerid] != 255 && PlayerInfo[playerid][pAdmin] < 1)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You are Spectating, can't change the Spawn right now !");
	                return 1;
	            }
	            if(SpawnChange[playerid])
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You will now spawn at your Normal Place !");
	                SpawnChange[playerid] = 0;
	                if(IsAnInstructor(playerid))
		            {
		                if(SchoolSpawn[playerid] == 0)
		                {
		                    SchoolSpawn[playerid] = 1;
		                    SendClientMessage(playerid, COLOR_GREY, "   You will now spawn at the Flying School !");
		                }
		                else if(SchoolSpawn[playerid] == 1)
		                {
		                    SchoolSpawn[playerid] = 0;
		                    SendClientMessage(playerid, COLOR_GREY, "   You will now spawn at the Driving School !");
		                }
		            }
	            }
	            else
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You will now spawn at your Own / Rented House !");
	                SpawnChange[playerid] = 1;
	            }
	        }
	        else
	        {
	            if(IsAnInstructor(playerid))
	            {
	                if(SchoolSpawn[playerid] == 0)
	                {
	                    SchoolSpawn[playerid] = 1;
	                    SendClientMessage(playerid, COLOR_GREY, "   You will now spawn at the Flying School !");
	                }
	                else if(SchoolSpawn[playerid] == 1)
	                {
	                    SchoolSpawn[playerid] = 0;
	                    SendClientMessage(playerid, COLOR_GREY, "   You will now spawn at the Driving School !");
	                }
	            }
	            else
	            {
		            SendClientMessage(playerid, COLOR_GREY, "   You dont own / rent a House !");
		            return 1;
	            }
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/report", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /report [text]");
				return 1;
			}
			format(string, sizeof(string), "Report from %s: %s", sendername, (result));
			ABroadCast(COLOR_YELLOW,string,1);
			SendClientMessage(playerid, COLOR_YELLOW, "Your Report Message was sent to the Admins.");
	    }
	    return 1;
	}
	if(strcmp(cmd, "/clothes", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pMember] >= 1)
	        {
	            if(IsAtClothShop(playerid))
				{
				    if(PlayerInfo[playerid][pMember] == 1) { ChosenSkin[playerid] = 280; SetPlayerSkin(playerid, 280); }
					else if(PlayerInfo[playerid][pMember] == 2) { ChosenSkin[playerid] = 286; SetPlayerSkin(playerid, 286); }
					else if(PlayerInfo[playerid][pMember] == 3) { ChosenSkin[playerid] = 287; SetPlayerSkin(playerid, 287); }
					else if(PlayerInfo[playerid][pMember] == 4) { ChosenSkin[playerid] = 70; SetPlayerSkin(playerid, 70); }
					else if(PlayerInfo[playerid][pMember] == 5) { ChosenSkin[playerid] = 258; SetPlayerSkin(playerid, 120); }
					else if(PlayerInfo[playerid][pMember] == 6) { ChosenSkin[playerid] = 120; SetPlayerSkin(playerid, 258); }
					else if(PlayerInfo[playerid][pMember] == 8) { ChosenSkin[playerid] = 127; SetPlayerSkin(playerid, 127); }
					else if(PlayerInfo[playerid][pMember] == 9) { ChosenSkin[playerid] = 148; SetPlayerSkin(playerid, 148); }
					else if(PlayerInfo[playerid][pMember] == 10) { ChosenSkin[playerid] = 255; SetPlayerSkin(playerid, 255); }
					else if(PlayerInfo[playerid][pMember] == 11) { ChosenSkin[playerid] = 59; SetPlayerSkin(playerid, 59); }
					else { return 1; }
					GetPlayerPos(playerid, ChangePos[playerid][0],ChangePos[playerid][1],ChangePos[playerid][2]);
					ChangePos2[playerid][0] = GetPlayerInterior(playerid);
					ChangePos2[playerid][1] = 1;
				    SetPlayerInterior(playerid,0);
					new rand = random(sizeof(gInviteSpawns));
					SetPlayerPos(playerid, gInviteSpawns[rand][0], gInviteSpawns[rand][1], gInviteSpawns[rand][2]); // Warp the player
					SetPlayerFacingAngle(playerid, gInviteSpawns[rand][3]);
					SetPlayerCameraPos(playerid,gInviteSpawns[rand][0] + 3, gInviteSpawns[rand][1], gInviteSpawns[rand][2]);
					SetPlayerCameraLookAt(playerid,gInviteSpawns[rand][0], gInviteSpawns[rand][1], gInviteSpawns[rand][2]);
					TogglePlayerControllable(playerid, 0);
					SelectChar[playerid] = 255;
					SelectCharID[playerid] = PlayerInfo[playerid][pMember];
					SelectCharPlace[playerid] = 1;
					PlayerInfo[playerid][pModel] = ChosenSkin[playerid];
			    	PlayerInfo[playerid][pChar] = ChosenSkin[playerid];
				    SendClientMessage(playerid, COLOR_LIGHTRED, "* Use 'next' to Select the char you want to use.");
				    SendClientMessage(playerid, COLOR_LIGHTRED, "* If you've found the Char you want to use, type 'done'.");
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You are not in a Clothing Shop !");
					return 1;
				}
	        }
	        else
	        {
	            SendClientMessage(playerid,COLOR_GREY, "   You are not in a Force / Organisation !");
	            return 1;
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/lotto", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pLottoNr] > 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You already have a Lottery Ticket !");
	            return 1;
	        }
	        if(GetPlayerMoney(playerid) < 1500)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You need $1500 for a Lottery Ticket !");
	            return 1;
	        }
	        tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_WHITE,"USAGE: /lotto [number]");
				return 1;
			}
			new lottonr = strval(tmp);
			if(lottonr < 1 || lottonr > 80) { SendClientMessage(playerid, COLOR_GREY, "   Lottery Number not below 1 or above 80 !"); return 1; }
			format(string, sizeof(string), "* You bought a Lottery Ticket with number: %d.", lottonr);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			GivePlayerMoney(playerid, - 1500);
			PlayerInfo[playerid][pLottoNr] = lottonr;
	    }
	    return 1;
	}

	if(strcmp(cmd, "/take", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(gTeam[playerid] == 2 || IsACop(playerid))
	        {
	            if(PlayerInfo[playerid][pRank] < 2)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You need to be Rank 2 or Higher for this action !");
	                return 1;
	            }
	            new x_nr[256];
				x_nr = strtok(cmdtext, idx);
				if(!strlen(x_nr)) {
					SendClientMessage(playerid, COLOR_WHITE, "|__________________ Take Licenses __________________|");
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /take [licensename] [playerid/PartOfName]");
			  		SendClientMessage(playerid, COLOR_GREY, "Available names: Driverslicense, Flyinglicense, Boatlicense, Gunlicense, Weapons, Drugs, Materials");
					SendClientMessage(playerid, COLOR_WHITE, "|___________________________________________________|");
					return 1;
				}
			    if(strcmp(x_nr,"driverslicense",true) == 0)
				{
				    tmp = strtok(cmdtext, idx);
					if(!strlen(tmp)) {
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: /take driverslicense [playerid/PartOfName]");
						return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        if (ProxDetectorS(8.0, playerid, giveplayerid))
							{
						        format(string, sizeof(string), "* You have taken away %s's Drivers License.", giveplayer);
						        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						        format(string, sizeof(string), "* Officer %s has taken away your Drivers License.", sendername);
						        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						        PlayerInfo[giveplayerid][pCarLic] = 0;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
							    return 1;
							}
					    }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else if(strcmp(x_nr,"flyinglicense",true) == 0)
				{
				    tmp = strtok(cmdtext, idx);
					if(!strlen(tmp)) {
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: /take flyinglicense [playerid/PartOfName]");
						return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        if (ProxDetectorS(8.0, playerid, giveplayerid))
							{
						        format(string, sizeof(string), "* You have taken away %s's Flying License.", giveplayer);
						        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						        format(string, sizeof(string), "* Officer %s has taken away your Flying License.", sendername);
						        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						        PlayerInfo[giveplayerid][pFlyLic] = 0;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
							    return 1;
							}
					    }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else if(strcmp(x_nr,"gunlicense",true) == 0)
				{
				    tmp = strtok(cmdtext, idx);
					if(!strlen(tmp)) {
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: /take driverslicense [playerid/PartOfName]");
						return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        if (ProxDetectorS(8.0, playerid, giveplayerid))
							{
						        format(string, sizeof(string), "* You have taken away %s's Weapon License.", giveplayer);
						        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						        format(string, sizeof(string), "* Officer %s has taken away your Weapon License.", sendername);
						        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						        PlayerInfo[giveplayerid][pGunLic] = 0;
					        }
					        else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
							    return 1;
							}
					    }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else if(strcmp(x_nr,"boatlicense",true) == 0)
				{
				    tmp = strtok(cmdtext, idx);
					if(!strlen(tmp)) {
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: /take boatlicense [playerid/PartOfName]");
						return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        if (ProxDetectorS(8.0, playerid, giveplayerid))
							{
						        format(string, sizeof(string), "* You have taken away %s's Boat License.", giveplayer);
						        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						        format(string, sizeof(string), "* Officer %s has taken away your Boat License.", sendername);
						        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						        PlayerInfo[giveplayerid][pBoatLic] = 0;
					        }
					        else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
							    return 1;
							}
					    }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else if(strcmp(x_nr,"weapons",true) == 0)
				{
				    tmp = strtok(cmdtext, idx);
					if(!strlen(tmp)) {
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: /take weapons [playerid/PartOfName]");
						return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        if (ProxDetectorS(8.0, playerid, giveplayerid))
							{
						        format(string, sizeof(string), "* You have taken away %s's Weapons.", giveplayer);
						        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						        format(string, sizeof(string), "* Officer %s has taken away your Weapons.", sendername);
						        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						        ResetPlayerWeapons(giveplayerid);
						        PlayerInfo[giveplayerid][pGun1] = 0; PlayerInfo[giveplayerid][pAmmo1] = 0;
						        PlayerInfo[giveplayerid][pGun2] = 0; PlayerInfo[giveplayerid][pAmmo2] = 0;
						        PlayerInfo[giveplayerid][pGun3] = 0; PlayerInfo[giveplayerid][pAmmo3] = 0;
						        PlayerInfo[giveplayerid][pGun4] = 0; PlayerInfo[giveplayerid][pAmmo4] = 0;
					        }
					        else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
							    return 1;
							}
					    }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else if(strcmp(x_nr,"drugs",true) == 0)
				{
				    tmp = strtok(cmdtext, idx);
					if(!strlen(tmp)) {
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: /take drugs [playerid/PartOfName]");
						return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        if (ProxDetectorS(8.0, playerid, giveplayerid))
							{
							    format(string, sizeof(string), "* You have taken away %s's Drugs.", giveplayer);
						        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						        format(string, sizeof(string), "* Officer %s has taken away your Drugs.", sendername);
						        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						        PlayerInfo[giveplayerid][pDrugs] = 0;
							}
					        else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
							    return 1;
							}
					    }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else if(strcmp(x_nr,"materials",true) == 0)
				{
				    tmp = strtok(cmdtext, idx);
					if(!strlen(tmp)) {
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: /take materials [playerid/PartOfName]");
						return 1;
					}
					giveplayerid = ReturnUser(tmp);
					if(IsPlayerConnected(giveplayerid))
					{
					    if(giveplayerid != INVALID_PLAYER_ID)
					    {
					        if (ProxDetectorS(8.0, playerid, giveplayerid))
							{
							    format(string, sizeof(string), "* You have taken away %s's Materials.", giveplayer);
						        SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						        format(string, sizeof(string), "* Officer %s as taken away your Materials.", sendername);
						        SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						        PlayerInfo[giveplayerid][pMats] = 0;
							}
					        else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
							    return 1;
							}
					    }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
					    return 1;
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GREY, "   Unknown Take name !");
					return 1;
				}
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not a Cop !");
	            return 1;
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/drink", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(IsAtBar(playerid))
	        {
	            if(PlayerDrunk[playerid] < 10)
	            {
	                new Float:health;
	                new x_nr[256];
					x_nr = strtok(cmdtext, idx);
					if(!strlen(x_nr)) {
						SendClientMessage(playerid, COLOR_WHITE, "|__________________ Bar Drinks __________________|");
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: /drink [drinkname]");
				  		SendClientMessage(playerid, COLOR_GREY, "Available names: Beer ($6), Vodka ($10), Whiskey ($10), Water ($2), Soda($2)");
						SendClientMessage(playerid, COLOR_WHITE, "|________________________________________________|");
						return 1;
					}
				    if(strcmp(x_nr,"beer",true) == 0)
					{
						if(PlayerInfo[playerid][pAge] < 16)
						{
						    SendClientMessage(playerid, COLOR_WHITE, "Bartender: Sorry, you need to be 16 years to get this drink.");
						    return 1;
						}
					    GivePlayerMoney(playerid, - 6);
					    PlayerDrunk[playerid] += 1;
						if(PlayerDrunk[playerid] >= 5) { GameTextForPlayer(playerid, "~w~You are~n~~p~Drunk", 3500, 1); }
						if(GetPlayerHealth(playerid, health) < 100)
						{
						    if(PlayerInfo[playerid][pAlcoholPerk] > 0) { PlayerDrunk[playerid] += 1; new hp = 2 * PlayerInfo[playerid][pAlcoholPerk]; hp += 15; SetPlayerHealth(playerid, health + hp); }
							else { SetPlayerHealth(playerid, health + 15.0); }
						}
					}
					else if(strcmp(x_nr,"vodka",true) == 0)
					{
					    if(PlayerInfo[playerid][pAge] < 18)
						{
						    SendClientMessage(playerid, COLOR_WHITE, "Bartender: Sorry, you need to be 16 years to get this drink.");
						    return 1;
						}
					    GivePlayerMoney(playerid, - 10);
					    PlayerDrunk[playerid] += 2;
						if(PlayerDrunk[playerid] >= 5) { GameTextForPlayer(playerid, "~w~You are~n~~p~Drunk", 3500, 1); }
						if(GetPlayerHealth(playerid, health) < 100)
						{
						    if(PlayerInfo[playerid][pAlcoholPerk] > 0) { PlayerDrunk[playerid] += 1; new hp = 2 * PlayerInfo[playerid][pAlcoholPerk]; hp += 25; SetPlayerHealth(playerid, health + hp); }
							else { SetPlayerHealth(playerid, health + 25.0); }
						}
					}
					else if(strcmp(x_nr,"whiskey",true) == 0)
					{
					    if(PlayerInfo[playerid][pAge] < 18)
						{
						    SendClientMessage(playerid, COLOR_WHITE, "Bartender: Sorry, you need to be 16 years to get this drink.");
						    return 1;
						}
					    GivePlayerMoney(playerid, - 10);
					    PlayerDrunk[playerid] += 3;
						if(PlayerDrunk[playerid] >= 5) { GameTextForPlayer(playerid, "~w~You are~n~~p~Drunk", 3500, 1); }
						if(GetPlayerHealth(playerid, health) < 100)
						{
						    if(PlayerInfo[playerid][pAlcoholPerk] > 0) { PlayerDrunk[playerid] += 1; new hp = 2 * PlayerInfo[playerid][pAlcoholPerk]; hp += 27; SetPlayerHealth(playerid, health + hp); }
							else { SetPlayerHealth(playerid, health + 27.0); }
						}
					}
					else if(strcmp(x_nr,"water",true) == 0)
					{
					    GivePlayerMoney(playerid, - 2);
					    if(GetPlayerHealth(playerid, health) < 100)
						{
						    if(PlayerInfo[playerid][pAlcoholPerk] > 0) { new hp = 2 * PlayerInfo[playerid][pAlcoholPerk]; hp += 5; SetPlayerHealth(playerid, health + hp); }
							else { SetPlayerHealth(playerid, health + 5.0); }
						}
					}
					else if(strcmp(x_nr,"soda",true) == 0)
					{
					    GivePlayerMoney(playerid, - 2);
					    if(GetPlayerHealth(playerid, health) < 100)
						{
						    if(PlayerInfo[playerid][pAlcoholPerk] > 0) { new hp = 2 * PlayerInfo[playerid][pAlcoholPerk]; hp += 5; SetPlayerHealth(playerid, health + hp); }
							else { SetPlayerHealth(playerid, health + 5.0); }
						}
					}
					else
					{
					    SendClientMessage(playerid, COLOR_WHITE, "Bartender: I don't know that Drink Name.");
					    return 1;
					}
					GetPlayerName(playerid, sendername, sizeof(sendername));
					format(string, sizeof(string), "* %s drinks a %s.", sendername ,x_nr);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	            }
	            else
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You can't drink anymore, you will throw up !");
	                return 1;
	            }
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not at a Bar !");
	            return 1;
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd, "/setchamp", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pAdmin] >= 4)
	        {
	            tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /setchamp [playerid/PartOfName]");
					return 1;
				}
				//giveplayerid = strval(tmp);
		        giveplayerid = ReturnUser(tmp);
		        if(IsPlayerConnected(giveplayerid))
		        {
		            if(giveplayerid != INVALID_PLAYER_ID)
		            {
		                GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
		                new nstring[MAX_PLAYER_NAME];
						format(nstring, sizeof(nstring), "%s", giveplayer);
						strmid(Titel[TitelName], nstring, 0, strlen(nstring), 255);
						Titel[TitelWins] = PlayerInfo[giveplayerid][pWins];
						Titel[TitelLoses] = PlayerInfo[giveplayerid][pLoses];
						SaveBoxer();
						format(string, sizeof(string), "* You have made %s the new Boxing Champion.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		            }
		        }
		        else
		        {
		            SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
		            return 1;
		        }
	        }
			else
			{
				SendClientMessage(playerid, COLOR_GRAD1, "   you are not authorized to use that command!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/boxstats", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pJob] != 12)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not a Boxer !");
	            return 1;
	        }
	        new ttext[20];//Title
	        new clevel = PlayerInfo[playerid][pBoxSkill];
			if(clevel >= 0 && clevel <= 50) { ttext = "Beginner"; }
			else if(clevel >= 51 && clevel <= 200) { ttext = "Amateur"; }
			else if(clevel >= 201 && clevel <= 400) { ttext = "Professional"; }
	        new ntext[20];//NickName
	        new level = PlayerInfo[playerid][pWins];
	        if(level > 0 && PlayerInfo[playerid][pLoses] == 0)
	        {
	            ntext = "Undefeated";
	        }
	        else
	        {
	            if(level >= 0 && level <= 10) { ntext = "Newcomer"; }
	            else if(level >= 11 && level <= 20) { ntext = "Touchy Fist"; }
	            else if(level >= 21 && level <= 30) { ntext = "Nut Cracker"; }
	            else if(level >= 31 && level <= 40) { ntext = "Tommygun"; }
	            else if(level >= 41 && level <= 50) { ntext = "Skull Breaker"; }
	            else if(level >= 51 && level <= 60) { ntext = "Light Speed"; }
	            else if(level >= 61 && level <= 70) { ntext = "Unbroken Warrior"; }
	            else if(level >= 71) { ntext = "Itallion Stallion"; }
	        }
	        SendClientMessage(playerid, COLOR_WHITE, "|__________________ Boxing Records __________________|");
	        format(string, sizeof(string), "| Current Champion: %s, with [%d] Winnings and [%d] Losses.", Titel[TitelName],Titel[TitelWins],Titel[TitelLoses]);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "| Current Title: %s.", ttext);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "| Current NickName: %s.", ntext);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "| Total Wins: %d.", PlayerInfo[playerid][pWins]);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "| Total Losses: %d.", PlayerInfo[playerid][pLoses]);
			SendClientMessage(playerid, COLOR_GREY, string);
	        SendClientMessage(playerid, COLOR_WHITE, "|____________________________________________________|");
		}
		return 1;
	}
	if(strcmp(cmd, "/fight", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pJob] != 12)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not a Boxer !");
	            return 1;
	        }
	        if(InRing > 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   There is already a Fight going on, wait for it to Finish !");
	            return 1;
	        }
	        if(PlayerBoxing[playerid] > 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are already Fighting !");
	            return 1;
	        }
	        if(!PlayerToPoint(20.0,playerid,765.9343,0.2761,1000.7173))
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not at the Grove Street Gym !");
	            return 1;
	        }
	        tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /fight [Playerid/PartOfName]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
		    if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if (ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Box with yourself!"); return 1; }
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "* You offerd a Boxing Challenge to %s.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Boxer %s wants to Fight with you (type /accept boxing) to accept.", sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
				        BoxOffer[giveplayerid] = playerid;
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
						return 1;
					}
			    }
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
			    return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/music", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pCDPlayer])
	        {
		        new x_nr[256];
				x_nr = strtok(cmdtext, idx);
				if(!strlen(x_nr)) {
					SendClientMessage(playerid, COLOR_WHITE, "|__________________ Music __________________|");
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /music [name]");
			  		SendClientMessage(playerid, COLOR_GREY, "Available names: On, Off, Next");
					SendClientMessage(playerid, COLOR_WHITE, "|___________________________________________|");
					return 1;
				}
			    if(strcmp(x_nr,"on",true) == 0)
				{
				    GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~g~CD Player On", 5000, 5);
				    new channel = Music[playerid];
				    PlayerPlaySound(playerid, Songs[channel][0], 0.0, 0.0, 0.0);
				}
	            else if(strcmp(x_nr,"off",true) == 0)
				{
				    GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~r~CD Player Off", 5000, 5);
				    PlayerFixRadio(playerid);
				}
				else if(strcmp(x_nr,"next",true) == 0)
				{
				    if(Music[playerid] == 0) { Music[playerid] = 1; }
				    else if(Music[playerid] == 1) { Music[playerid] = 2; }
				    else if(Music[playerid] == 2) { Music[playerid] = 3; }
				    else if(Music[playerid] == 3) { Music[playerid] = 4; }
				    else if(Music[playerid] == 4) { Music[playerid] = 5; }
				    else if(Music[playerid] == 5) { Music[playerid] = 6; }
				    else if(Music[playerid] == 6) { Music[playerid] = 0; }
				    new channel = Music[playerid];
				    PlayerPlaySound(playerid, Songs[channel][0], 0.0, 0.0, 0.0);
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Unknown music command !");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You don't have a CD-Player !");
			    return 1;
			}
	    }
	    return 1;
	}
	if(strcmp(cmd, "/service", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new x_nr[256];
			x_nr = strtok(cmdtext, idx);
			if(!strlen(x_nr)) {
				SendClientMessage(playerid, COLOR_WHITE, "|__________________ Service Names __________________|");
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /service [name]");
		  		SendClientMessage(playerid, COLOR_GREY, "Available names: Taxi, Bus, Medic, Mechanic");
				SendClientMessage(playerid, COLOR_WHITE, "|________________________________________________|");
				return 1;
			}
		    if(strcmp(x_nr,"taxi",true) == 0)
			{
			    if(TaxiDrivers < 1)
		        {
		            SendClientMessage(playerid, COLOR_GREY, "   There are no Taxi Drivers On Duty at the moment, try again later !");
		            return 1;
		        }
		        if(TransportDuty[playerid] > 0)
		        {
		            SendClientMessage(playerid, COLOR_GREY, "   You can't call for a Taxi now !");
		            return 1;
		        }
		        GetPlayerName(playerid, sendername, sizeof(sendername));
			    format(string, sizeof(string), "** %s is in need of a Taxi Driver. (use /accept taxi to accept the call)", sendername);
		    	SendFamilyMessage(10, TEAM_AZTECAS_COLOR, string);
		    	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have called for a Taxi Driver, wait for a reply.");
		    	TaxiCall = playerid;
		    	return 1;
			}
			else if(strcmp(x_nr,"bus",true) == 0)
			{
			    if(BusDrivers < 1)
		        {
		            SendClientMessage(playerid, COLOR_GREY, "   There are no Bus Drivers On Duty at the moment, try again later !");
		            return 1;
		        }
		        if(TransportDuty[playerid] > 0)
		        {
		            SendClientMessage(playerid, COLOR_GREY, "   You can't call for a Bus now !");
		            return 1;
		        }
		        GetPlayerName(playerid, sendername, sizeof(sendername));
			    format(string, sizeof(string), "** %s is in need of a Bus Driver. (use /accept bus to accept the call)", sendername);
		    	SendJobMessage(14, TEAM_AZTECAS_COLOR, string);
		    	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have called for a Bus Driver, wait for a reply.");
		    	BusCall = playerid;
		    	return 1;
			}
			else if(strcmp(x_nr,"medic",true) == 0)
			{
			    if(Medics < 1)
		        {
		            SendClientMessage(playerid, COLOR_GREY, "   There are no Medics On Duty at the moment, try again later !");
		            return 1;
		        }
		        GetPlayerName(playerid, sendername, sizeof(sendername));
			    format(string, sizeof(string), "** %s is in need of a Medic. (use /accept medic to accept the call)", sendername);
		    	SendRadioMessage(4, TEAM_AZTECAS_COLOR, string);
		    	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have called for a Medic, wait for a reply.");
		    	MedicCall = playerid;
		    	return 1;
			}
			else if(strcmp(x_nr,"mechanic",true) == 0)
			{
			    if(Mechanics < 1)
		        {
		            SendClientMessage(playerid, COLOR_GREY, "   There are no Car Mechanics On Duty at the moment, try again later !");
		            return 1;
		        }
		        GetPlayerName(playerid, sendername, sizeof(sendername));
			    format(string, sizeof(string), "** %s is in need of a Car Mechanic. (use /accept mechanic to accept the call)", sendername);
		    	SendJobMessage(7, TEAM_AZTECAS_COLOR, string);
		    	SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have called for a Car Mechanic, wait for a reply.");
		    	MechanicCall = playerid;
		    	return 1;
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   Unknown service name !");
			    return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/tie", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(IsAMember(playerid) || PlayerInfo[playerid][pFMember] < 255)
			{
			    if(PlayerInfo[playerid][pRank] < 3)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You need Rank 3 or higher to tie people up !");
			        return 1;
			    }
			    tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /tie [Playerid/PartOfName]");
					return 1;
				}
				giveplayerid = ReturnUser(tmp);
			    if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
					    if(PlayerTied[giveplayerid] > 0)
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   Player already Tied !");
					        return 1;
					    }
						if (ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    new car = GetPlayerVehicleID(playerid);
						    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Tie up yourself!"); return 1; }
						    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == 2 && IsPlayerInVehicle(giveplayerid, car))
						    {
						        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
						        format(string, sizeof(string), "* You were tied up by %s, till untie.", sendername);
								SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* You tied %s up, till untie.", giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* %s ties %s up, so he wont go anywhere.", sendername ,giveplayer);
								ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								GameTextForPlayer(giveplayerid, "~r~Tied", 2500, 3);
								TogglePlayerControllable(giveplayerid, 0);
								PlayerTied[giveplayerid] = 1;
						    }
						    else
						    {
						        SendClientMessage(playerid, COLOR_GREY, "   Player not in your Car, or your not the Driver !");
						        return 1;
						    }
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
						    return 1;
						}
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
				    return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "   You are not a Family Member / Leader !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/untie", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(IsAMember(playerid) || PlayerInfo[playerid][pFMember] < 255)
			{
			    if(PlayerInfo[playerid][pRank] < 3)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You need Rank 3 or higher to untie people !");
			        return 1;
			    }
			    tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /untie [Playerid/PartOfName]");
					return 1;
				}
				giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
					if(giveplayerid != INVALID_PLAYER_ID)
					{
					    if (ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Untie yourself!"); return 1; }
							if(PlayerTied[giveplayerid])
							{
							    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
							    format(string, sizeof(string), "* You were Untied by %s.", sendername);
								SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* You Untied %s.", giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								GameTextForPlayer(giveplayerid, "~g~Untied", 2500, 3);
								TogglePlayerControllable(giveplayerid, 1);
								PlayerTied[giveplayerid] = 0;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   That player isn't Tied up !");
							    return 1;
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
						    return 1;
						}
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
				    return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "   You are not a Family Member / Leader !");
			}
		}//not connected
		return 1;
	}
	if(strcmp(cmd, "/sell", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			new x_nr[256];
			x_nr = strtok(cmdtext, idx);
			if(!strlen(x_nr)) {
				SendClientMessage(playerid, COLOR_WHITE, "|__________________ Selling __________________|");
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /sell [name]");
		  		SendClientMessage(playerid, COLOR_GREY, "Available names: Fish, Cooked");
				SendClientMessage(playerid, COLOR_WHITE, "|_____________________________________________|");
				return 1;
			}
		    if(strcmp(x_nr,"fish",true) == 0)
			{
			    if (!PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53))//centerpoint 24-7
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You are not in a 24-7 !");
					return 1;
				}
			    tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /sell fish [fish]");
					return 1;
				}
				new price;
				new fishid = strval(tmp);
				if(fishid < 1 || fishid > 5) { SendClientMessage(playerid, COLOR_GREY, "   Fish number cant be below 1 or above 5 !"); return 1; }
				else if(fishid == 1 && Fishes[playerid][pWeight1] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(1) !"); return 1; }
				else if(fishid == 2 && Fishes[playerid][pWeight2] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(2) !"); return 1; }
				else if(fishid == 3 && Fishes[playerid][pWeight3] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(3) !"); return 1; }
				else if(fishid == 4 && Fishes[playerid][pWeight4] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(4) !"); return 1; }
				else if(fishid == 5 && Fishes[playerid][pWeight5] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(5) !"); return 1; }
				ConsumingMoney[playerid] = 1;
				switch (fishid)
				{
				    case 1:
				    {
				        if(Fishes[playerid][pWeight1] < 20)
				        {
				            SendClientMessage(playerid, COLOR_WHITE, "We are only interested in Fishes weighting 20 LBS or more.");
				            return 1;
				        }
                        price = FishCost(playerid, Fishes[playerid][pFid1]);
                        price = price * Fishes[playerid][pWeight1];
                        if(PlayerInfo[playerid][pTraderPerk] > 0)
				        {
				            new skill = price / 100;
				            new payout = (skill)*(5);
				            price += payout;
				        }
                        GameTextForPlayer(playerid, "~g~Fish~n~~r~Sold", 3000, 1);
                        format(string, sizeof(string), "* You have sold your %s that weights %d, for $%d.", Fishes[playerid][pFish1],Fishes[playerid][pWeight1],price);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						GivePlayerMoney(playerid, price);
						ClearFishID(playerid, 1);
				    }
				    case 2:
				    {
				        if(Fishes[playerid][pWeight2] < 20)
				        {
				            SendClientMessage(playerid, COLOR_WHITE, "We are only interested in Fishes weighting 20 LBS or more.");
				            return 1;
				        }
            			price = FishCost(playerid, Fishes[playerid][pFid2]);
                        price = price * Fishes[playerid][pWeight2];
                        if(PlayerInfo[playerid][pTraderPerk] > 0)
				        {
				            new skill = price / 100;
				            new payout = (skill)*(5);
				            price += payout;
				        }
                        GameTextForPlayer(playerid, "~g~Fish~n~~r~Sold", 3000, 1);
                        format(string, sizeof(string), "* You have sold your %s that weights %d, for $%d.", Fishes[playerid][pFish2],Fishes[playerid][pWeight2],price);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						GivePlayerMoney(playerid, price);
						ClearFishID(playerid, 2);
				    }
				    case 3:
				    {
				        if(Fishes[playerid][pWeight3] < 20)
				        {
				            SendClientMessage(playerid, COLOR_WHITE, "We are only interested in Fishes weighting 20 LBS or more.");
				            return 1;
				        }
            			price = FishCost(playerid, Fishes[playerid][pFid3]);
                        price = price * Fishes[playerid][pWeight3];
                        if(PlayerInfo[playerid][pTraderPerk] > 0)
				        {
				            new skill = price / 100;
				            new payout = (skill)*(5);
				            price += payout;
				        }
                        GameTextForPlayer(playerid, "~g~Fish~n~~r~Sold", 3000, 1);
                        format(string, sizeof(string), "* You have sold your %s that weights %d, for $%d.", Fishes[playerid][pFish3],Fishes[playerid][pWeight3],price);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						GivePlayerMoney(playerid, price);
						ClearFishID(playerid, 3);
				    }
				    case 4:
				    {
				        if(Fishes[playerid][pWeight4] < 20)
				        {
				            SendClientMessage(playerid, COLOR_WHITE, "We are only interested in Fishes weighting 20 LBS or more.");
				            return 1;
				        }
            			price = FishCost(playerid, Fishes[playerid][pFid4]);
                        price = price * Fishes[playerid][pWeight4];
                        if(PlayerInfo[playerid][pTraderPerk] > 0)
				        {
				            new skill = price / 100;
				            new payout = (skill)*(5);
				            price += payout;
				        }
                        GameTextForPlayer(playerid, "~g~Fish~n~~r~Sold", 3000, 1);
                        format(string, sizeof(string), "* You have sold your %s that weights %d, for $%d.", Fishes[playerid][pFish4],Fishes[playerid][pWeight4],price);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						GivePlayerMoney(playerid, price);
						ClearFishID(playerid, 4);
				    }
				    case 5:
				    {
				        if(Fishes[playerid][pWeight5] < 20)
				        {
				            SendClientMessage(playerid, COLOR_WHITE, "We are only interested in Fishes weighting 20 LBS or more.");
				            return 1;
				        }
            			price = FishCost(playerid, Fishes[playerid][pFid5]);
                        price = price * Fishes[playerid][pWeight5];
                        if(PlayerInfo[playerid][pTraderPerk] > 0)
				        {
				            new skill = price / 100;
				            new payout = (skill)*(5);
				            price += payout;
				        }
                        GameTextForPlayer(playerid, "~g~Fish~n~~r~Sold", 3000, 1);
                        format(string, sizeof(string), "* You have sold your %s that weights %d, for $%d.", Fishes[playerid][pFish5],Fishes[playerid][pWeight5],price);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						GivePlayerMoney(playerid, price);
						ClearFishID(playerid, 5);
				    }
				}
				Fishes[playerid][pLastFish] = 0;
				Fishes[playerid][pFishID] = 0;
				return 1;
			}
			else if(strcmp(x_nr,"cooked",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
			    if(!strlen(tmp)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /sell cooked [cooknumber] [playerid/PartOfName]");
					return 1;
				}
				new cookid = strval(tmp);
				if(cookid < 1 || cookid > 5) { SendClientMessage(playerid, COLOR_GREY, "   Cook number cant be below 1 or above 5 !"); return 1; }
				else if(cookid == 1 && Cooking[playerid][pCWeight1] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even Cook something at that number(1) !"); return 1; }
				else if(cookid == 2 && Cooking[playerid][pCWeight2] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even Cook something at that number(2) !"); return 1; }
				else if(cookid == 3 && Cooking[playerid][pCWeight3] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even Cook something at that number(3) !"); return 1; }
				else if(cookid == 4 && Cooking[playerid][pCWeight4] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even Cook something at that number(4) !"); return 1; }
				else if(cookid == 5 && Cooking[playerid][pCWeight5] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even Cook something at that number(5) !"); return 1; }
				tmp = strtok(cmdtext, idx);
			    if(!strlen(tmp)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /sell cooked [cooknumber] [playerid/PartOfName]");
					return 1;
				}
				giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
				        switch(cookid)
				        {
							case 1:
							{
							    if(Cooking[giveplayerid][pCWeight1] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook1]);
								    strmid(Cooking[giveplayerid][pCook1], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight1] = Cooking[playerid][pCWeight1];
								    Cooking[giveplayerid][pCookID1] = Cooking[playerid][pCookID1];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook1],Cooking[giveplayerid][pCWeight1]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight2] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook1]);
								    strmid(Cooking[giveplayerid][pCook2], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight2] = Cooking[playerid][pCWeight1];
								    Cooking[giveplayerid][pCookID2] = Cooking[playerid][pCookID1];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook2],Cooking[giveplayerid][pCWeight2]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight3] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook1]);
								    strmid(Cooking[giveplayerid][pCook3], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight3] = Cooking[playerid][pCWeight1];
								    Cooking[giveplayerid][pCookID3] = Cooking[playerid][pCookID1];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook3],Cooking[giveplayerid][pCWeight3]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight4] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook1]);
								    strmid(Cooking[giveplayerid][pCook4], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight4] = Cooking[playerid][pCWeight1];
								    Cooking[giveplayerid][pCookID4] = Cooking[playerid][pCookID1];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook4],Cooking[giveplayerid][pCWeight4]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight5] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook1]);
								    strmid(Cooking[giveplayerid][pCook5], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight5] = Cooking[playerid][pCWeight1];
								    Cooking[giveplayerid][pCookID5] = Cooking[playerid][pCookID1];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook5],Cooking[giveplayerid][pCWeight5]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else
							    {
							        SendClientMessage(playerid, COLOR_GREY, "   That player has no space left in his Cooking List !");
							        return 1;
							    }
							}
							case 2:
							{
							    if(Cooking[giveplayerid][pCWeight1] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook2]);
								    strmid(Cooking[giveplayerid][pCook1], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight1] = Cooking[playerid][pCWeight2];
								    Cooking[giveplayerid][pCookID1] = Cooking[playerid][pCookID2];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook1],Cooking[giveplayerid][pCWeight1]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight2] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook2]);
								    strmid(Cooking[giveplayerid][pCook2], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight2] = Cooking[playerid][pCWeight2];
								    Cooking[giveplayerid][pCookID2] = Cooking[playerid][pCookID2];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook2],Cooking[giveplayerid][pCWeight2]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight3] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook2]);
								    strmid(Cooking[giveplayerid][pCook3], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight3] = Cooking[playerid][pCWeight2];
								    Cooking[giveplayerid][pCookID3] = Cooking[playerid][pCookID2];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook3],Cooking[giveplayerid][pCWeight3]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight4] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook2]);
								    strmid(Cooking[giveplayerid][pCook4], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight4] = Cooking[playerid][pCWeight2];
								    Cooking[giveplayerid][pCookID4] = Cooking[playerid][pCookID2];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook4],Cooking[giveplayerid][pCWeight4]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight5] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook2]);
								    strmid(Cooking[giveplayerid][pCook5], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight5] = Cooking[playerid][pCWeight2];
								    Cooking[giveplayerid][pCookID5] = Cooking[playerid][pCookID2];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook5],Cooking[giveplayerid][pCWeight5]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else
							    {
							        SendClientMessage(playerid, COLOR_GREY, "   That player has no space left in his Cooking List !");
							        return 1;
							    }
							}
							case 3:
							{
							    if(Cooking[giveplayerid][pCWeight1] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook3]);
								    strmid(Cooking[giveplayerid][pCook1], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight1] = Cooking[playerid][pCWeight3];
								    Cooking[giveplayerid][pCookID1] = Cooking[playerid][pCookID3];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook1],Cooking[giveplayerid][pCWeight1]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight2] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook3]);
								    strmid(Cooking[giveplayerid][pCook2], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight2] = Cooking[playerid][pCWeight3];
								    Cooking[giveplayerid][pCookID2] = Cooking[playerid][pCookID3];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook2],Cooking[giveplayerid][pCWeight2]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight3] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook3]);
								    strmid(Cooking[giveplayerid][pCook3], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight3] = Cooking[playerid][pCWeight3];
								    Cooking[giveplayerid][pCookID3] = Cooking[playerid][pCookID3];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook3],Cooking[giveplayerid][pCWeight3]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight4] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook3]);
								    strmid(Cooking[giveplayerid][pCook4], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight4] = Cooking[playerid][pCWeight3];
								    Cooking[giveplayerid][pCookID4] = Cooking[playerid][pCookID3];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook4],Cooking[giveplayerid][pCWeight4]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight5] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook3]);
								    strmid(Cooking[giveplayerid][pCook5], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight5] = Cooking[playerid][pCWeight3];
								    Cooking[giveplayerid][pCookID5] = Cooking[playerid][pCookID3];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook5],Cooking[giveplayerid][pCWeight5]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else
							    {
							        SendClientMessage(playerid, COLOR_GREY, "   That player has no space left in his Cooking List !");
							        return 1;
							    }
							}
							case 4:
							{
							    if(Cooking[giveplayerid][pCWeight1] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook4]);
								    strmid(Cooking[giveplayerid][pCook1], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight1] = Cooking[playerid][pCWeight4];
								    Cooking[giveplayerid][pCookID1] = Cooking[playerid][pCookID4];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook1],Cooking[giveplayerid][pCWeight1]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight2] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook4]);
								    strmid(Cooking[giveplayerid][pCook2], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight2] = Cooking[playerid][pCWeight4];
								    Cooking[giveplayerid][pCookID2] = Cooking[playerid][pCookID4];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook2],Cooking[giveplayerid][pCWeight2]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight3] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook4]);
								    strmid(Cooking[giveplayerid][pCook3], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight3] = Cooking[playerid][pCWeight4];
								    Cooking[giveplayerid][pCookID3] = Cooking[playerid][pCookID4];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook3],Cooking[giveplayerid][pCWeight3]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight4] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook4]);
								    strmid(Cooking[giveplayerid][pCook4], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight4] = Cooking[playerid][pCWeight4];
								    Cooking[giveplayerid][pCookID4] = Cooking[playerid][pCookID4];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook4],Cooking[giveplayerid][pCWeight4]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight5] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook4]);
								    strmid(Cooking[giveplayerid][pCook5], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight5] = Cooking[playerid][pCWeight4];
								    Cooking[giveplayerid][pCookID5] = Cooking[playerid][pCookID4];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook5],Cooking[giveplayerid][pCWeight5]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else
							    {
							        SendClientMessage(playerid, COLOR_GREY, "   That player has no space left in his Cooking List !");
							        return 1;
							    }
							}
							case 5:
							{
							    if(Cooking[giveplayerid][pCWeight1] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook5]);
								    strmid(Cooking[giveplayerid][pCook1], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight1] = Cooking[playerid][pCWeight5];
								    Cooking[giveplayerid][pCookID1] = Cooking[playerid][pCookID5];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook1],Cooking[giveplayerid][pCWeight1]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight2] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook5]);
								    strmid(Cooking[giveplayerid][pCook2], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight2] = Cooking[playerid][pCWeight5];
								    Cooking[giveplayerid][pCookID2] = Cooking[playerid][pCookID5];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook2],Cooking[giveplayerid][pCWeight2]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight3] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook5]);
								    strmid(Cooking[giveplayerid][pCook3], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight3] = Cooking[playerid][pCWeight5];
								    Cooking[giveplayerid][pCookID3] = Cooking[playerid][pCookID5];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook3],Cooking[giveplayerid][pCWeight3]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight4] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook5]);
								    strmid(Cooking[giveplayerid][pCook4], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight4] = Cooking[playerid][pCWeight5];
								    Cooking[giveplayerid][pCookID4] = Cooking[playerid][pCookID5];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook4],Cooking[giveplayerid][pCWeight4]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else if(Cooking[giveplayerid][pCWeight5] < 1)
							    {
							        format(string, sizeof(string), "%s", Cooking[playerid][pCook5]);
								    strmid(Cooking[giveplayerid][pCook5], string, 0, strlen(string), 255);
								    Cooking[giveplayerid][pCWeight5] = Cooking[playerid][pCWeight5];
								    Cooking[giveplayerid][pCookID5] = Cooking[playerid][pCookID5];
								    format(string, sizeof(string), "* %s has given you %s weighting %d (use /cooked to see it).",sendername,Cooking[giveplayerid][pCook5],Cooking[giveplayerid][pCWeight5]);
								    SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								    format(string, sizeof(string), "* You gave %s weighting %d to %s.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5],giveplayer);
								    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							    }
							    else
							    {
							        SendClientMessage(playerid, COLOR_GREY, "   That player has no space left in his Cooking List !");
							        return 1;
							    }
							}
				        }//switch
				        ClearCookingID(playerid, cookid);
				    }//invalid giveplayerid
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   Unknown Selling Name !");
			    return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd,"/fare",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pMember] == 10||PlayerInfo[playerid][pLeader] == 10|| PlayerInfo[playerid][pJob] == 14)
			{
				if(TransportDuty[playerid] > 0)
				{
				    if(TransportDuty[playerid] == 1)
				    {
				        TaxiDrivers -= 1;
				    }
				    else if(TransportDuty[playerid] == 2)
				    {
				        BusDrivers -= 1;
				    }
				    TransportDuty[playerid] = 0;
					format(string, sizeof(string), "* You are now Off Duty and earned $%d.", TransportMoney[playerid]);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					GivePlayerMoney(playerid, TransportMoney[playerid]);
					ConsumingMoney[playerid] = 1; TransportValue[playerid] = 0; TransportMoney[playerid] = 0;
					return 1;
				}
				new Veh = GetPlayerVehicleID(playerid);
				if(Veh == 82 || Veh == 84 || Veh == 85 || Veh == 94)
				{
				    if(GetPlayerState(playerid) == 2)
				    {
					    tmp = strtok(cmdtext, idx);
						if(!strlen(tmp))
						{
							SendClientMessage(playerid, COLOR_WHITE, "USAGE: /fare [price]");
							return 1;
						}
						moneys = strval(tmp);
						if(moneys < 1 || moneys > 999) { SendClientMessage(playerid, COLOR_GREY, "   Fare price must be between $1 and $999 !"); return 1; }
					    TaxiDrivers += 1; TransportDuty[playerid] = 1; TransportValue[playerid] = moneys;
					    GetPlayerName(playerid,sendername,sizeof(sendername));
	    				format(string, sizeof(string), "Taxi Driver %s is On Duty, fare: $%d.", sendername, TransportValue[playerid]);
	    				OOCNews(TEAM_GROVE_COLOR,string);
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You are not the Driver !");
					    return 1;
					}
				}
				else if(Veh == 64 || Veh == 65)
				{
				    if(GetPlayerState(playerid) == 2)
				    {
					    tmp = strtok(cmdtext, idx);
						if(!strlen(tmp))
						{
							SendClientMessage(playerid, COLOR_WHITE, "USAGE: /fare [price]");
							return 1;
						}
						moneys = strval(tmp);
						if(moneys < 1 || moneys > 99999) { SendClientMessage(playerid, COLOR_GREY, "   Fare price must be between $1 and $99999 !"); return 1; }
					    BusDrivers += 1; TransportDuty[playerid] = 2; TransportValue[playerid]= moneys;
					    GetPlayerName(playerid,sendername,sizeof(sendername));
	    				format(string, sizeof(string), "Bus Driver %s is On Duty, fare: $%d.", sendername, TransportValue[playerid]);
	    				OOCNews(TEAM_GROVE_COLOR,string);
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You are not the Driver !");
					    return 1;
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not in a Taxi / Bus !");
				}
			}
			else
			{
			    SendClientMessage(playerid,COLOR_GREY,"   You are not a Taxi / Bus Driver !");
			    return 1;
			}
	    }
	    return 1;
 	}
 	if(strcmp(cmd,"/eat",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
	        if(PlayerBoxing[playerid] > 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   Cant eat a Fish while you are fighting !");
	            return 1;
	        }
	        tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /eat [cook number]");
				return 1;
			}
			new cookid = strval(tmp);
			if(cookid < 1 || cookid > 5) { SendClientMessage(playerid, COLOR_GREY, "   Cook number cant be below 1 or above 5 !"); return 1; }
			else if(cookid == 1 && Cooking[playerid][pCWeight1] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even Cook something at that number(1) !"); return 1; }
			else if(cookid == 2 && Cooking[playerid][pCWeight2] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even Cook something at that number(2) !"); return 1; }
			else if(cookid == 3 && Cooking[playerid][pCWeight3] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even Cook something at that number(3) !"); return 1; }
			else if(cookid == 4 && Cooking[playerid][pCWeight4] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even Cook something at that number(4) !"); return 1; }
			else if(cookid == 5 && Cooking[playerid][pCWeight5] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even Cook something at that number(5) !"); return 1; }
            GetPlayerName(playerid, sendername, sizeof(sendername));
			new Float:health;
			if(GetPlayerHealth(playerid, health) < 40)
			{
			    new hp = 0;
			    switch (cookid)
			    {
					case 1:
					{
					    if(Cooking[playerid][pCookID1] == 16 || Cooking[playerid][pCookID1] == 18)
						{//Dolphin or Turtle
						    WantedPoints[playerid] += 2;
							SetPlayerCriminal(playerid,255, "Consuming endangered Species");
						}
					    SetPlayerHealth(playerid, health + (Cooking[playerid][pCWeight1] / 3));
					    hp = Cooking[playerid][pCWeight1];
					    format(string, sizeof(string), "* %s eats %s.", sendername, Cooking[playerid][pCook1]);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					    format(string, sizeof(string), "* You ate %s weighting %d, and it was added to your Health.",Cooking[playerid][pCook1], hp);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					}
					case 2:
					{
					    if(Cooking[playerid][pCookID2] == 16 || Cooking[playerid][pCookID2] == 18)
						{//Dolphin or Turtle
						    WantedPoints[playerid] += 2;
							SetPlayerCriminal(playerid,255, "Consuming endangered Species");
						}
					    SetPlayerHealth(playerid, health + (Cooking[playerid][pCWeight2] / 3));
					    hp = Cooking[playerid][pCWeight2];
					    format(string, sizeof(string), "* %s eats %s.", sendername, Cooking[playerid][pCook2]);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					    format(string, sizeof(string), "* You ate %s weighting %d, and it was added to your Health.",Cooking[playerid][pCook2], hp);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					}
					case 3:
					{
					    if(Cooking[playerid][pCookID3] == 16 || Cooking[playerid][pCookID3] == 18)
						{//Dolphin or Turtle
						    WantedPoints[playerid] += 2;
							SetPlayerCriminal(playerid,255, "Consuming endangered Species");
						}
					    SetPlayerHealth(playerid, health + (Cooking[playerid][pCWeight3] / 3));
					    hp = Cooking[playerid][pCWeight3];
					    format(string, sizeof(string), "* %s eats %s.", sendername, Cooking[playerid][pCook3]);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					    format(string, sizeof(string), "* You ate %s weighting %d, and it was added to your Health.",Cooking[playerid][pCook3], hp);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					}
					case 4:
					{
					    if(Cooking[playerid][pCookID4] == 16 || Cooking[playerid][pCookID4] == 18)
						{//Dolphin or Turtle
						    WantedPoints[playerid] += 2;
							SetPlayerCriminal(playerid,255, "Consuming endangered Species");
						}
					    SetPlayerHealth(playerid, health + (Cooking[playerid][pCWeight4] / 3));
					    hp = Cooking[playerid][pCWeight4];
					    format(string, sizeof(string), "* %s eats %s.", sendername, Cooking[playerid][pCook4]);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					    format(string, sizeof(string), "* You ate %s weighting %d, and it was added to your Health.",Cooking[playerid][pCook4], hp);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					}
					case 5:
					{
					    if(Cooking[playerid][pCookID5] == 16 || Cooking[playerid][pCookID5] == 18)
						{//Dolphin or Turtle
						    WantedPoints[playerid] += 2;
							SetPlayerCriminal(playerid,255, "Consuming endangered Species");
						}
					    SetPlayerHealth(playerid, health + (Cooking[playerid][pCWeight5] / 3));
					    hp = Cooking[playerid][pCWeight5];
					    format(string, sizeof(string), "* %s eats %s.", sendername, Cooking[playerid][pCook5]);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					    format(string, sizeof(string), "* You ate %s weighting %d, and it was added to your Health.",Cooking[playerid][pCook5], hp);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					}
			    }
				ClearCookingID(playerid, cookid);
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   Your health is high enough, can only eat at 40 Health !");
			    return 1;
			}
	    }
	    return 1;
	}
 	if(strcmp(cmd,"/cook",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
	        if(IsAtCookPlace(playerid))
	        {
	            new x_nr[256];
	            x_nr = strtok(cmdtext, idx);
				if(!strlen(x_nr)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /cook [name]");
					SendClientMessage(playerid, COLOR_WHITE, "Available names: Lastfish, Fish, Chicken, Hamburger, Pizza.");
					return 1;
				}
				if(strcmp(x_nr,"lastfish",true) == 0)
				{
				    if(Fishes[playerid][pLastFish] > 0)
	        		{
					    new found = 0;
					    if(Cooking[playerid][pCWeight1] == 0)
					    {
						    format(string, sizeof(string), "A Cooked %s", FishNames[Fishes[playerid][pFishID]]);
						    strmid(Cooking[playerid][pCook1], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight1] = Fishes[playerid][pLastWeight];
						    Cooking[playerid][pCookID1] = Fishes[playerid][pFishID];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1]);
						    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    found = 1;
					    }
					    else if(Cooking[playerid][pCWeight2] == 0)
					    {
						    format(string, sizeof(string), "A Cooked %s", FishNames[Fishes[playerid][pFishID]]);
						    strmid(Cooking[playerid][pCook2], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight2] = Fishes[playerid][pLastWeight];
						    Cooking[playerid][pCookID2] = Fishes[playerid][pFishID];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2]);
						    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    found = 1;
					    }
					    else if(Cooking[playerid][pCWeight3] == 0)
					    {
						    format(string, sizeof(string), "A Cooked %s", FishNames[Fishes[playerid][pFishID]]);
						    strmid(Cooking[playerid][pCook3], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight3] = Fishes[playerid][pLastWeight];
						    Cooking[playerid][pCookID3] = Fishes[playerid][pFishID];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3]);
						    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    found = 1;
					    }
					    else if(Cooking[playerid][pCWeight4] == 0)
					    {
						    format(string, sizeof(string), "A Cooked %s", FishNames[Fishes[playerid][pFishID]]);
						    strmid(Cooking[playerid][pCook4], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight4] = Fishes[playerid][pLastWeight];
						    Cooking[playerid][pCookID4] = Fishes[playerid][pFishID];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4]);
						    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    found = 1;
					    }
					    else if(Cooking[playerid][pCWeight5] == 0)
					    {
						    format(string, sizeof(string), "A Cooked %s", FishNames[Fishes[playerid][pFishID]]);
						    strmid(Cooking[playerid][pCook5], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight5] = Fishes[playerid][pLastWeight];
						    Cooking[playerid][pCookID5] = Fishes[playerid][pFishID];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5]);
						    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    found = 1;
					    }
					    else
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   You don't have any space in your Cooking List !");
					        return 1;
					    }
					    if(found)
					    {
					        ClearFishID(playerid, Fishes[playerid][pLastFish]);
				            Fishes[playerid][pLastFish] = 0;
				            Fishes[playerid][pFishID] = 0;
					    }
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   You haven't even catched a Fish yet !");
				        return 1;
				    }
				}
				else if(strcmp(x_nr,"fish",true) == 0)
				{
				    new found = 0;
				    tmp = strtok(cmdtext, idx);
					if(!strlen(tmp))
					{
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: /cook fish [fishnumber]");
						return 1;
					}
					new fishid = strval(tmp);
					if(fishid < 1 || fishid > 5) { SendClientMessage(playerid, COLOR_GREY, "   Fish number cant be below 1 or above 5 !"); return 1; }
					else if(fishid == 1 && Fishes[playerid][pWeight1] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(1) !"); return 1; }
					else if(fishid == 2 && Fishes[playerid][pWeight2] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(2) !"); return 1; }
					else if(fishid == 3 && Fishes[playerid][pWeight3] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(3) !"); return 1; }
					else if(fishid == 4 && Fishes[playerid][pWeight4] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(4) !"); return 1; }
					else if(fishid == 5 && Fishes[playerid][pWeight5] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(5) !"); return 1; }
					if(Cooking[playerid][pCWeight1] == 0)
					{
					    if(fishid == 1)
					    {
						    format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish1]);
						    strmid(Cooking[playerid][pCook1], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight1] = Fishes[playerid][pWeight1];
						    Cooking[playerid][pCookID1] = Fishes[playerid][pFid1];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1]);
					    	SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
					    }
						else if(fishid == 2)
					 	{
						    format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish2]);
						    strmid(Cooking[playerid][pCook1], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight1] = Fishes[playerid][pWeight2];
						    Cooking[playerid][pCookID1] = Fishes[playerid][pFid2];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1]);
						    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						}
						else if(fishid == 3)
						{
						    format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish3]);
						    strmid(Cooking[playerid][pCook1], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight1] = Fishes[playerid][pWeight3];
						    Cooking[playerid][pCookID1] = Fishes[playerid][pFid3];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1]);
						    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						}
						else if(fishid == 4)
						{
						    format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish4]);
						    strmid(Cooking[playerid][pCook1], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight1] = Fishes[playerid][pWeight4];
						    Cooking[playerid][pCookID1] = Fishes[playerid][pFid4];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1]);
						    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						}
						else if(fishid == 5)
						{
						    format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish5]);
						    strmid(Cooking[playerid][pCook1], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight1] = Fishes[playerid][pWeight5];
						    Cooking[playerid][pCookID1] = Fishes[playerid][pFid5];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1]);
						    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						}
						found = 1;
		    		}
					else if(Cooking[playerid][pCWeight2] == 0)
					{
						if(fishid == 1)
					    {
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish1]);
							strmid(Cooking[playerid][pCook2], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight2] = Fishes[playerid][pWeight1];
							Cooking[playerid][pCookID2] = Fishes[playerid][pFid1];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						else if(fishid == 2)
						{
						    format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish2]);
						    strmid(Cooking[playerid][pCook2], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight2] = Fishes[playerid][pWeight2];
						    Cooking[playerid][pCookID2] = Fishes[playerid][pFid2];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2]);
						    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						}
						else if(fishid == 3)
						{
						    format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish3]);
						    strmid(Cooking[playerid][pCook2], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight2] = Fishes[playerid][pWeight3];
						    Cooking[playerid][pCookID2] = Fishes[playerid][pFid3];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2]);
						    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						}
						else if(fishid == 4)
						{
						    format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish4]);
						    strmid(Cooking[playerid][pCook2], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight2] = Fishes[playerid][pWeight4];
						    Cooking[playerid][pCookID2] = Fishes[playerid][pFid4];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2]);
						    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						}
						else if(fishid == 5)
						{
						    format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish5]);
						    strmid(Cooking[playerid][pCook2], string, 0, strlen(string), 255);
						    Cooking[playerid][pCWeight2] = Fishes[playerid][pWeight5];
						    Cooking[playerid][pCookID2] = Fishes[playerid][pFid5];
						    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2]);
						    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						}
						found = 1;
		    		}
					else if(Cooking[playerid][pCWeight3] == 0)
					{
						if(fishid == 1)
					    {
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish1]);
							strmid(Cooking[playerid][pCook3], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight3] = Fishes[playerid][pWeight1];
							Cooking[playerid][pCookID3] = Fishes[playerid][pFid1];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						else if(fishid == 2)
						{
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish2]);
							strmid(Cooking[playerid][pCook3], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight3] = Fishes[playerid][pWeight2];
							Cooking[playerid][pCookID3] = Fishes[playerid][pFid2];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
    					}
						else if(fishid == 3)
						{
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish3]);
							strmid(Cooking[playerid][pCook3], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight3] = Fishes[playerid][pWeight3];
							Cooking[playerid][pCookID3] = Fishes[playerid][pFid3];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						else if(fishid == 4)
						{
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish4]);
							strmid(Cooking[playerid][pCook3], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight3] = Fishes[playerid][pWeight4];
							Cooking[playerid][pCookID3] = Fishes[playerid][pFid4];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						else if(fishid == 5)
						{
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish5]);
							strmid(Cooking[playerid][pCook3], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight3] = Fishes[playerid][pWeight5];
							Cooking[playerid][pCookID3] = Fishes[playerid][pFid5];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						found = 1;
   					}
					else if(Cooking[playerid][pCWeight4] == 0)
					{
						if(fishid == 1)
					    {
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish1]);
							strmid(Cooking[playerid][pCook4], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight4] = Fishes[playerid][pWeight1];
							Cooking[playerid][pCookID4] = Fishes[playerid][pFid1];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						else if(fishid == 2)
						{
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish2]);
							strmid(Cooking[playerid][pCook4], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight4] = Fishes[playerid][pWeight2];
							Cooking[playerid][pCookID4] = Fishes[playerid][pFid2];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						else if(fishid == 3)
						{
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish3]);
							strmid(Cooking[playerid][pCook4], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight4] = Fishes[playerid][pWeight3];
							Cooking[playerid][pCookID4] = Fishes[playerid][pFid3];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						else if(fishid == 4)
						{
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish4]);
							strmid(Cooking[playerid][pCook4], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight4] = Fishes[playerid][pWeight4];
							Cooking[playerid][pCookID4] = Fishes[playerid][pFid4];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						else if(fishid == 5)
						{
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish5]);
							strmid(Cooking[playerid][pCook4], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight4] = Fishes[playerid][pWeight5];
							Cooking[playerid][pCookID4] = Fishes[playerid][pFid5];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
    					}
						found = 1;
		    		}
					else if(Cooking[playerid][pCWeight5] == 0)
					{
						if(fishid == 1)
					    {
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish1]);
							strmid(Cooking[playerid][pCook5], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight5] = Fishes[playerid][pWeight1];
							Cooking[playerid][pCookID5] = Fishes[playerid][pFid1];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						else if(fishid == 2)
						{
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish2]);
							strmid(Cooking[playerid][pCook5], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight5] = Fishes[playerid][pWeight2];
							Cooking[playerid][pCookID5] = Fishes[playerid][pFid2];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						else if(fishid == 3)
						{
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish3]);
							strmid(Cooking[playerid][pCook5], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight5] = Fishes[playerid][pWeight3];
							Cooking[playerid][pCookID5] = Fishes[playerid][pFid3];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						else if(fishid == 4)
						{
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish4]);
							strmid(Cooking[playerid][pCook5], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight5] = Fishes[playerid][pWeight4];
							Cooking[playerid][pCookID5] = Fishes[playerid][pFid4];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						else if(fishid == 5)
						{
							format(string, sizeof(string), "A Cooked %s", Fishes[playerid][pFish5]);
							strmid(Cooking[playerid][pCook5], string, 0, strlen(string), 255);
							Cooking[playerid][pCWeight5] = Fishes[playerid][pWeight5];
							Cooking[playerid][pCookID5] = Fishes[playerid][pFid5];
							format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5]);
							SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
			    		}
						found = 1;
   					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, "   You don't have any space in your Cooking List !");
					    return 1;
		    		}
					if(found)
					{
					    ClearFishID(playerid, fishid);
						Fishes[playerid][pLastFish] = 0;
			   			Fishes[playerid][pFishID] = 0;
					}
				}
				else if(strcmp(x_nr,"chicken",true) == 0)
				{
				    if(PlayerToPoint(3.0,playerid,369.9786,-4.0798,1001.8589))
				    {//Cluckin Bell
				        if(Groceries[playerid][pChicken] != 0)
				        {
				            if(Cooking[playerid][pCWeight1] == 0)
						    {
							    format(string, sizeof(string), "A Cooked Chicken");
							    strmid(Cooking[playerid][pCook1], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight1] = Groceries[playerid][pChicken];
							    Cooking[playerid][pCookID1] = 30;
							    Groceries[playerid][pChickens] = 0; Groceries[playerid][pChicken] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else if(Cooking[playerid][pCWeight2] == 0)
						    {
							    format(string, sizeof(string), "A Cooked Chicken");
							    strmid(Cooking[playerid][pCook2], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight2] = Groceries[playerid][pChicken];
							    Cooking[playerid][pCookID2] = 30;
							    Groceries[playerid][pChickens] = 0; Groceries[playerid][pChicken] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else if(Cooking[playerid][pCWeight3] == 0)
						    {
							    format(string, sizeof(string), "A Cooked Chicken");
							    strmid(Cooking[playerid][pCook3], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight3] = Groceries[playerid][pChicken];
							    Cooking[playerid][pCookID3] = 30;
							    Groceries[playerid][pChickens] = 0; Groceries[playerid][pChicken] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else if(Cooking[playerid][pCWeight4] == 0)
						    {
							    format(string, sizeof(string), "A Cooked Chicken");
							    strmid(Cooking[playerid][pCook4], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight4] = Groceries[playerid][pChicken];
							    Cooking[playerid][pCookID4] = 30;
							    Groceries[playerid][pChickens] = 0; Groceries[playerid][pChicken] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else if(Cooking[playerid][pCWeight5] == 0)
						    {
							    format(string, sizeof(string), "A Cooked Chicken");
							    strmid(Cooking[playerid][pCook5], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight5] = Groceries[playerid][pChicken];
							    Cooking[playerid][pCookID5] = 30;
							    Groceries[playerid][pChickens] = 0; Groceries[playerid][pChicken] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else
						    {
						        SendClientMessage(playerid, COLOR_GREY, "   You don't have any space in your Cooking List !");
						        return 1;
						    }
				        }
				        else
				        {
				            SendClientMessage(playerid, COLOR_GREY, "   You don't have any Chickens with you !");
				            return 1;
				        }
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   You need to be at Cluckin Bell to Cook this !");
					    return 1;
				    }
				}
				else if(strcmp(x_nr,"hamburger",true) == 0)
				{
				    if(PlayerToPoint(3.0,playerid,376.4466,-60.9574,1001.5078) || PlayerToPoint(3.0,playerid,378.1215,-57.4928,1001.5078))
					{//Burgershot
					    if(Groceries[playerid][pHamburger] != 0)
				        {
				            if(Cooking[playerid][pCWeight1] == 0)
						    {
							    format(string, sizeof(string), "A Baken Hamburger");
							    strmid(Cooking[playerid][pCook1], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight1] = Groceries[playerid][pHamburger];
							    Cooking[playerid][pCookID1] = 30;
							    Groceries[playerid][pHamburgers] = 0; Groceries[playerid][pHamburger] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else if(Cooking[playerid][pCWeight2] == 0)
						    {
							    format(string, sizeof(string), "A Baken Hamburger");
							    strmid(Cooking[playerid][pCook2], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight2] = Groceries[playerid][pHamburger];
							    Cooking[playerid][pCookID2] = 30;
							    Groceries[playerid][pHamburgers] = 0; Groceries[playerid][pHamburger] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else if(Cooking[playerid][pCWeight3] == 0)
						    {
							    format(string, sizeof(string), "A Baken Hamburger");
							    strmid(Cooking[playerid][pCook3], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight3] = Groceries[playerid][pHamburger];
							    Cooking[playerid][pCookID3] = 30;
							    Groceries[playerid][pHamburgers] = 0; Groceries[playerid][pHamburger] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else if(Cooking[playerid][pCWeight4] == 0)
						    {
							    format(string, sizeof(string), "A Baken Hamburger");
							    strmid(Cooking[playerid][pCook4], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight4] = Groceries[playerid][pHamburger];
							    Cooking[playerid][pCookID4] = 30;
							    Groceries[playerid][pHamburgers] = 0; Groceries[playerid][pHamburger] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else if(Cooking[playerid][pCWeight5] == 0)
						    {
							    format(string, sizeof(string), "A Baken Hamburger");
							    strmid(Cooking[playerid][pCook5], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight5] = Groceries[playerid][pHamburger];
							    Cooking[playerid][pCookID5] = 30;
							    Groceries[playerid][pHamburgers] = 0; Groceries[playerid][pHamburger] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else
						    {
						        SendClientMessage(playerid, COLOR_GREY, "   You don't have any space in your Cooking List !");
						        return 1;
						    }
				        }
				        else
				        {
				            SendClientMessage(playerid, COLOR_GREY, "   You don't have any Hamburgers with you !");
				            return 1;
				        }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You need to be at Burger Shot to Cook this !");
					    return 1;
					}
				}
				else if(strcmp(x_nr,"pizza",true) == 0)
				{
				    if(PlayerToPoint(3.0,playerid,374.1185,-113.6361,1001.4922) || PlayerToPoint(3.0,playerid,377.7971,-113.7668,1001.4922))
					{//Well Stacked Pizza
					    if(Groceries[playerid][pPizza] != 0)
				        {
				            if(Cooking[playerid][pCWeight1] == 0)
						    {
							    format(string, sizeof(string), "A Baken Pizza");
							    strmid(Cooking[playerid][pCook1], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight1] = Groceries[playerid][pHamburger];
							    Cooking[playerid][pCookID1] = 30;
							    Groceries[playerid][pPizzas] = 0; Groceries[playerid][pPizza] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook1],Cooking[playerid][pCWeight1]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else if(Cooking[playerid][pCWeight2] == 0)
						    {
							    format(string, sizeof(string), "A Baken Pizza");
							    strmid(Cooking[playerid][pCook2], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight2] = Groceries[playerid][pHamburger];
							    Cooking[playerid][pCookID2] = 30;
							    Groceries[playerid][pPizzas] = 0; Groceries[playerid][pPizza] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook2],Cooking[playerid][pCWeight2]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else if(Cooking[playerid][pCWeight3] == 0)
						    {
							    format(string, sizeof(string), "A Baken Pizza");
							    strmid(Cooking[playerid][pCook3], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight3] = Groceries[playerid][pHamburger];
							    Cooking[playerid][pCookID3] = 30;
							    Groceries[playerid][pPizzas] = 0; Groceries[playerid][pPizza] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook3],Cooking[playerid][pCWeight3]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else if(Cooking[playerid][pCWeight4] == 0)
						    {
							    format(string, sizeof(string), "A Baken Pizza");
							    strmid(Cooking[playerid][pCook4], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight4] = Groceries[playerid][pHamburger];
							    Cooking[playerid][pCookID4] = 30;
							    Groceries[playerid][pPizzas] = 0; Groceries[playerid][pPizza] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook4],Cooking[playerid][pCWeight4]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else if(Cooking[playerid][pCWeight5] == 0)
						    {
							    format(string, sizeof(string), "A Baken Pizza");
							    strmid(Cooking[playerid][pCook5], string, 0, strlen(string), 255);
							    Cooking[playerid][pCWeight5] = Groceries[playerid][pHamburger];
							    Cooking[playerid][pCookID5] = 30;
							    Groceries[playerid][pPizzas] = 0; Groceries[playerid][pPizza] = 0;
							    format(string, sizeof(string), "* You've made %s, weighting %d LBS.",Cooking[playerid][pCook5],Cooking[playerid][pCWeight5]);
							    SendClientMessage(playerid,COLOR_LIGHTBLUE, string);
						    }
						    else
						    {
						        SendClientMessage(playerid, COLOR_GREY, "   You don't have any space in your Cooking List !");
						        return 1;
						    }
				        }
				        else
				        {
				            SendClientMessage(playerid, COLOR_GREY, "   You don't have any Pizzas with you !");
				            return 1;
				        }
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You need to be at Well Stacked Pizza to Cook this !");
					    return 1;
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Invalid Cooking Name !");
				    return 1;
				}
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not at one of the Cooking Places (Cluckin Bell / Burger Shot / Well Stacked Pizza).");
	            return 1;
	        }
	    }
	    return 1;
	}
	if(strcmp(cmd,"/cooked",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
	        SendClientMessage(playerid, COLOR_WHITE, "|__________________ Cooking __________________|");
	        format(string, sizeof(string), "** (1) Made: %s.   Weight: %d.", Cooking[playerid][pCook1], Cooking[playerid][pCWeight1]);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "** (2) Made: %s.   Weight: %d.", Cooking[playerid][pCook2], Cooking[playerid][pCWeight2]);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "** (3) Made: %s.   Weight: %d.", Cooking[playerid][pCook3], Cooking[playerid][pCWeight3]);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "** (4) Made: %s.   Weight: %d.", Cooking[playerid][pCook4], Cooking[playerid][pCWeight4]);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "** (5) Made: %s.   Weight: %d.", Cooking[playerid][pCook5], Cooking[playerid][pCWeight5]);
			SendClientMessage(playerid, COLOR_GREY, string);
			SendClientMessage(playerid, COLOR_WHITE, "|____________________________________________|");
		}
	    return 1;
 	}
	if(strcmp(cmd,"/fish",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pFishes] > 5)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   Caught to many fish, wait till its reduced !");
	            return 1;
	        }
	        if(Fishes[playerid][pWeight1] > 0 && Fishes[playerid][pWeight2] > 0 && Fishes[playerid][pWeight3] > 0 && Fishes[playerid][pWeight4] > 0 && Fishes[playerid][pWeight5] > 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You already caught 5 Fishes, sell / eat / release them first !");
	            return 1;
	        }
	        new Veh = GetPlayerVehicleID(playerid);
	        if((IsAtFishPlace(playerid)) || IsABoat(Veh))
	        {
	            new Caught;
	            new rand;
	            new fstring[MAX_PLAYER_NAME];
	            new Level = PlayerInfo[playerid][pFishSkill];
	            if(Level >= 0 && Level <= 50) { Caught = random(20)-7; }
	            else if(Level >= 51 && Level <= 100) { Caught = random(50)-20; }
	            else if(Level >= 101 && Level <= 200) { Caught = random(100)-50; }
	            else if(Level >= 201 && Level <= 400) { Caught = random(160)-60; }
	            else if(Level >= 401) { Caught = random(180)-70; }
	            rand = random(FishNamesNumber);
	            if(Caught <= 0)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   Line snapped !");
	                return 1;
	            }
	            else if(rand == 0)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You caught a Jacket and threw it away !");
	                return 1;
	            }
	            else if(rand == 4)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You caught a Pants and threw it away !");
	                return 1;
	            }
	            else if(rand == 7)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You caught a Can and threw it away !");
	                return 1;
	            }
	            else if(rand == 10)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You caught a pair of Shoes and threw it away !");
	                return 1;
	            }
	            else if(rand == 13)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You caught some Garbage and threw it away !");
	                return 1;
	            }
	            else if(rand == 20)
	            {
	                new mrand = random(500);
	                format(string, sizeof(string), "* You caught a Money Bag, containing $%d.", mrand);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
	                GivePlayerMoney(playerid, mrand);
	                return 1;
	            }
		        if(PlayerInfo[playerid][pFishLic] < 1)
		        {
	            	WantedPoints[playerid] += 1;
					SetPlayerCriminal(playerid,255, "Illegal Fishing");
				}
		        if(Fishes[playerid][pWeight1] == 0)
		        {
		        	PlayerInfo[playerid][pFishes] += 1;
		            PlayerInfo[playerid][pFishSkill] += 1;
		            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
					strmid(Fishes[playerid][pFish1], fstring, 0, strlen(fstring), 255);
					Fishes[playerid][pWeight1] = Caught;
					format(string, sizeof(string), "* You have caught a %s, which weights %d Lbs.", Fishes[playerid][pFish1], Caught);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					Fishes[playerid][pLastWeight] = Caught;
					Fishes[playerid][pLastFish] = 1;
					Fishes[playerid][pFid1] = rand;
					Fishes[playerid][pFishID] = rand;
					if(Caught > PlayerInfo[playerid][pBiggestFish])
					{
					    format(string, sizeof(string), "* Your old record of %d Lbs has been passed, your new Biggest Fish is: %d Lbs.", PlayerInfo[playerid][pBiggestFish], Caught);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						PlayerInfo[playerid][pBiggestFish] = Caught;
					}
     			}
		        else if(Fishes[playerid][pWeight2] == 0)
		        {
		            PlayerInfo[playerid][pFishes] += 1;
		            PlayerInfo[playerid][pFishSkill] += 1;
		            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
					strmid(Fishes[playerid][pFish2], fstring, 0, strlen(fstring), 255);
					Fishes[playerid][pWeight2] = Caught;
					format(string, sizeof(string), "* You have caught a %s, which weights %d Lbs.", Fishes[playerid][pFish2], Caught);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					Fishes[playerid][pLastWeight] = Caught;
					Fishes[playerid][pLastFish] = 2;
					Fishes[playerid][pFid2] = rand;
					Fishes[playerid][pFishID] = rand;
					if(Caught > PlayerInfo[playerid][pBiggestFish])
					{
					    format(string, sizeof(string), "* Your old record of %d Lbs has been passed, your new Biggest Fish is: %d Lbs.", PlayerInfo[playerid][pBiggestFish], Caught);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						PlayerInfo[playerid][pBiggestFish] = Caught;
					}
		        }
		        else if(Fishes[playerid][pWeight3] == 0)
		        {
		            PlayerInfo[playerid][pFishes] += 1;
		            PlayerInfo[playerid][pFishSkill] += 1;
		            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
					strmid(Fishes[playerid][pFish3], fstring, 0, strlen(fstring), 255);
					Fishes[playerid][pWeight3] = Caught;
					format(string, sizeof(string), "* You have caught a %s, which weights %d Lbs.", Fishes[playerid][pFish3], Caught);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					Fishes[playerid][pLastWeight] = Caught;
					Fishes[playerid][pLastFish] = 3;
					Fishes[playerid][pFid3] = rand;
					Fishes[playerid][pFishID] = rand;
					if(Caught > PlayerInfo[playerid][pBiggestFish])
					{
					    format(string, sizeof(string), "* Your old record of %d Lbs has been passed, your new Biggest Fish is: %d Lbs.", PlayerInfo[playerid][pBiggestFish], Caught);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						PlayerInfo[playerid][pBiggestFish] = Caught;
					}
		        }
		        else if(Fishes[playerid][pWeight4] == 0)
		        {
		            PlayerInfo[playerid][pFishes] += 1;
		            PlayerInfo[playerid][pFishSkill] += 1;
		            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
					strmid(Fishes[playerid][pFish4], fstring, 0, strlen(fstring), 255);
					Fishes[playerid][pWeight4] = Caught;
					format(string, sizeof(string), "* You have caught a %s, which weights %d Lbs.", Fishes[playerid][pFish4], Caught);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					Fishes[playerid][pLastWeight] = Caught;
					Fishes[playerid][pLastFish] = 4;
					Fishes[playerid][pFid4] = rand;
					Fishes[playerid][pFishID] = rand;
					if(Caught > PlayerInfo[playerid][pBiggestFish])
					{
					    format(string, sizeof(string), "* Your old record of %d Lbs has been passed, your new Biggest Fish is: %d Lbs.", PlayerInfo[playerid][pBiggestFish], Caught);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						PlayerInfo[playerid][pBiggestFish] = Caught;
					}
		        }
		        else if(Fishes[playerid][pWeight5] == 0)
		        {
		            PlayerInfo[playerid][pFishes] += 1;
		            PlayerInfo[playerid][pFishSkill] += 1;
		            format(fstring, sizeof(fstring), "%s", FishNames[rand]);
					strmid(Fishes[playerid][pFish5], fstring, 0, strlen(fstring), 255);
					Fishes[playerid][pWeight5] = Caught;
					format(string, sizeof(string), "* You have caught a %s, which weights %d Lbs.", Fishes[playerid][pFish5], Caught);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					Fishes[playerid][pLastWeight] = Caught;
					Fishes[playerid][pLastFish] = 5;
					Fishes[playerid][pFid5] = rand;
					Fishes[playerid][pFishID] = rand;
					if(Caught > PlayerInfo[playerid][pBiggestFish])
					{
					    format(string, sizeof(string), "* Your old record of %d Lbs has been passed, your new Biggest Fish is: %d Lbs.", PlayerInfo[playerid][pBiggestFish], Caught);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						PlayerInfo[playerid][pBiggestFish] = Caught;
					}
		        }
		        else
		        {
		            SendClientMessage(playerid, COLOR_GREY, "   You dont have any space for your Fish !");
		            return 1;
		        }
	            if(PlayerInfo[playerid][pFishSkill] == 50)
				{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Fishing Skill is now Level 2, you can now catch Heavier Fishes."); }
				else if(PlayerInfo[playerid][pFishSkill] == 250)
				{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Fishing Skill is now Level 3, you can now catch Heavier Fishes."); }
				else if(PlayerInfo[playerid][pFishSkill] == 500)
				{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Fishing Skill is now Level 4, you can now catch Heavier Fishes."); }
				else if(PlayerInfo[playerid][pFishSkill] == 1000)
				{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Fishing Skill is now Level 5, you can now catch Heavier Fishes."); }
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not at a Fishing Place (Big Wheel Rods) or on a Fishing Boat !");
	            return 1;
	        }
	    }
	    return 1;
 	}
	if(strcmp(cmd,"/fishes",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
	        SendClientMessage(playerid, COLOR_WHITE, "|__________________ Fishes __________________|");
	        format(string, sizeof(string), "** (1) Fish: %s.   Weight: %d.", Fishes[playerid][pFish1], Fishes[playerid][pWeight1]);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "** (2) Fish: %s.   Weight: %d.", Fishes[playerid][pFish2], Fishes[playerid][pWeight2]);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "** (3) Fish: %s.   Weight: %d.", Fishes[playerid][pFish3], Fishes[playerid][pWeight3]);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "** (4) Fish: %s.   Weight: %d.", Fishes[playerid][pFish4], Fishes[playerid][pWeight4]);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "** (5) Fish: %s.   Weight: %d.", Fishes[playerid][pFish5], Fishes[playerid][pWeight5]);
			SendClientMessage(playerid, COLOR_GREY, string);
			SendClientMessage(playerid, COLOR_WHITE, "|____________________________________________|");
		}
	    return 1;
 	}
 	if(strcmp(cmd,"/releasefish",true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /releasefish [fish]");
				return 1;
			}
			new fishid = strval(tmp);
			if(fishid < 1 || fishid > 5) { SendClientMessage(playerid, COLOR_GREY, "   Fish number cant be below 1 or above 5 !"); return 1; }
			else if(fishid == 1 && Fishes[playerid][pWeight1] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(1) !"); return 1; }
			else if(fishid == 2 && Fishes[playerid][pWeight2] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(2) !"); return 1; }
			else if(fishid == 3 && Fishes[playerid][pWeight3] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(3) !"); return 1; }
			else if(fishid == 4 && Fishes[playerid][pWeight4] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(4) !"); return 1; }
			else if(fishid == 5 && Fishes[playerid][pWeight5] < 1) { SendClientMessage(playerid, COLOR_GREY, "   You didnt even catch a Fish at that number(5) !"); return 1; }
			ClearFishID(playerid, fishid);
			Fishes[playerid][pLastFish] = 0;
   			Fishes[playerid][pFishID] = 0;
		}
		return 1;
	}
 	if(strcmp(cmd,"/throwback",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
	        if(Fishes[playerid][pLastFish] > 0)
	        {
	            ClearFishID(playerid, Fishes[playerid][pLastFish]);
	            Fishes[playerid][pLastFish] = 0;
	            Fishes[playerid][pFishID] = 0;
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You haven't even catched a Fish yet !");
	            return 1;
	        }
	    }
	    return 1;
 	}
 	if(strcmp(cmd,"/throwbackall",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
	        if(Fishes[playerid][pWeight1] > 0 || Fishes[playerid][pWeight2] > 0 || Fishes[playerid][pWeight3] > 0 || Fishes[playerid][pWeight4] > 0 || Fishes[playerid][pWeight5] > 0)
	        {
	            ClearFishes(playerid);
				Fishes[playerid][pLastFish] = 0;
				Fishes[playerid][pFishID] = 0;
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You haven't even catched a Fish yet !");
	            return 1;
	        }
	    }
	    return 1;
 	}
	if(strcmp(cmd,"/licenses",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
	        new text1[20];
	        new text2[20];
	        new text3[20];
	        new text4[20];
	        new text5[20];
	        if(PlayerInfo[playerid][pCarLic]) { text1 = "Passed"; } else { text1 = "Not Passed"; }
            if(PlayerInfo[playerid][pFlyLic]) { text4 = "Passed"; } else { text4 = "Not Passed"; }
			if(PlayerInfo[playerid][pBoatLic]) { text2 = "Passed"; } else { text2 = "Not Passed"; }
	        if(PlayerInfo[playerid][pFishLic]) { text3 = "Passed"; } else { text3 = "Not Passed"; }
	        if(PlayerInfo[playerid][pGunLic]) { text5 = "Passed"; } else { text5 = "Not Passed"; }
	        SendClientMessage(playerid, COLOR_WHITE, "|__________________ Licenses __________________|");
	        format(string, sizeof(string), "** Drivers License: %s.", text1);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "** Flying License: %s.", text4);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "** Sailing License: %s.", text2);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "** Fishing License: %s.", text3);
			SendClientMessage(playerid, COLOR_GREY, string);
			format(string, sizeof(string), "** Weapon License: %s.", text5);
			SendClientMessage(playerid, COLOR_GREY, string);
			SendClientMessage(playerid, COLOR_WHITE, "|______________________________________________|");
		}
	    return 1;
 	}
 	if(strcmp(cmd,"/showlicenses",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
	        tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /showlicenses [playerid/PartOfName]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if(IsPlayerConnected(giveplayerid))
			{
				if(giveplayerid != INVALID_PLAYER_ID)
				{
				    if (ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Show Licenses to yourself, use /licenses!"); return 1; }
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
					    new text1[20];
				        new text2[20];
				        new text3[20];
				        new text4[20];
				        new text5[20];
						if(PlayerInfo[playerid][pCarLic]) { text1 = "Passed"; } else { text1 = "Not Passed"; }
                        if(PlayerInfo[playerid][pFlyLic]) { text4 = "Passed"; } else { text4 = "Not Passed"; }

						if(PlayerInfo[playerid][pBoatLic]) { text2 = "Passed"; } else { text2 = "Not Passed"; }
				        if(PlayerInfo[playerid][pFishLic]) { text3 = "Passed"; } else { text3 = "Not Passed"; }
				        if(PlayerInfo[playerid][pGunLic]) { text5 = "Passed"; } else { text5 = "Not Passed"; }
				        format(string, sizeof(string), "|__________ Licenses of %s __________|", sendername);
				        SendClientMessage(giveplayerid, COLOR_WHITE, string);
				        format(string, sizeof(string), "** Drivers License: %s.", text1);
						SendClientMessage(giveplayerid, COLOR_GREY, string);
						format(string, sizeof(string), "** Flying License: %s.", text4);
						SendClientMessage(giveplayerid, COLOR_GREY, string);
						format(string, sizeof(string), "** Sailing License: %s.", text2);
						SendClientMessage(giveplayerid, COLOR_GREY, string);
						format(string, sizeof(string), "** Fishing License: %s.", text3);
						SendClientMessage(giveplayerid, COLOR_GREY, string);
						format(string, sizeof(string), "** Weapon License: %s.", text5);
						SendClientMessage(giveplayerid, COLOR_GREY, string);
						format(string, sizeof(string), "* %s has shown his Licenses to you.", sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* You have shown your Licenses to %s.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
					    return 1;
					}
				}
			}
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
	            return 1;
	        }
		}
	    return 1;
 	}
 	if(strcmp(cmd,"/frisk",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
	        tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /frisk [playerid/PartOfName]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if(IsPlayerConnected(giveplayerid))
			{
				if(giveplayerid != INVALID_PLAYER_ID)
				{
				    if (ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Frisk yourself!"); return 1; }
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
					    new text1[20], text2[20], text3[20], text4[20], text5[20];
					    if(PlayerInfo[giveplayerid][pDrugs] > 0) { text1 = "| Drugs."; } else { text1 = "| Empty Pocket."; }
					    if(PlayerInfo[giveplayerid][pMats] > 0) { text2 = "| Materials."; } else { text2 = "| Empty Pocket."; }
					    if(Fishes[giveplayerid][pWeight1] > 0 || Fishes[giveplayerid][pWeight2] > 0 || Fishes[giveplayerid][pWeight3] > 0 || Fishes[giveplayerid][pWeight4] > 0 || Fishes[giveplayerid][pWeight5] > 0) { text3 = "| Fishes."; } else { text3 = "| Empty Pocket."; }
					    if(PlayerInfo[giveplayerid][pPhoneBook] > 0) { text4 = "| Phone Book."; } else { text4 = "| Empty Pocket."; }
					    if(PlayerInfo[giveplayerid][pCDPlayer] > 0) { text5 = "| CD-Player."; } else { text5 = "| Empty Pocket."; }
					    format(string, sizeof(string), "|__________ Items with %s __________|", giveplayer);
				        SendClientMessage(playerid, COLOR_WHITE, string);
				        format(string, sizeof(string), "%s.", text1);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "%s.", text2);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "%s.", text3);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "%s.", text4);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "%s.", text5);
						SendClientMessage(playerid, COLOR_GREY, string);
						format(string, sizeof(string), "* %s has frisked %s for any illegal items.", sendername ,giveplayer);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
					    return 1;
					}
				}
			}
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
	            return 1;
	        }
		}
	    return 1;
 	}
	if(strcmp(cmd,"/sellcar",true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(PlayerInfo[playerid][pJob] != 10)
			{
			    SendClientMessage(playerid,COLOR_GREY,"   You are not a Car Dealer !");
			    return 1;
			}
			if(!IsPlayerInAnyVehicle(playerid))
			{
			    SendClientMessage(playerid,COLOR_GREY,"   You are not in a Car !");
			    return 1;
			}
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /sellcar [playerid/PartOfName] [price]");
				return 1;
			}
			//giveplayerid = strval(tmp);
			giveplayerid = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /sellcar [playerid/PartOfName] [price]");
				return 1;
			}
			new money = strval(tmp);
			if(money < 1 || money > 99999) { SendClientMessage(playerid, COLOR_GREY, "   Price not below $1 or above $99999 !"); return 1; }
			if (IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if (ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    if(giveplayerid == playerid)
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   Cant sell to yourself!");
					        return 1;
					    }
					    if(CarCalls[giveplayerid] > 0)
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   That player has already bought a car, has to use /callcar first !");
					        return 1;
					    }
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
					    format(string, sizeof(string), "* You offerd %s to buy your Car for $%d .", giveplayer, money);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Car Dealer %s wants to sell you his Car for $%d, (type /accept car) to buy.", sendername, money);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						CarOffer[giveplayerid] = playerid;
						CarPrice[giveplayerid] = money;
						CarID[giveplayerid] = GetPlayerVehicleID(playerid);
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
					}
			    }
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   Invalid ID/Name !");
			    return 1;
			}
	    }
		return 1;
	}
	if(strcmp(cmd,"/portable",true)==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(PlayerInfo[playerid][pMember] == 8 || PlayerInfo[playerid][pLeader] == 8)
		    {
			    if(ConnectedToPC[playerid] == 255)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have shutdowned your Laptop, and Disconnected from your Agency.");
			        ConnectedToPC[playerid] = 0;
			        return 1;
			    }
			    GetPlayerName(playerid, sendername, sizeof(sendername));
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have booted up your Laptop, and Connected to your Agency.");
			    SendClientMessage(playerid, COLOR_WHITE, "|___ Hitman Agency ___|");
			    SendClientMessage(playerid, COLOR_YELLOW2, "|");
			    SendClientMessage(playerid, COLOR_YELLOW2, "| - News");
			    SendClientMessage(playerid, COLOR_YELLOW2, "| - Contracts");
			    SendClientMessage(playerid, COLOR_YELLOW2, "| - Givehit");
			    SendClientMessage(playerid, COLOR_YELLOW2, "| - Order");
			    SendClientMessage(playerid, COLOR_YELLOW2, "| - Ranks");
			    SendClientMessage(playerid, COLOR_YELLOW2, "| - Logout");
				SendClientMessage(playerid, COLOR_WHITE, "|______________|00:00|");
				ConnectedToPC[playerid] = 255;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "   You are not a Member of the Hitman Agency !");
		        return 1;
		    }
		}
	    return 1;
	}
	if(strcmp(cmd,"/materials",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
		    if (PlayerInfo[playerid][pJob] != 9)
			{
			    SendClientMessage(playerid,COLOR_GREY,"   You are not a Arms Dealer !");
			    return 1;
			}
			new x_nr[256];
			x_nr = strtok(cmdtext, idx);
			if(!strlen(x_nr)) {
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /materials [name]");
				SendClientMessage(playerid, COLOR_WHITE, "Available names: Get, Deliver.");
				return 1;
			}
			if(strcmp(x_nr,"get",true) == 0)
			{
			    if(PlayerToPoint(3.0,playerid,597.1277,-1248.6479,18.2734))
			    {
			        if(MatsHolding[playerid] >= 10)
			        {
			            SendClientMessage(playerid, COLOR_GREY, "   You can't hold any more Materials Packages !");
				        return 1;
			        }
			        tmp = strtok(cmdtext, idx);
			        if(!strlen(tmp)) {
						SendClientMessage(playerid, COLOR_WHITE, "USAGE: /materials get [ammount]");
						return 1;
					}
					moneys = strval(tmp);
					if(moneys < 1 || moneys > 10) { SendClientMessage(playerid, COLOR_GREY, "   Package Number can't be below 1 or higher then 10 !"); return 1; }
					new price = moneys * 100;
					if(GetPlayerMoney(playerid) > price)
					{
					    format(string, sizeof(string), "* You bought %d Materials Packages for $%d.", moneys, price);
					    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					    GivePlayerMoney(playerid, - price);
					    MatsHolding[playerid] = moneys;
					}
					else
					{
					    format(string, sizeof(string), "   You can't afford the $%d !", price);
					    SendClientMessage(playerid, COLOR_GREY, string);
					}
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You are not at the Materials Package Building in Los Santos !");
			        return 1;
			    }
			}
			else if(strcmp(x_nr,"deliver",true) == 0)
			{
			    if(PlayerToPoint(3.0,playerid,-2119.5469,-178.5679,35.3203))
			    {
			        if(MatsHolding[playerid] > 0)
			        {
			            new payout = (50)*(MatsHolding[playerid]);
			            format(string, sizeof(string), "* The Factory gave you %d Materials for your %d Materials Packages.", payout, MatsHolding[playerid]);
					    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			            PlayerInfo[playerid][pMats] += payout;
			            MatsHolding[playerid] = 0;
			        }
			        else
			        {
			            SendClientMessage(playerid, COLOR_GREY, "   You don't have any Materials Packages !");
				        return 1;
			        }
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You are not at the Materials Factory in San Fierro !");
			        return 1;
			    }
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   Invalid Materials Name !");
			    return 1;
			}
		}
		return 1;
	}
    if(strcmp(cmd,"/sellgun",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
		    if (PlayerInfo[playerid][pJob] != 9)
			{
			    SendClientMessage(playerid,COLOR_GREY,"   You are not a Arms Dealer !");
			    return 1;
			}
			new x_weapon[256],weapon[MAX_PLAYERS],ammo[MAX_PLAYERS],price[MAX_PLAYERS];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /sellgun [playerid/PartOfName] [weaponname]");
				SendClientMessage(playerid, COLOR_GREY, "Weapons: flowers(25) sdpistol(100) eagle(150) mp5(200) shotgun(200)");
				SendClientMessage(playerid, COLOR_GREY, "Weapons: ak47(600) m4(600) rifle (600)");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if (IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
					x_weapon = strtok(cmdtext, idx);
					if(!strlen(x_weapon))
					{
						SendClientMessage(playerid, COLOR_GREEN, "________________________________________________");
						SendClientMessage(playerid, COLOR_WHITE, "*** Sell Guns ***");
						SendClientMessage(playerid, COLOR_GREY, "USAGE: /sellgun [playerid/PartOfName] [weaponname]");
						SendClientMessage(playerid, COLOR_GREY, "Weapons: flowers(25) sdpistol(100) eagle(200) mp5(200) shotgun(200)");
						SendClientMessage(playerid, COLOR_GREY, "Weapons: ak47(600) m4(600) rifle(600)");
						SendClientMessage(playerid, COLOR_GREEN, "________________________________________________");
						return 1;
					}
				}
				//if(strcmp(x_weapon,"knife",true) == 0) { if(PlayerInfo[playerid][pMats] > 99) { weapon[playerid] = 4; price[playerid] = 100; ammo[playerid] = 1; PlayerInfo[giveplayerid][pGun1] = 4; PlayerInfo[giveplayerid][pAmmo1] = 1; } else { SendClientMessage(playerid,COLOR_GREY,"   Not enough Materials for that Weapon!"); return 1; } }
				if(strcmp(x_weapon,"sdpistol",true) == 0) { if(PlayerInfo[playerid][pMats] > 99) { weapon[playerid] = 23; price[playerid] = 100; ammo[playerid] = 50; PlayerInfo[giveplayerid][pGun2] = 23; PlayerInfo[giveplayerid][pAmmo2] = 50; } else { SendClientMessage(playerid,COLOR_GREY,"   Not enough Materials for that Weapon!"); return 1; } }
				else if(strcmp(x_weapon,"flowers",true) == 0) { if(PlayerInfo[playerid][pMats] > 24) { weapon[playerid] = 14; price[playerid] = 25; ammo[playerid] = 1; PlayerInfo[giveplayerid][pGun1] = 14; PlayerInfo[giveplayerid][pAmmo1] = 1; } else { SendClientMessage(playerid,COLOR_GREY,"   Not enough Materials for that Weapon!"); return 1; } }
				else if(strcmp(x_weapon,"eagle",true) == 0) { if(PlayerInfo[playerid][pMats] > 199) { weapon[playerid] = 24; price[playerid] = 150; ammo[playerid] = 50; PlayerInfo[giveplayerid][pGun2] = 24; PlayerInfo[giveplayerid][pAmmo2] = 50; } else { SendClientMessage(playerid,COLOR_GREY,"   Not enough Materials for that Weapon!"); return 1; } }
				else if(strcmp(x_weapon,"mp5",true) == 0) {	if(PlayerInfo[playerid][pMats] > 199) { weapon[playerid] = 29; price[playerid] = 200; ammo[playerid] = 200; PlayerInfo[giveplayerid][pGun2] = 29; PlayerInfo[giveplayerid][pAmmo2] = 200; } else { SendClientMessage(playerid,COLOR_GREY,"   Not enough Materials for that Weapon!"); return 1; } }
				else if(strcmp(x_weapon,"shotgun",true) == 0) {	if(PlayerInfo[playerid][pMats] > 199) { weapon[playerid] = 25; price[playerid] = 200; ammo[playerid] = 50; PlayerInfo[giveplayerid][pGun2] = 25; PlayerInfo[giveplayerid][pAmmo2] = 50; } else { SendClientMessage(playerid,COLOR_GREY,"   Not enough Materials for that Weapon!"); return 1; } }
				//else if(strcmp(x_weapon,"spas12",true) == 0) { if(PlayerInfo[playerid][pMats] > 599) { weapon[playerid] = 27; price[playerid] = 600; ammo[playerid] = 50; PlayerInfo[giveplayerid][pGun2] = 27; PlayerInfo[giveplayerid][pAmmo2] = 50; } else { SendClientMessage(playerid,COLOR_GREY,"   Not enough Materials for that Weapon!"); return 1; } }
				else if(strcmp(x_weapon,"ak47",true) == 0) { if(PlayerInfo[playerid][pMats] > 599) { weapon[playerid] = 30; price[playerid] = 600; ammo[playerid] = 250; PlayerInfo[giveplayerid][pGun2] = 30; PlayerInfo[giveplayerid][pAmmo2] = 250; } else { SendClientMessage(playerid,COLOR_GREY,"   Not enough Materials for that Weapon!"); return 1; } }
				else if(strcmp(x_weapon,"m4",true) == 0) { if(PlayerInfo[playerid][pMats] > 599) { weapon[playerid] = 31; price[playerid] = 600; ammo[playerid] = 250; PlayerInfo[giveplayerid][pGun2] = 31; PlayerInfo[giveplayerid][pAmmo2] = 250; } else { SendClientMessage(playerid,COLOR_GREY,"   Not enough Materials for that Weapon!"); return 1; } }
				else if(strcmp(x_weapon,"rifle",true) == 0) { if(PlayerInfo[playerid][pMats] > 599) { weapon[playerid] = 33; price[playerid] = 600; ammo[playerid] = 50; PlayerInfo[giveplayerid][pGun2] = 33; PlayerInfo[giveplayerid][pAmmo2] = 50; } else { SendClientMessage(playerid,COLOR_GREY,"   Not enough Materials for that Weapon!"); return 1; } }
				else { SendClientMessage(playerid,COLOR_GREY,"   Invalid Weapon name!"); return 1; }
				if (ProxDetectorS(5.0, playerid, giveplayerid))
				{
				    if(giveplayerid == playerid)
					{
						SendClientMessage(playerid, COLOR_GRAD1, "   You can not sell Guns to yourself!");
						return 1;
					}
					if(PlayerInfo[playerid][pMiserPerk] > 0)
					{
					    new skill = 2 * PlayerInfo[playerid][pMiserPerk];
					    new mats = price[playerid] / 100;
					    price[playerid] -= (mats)*(skill);
					}
					ConsumingMoney[playerid] = 1;
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					format(string, sizeof(string), "   You have given %s, a %s with %d ammo, for %d Materials.", giveplayer,x_weapon, ammo[playerid], price[playerid]);
					PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					SendClientMessage(playerid, COLOR_GRAD1, string);
					format(string, sizeof(string), "   You have recieved a %s with %d ammo from %s.", x_weapon, ammo[playerid], sendername);
					SendClientMessage(giveplayerid, COLOR_GRAD1, string);
					PlayerPlaySound(giveplayerid, 1052, 0.0, 0.0, 0.0);
					format(string, sizeof(string), "* %s created a Gun from Materials, and hands it to %s.", sendername ,giveplayer);
					ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					GivePlayerWeapon(giveplayerid,weapon[playerid],ammo[playerid]);
					PlayerInfo[playerid][pMats] -= price[playerid];
				}
				else
				{
					SendClientMessage(playerid, COLOR_GRAD1, "   Your too far away.");
					return 1;
				}
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		}
		return 1;
	}
	if(strcmp(cmd,"/get",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
			new x_job[256];
			x_job = strtok(cmdtext, idx);

			if(!strlen(x_job)) {
				SendClientMessage(playerid, COLOR_WHITE, "|__________________ Get __________________|");
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /get [name]");
		  		SendClientMessage(playerid, COLOR_GREY, "Available names: Drugs, Fuel");
				SendClientMessage(playerid, COLOR_GREEN, "|_________________________________________|");
				return 1;
			}

		    if(strcmp(x_job,"drugs",true) == 0)
			{
		        if(PlayerInfo[playerid][pDrugs] > 15)
		        {
		            format(string, sizeof(string), "  You still have %d grams with you, sell them first !", PlayerInfo[playerid][pDrugs]);
					SendClientMessage(playerid, COLOR_GREY, string);
		            return 1;
		        }
		        new tel;
			    new price;
			    new ammount;
			    tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /get drugs [ammount]");
					return 1;
				}
				new level = PlayerInfo[playerid][pDrugsSkill];
				ammount = strval(tmp);
				if(level >= 0 && level <= 50)
				{ tel = 200; if(ammount < 1 || ammount > 6) { SendClientMessage(playerid, COLOR_GREY, "   You cant go below 1 or above 6 at your Skill Level!"); return 1; } }
				else if(level >= 51 && level <= 100)
				{ tel = 150; if(ammount < 1 || ammount > 12) { SendClientMessage(playerid, COLOR_GREY, "   You cant go below 1 or above 12 at your Skill Level!"); return 1; } }
				else if(level >= 101 && level <= 200)
				{ tel = 100; if(ammount < 1 || ammount > 20) { SendClientMessage(playerid, COLOR_GREY, "   You cant go below 1 or above 20 at your Skill Level!"); return 1; } }
				else if(level >= 201 && level <= 400)
				{ tel = 50; if(ammount < 1 || ammount > 30) { SendClientMessage(playerid, COLOR_GREY, "   You cant go below 1 or above 30 at your Skill Level!"); return 1; } }
				else if(level >= 401)
				{ tel = 10; if(ammount < 1 || ammount > 99) { SendClientMessage(playerid, COLOR_GREY, "   You cant go below 1 or above 99 at your Skill Level!"); return 1; } }
			    if (PlayerInfo[playerid][pJob] == 4 && PlayerToPoint(2.0, playerid, 323.0342,1118.5804,1083.8828))
				{
				    price = ammount * tel;
				    if(GetPlayerMoney(playerid) > price)
				    {
				        format(string, sizeof(string), "* You bought %d grams for $%d.", ammount, price);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				        GivePlayerMoney(playerid, -price);
						PlayerInfo[playerid][pDrugs] = ammount;
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   You cant afford the Drugs !");
				        return 1;
				    }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not a Drugs Dealer, or not at the Cracker House !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"fuel",true) == 0)
			{
			    if(IsAtGasStation(playerid))
				{
				    new price = 20 * SBizzInfo[3][sbEntranceCost];
				    format(string, sizeof(string), "* You filled your Gas Can with 20% Fuel for $%d",price);
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
				    PlayerInfo[playerid][pFuel] = 20;
					GivePlayerMoney(playerid, - price);
					return 1;
				}
				else
				{
					SendClientMessage(playerid,COLOR_GREY,"   You're not at a Gas Station!");
					return 1;
				}
			}
			else { return 1; }
		}//not connected
		return 1;
	}
	if(strcmp(cmd, "/join", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(PlayerInfo[playerid][pJob] == 0)
			{
			    if(gTeam[playerid] == 1 || gTeam[playerid] == 2 || gTeam[playerid] == 4 || gTeam[playerid] == 11)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You must be a Civilian (Not Wanted) or a Family Member to get a Job !");
			        return 1;
			    }
			    if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,359.5408,206.7693,1008.3828))
				{
				    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pFMember] < 255) { SendClientMessage(playerid, COLOR_GREY, "   Families cannot take on this Job !"); return 1; }
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are about to become a Detective, and get a 5 hour Contract.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have to forfill this Contract first, if you want to Quit the job later.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* If you are sure to become a Detective, type /accept job.");
				    GettingJob[playerid] = 1;
				}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,347.7374,193.7241,1014.1875))
				{
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are about to become a Lawyer, and get a 5 hour Contract.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have to forfill this Contract first, if you want to Quit the job later.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* If you are sure to become a Lawyer, type /accept job.");
				    GettingJob[playerid] = 2;
				}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,1215.1304,-11.8431,1000.9219))
				{
				    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pFMember] < 255) { SendClientMessage(playerid, COLOR_GREY, "   Families cannot take on this Job !"); return 1; }
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are about to become a Whore, and get a 5 hour Contract.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have to forfill this Contract first, if you want to Quit the job later.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* If you are sure to become a Whore, type /accept job.");
				    GettingJob[playerid] = 3;
				}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,2166.3772,-1675.3829,15.0859))
				{
				    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pFMember] < 255) { SendClientMessage(playerid, COLOR_GREY, "   Families cannot take on this Job !"); return 1; }
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are about to become a Drugs Dealer, and get a 5 hour Contract.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have to forfill this Contract first, if you want to Quit the job later.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* If you are sure to become a Drugs Dealer, type /accept job.");
				    GettingJob[playerid] = 4;
				}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,1109.3318,-1796.3042,16.5938))
				{
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are about to become a Car Jacker, and get a 5 hour Contract.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have to forfill this Contract first, if you want to Quit the job later.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* If you are sure to become a Car Jacker, type /accept job.");
				    GettingJob[playerid] = 5;
				}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,-1932.3859,276.2117,41.0391))
				{
				    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pFMember] < 255) { SendClientMessage(playerid, COLOR_GREY, "   Families cannot take on this Job !"); return 1; }
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are about to become a Car Mechanic, and get a 5 hour Contract.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have to forfill this Contract first, if you want to Quit the job later.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* If you are sure to become a Car Mechanic, type /accept job.");
				    GettingJob[playerid] = 7;
		  		}
				else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,2226.1716,-1718.1792,13.5165))
				{
				    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pFMember] < 255) { SendClientMessage(playerid, COLOR_GREY, "   Families cannot take on this Job !"); return 1; }
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are about to become a Bodyguard, and get a 5 hour Contract.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have to forfill this Contract first, if you want to Quit the job later.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* If you are sure to become a Bodyguard, type /accept job.");
				    GettingJob[playerid] = 8;
		  		}
		  		else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,1366.4325,-1275.2096,13.5469))
		  		{
		  		    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pFMember] < 255) { SendClientMessage(playerid, COLOR_GREY, "   Families cannot take on this Job !"); return 1; }
		  		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are about to become a Arms Dealer, and get a 5 hour Contract.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have to forfill this Contract first, if you want to Quit the job later.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* If you are sure to become a Arms Dealer, type /accept job.");
				    GettingJob[playerid] = 9;
		  		}
		  		else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,531.7930,-1292.4044,17.2422))
		  		{
		  		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are about to become a Car Dealer, and get a 5 hour Contract.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have to forfill this Contract first, if you want to Quit the job later.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* If you are sure to become a Car Dealer, type /accept job.");
				    GettingJob[playerid] = 10;
		  		}
		  		else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,766.0804,14.5133,1000.7004))
		  		{
		  		    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pFMember] < 255) { SendClientMessage(playerid, COLOR_GREY, "   Families cannot take on this Job !"); return 1; }
		  		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are about to become a Boxer, and get a 5 hour Contract.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have to forfill this Contract first, if you want to Quit the job later.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* If you are sure to become a Boxer, type /accept job.");
				    GettingJob[playerid] = 12;
		  		}
		  		else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,1154.2208,-1770.8203,16.5992))
		  		{
		  		    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pFMember] < 255) { SendClientMessage(playerid, COLOR_GREY, "   Families cannot take on this Job !"); return 1; }
		  		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are about to become a Bus Driver, and get a 5 hour Contract.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have to forfill this Contract first, if you want to Quit the job later.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* If you are sure to become a Bus Driver, type /accept job.");
				    GettingJob[playerid] = 14;
		  		}
		  		else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,-2040.9436,456.2395,35.1719))
		  		{
		  		    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pFMember] < 255) { SendClientMessage(playerid, COLOR_GREY, "   Families cannot take on this Job !"); return 1; }
		  		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are about to become a Paper Boy, and get a 5 hour Contract.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have to forfill this Contract first, if you want to Quit the job later.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* If you are sure to become a Paper Boy, type /accept job.");
				    GettingJob[playerid] = 15;
		  		}
		  		else if (GetPlayerState(playerid) == 1 && PlayerToPoint(3.0, playerid,-77.7288,-1136.3896,1.0781))
		  		{
		  		    if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pFMember] < 255) { SendClientMessage(playerid, COLOR_GREY, "   Families cannot take on this Job !"); return 1; }
		  		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are about to become a Trucker, and get a 5 hour Contract.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have to forfill this Contract first, if you want to Quit the job later.");
				    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* If you are sure to become a Trucker, type /accept job.");
				    GettingJob[playerid] = 16;
				}
		  		else
		  		{
		  		    SendClientMessage(playerid, COLOR_GREY, "   You are not even near a place to get a Job !");
		  		}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You already have a Job, use /quitjob first !");
			}
		}//not connected
	    return 1;
	}
	if(strcmp(cmd, "/fill", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(IsAtGasStation(playerid))
			{
			    GameTextForPlayer(playerid,"~w~~n~~n~~n~~n~~n~~n~~n~~n~~n~Re-Fueling Vehicle, please wait",2000,3);
				SetTimer("Fillup",RefuelWait,0);
				Refueling[playerid] = 1;
			}
			else
			{
				SendClientMessage(playerid,COLOR_GREY,"   You're not at a Gas Station!");
			}
		}
    	return 1;
	}
	if(strcmp(cmd, "/fillcar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(PlayerInfo[playerid][pFuel] > 0)
		    {
		        if(Gas[gLastCar[playerid]] < 81)
		        {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "   You filled your car with 20 percent Fuel from your Gas Can.");
			        Gas[gLastCar[playerid]] += 20;
			        PlayerInfo[playerid][pFuel] = 0;
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Your Car still got enough Fuel to drive with !");
				}
		    }
		    else
		    {
		        SendClientMessage(playerid, COLOR_GREY, "   You have no Fuel left in your Gas Can !");
		    }
		}
		return 1;
	}
	if(strcmp(cmd, "/tazer", true) ==0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(gTeam[playerid] == 2 || IsACop(playerid))
			{
			    if(IsPlayerInAnyVehicle(playerid))
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   Cannot use this while being in the Car !");
			        return 1;
			    }
			    new suspect = GetClosestPlayer(playerid);
			    if(IsPlayerConnected(suspect))
				{
				    if(PlayerCuffed[suspect] > 0)
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   Player already Cuffed !");
				        return 1;
				    }
				    if(GetDistanceBetweenPlayers(playerid,suspect) < 5)
					{
					    if(gTeam[suspect] == 2)
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   Cannot Tazer Cops / FBI / National Guard !");
					        return 1;
					    }
					    if(IsPlayerInAnyVehicle(suspect))
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   Suspect is in a Car, get him out first !");
					        return 1;
					    }
					    GetPlayerName(suspect, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "* You were Tazed by %s for 8 seconds.", sendername);
						SendClientMessage(suspect, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* You Tazed %s for 8 seconds.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* %s shoots with his Tazer at %s, and tazed him.", sendername ,giveplayer);
						ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
						GameTextForPlayer(suspect, "~r~Tazed", 2500, 3);
						TogglePlayerControllable(suspect, 0);
						PlayerCuffed[suspect] = 1;
						PlayerCuffedTime[suspect] = 8;
		            }
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   No-one near you!");
					    return 1;
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "   You are not a Cop / FBI / National Guard !");
			}
		}//not connected
	    return 1;
	}
	if(strcmp(cmd, "/cuff", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(gTeam[playerid] == 2 || IsACop(playerid))
			{
			    tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /cuff [Playerid/PartOfName]");
					return 1;
				}
				giveplayerid = ReturnUser(tmp);
			    if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        if(gTeam[giveplayerid] == 2 || IsACop(giveplayerid))
				        {
				            SendClientMessage(playerid, COLOR_GREY, "   You can't Cuff Cops !");
					        return 1;
				        }
					    if(PlayerCuffed[giveplayerid] > 0)
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   Player already Cuffed !");
					        return 1;
					    }
						if (ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    new car = GetPlayerVehicleID(playerid);
						    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Cuff yourself!"); return 1; }
						    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == 2 && IsPlayerInVehicle(giveplayerid, car))
						    {
						        GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
						        format(string, sizeof(string), "* You were Cuffed by %s, till uncuff.", sendername);
								SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* You Cuffed %s, till uncuff.", giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* %s Hand Cuffs %s, so he wont go anywhere.", sendername ,giveplayer);
								ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
								GameTextForPlayer(giveplayerid, "~r~Cuffed", 2500, 3);
								TogglePlayerControllable(giveplayerid, 0);
								PlayerCuffed[giveplayerid] = 2;
								PlayerCuffedTime[giveplayerid] = 180;
						    }
						    else
						    {
						        SendClientMessage(playerid, COLOR_GREY, "   Player not in your Car, or your not the Driver !");
						        return 1;
						    }
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
						    return 1;
						}
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
				    return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "   You are not a Cop / FBI / National Guard !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/uncuff", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(gTeam[playerid] == 2)
			{
			    tmp = strtok(cmdtext, idx);
				if(!strlen(tmp)) {
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: /uncuff [Playerid/PartOfName]");
					return 1;
				}
				giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
					if(giveplayerid != INVALID_PLAYER_ID)
					{
					    if (ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Uncuff yourself!"); return 1; }
							if(PlayerCuffed[giveplayerid])
							{
							    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
							    format(string, sizeof(string), "* You were Uncuffed by %s.", sendername);
								SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* You Uncuffed %s.", giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								GameTextForPlayer(giveplayerid, "~g~Uncuffed", 2500, 3);
								TogglePlayerControllable(giveplayerid, 1);
								PlayerCuffed[giveplayerid] = 0;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   That player isn't Tied up !");
							    return 1;
							}
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
						    return 1;
						}
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
				    return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "   You are not a Cop / FBI / National Guard !");
			}
		}//not connected
		return 1;
	}
    if(strcmp(cmd, "/find", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(PlayerInfo[playerid][pJob] != 1)
		    {
				SendClientMessage(playerid, COLOR_GREY, "   You are not a Detective !");
				return 1;
		    }
		    if(PlayerOnMission[playerid] > 0)
			{
				SendClientMessage(playerid, COLOR_GREY, "   On a mission right now, can't use this command !");
			    return 1;
			}
			if(UsedFind[playerid] != 0 && PlayerInfo[playerid][pDetSkill] < 401)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You've already searched for someone, wait 2 minutes !");
			    return 1;
			}
		    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /find [playerid/PartOfName]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Find yourself!"); return 1; }
			        new points;
			        new level = PlayerInfo[playerid][pDetSkill];
					if(level >= 0 && level <= 50)
					{ points = 4; }
					else if(level >= 51 && level <= 100)
					{ points = 6; }
					else if(level >= 101 && level <= 200)
					{ points = 8; }
					else if(level >= 201 && level <= 400)
					{ points = 10; }
					else if(level >= 401)
					{ points = 12; }
				    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					new Float:X,Float:Y,Float:Z;
					GetPlayerPos(giveplayerid, X,Y,Z);
					SetPlayerCheckpoint(playerid, X,Y,Z, 6);
					FindTime[playerid] = 1;
					FindTimePoints[playerid] = points;
					PlayerInfo[playerid][pDetSkill] ++;
					UsedFind[playerid] = 1;
					if(PlayerInfo[playerid][pDetSkill] == 50)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Detective Skill is now Level 2, soon you are able to find Faction Members."); }
					else if(PlayerInfo[playerid][pDetSkill] == 100)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Detective Skill is now Level 3, soon you are able to find Faction Members."); }
					else if(PlayerInfo[playerid][pDetSkill] == 200)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Detective Skill is now Level 4, you are now able to find Faction Members."); }
					else if(PlayerInfo[playerid][pDetSkill] == 400)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Detective Skill is now Level 5, you are now able to find Faction Members."); }
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   Invalid Name/ID !");
			}
		}
	    return 1;
	}
	if(strcmp(cmd, "/guard", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(PlayerInfo[playerid][pJob] != 8)
		    {
				SendClientMessage(playerid, COLOR_GREY, "   You are not a Bodyguard!");
				return 1;
		    }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /guard [playerid/PartOfName] [price]");
				return 1;
			}
			new money;
			giveplayerid = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) { return 1; }
			money = strval(tmp);
			if(money < 1 || money > 99999) { SendClientMessage(playerid, COLOR_GREY, "   Price not lower then 1, or above 99999!"); return 1; }
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if(ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    if(giveplayerid == playerid)
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   Cant offer protection to yourself !");
					        return 1;
					    }
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
					    format(string, sizeof(string), "* You offerd protection to %s for $%d.", giveplayer, money);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Bodyguard %s wants to protect you for $%d, (type /accept bodyguard) to accept.", sendername, money);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						GuardOffer[giveplayerid] = playerid;
						GuardPrice[giveplayerid] = money;
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That player is offline!");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/free", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(PlayerInfo[playerid][pJob] != 2)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "   You are not a Lawyer!");
		        return 1;
		    }
		    if(PlayerInfo[playerid][pLawSkill] >= 401)
		    {
		        ApprovedLawyer[playerid] = 1;
		    }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /free [playerid/PartOfName]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
            if(IsPlayerConnected(giveplayerid))
            {
                if(giveplayerid != INVALID_PLAYER_ID)
                {
                    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Free yourself!"); return 1; }
					if(PlayerInfo[giveplayerid][pJailed] == 1 && ApprovedLawyer[playerid] == 1)
					{
						GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "* You freed %s out of jail.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* You were freed out of jail, by Lawyer %s.", sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						ApprovedLawyer[playerid] = 0;
						WantLawyer[giveplayerid] = 0;
						CallLawyer[giveplayerid] = 0;
						JailPrice[giveplayerid] = 0;
						PlayerInfo[giveplayerid][pJailTime] = 1;
						PlayerInfo[playerid][pLawSkill] ++;
						if(PlayerInfo[playerid][pLawSkill] == 50)
						{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Lawyer Skill is now Level 2, you will earn more Money and quicker Reload Time."); }
						else if(PlayerInfo[playerid][pLawSkill] == 100)
						{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Lawyer Skill is now Level 3, you will earn more Money and quicker Reload Time."); }
						else if(PlayerInfo[playerid][pLawSkill] == 200)
						{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Lawyer Skill is now Level 4, you will earn more Money and quicker Reload Time."); }
						else if(PlayerInfo[playerid][pLawSkill] == 400)
						{ SendClientMessage(playerid, COLOR_YELLOW, "* Your Lawyer Skill is now Level 5, you will earn more Money and quicker Reload Time."); }
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD1, "   Player didnt need a Lawyer / Player aint Jailed !");
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That player is offline!");
			}
		}//not connected
		return 1;
	}
	if(strcmp(cmd,"/cancel",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
			new x_job[256];
			x_job = strtok(cmdtext, idx);
			if(!strlen(x_job)) {
				SendClientMessage(playerid, COLOR_WHITE, "|__________________ Cancel __________________|");
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: /cancel [name]");
				SendClientMessage(playerid, COLOR_GREY, "Available names: Sex, Drugs, Repair, Lawyer, Bodyguard, Live, Refill, Car, Boxing");
				SendClientMessage(playerid, COLOR_GREY, "Available names: Taxi, Bus, Medic, Mechanic, Paper, Ticket, Witness, Marriage, Divorce");
				SendClientMessage(playerid, COLOR_WHITE, "|____________________________________________|");
				return 1;
			}
			if(strcmp(x_job,"sex",true) == 0) {	SexOffer[playerid] = 999; SexPrice[playerid] = 0; }
			else if(strcmp(x_job,"drugs",true) == 0) { DrugOffer[playerid] = 999; DrugPrice[playerid] = 0; DrugGram[playerid] = 0; }
			else if(strcmp(x_job,"repair",true) == 0) {	RepairOffer[playerid] = 999; RepairPrice[playerid] = 0; RepairCar[playerid] = 0; }
			else if(strcmp(x_job,"lawyer",true) == 0) { WantLawyer[playerid] = 0; CallLawyer[playerid] = 0; }
			else if(strcmp(x_job,"bodyguard",true) == 0) { GuardOffer[playerid] = 999; GuardPrice[playerid] = 0; }
			else if(strcmp(x_job,"live",true) == 0) { LiveOffer[playerid] = 999; }
			else if(strcmp(x_job,"refill",true) == 0) { RefillOffer[playerid] = 999; RefillPrice[playerid] = 0; }
			else if(strcmp(x_job,"car",true) == 0) { CarOffer[playerid] = 999; CarPrice[playerid] = 0; CarID[playerid] = 0; }
			else if(strcmp(x_job,"boxing",true) == 0) { BoxOffer[playerid] = 999; }
			else if(strcmp(x_job,"paper",true) == 0) { PaperOffer[playerid] = 999; }
			else if(strcmp(x_job,"witness",true) == 0) { MarryWitnessOffer[playerid] = 999; }
			else if(strcmp(x_job,"marriage",true) == 0) { ProposeOffer[playerid] = 999; }
			else if(strcmp(x_job,"divorce",true) == 0) { DivorceOffer[playerid] = 999; }
			else if(strcmp(x_job,"ticket",true) == 0) { TicketOffer[playerid] = 999; TicketMoney[playerid] = 0; }
			else if(strcmp(x_job,"medic",true) == 0) { if(IsPlayerConnected(MedicCall)) { if(MedicCall == playerid) { MedicCall = 999; } else { SendClientMessage(playerid, COLOR_GREY, "   You are not the current Caller !"); return 1; } } }
			else if(strcmp(x_job,"mechanic",true) == 0) { if(IsPlayerConnected(MechanicCall)) { if(MechanicCall == playerid) { MechanicCall = 999; } else { SendClientMessage(playerid, COLOR_GREY, "   You are not the current Caller !"); return 1; } } }
			else if(strcmp(x_job,"taxi",true) == 0)
			{
			    if(TaxiCall < 999)
			    {
			        if(TransportDuty[playerid] == 1 && TaxiCallTime[playerid] > 0)
			        {
			            TaxiAccepted[playerid] = 999;
						GameTextForPlayer(playerid, "~w~You have~n~~r~Canceled the call", 5000, 1);
						TaxiCallTime[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
						TaxiCall = 999;
			        }
			        else
			        {
						if(IsPlayerConnected(TaxiCall)) { if(TaxiCall == playerid) { TaxiCall = 999; } }
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
						    if(IsPlayerConnected(i))
						    {
						        if(TaxiAccepted[i] < 999)
						        {
							        if(TaxiAccepted[i] == playerid)
							        {
							            TaxiAccepted[i] = 999;
							            GameTextForPlayer(i, "~w~Taxi Caller~n~~r~Canceled the call", 5000, 1);
							            TaxiCallTime[i] = 0;
							            DisablePlayerCheckpoint(i);
							        }
						        }
						    }
						}
					}
				}
			}
			else if(strcmp(x_job,"bus",true) == 0)
			{
			    if(BusCall < 999)
			    {
			        if(TransportDuty[playerid] == 2 && BusCallTime[playerid] > 0)
			        {
			            BusAccepted[playerid] = 999;
						GameTextForPlayer(playerid, "~w~You have~n~~r~Canceled the call", 5000, 1);
						BusCallTime[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
						BusCall = 999;
			        }
			        else
			        {
						if(IsPlayerConnected(BusCall)) { if(BusCall == playerid) { BusCall = 999; } }
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
						    if(IsPlayerConnected(i))
						    {
						        if(BusAccepted[i] < 999)
						        {
							        if(BusAccepted[i] == playerid)
							        {
							            BusAccepted[i] = 999;
							            GameTextForPlayer(i, "~w~Bus Caller~n~~r~Canceled the call", 5000, 1);
							            BusCallTime[i] = 0;
							            DisablePlayerCheckpoint(i);
							        }
						        }
						    }
						}
					}
				}
			}
			else { return 1; }
			format(string, sizeof(string), "* You have canceled: %s.", x_job);
			SendClientMessage(playerid, COLOR_YELLOW, string);
		}//not connected
		return 1;
	}
//ACCEPT COMMANDS (Cops)
	if(strcmp(cmd,"/accept",true)==0)
    {
        if(IsPlayerConnected(playerid))
	    {
			new x_job[256];
			x_job = strtok(cmdtext, idx);
			if(!strlen(x_job)) {
				SendClientMessage(playerid, COLOR_WHITE, "|__________________ Accept __________________|");
				SendClientMessage(playerid, COLOR_WHITE, "USAGE: accept [name]");
				SendClientMessage(playerid, COLOR_GREY, "Available names: Sex, Drugs, Repair, Lawyer, Bodyguard, Job, Live, Refill");
				SendClientMessage(playerid, COLOR_GREY, "Available names: Car, Taxi, Bus, Boxing, Medic, Mechanic, Paper, Ticket");
				SendClientMessage(playerid, COLOR_WHITE, "|____________________________________________|");
				return 1;
			}
	        if(strcmp(x_job,"car",true) == 0)
			{
			    if(CarOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(CarOffer[playerid]))
			        {
			            if(GetPlayerMoney(playerid) > CarPrice[playerid])
			            {
			                if(IsPlayerInVehicle(CarOffer[playerid], CarID[playerid]))
			                {
				                GetPlayerName(CarOffer[playerid], giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
				                new points;
				                PlayerInfo[CarOffer[playerid]][pCarSkill] ++;
				                if(PlayerInfo[CarOffer[playerid]][pCarSkill] == 50)
								{ SendClientMessage(CarOffer[playerid], COLOR_YELLOW, "* Your Car Dealer Skill is now Level 2, Players that buy Cars from you can call it more often."); }
								else if(PlayerInfo[CarOffer[playerid]][pCarSkill] == 100)
								{ SendClientMessage(CarOffer[playerid], COLOR_YELLOW, "* Your Car Dealer Skill is now Level 3, Players that buy Cars from you can call it more often."); }
								else if(PlayerInfo[CarOffer[playerid]][pCarSkill] == 200)
								{ SendClientMessage(CarOffer[playerid], COLOR_YELLOW, "* Your Car Dealer Skill is now Level 4, Players that buy Cars from you can call it more often."); }
								else if(PlayerInfo[CarOffer[playerid]][pCarSkill] == 400)
								{ SendClientMessage(CarOffer[playerid], COLOR_YELLOW, "* Your Car Dealer Skill is now Level 5, Players that buy Cars from you can call it more often."); }
								new level = PlayerInfo[CarOffer[playerid]][pCarSkill];
								if(level >= 0 && level <= 50) { points = 1; }
								else if(level >= 51 && level <= 100) { points = 2; }
								else if(level >= 101 && level <= 200) { points = 3; }
								else if(level >= 201 && level <= 400) { points = 4; }
								else if(level >= 401) { points = 4; }
				                format(string, sizeof(string), "* You bought a Car for $%d, from Car Dealer %s. (You can use /callcar %d times)",CarPrice[playerid],giveplayer,points);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* You sold your Car to %s for $%d, the player can use /callcar %d times.",sendername,CarPrice[playerid],points);
								SendClientMessage(CarOffer[playerid], COLOR_LIGHTBLUE, string);
								PlayerInfo[CarOffer[playerid]][pPayCheck] += CarPrice[playerid];
								GivePlayerMoney(playerid, -CarPrice[playerid]);
								RemovePlayerFromVehicle(CarOffer[playerid]);
								CarCalls[playerid] = points;
						        CarOffer[playerid] = 999;
								CarPrice[playerid] = 0;
								return 1;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   The Car Dealer is not in the offerd Car !");
						    	return 1;
							}
			            }
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   You cant afford the Car !");
						    return 1;
						}
			        }
			        return 1;
			    }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   No-one offered to buy a Car !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"divorce",true) == 0)
			{
			    if(DivorceOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(DivorceOffer[playerid]))
			        {
			            if(ProxDetectorS(10.0, playerid, DivorceOffer[playerid]))
						{
						    GetPlayerName(DivorceOffer[playerid], giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							format(string, sizeof(string), "* You have accepted %s's request to be his Marriage Witness.", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s has accepted your request to be your Marriage Witness.", sendername);
							SendClientMessage(DivorceOffer[playerid], COLOR_LIGHTBLUE, string);
							ClearMarriage(playerid);
							ClearMarriage(DivorceOffer[playerid]);
							PlayerInfo[playerid][pPhousekey] = 255;
							PlayerInfo[playerid][pPbiskey] = 255;
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   The player that sent you the Divorce Papers is not near you !");
						    return 1;
						}
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   No-one sent you any Divorce Papers !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"witness",true) == 0)
			{
			    if(MarryWitnessOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(MarryWitnessOffer[playerid]))
			        {
			            if(ProxDetectorS(10.0, playerid, MarryWitnessOffer[playerid]))
						{
						    GetPlayerName(MarryWitnessOffer[playerid], giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							format(string, sizeof(string), "* You have accepted %s's request to be his Marriage Witness.", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s has accepted your request to be your Marriage Witness.", sendername);
							SendClientMessage(MarryWitnessOffer[playerid], COLOR_LIGHTBLUE, string);
							MarryWitness[MarryWitnessOffer[playerid]] = playerid;
							MarryWitnessOffer[playerid] = 999;
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   The player that requested you to be his Marriage Witness is not near you !");
						    return 1;
						}
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   No-one asked you to be his Marriage Witness !");
				    return 1;
				}
			}
	        else if(strcmp(x_job,"marriage",true) == 0)
			{
			    if(ProposeOffer[playerid] < 999)
			    {
			        if(!PlayerToPoint(10.0, playerid, -1988.6638,1117.8837,54.4726))
			        {
			            SendClientMessage(playerid, COLOR_GREY, "   You are not at the Church in San Fierro !");
			            return 1;
			        }
			        if(IsPlayerConnected(ProposeOffer[playerid]))
			        {
			            if(ProxDetectorS(10.0, playerid, ProposeOffer[playerid]))
						{
						    if(MarryWitness[ProposeOffer[playerid]] == 999)
						    {
						        SendClientMessage(playerid, COLOR_GREY, "   The proposer doesn't have a Marriage Witness !");
						        return 1;
						    }
						    if(IsPlayerConnected(MarryWitness[ProposeOffer[playerid]]))
						    {
							    if(ProxDetectorS(12.0, ProposeOffer[playerid], MarryWitness[ProposeOffer[playerid]]))
								{
								    GetPlayerName(ProposeOffer[playerid], giveplayer, sizeof(giveplayer));
									GetPlayerName(playerid, sendername, sizeof(sendername));
									format(string, sizeof(string), "* You have accepted %s's request to be your Husband.", giveplayer);
									SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "* %s has accepted your request to be your Wife.", sendername);
									SendClientMessage(ProposeOffer[playerid], COLOR_LIGHTBLUE, string);
									format(string, sizeof(string), "Priest: %s do you take %s as your lovely Husband? (type 'yes', anything else will reject the Marriage)", sendername, giveplayer);
									SendClientMessage(playerid, COLOR_WHITE, string);
									MarriageCeremoney[playerid] = 1;
									ProposedTo[ProposeOffer[playerid]] = playerid;
									GotProposedBy[playerid] = ProposeOffer[playerid];
									MarryWitness[ProposeOffer[playerid]] = 999;
									ProposeOffer[playerid] = 999;
									return 1;
								}
								else
								{
								    SendClientMessage(playerid, COLOR_GREY, "   The Marriage Witness is not near your proposer !");
								    return 1;
								}
							}
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   The player that proposed to you is not near you !");
						    return 1;
						}
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   No-one Proposed to you !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"ticket",true) == 0)
			{
			    if(TicketOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(TicketOffer[playerid]))
			        {
			            if (ProxDetectorS(5.0, playerid, TicketOffer[playerid]))
						{
				           	GetPlayerName(TicketOffer[playerid], giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							format(string, sizeof(string), "* You have paid the Ticket of $%d to Officer %s.", TicketMoney[playerid], giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s has paid your Ticket of $%d.", sendername, TicketMoney[playerid]);
							SendClientMessage(TicketOffer[playerid], COLOR_LIGHTBLUE, string);
							GivePlayerMoney(playerid, - TicketMoney[playerid]);
							GivePlayerMoney(TicketOffer[playerid], TicketMoney[playerid]);
							TicketOffer[playerid] = 999;
							TicketMoney[playerid] = 0;
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   The Officer is not near you !");
						    return 1;
						}
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   No-one offered you a Ticket !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"paper",true) == 0)
			{
			    if(PaperOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(PaperOffer[playerid]))
			        {
			            if(BringingPaper[PaperOffer[playerid]] > 0)
			            {
			                if (ProxDetectorS(5.0, playerid, PaperOffer[playerid]))
							{
				            	GetPlayerName(PaperOffer[playerid], giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								format(string, sizeof(string), "* You have accepted a Newspaper from Paper Boy %s (use /read paper, to read).", giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* %s has accepted your Newspaper.", sendername);
								SendClientMessage(PaperOffer[playerid], COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "%s", Paper[PaperOffer[playerid]][pTitle]);
								strmid(Paper[playerid][pTitle], string, 0, strlen(string), 255);
								format(string, sizeof(string), "%s", Paper[PaperOffer[playerid]][pMaker]);
								strmid(Paper[playerid][pMaker], string, 0, strlen(string), 255);
								format(string, sizeof(string), "%s", Paper[PaperOffer[playerid]][pLine1]);
								strmid(Paper[playerid][pLine1], string, 0, strlen(string), 255);
								format(string, sizeof(string), "%s", Paper[PaperOffer[playerid]][pLine2]);
								strmid(Paper[playerid][pLine2], string, 0, strlen(string), 255);
								format(string, sizeof(string), "%s", Paper[PaperOffer[playerid]][pLine3]);
								strmid(Paper[playerid][pLine3], string, 0, strlen(string), 255);
								format(string, sizeof(string), "%s", Paper[PaperOffer[playerid]][pLine4]);
								strmid(Paper[playerid][pLine4], string, 0, strlen(string), 255);
								format(string, sizeof(string), "%s", Paper[PaperOffer[playerid]][pLine5]);
								strmid(Paper[playerid][pLine5], string, 0, strlen(string), 255);
								format(string, sizeof(string), "%s", Paper[PaperOffer[playerid]][pLine6]);
								strmid(Paper[playerid][pLine6], string, 0, strlen(string), 255);
								format(string, sizeof(string), "%s", Paper[PaperOffer[playerid]][pLine7]);
								strmid(Paper[playerid][pLine7], string, 0, strlen(string), 255);
								GotPaper[playerid] = 1;
								PaperOffer[playerid] = 999;
								return 1;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   The Paper Boy is not near you !");
							    return 1;
							}
						}
			        }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   No-one offered you a Newspaper !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"boxing",true) == 0)
			{
			    if(BoxOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(BoxOffer[playerid]))
			        {
			            new points;
			            new mypoints;
			            GetPlayerName(BoxOffer[playerid], giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
			            new level = PlayerInfo[BoxOffer[playerid]][pBoxSkill];
						if(level >= 0 && level <= 50) { points = 40; }
						else if(level >= 51 && level <= 100) { points = 50; }
						else if(level >= 101 && level <= 200) { points = 60; }
						else if(level >= 201 && level <= 400) { points = 70; }
						else if(level >= 401) { points = 80; }
						if(PlayerInfo[playerid][pJob] == 12)
						{
							new clevel = PlayerInfo[playerid][pBoxSkill];
							if(clevel >= 0 && clevel <= 50) { mypoints = 40; }
							else if(clevel >= 51 && clevel <= 100) { mypoints = 50; }
							else if(clevel >= 101 && clevel <= 200) { mypoints = 60; }
							else if(clevel >= 201 && clevel <= 400) { mypoints = 70; }
							else if(clevel >= 401) { mypoints = 80; }
						}
						else
						{
						    mypoints = 30;
						}
						format(string, sizeof(string), "* You have accepted the Boxing Challenge from %s, and will fight with %d Health.",giveplayer,mypoints);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* %s has accepted your Boxing Challenge Request, you will fight with %d Health.",sendername,points);
						SendClientMessage(BoxOffer[playerid], COLOR_LIGHTBLUE, string);
						SetPlayerHealth(playerid, mypoints);
						SetPlayerHealth(BoxOffer[playerid], points);
						SetPlayerInterior(playerid, 5); SetPlayerInterior(BoxOffer[playerid], 5);
						SetPlayerPos(playerid, 762.9852,2.4439,1001.5942); SetPlayerFacingAngle(playerid, 131.8632);
						SetPlayerPos(BoxOffer[playerid], 758.7064,-1.8038,1001.5942); SetPlayerFacingAngle(BoxOffer[playerid], 313.1165);
						TogglePlayerControllable(playerid, 0); TogglePlayerControllable(BoxOffer[playerid], 0);
						GameTextForPlayer(playerid, "~r~Waiting", 3000, 1); GameTextForPlayer(BoxOffer[playerid], "~r~Waiting", 3000, 1);
						new name[MAX_PLAYER_NAME];
						new dstring[MAX_PLAYER_NAME];
						new wstring[MAX_PLAYER_NAME];
						GetPlayerName(playerid, name, sizeof(name));
						format(dstring, sizeof(dstring), "%s", name);
						strmid(wstring, dstring, 0, strlen(dstring), 255);
						if(strcmp(Titel[TitelName] ,wstring, true ) == 0 )
						{
						    format(string, sizeof(string), "Boxing News: Boxing Champion %s will fight VS %s, in 60 seconds (Grove Street Gym).",  sendername, giveplayer);
							OOCOff(COLOR_WHITE,string);
							TBoxer = playerid;
							BoxDelay = 60;
						}
						GetPlayerName(BoxOffer[playerid], name, sizeof(name));
						format(dstring, sizeof(dstring), "%s", name);
						strmid(wstring, dstring, 0, strlen(dstring), 255);
						if(strcmp(Titel[TitelName] ,wstring, true ) == 0 )
						{
						    format(string, sizeof(string), "Boxing News: Boxing Champion %s will fight VS %s, in 60 seconds (Grove Street Gym).",  giveplayer, sendername);
							OOCOff(COLOR_WHITE,string);
							TBoxer = BoxOffer[playerid];
							BoxDelay = 60;
						}
						BoxWaitTime[playerid] = 1; BoxWaitTime[BoxOffer[playerid]] = 1;
						if(BoxDelay < 1) { BoxDelay = 20; }
						InRing = 1;
						Boxer1 = BoxOffer[playerid];
						Boxer2 = playerid;
						PlayerBoxing[playerid] = 1;
						PlayerBoxing[BoxOffer[playerid]] = 1;
						BoxOffer[playerid] = 999;
						return 1;
			        }
			        return 1;
			    }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   No-one offered you a Boxing Challenge !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"taxi",true) == 0)
			{
			    if(TransportDuty[playerid] != 1)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You are not a Taxi Driver !");
				    return 1;
			    }
	            if(TaxiCallTime[playerid] > 0)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You have already accepted a Taxi Call !");
				    return 1;
	            }
	            if(PlayerOnMission[playerid] > 0)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   On a mission right now, can't use this command !");
			        return 1;
			    }
	            if(TaxiCall < 999)
	            {
	                if(IsPlayerConnected(TaxiCall))
	                {
	                    GetPlayerName(playerid, sendername, sizeof(sendername));
	                	GetPlayerName(TaxiCall, giveplayer, sizeof(giveplayer));
	                	format(string, sizeof(string), "* You have accepted the Taxi Call from %s, you will see the marker untill you have reached it.",giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        format(string, sizeof(string), "* Taxi Driver %s has accepted your Taxi Call please wait at your current Position.",sendername);
						SendClientMessage(TaxiCall, COLOR_LIGHTBLUE, string);
						GameTextForPlayer(playerid, "~w~Taxi Caller~n~~r~Goto redmarker", 5000, 1);
						TaxiCallTime[playerid] = 1;
						TaxiAccepted[playerid] = TaxiCall;
						TaxiCall = 999;
						return 1;
					}
	            }
	            else
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   No-one called for a Taxi yet !");
			    	return 1;
	            }
			}
			else if(strcmp(x_job,"bus",true) == 0)
			{
			    if(TransportDuty[playerid] != 2)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You are not a Bus Driver !");
				    return 1;
			    }
	            if(BusCallTime[playerid] > 0)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You have already accepted a Bus Call !");
				    return 1;
	            }
	            if(PlayerOnMission[playerid] > 0)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   On a mission right now, can't use this command !");
			        return 1;
			    }
	            if(BusCall < 999)
	            {
	                if(IsPlayerConnected(BusCall))
	                {
	                    GetPlayerName(playerid, sendername, sizeof(sendername));
	                	GetPlayerName(BusCall, giveplayer, sizeof(giveplayer));
	                	format(string, sizeof(string), "* You have accepted the Bus Call from %s, you will see the marker untill you have reached it.",giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
                        format(string, sizeof(string), "* Bus Driver %s has accepted your Bus Call please wait at your current Position.",sendername);
						SendClientMessage(BusCall, COLOR_LIGHTBLUE, string);
						new Float:X,Float:Y,Float:Z;
						GetPlayerPos(BusCall, X, Y, Z);
						SetPlayerCheckpoint(playerid, X, Y, Z, 5);
						GameTextForPlayer(playerid, "~w~Bus Caller~n~~r~Goto redmarker", 5000, 1);
						BusCallTime[playerid] = 1;
						BusAccepted[playerid] = BusCall;
						BusCall = 999;
						return 1;
					}
	            }
	            else
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   No-one called for a Bus yet !");
			    	return 1;
	            }
			}
			else if(strcmp(x_job,"medic",true) == 0)
			{
			    if(PlayerInfo[playerid][pMember] == 4 || PlayerInfo[playerid][pLeader] == 4)
			    {
		            if(MedicCallTime[playerid] > 0)
		            {
		                SendClientMessage(playerid, COLOR_GREY, "   You have already accepted a Medic Call !");
					    return 1;
		            }
		            if(PlayerOnMission[playerid] > 0)
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   On a mission right now, can't use this command !");
				        return 1;
				    }
		            if(MedicCall < 999)
		            {
		                if(IsPlayerConnected(MedicCall))
		                {
		                    GetPlayerName(playerid, sendername, sizeof(sendername));
		                	GetPlayerName(MedicCall, giveplayer, sizeof(giveplayer));
		                	format(string, sizeof(string), "* You have accepted the Medic Call from %s, you have 30 Seconds to get there.",giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, "* After the 30 Seconds the Red Marker will dissapear.");
	                        format(string, sizeof(string), "* Medic %s has accepted your Medic Call please wait at your current Position.",sendername);
							SendClientMessage(MedicCall, COLOR_LIGHTBLUE, string);
							new Float:X,Float:Y,Float:Z;
							GetPlayerPos(MedicCall, X, Y, Z);
							SetPlayerCheckpoint(playerid, X, Y, Z, 5);
							GameTextForPlayer(playerid, "~w~Medic Caller~n~~r~Goto redmarker", 5000, 1);
							MedicCallTime[playerid] = 1;
							MedicCall = 999;
							return 1;
						}
		            }
		            else
		            {
		                SendClientMessage(playerid, COLOR_GREY, "   No-one called for a Medic yet !");
				    	return 1;
		            }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not a Medic !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"mechanic",true) == 0)
			{
			    if(PlayerInfo[playerid][pJob] != 7)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You are not a Car Mechanic !");
				    return 1;
			    }
	            if(MechanicCallTime[playerid] > 0)
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   You have already accepted a Mechanic Call !");
				    return 1;
	            }
	            if(PlayerOnMission[playerid] > 0)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   On a mission right now, can't use this command !");
			        return 1;
			    }
	            if(MechanicCall < 999)
	            {
	                if(IsPlayerConnected(MechanicCall))
	                {
	                    GetPlayerName(playerid, sendername, sizeof(sendername));
	                	GetPlayerName(MechanicCall, giveplayer, sizeof(giveplayer));
	                	format(string, sizeof(string), "* You have accepted the Mechanic Call from %s, you have 30 Seconds to get there.",giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* After the 30 Seconds the Red Marker will dissapear.");
                        format(string, sizeof(string), "* Car Mechanic %s has accepted your Mechanic Call please wait at your current Position.",sendername);
						SendClientMessage(MechanicCall, COLOR_LIGHTBLUE, string);
						new Float:X,Float:Y,Float:Z;
						GetPlayerPos(MechanicCall, X, Y, Z);
						SetPlayerCheckpoint(playerid, X, Y, Z, 5);
						GameTextForPlayer(playerid, "~w~Mechanic Caller~n~~r~Goto redmarker", 5000, 1);
						MechanicCallTime[playerid] = 1;
						MechanicCall = 999;
						return 1;
					}
	            }
	            else
	            {
	                SendClientMessage(playerid, COLOR_GREY, "   No-one called for a Car Mechanic yet !");
			    	return 1;
	            }
			}
		    else if(strcmp(x_job,"job",true) == 0)
			{
			    if(GettingJob[playerid] > 0)
			    {
			        if(PlayerInfo[playerid][pMember] > 0 || PlayerInfo[playerid][pFMember] < 255)
			        {
			            if(GettingJob[playerid] == 2 || GettingJob[playerid] == 5 || GettingJob[playerid] == 10)
			            {//Allow the 3 jobs for Family Members
			            }
			            else
						{
							SendClientMessage(playerid, COLOR_GREY, "   Cant get a Job, you are in a Family !");
			            	return 1;
						}
			        }
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Now that you have confirmed you want the Job, you got a 5 hour Contract.");
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Congratulations with your new Job, type /help to see your new command.");
			        PlayerInfo[playerid][pJob] = GettingJob[playerid];
			        GettingJob[playerid] = 0;
			        return 1;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   You haven't even been at a Job place yet!");
			        return 1;
			    }
			}
			else if(strcmp(x_job,"refill",true) == 0)
			{
			    if(RefillOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(RefillOffer[playerid]))
			        {
			            if(GetPlayerMoney(playerid) > RefillPrice[playerid])
			            {
			                GetPlayerName(RefillOffer[playerid], giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
			                new car = gLastCar[playerid];
			                new fuel;
			                PlayerInfo[RefillOffer[playerid]][pMechSkill] ++;
			                if(PlayerInfo[RefillOffer[playerid]][pMechSkill] == 50)
							{ SendClientMessage(RefillOffer[playerid], COLOR_YELLOW, "* Your Car Mechanic Skill is now Level 2, you can add more Fuel to any Players Cars."); }
							else if(PlayerInfo[RefillOffer[playerid]][pMechSkill] == 100)
							{ SendClientMessage(RefillOffer[playerid], COLOR_YELLOW, "* Your Car Mechanic Skill is now Level 3, you can add more Fuel to any Players Cars."); }
							else if(PlayerInfo[RefillOffer[playerid]][pMechSkill] == 200)
							{ SendClientMessage(RefillOffer[playerid], COLOR_YELLOW, "* Your Car Mechanic Skill is now Level 4, you can add more Fuel to any Players Cars."); }
							else if(PlayerInfo[RefillOffer[playerid]][pMechSkill] == 400)
							{ SendClientMessage(RefillOffer[playerid], COLOR_YELLOW, "* Your Car Mechanic Skill is now Level 5, you can add more Fuel to any Players Cars."); }
							new level = PlayerInfo[RefillOffer[playerid]][pMechSkill];
							if(level >= 0 && level <= 50)
							{ fuel = 15; }
							else if(level >= 51 && level <= 100)
							{ fuel = 40; }
							else if(level >= 101 && level <= 200)
							{ fuel = 60; }
							else if(level >= 201 && level <= 400)
							{ fuel = 80; }
							else if(level >= 401)
							{ fuel = 100; }
			                format(string, sizeof(string), "* You refilled your car with %d%, for $%d by Car Mechanic %s.",fuel,RefillPrice[playerid],giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* You refilled %s's car with %d%, the $%d has been added to your PayCheck.",sendername,fuel,RefillPrice[playerid]);
							SendClientMessage(RefillOffer[playerid], COLOR_LIGHTBLUE, string);
							PlayerInfo[RefillOffer[playerid]][pPayCheck] += RefillPrice[playerid];
							GivePlayerMoney(playerid, -RefillPrice[playerid]);
							if(Gas[car] < 110) { Gas[car] += fuel; }
					        RefillOffer[playerid] = 999;
							RefillPrice[playerid] = 0;
							return 1;
			            }
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   You cant afford the Refill !");
						    return 1;
						}
			        }
			        return 1;
			    }
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   No-one offered to Refill your Car !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"live",true) == 0)
			{
			    if(LiveOffer[playerid] < 999)
			    {
			        if(IsPlayerConnected(LiveOffer[playerid]))
			        {
				        if (ProxDetectorS(5.0, playerid, LiveOffer[playerid]))
						{
						    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are frozen till the Live Conversation ends.");
							SendClientMessage(LiveOffer[playerid], COLOR_LIGHTBLUE, "* You are frozen till the Live Conversation ends (use /live again).");
							TogglePlayerControllable(playerid, 0);
							TogglePlayerControllable(LiveOffer[playerid], 0);
							TalkingLive[playerid] = LiveOffer[playerid];
							TalkingLive[LiveOffer[playerid]] = playerid;
							LiveOffer[playerid] = 999;
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   You are to far away from the News Reporter !");
							return 1;
						}
					}
					return 1;
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   No-one gave you a Live Conversation offer !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"lawyer",true) == 0)
			{
			    tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /accept lawyer [playerid/PartOfName]");
					return 1;
				}
				giveplayerid = ReturnUser(tmp);
				if (gTeam[playerid] == 2)
				{
				    if(IsPlayerConnected(giveplayerid))
				    {
				        if(giveplayerid != INVALID_PLAYER_ID)
				        {
				            if(PlayerInfo[giveplayerid][pJob] == 2)
				            {
							    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								format(string, sizeof(string), "* You allowed %s to free a Jailed Person.", giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE,string);
								format(string, sizeof(string), "* Officer %s approved (allowed) you to free a Jailed Person. (use /free)", sendername);
								SendClientMessage(giveplayerid, COLOR_LIGHTBLUE,string);
								ApprovedLawyer[giveplayerid] = 1;
							    return 1;
							}
						}
					}
					return 1;
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "Invalid action! (You are no cop / Player aint a Lawyer / Bad ID)");
				    return 1;
				}
			}
			else if(strcmp(x_job,"bodyguard",true) == 0)
			{
			    if(GuardOffer[playerid] < 999)
			    {
			        if(GetPlayerMoney(playerid) > GuardPrice[playerid])
				    {
					    if(IsPlayerConnected(GuardOffer[playerid]))
					    {
					        GetPlayerName(GuardOffer[playerid], giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							format(string, sizeof(string), "* You accepted the Protection for $%d from Bodyguard %s.",GuardPrice[playerid],giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s accepted your Protection, and the $%d was added to your PayCheck.",sendername,GuardPrice[playerid]);
							SendClientMessage(GuardOffer[playerid], COLOR_LIGHTBLUE, string);
							PlayerInfo[GuardOffer[playerid]][pPayCheck] += GuardPrice[playerid];
							GivePlayerMoney(playerid, -GuardPrice[playerid]);
					        GuardOffer[playerid] = 999;
							GuardPrice[playerid] = 0;
							return 1;
						}
						return 1;
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You can't afford the Protection !");
					    return 1;
					}
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   No-one offerd you any Protection !");
			        return 1;
			    }
			}
			else if(strcmp(x_job,"drugs",true) == 0)
			{
			    if(DrugOffer[playerid] < 999)
			    {
			        if(GetPlayerMoney(playerid) > DrugPrice[playerid])
				    {
				        if(PlayerInfo[playerid][pDrugs] < 7)
				        {
					        if(IsPlayerConnected(DrugOffer[playerid]))
					        {
					            GetPlayerName(DrugOffer[playerid], giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								format(string, sizeof(string), "* You bought %d gram for $%d from Drug Dealer %s.",DrugGram[playerid],DrugPrice[playerid],giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* %s has bought your %d gram, the $%d was added to your PayCheck.",sendername,DrugGram[playerid],DrugPrice[playerid]);
								SendClientMessage(DrugOffer[playerid], COLOR_LIGHTBLUE, string);
								PlayerInfo[DrugOffer[playerid]][pPayCheck] += DrugPrice[playerid];
								PlayerInfo[DrugOffer[playerid]][pDrugsSkill] ++;
								GivePlayerMoney(playerid, -DrugPrice[playerid]);
								PlayerInfo[playerid][pDrugs] += DrugGram[playerid];
								PlayerInfo[DrugOffer[playerid]][pDrugs] -= DrugGram[playerid];
								if(PlayerInfo[DrugOffer[playerid]][pDrugsSkill] == 50)
								{ SendClientMessage(DrugOffer[playerid], COLOR_YELLOW, "* Your Drug Dealer Skill is now Level 2, you can buy more Grams and Cheaper."); }
								else if(PlayerInfo[DrugOffer[playerid]][pDrugsSkill] == 100)
								{ SendClientMessage(DrugOffer[playerid], COLOR_YELLOW, "* Your Drug Dealer Skill is now Level 3, you can buy more Grams and Cheaper."); }
								else if(PlayerInfo[DrugOffer[playerid]][pDrugsSkill] == 200)
								{ SendClientMessage(DrugOffer[playerid], COLOR_YELLOW, "* Your Drug Dealer Skill is now Level 4, you can buy more Grams and Cheaper."); }
								else if(PlayerInfo[DrugOffer[playerid]][pDrugsSkill] == 400)
								{ SendClientMessage(DrugOffer[playerid], COLOR_YELLOW, "* Your Drug Dealer Skill is now Level 5, you can buy more Grams and Cheaper."); }
					            DrugOffer[playerid] = 999;
								DrugPrice[playerid] = 0;
								DrugGram[playerid] = 0;
								return 1;
							}
							return 1;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   You are fully loaded with Drugs, use them first !");
						    return 1;
						}
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You can't afford those Drugs !");
					    return 1;
					}
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   No-one offerd you any Drugs !");
			        return 1;
			    }
			}
			else if(strcmp(x_job,"sex",true) == 0)
			{
			    if(SexOffer[playerid] < 999)
				{
					if(GetPlayerMoney(playerid) > SexPrice[playerid])
			  		{
						if (IsPlayerConnected(SexOffer[playerid]))
						{
						    new Car = GetPlayerVehicleID(playerid);
						    if(IsPlayerInAnyVehicle(playerid) && IsPlayerInVehicle(SexOffer[playerid], Car))
						    {
								GetPlayerName(SexOffer[playerid], giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								format(string, sizeof(string), "* You had sex with Whore %s, for $%d.", giveplayer, SexPrice[playerid]);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* %s had sex with you, the $%d was added to your PayCheck.", sendername, SexPrice[playerid]);
								SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, string);
								PlayerInfo[SexOffer[playerid]][pPayCheck] += SexPrice[playerid];
								GivePlayerMoney(playerid, -SexPrice[playerid]);
								PlayerInfo[SexOffer[playerid]][pSexSkill] ++;
								if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 50)
								{ SendClientMessage(SexOffer[playerid], COLOR_YELLOW, "* Your Sex Skill is now Level 2, you offer better Sex (health) and less chance on STD."); }
								else if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 100)
								{ SendClientMessage(SexOffer[playerid], COLOR_YELLOW, "* Your Sex Skill is now Level 3, you offer better Sex (health) and less chance on STD."); }
								else if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 200)
								{ SendClientMessage(SexOffer[playerid], COLOR_YELLOW, "* Your Sex Skill is now Level 4, you offer better Sex (health) and less chance on STD."); }
								else if(PlayerInfo[SexOffer[playerid]][pSexSkill] == 400)
								{ SendClientMessage(SexOffer[playerid], COLOR_YELLOW, "* Your Sex Skill is now Level 5, you offer better Sex (health) and less chance on STD."); }
								if(STDPlayer[playerid] == 0)
								{
								    if(Condom[playerid] < 1)
									{
									    new Float:health;
									    new level = PlayerInfo[SexOffer[playerid]][pSexSkill];
									    if(level >= 0 && level <= 50)
									    {
									        if(GetPlayerHealth(playerid, health) < 150) {
											SetPlayerHealth(playerid, health + 30.0); }
											new rand = random(sizeof(STD1));
											STDPlayer[playerid] = STD1[rand];
											STDPlayer[SexOffer[playerid]] = STD1[rand];
											if(STD1[rand] == 0) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 30 Health + no STD while having Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You haven't got a STD while having Sex."); }
											else if(STD1[rand] == 1) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 30 Health + a Chlamydia because of the Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You got a Chlamydia because of the Sex."); }
											else if(STD1[rand] == 2) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 30 Health + a Gonorrhea because of the Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You got a Gonorrhea because of the Sex."); }
											else if(STD1[rand] == 3) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 30 Health + a Syphilis because of the Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You got a Syphilis because of the Sex."); }
										}
										else if(level >= 51 && level <= 100)
									    {
									        if(GetPlayerHealth(playerid, health) < 150) {
											SetPlayerHealth(playerid, health + 60.0); }
											new rand = random(sizeof(STD2));
											STDPlayer[playerid] = STD2[rand];
											STDPlayer[SexOffer[playerid]] = STD2[rand];
											if(STD2[rand] == 0) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 60 Health + no STD while having Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You haven't got a STD while having Sex."); }
											else if(STD2[rand] == 1) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 60 Health + a Chlamydia because of the Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You got a Chlamydia because of the Sex."); }
											else if(STD2[rand] == 2) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 60 Health + a Gonorrhea because of the Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You got a Gonorrhea because of the Sex."); }
											else if(STD2[rand] == 3) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 60 Health + a Syphilis because of the Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You got a Syphilis because of the Sex."); }
										}
										else if(level >= 101 && level <= 200)
									    {
									        if(GetPlayerHealth(playerid, health) < 150) {
											SetPlayerHealth(playerid, health + 90.0); }
											new rand = random(sizeof(STD3));
											STDPlayer[playerid] = STD3[rand];
											STDPlayer[SexOffer[playerid]] = STD3[rand];
											if(STD3[rand] == 0) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 90 Health + no STD while having Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You haven't got a STD while having Sex."); }
											else if(STD3[rand] == 1) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 90 Health + a Chlamydia because of the Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You got a Chlamydia because of the Sex."); }
											else if(STD3[rand] == 2) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 90 Health + a Gonorrhea because of the Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You got a Gonorrhea because of the Sex."); }
											else if(STD3[rand] == 3) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 90 Health + a Syphilis because of the Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You got a Syphilis because of the Sex."); }
										}
										else if(level >= 201 && level <= 400)
									    {
									        if(GetPlayerHealth(playerid, health) < 150) {
											SetPlayerHealth(playerid, health + 120.0); }
											new rand = random(sizeof(STD4));
											STDPlayer[playerid] = STD4[rand];
											STDPlayer[SexOffer[playerid]] = STD4[rand];
											if(STD4[rand] == 0) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 120 Health + no STD while having Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You haven't got a STD while having Sex."); }
											else if(STD4[rand] == 1) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 120 Health + a Chlamydia because of the Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You got a Chlamydia because of the Sex."); }
											else if(STD4[rand] == 2) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 120 Health + a Gonorrhea because of the Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You got a Gonorrhea because of the Sex."); }
											else if(STD4[rand] == 3) { SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You got 120 Health + a Syphilis because of the Sex."); SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* You got a Syphilis because of the Sex."); }
										}
										else if(level >= 401)
										{
										    if(GetPlayerHealth(playerid, health) < 150) {
											SetPlayerHealth(playerid, health + 150.0); }
											SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Your Sex Skill Level is so high you gave high health and No STD.");
											SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* The Whore's Sex Skill Level is so high you got high health and No STD.");
										}
				      				}
									else
									{
									    SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* The player used a Condom.");
									    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You used a Condom.");
									    Condom[playerid] --;
									}
								}
								else
								{
								    SendClientMessage(SexOffer[playerid], COLOR_LIGHTBLUE, "* That player was already infected with a STD, can't get another one.");
								    return 1;
								}
								SexOffer[playerid] = 999;
								return 1;
							}
							else
							{
							    SendClientMessage(playerid, COLOR_GREY, "   You or the Whore are not both in a Car !");
							    return 1;
							}
						}//Connected or not
						return 1;
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You can't afford the Sex!");
					    return 1;
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You dont have any Sex offerd by a Whore !");
				    return 1;
				}
			}
			else if(strcmp(x_job,"repair",true) == 0)
			{
			    if(RepairOffer[playerid] < 999)
			    {
			        if(GetPlayerMoney(playerid) > RepairPrice[playerid])
				    {
					    if(IsPlayerInAnyVehicle(playerid))
					    {
					        if(IsPlayerConnected(RepairOffer[playerid]))
					        {
						        GetPlayerName(RepairOffer[playerid], giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
						        RepairCar[playerid] = GetPlayerVehicleID(playerid);
						        SetVehicleHealth(RepairCar[playerid], 1000.0);
								format(string, sizeof(string), "* You repaired your car for $%d by Car Mechanic %s.",RepairPrice[playerid],giveplayer);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* You fixed %s's car, the $%d has been added to your PayCheck.",sendername,RepairPrice[playerid]);
								SendClientMessage(RepairOffer[playerid], COLOR_LIGHTBLUE, string);
								PlayerInfo[RepairOffer[playerid]][pMechSkill] ++;
				                if(PlayerInfo[RepairOffer[playerid]][pMechSkill] == 50)
								{ SendClientMessage(RepairOffer[playerid], COLOR_YELLOW, "* Your Car Mechanic Skill is now Level 2, you can add more Fuel to any Players Cars."); }
								else if(PlayerInfo[RepairOffer[playerid]][pMechSkill] == 100)
								{ SendClientMessage(RepairOffer[playerid], COLOR_YELLOW, "* Your Car Mechanic Skill is now Level 3, you can add more Fuel to any Players Cars."); }
								else if(PlayerInfo[RepairOffer[playerid]][pMechSkill] == 200)
								{ SendClientMessage(RepairOffer[playerid], COLOR_YELLOW, "* Your Car Mechanic Skill is now Level 4, you can add more Fuel to any Players Cars."); }
								else if(PlayerInfo[RepairOffer[playerid]][pMechSkill] == 400)
								{ SendClientMessage(RepairOffer[playerid], COLOR_YELLOW, "* Your Car Mechanic Skill is now Level 5, you can add more Fuel to any Players Cars."); }
								PlayerInfo[RepairOffer[playerid]][pPayCheck] += RepairPrice[playerid];
								GivePlayerMoney(playerid, -RepairPrice[playerid]);
						        RepairOffer[playerid] = 999;
								RepairPrice[playerid] = 0;
								return 1;
							}
							return 1;
						}
						return 1;
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   You can't afford the Repair !");
					    return 1;
					}
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   No-one offerd you to Repair your Car !");
			        return 1;
			    }
			}
			else { return 1; }
		}//not connected
		return 1;
	}
	if(strcmp(cmd, "/refill", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(PlayerInfo[playerid][pJob] != 7)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "   You are not a Car Mechanic!");
		        return 1;
		    }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /refill [playerid/PartOfName] [price]");
				return 1;
			}
			new playa;
			new money;
			playa = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			money = strval(tmp);
			if(money < 1 || money > 99999) { SendClientMessage(playerid, COLOR_GREY, "   Price not lower then 1, or above 99999!"); return 1; }
			if(IsPlayerConnected(playa))
			{
			    if(playa != INVALID_PLAYER_ID)
			    {
			        if(ProxDetectorS(8.0, playerid, playa)&& IsPlayerInAnyVehicle(playa))
					{
					    if(playa == playerid) { SendClientMessage(playerid, COLOR_GREY, "   Can't do that!"); return 1; }
					    GetPlayerName(playa, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
					    format(string, sizeof(string), "* You offerd %s to refill his car for $%d .",giveplayer,money);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Car Mechanic %s wants to refill your car for $%d, (type /accept refill) to accept.",sendername,money);
						SendClientMessage(playa, COLOR_LIGHTBLUE, string);
						RefillOffer[playa] = playerid;
						RefillPrice[playa] = money;
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you / not in a car.");
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That player is offline.");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/repair", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(PlayerInfo[playerid][pJob] != 7)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "   You are not a Car Mechanic!");
		        return 1;
		    }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /repair [playerid/PartOfName] [price]");
				return 1;
			}
			new playa;
			new money;
			playa = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			money = strval(tmp);
			if(money < 1 || money > 99999) { SendClientMessage(playerid, COLOR_GREY, "   Price not lower then 1, or above 99999!"); return 1; }
			if(IsPlayerConnected(playa))
			{
			    if(playa != INVALID_PLAYER_ID)
			    {
			        if(ProxDetectorS(8.0, playerid, playa)&& IsPlayerInAnyVehicle(playa))
					{
					    if(playa == playerid) { SendClientMessage(playerid, COLOR_GREY, "   Can't do that!"); return 1; }
				    	GetPlayerName(playa, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
					    format(string, sizeof(string), "* You offerd %s to fix his car for $%d .",giveplayer,money);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Car Mechanic %s wants to repair your car for $%d, (type /accept repair) to accept.",sendername,money);
						SendClientMessage(playa, COLOR_LIGHTBLUE, string);
						RepairOffer[playa] = playerid;
						RepairPrice[playa] = money;
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you / not in a car.");
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That player is offline.");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/callcar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(CarCalls[playerid] > 0)
		    {
		        new Float:plocx,Float:plocy,Float:plocz;
	            GetPlayerPos(playerid, plocx, plocy, plocz);
				SetVehiclePos(CarID[playerid],plocx,plocy+4, plocz);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Bought Car has arrived.");
				CarCalls[playerid] -= 1;
				format(string, sizeof(string), "* You can call your Bought Car for %d times more.", CarCalls[playerid]);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
		    }
		    else
		    {
		        SendClientMessage(playerid, COLOR_GREY, "   Invalid action !");
		    }
		}
	    return 1;
	}
	if(strcmp(cmd, "/family", true) == 0 || strcmp(cmd, "/f", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(PlayerInfo[playerid][pMuted] == 1)
			{
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "You cannot speak, you have been silenced");
				return 1;
			}
			GetPlayerName(playerid, sendername, sizeof(sendername));
			new length = strlen(cmdtext);
			while ((idx < length) && (cmdtext[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = cmdtext[idx];
				idx++;
			}
			result[idx - offset] = EOS;
			if(!strlen(result))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: (/f)amily [family chat]");
				return 1;
			}
			if (gTeam[playerid] >= 5 || PlayerInfo[playerid][pFMember] < 255)
			{
			    new leader = PlayerInfo[playerid][pLeader];
			    new member = PlayerInfo[playerid][pMember];
			    if(member==5||member==6)
			    {
			        if(PlayerInfo[playerid][pRank] == 6) { format(string, sizeof(string), "** Godfather %s: %s. )) **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 5) { format(string, sizeof(string), "** Underboss %s: %s. )) **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 4) { format(string, sizeof(string), "** Capo %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 3) { format(string, sizeof(string), "** Soldier %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 2) { format(string, sizeof(string), "** Associate %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 1) { format(string, sizeof(string), "** Outsider %s: %s. ))  **", sendername, result); }
					else { format(string, sizeof(string), "** Outsider %s: %s. )) **", sendername, result); }
					SendFamilyMessage(PlayerInfo[playerid][pMember], TEAM_AZTECAS_COLOR, string);
				}
				else if(member==8)
				{
				    if(PlayerInfo[playerid][pRank] == 6) { format(string, sizeof(string), "** Director %s: %s. )) **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 5) { format(string, sizeof(string), "** Vice-Director %s: %s. )) **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 4) { format(string, sizeof(string), "** Special Agent %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 3) { format(string, sizeof(string), "** Agent %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 2) { format(string, sizeof(string), "** Marksman %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 1) { format(string, sizeof(string), "** Freelancer %s: %s. ))  **", sendername, result); }
					else { format(string, sizeof(string), "** Freelancer %s: %s. )) **", sendername, result); }
					SendFamilyMessage(PlayerInfo[playerid][pMember], TEAM_AZTECAS_COLOR, string);
				}
				else if(member==9)
				{
				    if(PlayerInfo[playerid][pRank] == 6) { format(string, sizeof(string), "** Network Producer %s: %s. )) **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 5) { format(string, sizeof(string), "** Network Editor %s: %s. )) **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 4) { format(string, sizeof(string), "** Network Anchor %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 3) { format(string, sizeof(string), "** Local Editor %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 2) { format(string, sizeof(string), "** Local Reporter %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 1) { format(string, sizeof(string), "** Intern %s: %s. ))  **", sendername, result); }
					else { format(string, sizeof(string), "** Intern %s: %s. )) **", sendername, result); }
					SendFamilyMessage(PlayerInfo[playerid][pMember], TEAM_AZTECAS_COLOR, string);
				}
				else if(member==10)
				{
				    if(PlayerInfo[playerid][pRank] == 6) { format(string, sizeof(string), "** Taxi Company Owner %s: %s. )) **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 5) { format(string, sizeof(string), "** Shift Supervisor %s: %s. )) **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 4) { format(string, sizeof(string), "** Dispatcher %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 3) { format(string, sizeof(string), "** Cabbie %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 2) { format(string, sizeof(string), "** Taxi Rookie %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 1) { format(string, sizeof(string), "** Trainee %s: %s. ))  **", sendername, result); }
					else { format(string, sizeof(string), "** Trainee %s: %s. )) **", sendername, result); }
					SendFamilyMessage(PlayerInfo[playerid][pMember], TEAM_AZTECAS_COLOR, string);
				}
				else if(member==11)
				{
				    if(PlayerInfo[playerid][pRank] == 6) { format(string, sizeof(string), "** Boss %s: %s. )) **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 5) { format(string, sizeof(string), "** Under Boss %s: %s. )) **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 4) { format(string, sizeof(string), "** Manager %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 3) { format(string, sizeof(string), "** Senior Instructor %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 2) { format(string, sizeof(string), "** Instructor %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 1) { format(string, sizeof(string), "** Trainee %s: %s. ))  **", sendername, result); }
					else { format(string, sizeof(string), "** Trainee %s: %s. )) **", sendername, result); }
					SendFamilyMessage(PlayerInfo[playerid][pMember], TEAM_AZTECAS_COLOR, string);
				}
				else if(leader==5||leader==6)
				{
				    format(string, sizeof(string), "** Godfather %s: %s. )) **", sendername, result);
					SendFamilyMessage(PlayerInfo[playerid][pLeader], TEAM_AZTECAS_COLOR, string);
				}
				else if(leader==8)
				{
				    format(string, sizeof(string), "** Director %s: %s. )) **", sendername, result);
					SendFamilyMessage(PlayerInfo[playerid][pLeader], TEAM_AZTECAS_COLOR, string);
				}
				else if(leader==9)
				{
				    format(string, sizeof(string), "** Network Producer %s: %s. )) **", sendername, result);
					SendFamilyMessage(PlayerInfo[playerid][pLeader], TEAM_AZTECAS_COLOR, string);
				}
				else if(leader==10)
				{
				    format(string, sizeof(string), "** Taxi Company Owner %s: %s. )) **", sendername, result);
					SendFamilyMessage(PlayerInfo[playerid][pLeader], TEAM_AZTECAS_COLOR, string);
				}
				else if(leader==11)
				{
				    format(string, sizeof(string), "** Boss %s: %s. )) **", sendername, result);
					SendFamilyMessage(PlayerInfo[playerid][pLeader], TEAM_AZTECAS_COLOR, string);
				}
				else if(PlayerInfo[playerid][pFMember] < 255)
			    {
			        if(PlayerInfo[playerid][pRank] == 6) { format(string, sizeof(string), "** Godfather %s: %s. )) **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 5) { format(string, sizeof(string), "** Underboss %s: %s. )) **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 4) { format(string, sizeof(string), "** Capo %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 3) { format(string, sizeof(string), "** Soldier %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 2) { format(string, sizeof(string), "** Associate %s: %s. ))  **", sendername, result); }
					else if(PlayerInfo[playerid][pRank] == 1) { format(string, sizeof(string), "** Outsider %s: %s. ))  **", sendername, result); }
					else { format(string, sizeof(string), "** Outsider %s: %s. )) **", sendername, result); }
					SendNewFamilyMessage(PlayerInfo[playerid][pFMember], TEAM_AZTECAS_COLOR, string);
				}
				printf("%s", string);
				return 1;
			}
			else
			{
				SendClientMessage(playerid, COLOR_GRAD2, "   you are not part of a Family!");
				return 1;
			}
		}//not connected
		return 1;
	}
	if(strcmp(cmd, "/news", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(PlayerInfo[playerid][pMember] == 9 || PlayerInfo[playerid][pLeader] == 9)
			{
			    new newcar = GetPlayerVehicleID(playerid);
		        if(PlayerInfo[playerid][pMuted] == 1)
				{
					SendClientMessage(playerid, TEAM_CYAN_COLOR, "You cannot speak, you have been silenced");
					return 1;
				}
				if(newcar == 99 || newcar == 97 || newcar == 98)
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' '))
					{
						idx++;
					}
					new offset = idx;
					new result[64];
					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
					{
						result[idx - offset] = cmdtext[idx];
						idx++;
					}
					result[idx - offset] = EOS;
					if(!strlen(result))
					{
						SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /news [newstext]");
						return 1;
					}
					format(string, sizeof(string), "NR %s: %s", sendername, result);
					OOCNews(COLOR_NEWS,string);
					PlayerInfo[playerid][pNewsSkill] ++;
					if(PlayerInfo[playerid][pNewsSkill] == 50)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Your News Reporter Skill is now Level 2, soon you are able to Fly the News Chopper and talk Live."); }
					else if(PlayerInfo[playerid][pNewsSkill] == 100)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Your News Reporter Skill is now Level 3, soon you are able to Fly the News Chopper and talk Live."); }
					else if(PlayerInfo[playerid][pNewsSkill] == 200)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Your News Reporter Skill is now Level 4, you can fly the News Chopper now."); }
					else if(PlayerInfo[playerid][pNewsSkill] == 400)
					{ SendClientMessage(playerid, COLOR_YELLOW, "* Your News Reporter Skill is now Level 5, you can now talk Live with any person you want."); }
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not in the News Van or Chopper !");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not a News Reporter !");
			}
		}//not connected
		return 1;
	}
	if(strcmp(cmd, "/live", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(PlayerInfo[playerid][pMember] == 9 || PlayerInfo[playerid][pLeader] == 9)
			{
			    if(TalkingLive[playerid] != 255)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Live Conversation ended.");
			        SendClientMessage(TalkingLive[playerid], COLOR_LIGHTBLUE, "* Live Conversation ended.");
			        TogglePlayerControllable(playerid, 1);
			        TogglePlayerControllable(TalkingLive[playerid], 1);
		            TalkingLive[TalkingLive[playerid]] = 255;
			        TalkingLive[playerid] = 255;
			        return 1;
			    }
			    if(PlayerInfo[playerid][pNewsSkill] < 400)
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Your News Reporter Skill is to low to talk Live with people !");
				    return 1;
				}
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /live [playerid/PartOfName]");
					return 1;
				}
				//giveplayerid = strval(tmp);
		        giveplayerid = ReturnUser(tmp);
				if (IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
						if (ProxDetectorS(5.0, playerid, giveplayerid))
						{
						    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Talk Live with yourself!"); return 1; }
						    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
							GetPlayerName(playerid, sendername, sizeof(sendername));
							format(string, sizeof(string), "* You offered %s to have a Live Conversation.", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s offered you to have a Live Conversation, type (/accept live) to accept.", sendername);
							SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
							LiveOffer[giveplayerid] = playerid;
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   You are to far away from that player !");
						    return 1;
						}
					}
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   Invalid ID/Name !");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not a News Reporter !");
			}
		}//not connected
		return 1;
	}
	if(strcmp(cmd, "/selldrugs", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
		    if(PlayerInfo[playerid][pJob] != 4)
		    {
				SendClientMessage(playerid, COLOR_GREY, "   You are not a Drugs Dealer!");
				return 1;
		    }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /selldrugs [playerid/PartOfName] [ammount] [price]");
				return 1;
			}
			new playa;
			new money;
			new needed;
			playa = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) { return 1; }
			needed = strval(tmp);
			if(needed < 1 || needed > 99) { SendClientMessage(playerid, COLOR_GREY, "   Grams not lower then 1, or above 99!"); return 1; }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) { return 1; }
			money = strval(tmp);
			if(money < 1 || money > 99999) { SendClientMessage(playerid, COLOR_GREY, "   Price not lower then 1, or above 99999!"); return 1; }
			if(needed > PlayerInfo[playerid][pDrugs]) { SendClientMessage(playerid, COLOR_GREY, "   You dont have that much Drugs with you !"); return 1; }
			if(IsPlayerConnected(playa))
			{
			    if(playa != INVALID_PLAYER_ID)
			    {
					if (ProxDetectorS(8.0, playerid, playa))
					{
					    if(playa == playerid)
					    {
					        SendClientMessage(playerid, COLOR_GREY, "   Cant sell to yourself!");
					        return 1;
					    }
					    GetPlayerName(playa, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
					    format(string, sizeof(string), "* You offerd %s to buy %d gram of drugs for $%d .", giveplayer, needed, money);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Drug Dealer %s wants to sell you %d gram for $%d, (type /accept drugs) to buy.", sendername, needed, money);
						SendClientMessage(playa, COLOR_LIGHTBLUE, string);
						DrugOffer[playa] = playerid;
						DrugPrice[playa] = money;
						DrugGram[playa] = needed;
					}
					else
					{
					    SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That player is offline.");
			}
		}
		return 1;
	}
	if(strcmp(cmdtext, "/usedrugs", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	   	{
	   	    if(PlayerBoxing[playerid] > 0)
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   Cant use Drugs while you are fighting !");
	            return 1;
	        }
			if(PlayerInfo[playerid][pDrugs] > 1)
			{
			    PlayerStoned[playerid] += 1;
			    if(PlayerStoned[playerid] >= 2) { GameTextForPlayer(playerid, "~w~You are~n~~p~Stoned", 4000, 1); }
			    new Float:health;
			    GetPlayerHealth(playerid, health);
			    if(PlayerInfo[playerid][pDrugPerk] > 0)
			    {
			        new hp = 2 * PlayerInfo[playerid][pDrugPerk]; hp += 20;
					SetPlayerHealth(playerid, health + hp);
			    }
			    else
			    {
			        SetPlayerHealth(playerid, health + 20.0);
			    }
			    SendClientMessage(playerid, COLOR_GREY, "   2 Drug Grams used !");
			    PlayerInfo[playerid][pDrugs] -= 2;
			    if(STDPlayer[playerid]==1)
				{
				     STDPlayer[playerid] = 0;
				     SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are no longer infected with a STD anymore because of the Drugs !");
				}
				else if(STDPlayer[playerid]==2)
				{
				     STDPlayer[playerid] = 1;
				     SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You lowered the STD to Chlamydia because of the Drugs !");
				}
				else if(STDPlayer[playerid]==3)
				{
				     STDPlayer[playerid] = 2;
				     SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You lowered the STD to Gonorrhea because of the Drugs !");
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You dont have any Drug Grams left !");
			}
		}//not connected
		return 1;
	}
	if(strcmp(cmd, "/healme", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	   	{
	        if (PlayerToPoint(3, playerid,1173.2563,-1323.3102,15.3943)||PlayerToPoint(3, playerid,2029.5945,-1404.6426,17.2512))
			{
	            if(STDPlayer[playerid] > 0)
	            {
					STDPlayer[playerid] = 0;
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You are no longer infected with a STD anymore because of the Hospital's help !");
					GivePlayerMoney(playerid, -1000);
					SendClientMessage(playerid, TEAM_CYAN_COLOR, "Doc: Your medical bill contained $1000,-. Have a nice day!");
				}
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You dont have a STD to heal !");
				    return 1;
				}
	        }
	        else
	        {
	            SendClientMessage(playerid, COLOR_GREY, "   You are not at a Hospital !");
	        }
        }
		return 1;
	}
	if(strcmp(cmd, "/eject", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	   	{
	        new State;
	        if(IsPlayerInAnyVehicle(playerid))
	        {
         		State=GetPlayerState(playerid);
		        if(State!=PLAYER_STATE_DRIVER)
		        {
		        	SendClientMessage(playerid,COLOR_GREY,"   You can only eject people as the driver !");
		            return 1;
		        }
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /eject [playerid/PartOfName]");
					return 1;
				}
				new playa;
				playa = ReturnUser(tmp);
				new test;
				test = GetPlayerVehicleID(playerid);
				if(IsPlayerConnected(playa))
				{
				    if(playa != INVALID_PLAYER_ID)
				    {
				        if(playa == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Eject yourself!"); return 1; }
				        if(IsPlayerInVehicle(playa,test))
				        {
							new PName[MAX_PLAYER_NAME];
							GetPlayerName(playerid,PName,sizeof(PName));
							GetPlayerName(playa, giveplayer, sizeof(giveplayer));
							format(string, sizeof(string), "* You have thrown %s out of the car!", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* You have been thrown out the car by %s !", PName);
							SendClientMessage(playa, COLOR_LIGHTBLUE, string);
							RemovePlayerFromVehicle(playa);
						}
						else
						{
						    SendClientMessage(playerid, COLOR_GREY, "   That player is not in your Car !");
						    return 1;
						}
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GREY, " Invalid ID/Name!");
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You need to be in a Vehicle to use this !");
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/sex", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	   	{
	        if(PlayerInfo[playerid][pJob] == 3)
			{
			    if(!IsPlayerInAnyVehicle(playerid))
			    {
					SendClientMessage(playerid, COLOR_GREY, "   You can only have Sex in a Car !");
					return 1;
			    }
			    new Car = GetPlayerVehicleID(playerid);
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /sex [playerid/PartOfName] [price]");
					return 1;
				}
				//giveplayerid = strval(tmp);
				giveplayerid = ReturnUser(tmp);
				tmp = strtok(cmdtext, idx);
				new money;
				money = strval(tmp);
				if(money < 1 || money > 99999) { SendClientMessage(playerid, COLOR_GREY, "   Price not lower then 1, or above 99999!"); return 1; }
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
						if (ProxDetectorS(8.0, playerid, giveplayerid))
						{
						    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot have Sex with yourself!"); return 1; }
						    if(IsPlayerInAnyVehicle(playerid) && IsPlayerInVehicle(giveplayerid, Car))
						    {
							    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
								GetPlayerName(playerid, sendername, sizeof(sendername));
								format(string, sizeof(string), "* You offerd %s to have Sex with you, for $%d.", giveplayer, money);
								SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
								format(string, sizeof(string), "* Whore %s has offerd you to have Sex with her, for $%d (type /accept sex) to accept.", sendername, money);
								SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
					            SexOffer[giveplayerid] = playerid;
					            SexPrice[giveplayerid] = money;
				            }
				            else
				            {
				                SendClientMessage(playerid, COLOR_GREY, "   You or the other player must be in a Car together !");
				                return 1;
				            }
						}
						else
						{
							SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
							return 1;
						}
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GREY, "   That player is offline !");
					return 1;
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "   You are not a Whore !");
			}
		}//not connected
		return 1;
		}
	if(strcmp(cmd, "/wanted", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	   	{
			if(gTeam[playerid] == 2 || IsACop(playerid))
			{
				new x;
				SendClientMessage(playerid, COLOR_GREEN, "Current Wanted Suspects:");
			    for(new i=0; i < MAX_PLAYERS; i++) {
					if(IsPlayerConnected(i))
					{
					    if(WantedLevel[i] > 1)
					    {
							GetPlayerName(i, giveplayer, sizeof(giveplayer));
							format(string, sizeof(string), "%s%s: %d", string,giveplayer,WantedLevel[i]);
							x++;
							if(x > 3) {
							    SendClientMessage(playerid, COLOR_YELLOW, string);
							    x = 0;
								format(string, sizeof(string), "");
							} else {
								format(string, sizeof(string), "%s, ", string);
							}
						}
					}
				}
				if(x <= 3 && x > 0) {
					string[strlen(string)-2] = '.';
				    SendClientMessage(playerid, COLOR_YELLOW, string);
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You're not a Cop / FBI / National Guard !");
			}
		}//not connected
		return 1;
	}
	if(strcmp(cmd, "/dropcar", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	   	{
	        if(PlayerInfo[playerid][pJob] == 5)
			{
			    if(PlayerOnMission[playerid] > 0)
			    {
			        SendClientMessage(playerid, COLOR_GREY, "   On a mission right now, can't use this command !");
			        return 1;
			    }
		        if(PlayerInfo[playerid][pCarTime] == 0)
		        {
		            GameTextForPlayer(playerid, "~w~Car Selling ~n~~r~Drop the car at the Crane", 5000, 1);
		            CP[playerid] = 1;
		            SetPlayerCheckpoint(playerid, -1548.3618,123.6438,3.2966,8.0);
		        }
		        else
		        {
		            SendClientMessage(playerid, COLOR_GREY, "   You already Dropped a car, wait till your reload time is over !");
		        }
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "   You are not a Car Jacker !");
			}
		}//not connected
		return 1;
	}
	if(strcmp(cmd, "/quitjob", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	   	{
		    if(PlayerInfo[playerid][pJob] > 0)
		    {
		        if(PlayerInfo[playerid][pDonateRank] > 0)
		        {
		            if(PlayerInfo[playerid][pContractTime] >= 2)
					{
					    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You already forfilled your 1 hour Contract, and quited your Job.");
					    PlayerInfo[playerid][pJob] = 0;
					    PlayerInfo[playerid][pChar] = 0;
					    PlayerInfo[playerid][pContractTime] = 0;
					}
					else
					{
					    new chours = 2 - PlayerInfo[playerid][pContractTime];
					    format(string, sizeof(string), "* You still have %d hours left to forfill and end your Contract.", chours / 2);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					}
		        }
		        else
		        {
					if(PlayerInfo[playerid][pContractTime] >= 10)
					{
					    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You already forfilled your 5 hour Contract, and quited your Job.");
					    PlayerInfo[playerid][pJob] = 0;
					    PlayerInfo[playerid][pChar] = 0;
					    PlayerInfo[playerid][pContractTime] = 0;
					}
					else
					{
					    new chours = 10 - PlayerInfo[playerid][pContractTime];
					    format(string, sizeof(string), "* You still have %d hours left to forfill and end your Contract.", chours / 2);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You don't even have a Job !");
			}
		}//not connected
		return 1;
	}
	if(strcmp(cmd, "/bail", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	   	{
			if(PlayerInfo[playerid][pJailed]==1)
			{
			    if(JailPrice[playerid] > 0)
			    {
			        if(GetPlayerMoney(playerid) > JailPrice[playerid])
			        {
			            format(string, sizeof(string), "You bailed yourself out for: $%d", JailPrice[playerid]);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						GivePlayerMoney(playerid, -JailPrice[playerid]);
						JailPrice[playerid] = 0;
						WantLawyer[playerid] = 0; CallLawyer[playerid] = 0;
						PlayerInfo[playerid][pJailTime] = 1;
			        }
			        else
			        {
			            SendClientMessage(playerid, COLOR_GRAD1, "   You can't afford the Bail Price !");
			        }
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GRAD1, "   You don't have a Bail Price !");
			    }
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GRAD1, "   You are not in Jail !");
			}
		}//not connected
		return 1;
	}
	if(strcmp(cmd, "/clear", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	   	{
			new member = PlayerInfo[playerid][pMember];
			new leader = PlayerInfo[playerid][pLeader];
			new rank = PlayerInfo[playerid][pRank];
	 		if(gTeam[playerid] == 2)
			{
				if (!PlayerToPoint(3.0, playerid, 253.9280,69.6094,1003.6406))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "   You are to not inside the Police Station!");
					return 1;
				}
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /clear [playerid/PartOfName]");
					return 1;
				}
				giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
                        if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Clear yourself!"); return 1; }
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						format(string, sizeof(string), "* You cleared the Records and Wanted Points of %s.", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Officer %s has cleared your Records and Wanted Points.", sendername);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						WantedPoints[giveplayerid] = 0;
						WantedLevel[giveplayerid] = 0;
						ClearCrime(giveplayerid);
						if(gTeam[giveplayerid]==4)
						{
						    gTeam[giveplayerid] = 3;
						    SetPlayerToTeamColor(giveplayerid);
						}
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GREY, "   Invalid ID/Name!");
				}
			}
			else if(member == 5||member == 6||leader == 5||leader == 6)
			{
			    tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /clear [playerid/PartOfName]");
					return 1;
				}
				giveplayerid = ReturnUser(tmp);
				if(IsPlayerConnected(giveplayerid))
				{
				    if(giveplayerid != INVALID_PLAYER_ID)
				    {
				        if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Clear yourself!"); return 1; }
					    if(rank < 4) { SendClientMessage(playerid, COLOR_GREY, "   You need Rank 4 to clear someone's Wanted Points + Records !"); return 1; }
					    if(GetPlayerMoney(playerid) < 5000) { SendClientMessage(playerid, COLOR_GREY, "   You need $5000 to Clear your Family Member !"); return 1; }
		                GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
					    if(member > 0)
					    {
						    if(PlayerInfo[giveplayerid][pMember] != member)
							{
								SendClientMessage(playerid, COLOR_GREY, "   That player is not in your Family !");
								return 1;
							}
							format(string, sizeof(string), "* You cleared the Records and Wanted Points of %s for $5000.", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* Family Member %s with Rank %d, has cleared your Records and Wanted Points.", sendername, rank);
							SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						}
						else if(leader > 0)
						{
			                if(PlayerInfo[giveplayerid][pMember] != leader)
							{
								SendClientMessage(playerid, COLOR_GREY, "   That player is not in your Family !");
								return 1;
							}
						    format(string, sizeof(string), "* You cleared the Records and Wanted Points of %s for $5000.", giveplayer);
							SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* Family Leader %s, has cleared your Records and Wanted Points.", sendername);
							SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						}
						WantedPoints[giveplayerid] = 0;
						WantedLevel[giveplayerid] = 0;
						ClearCrime(giveplayerid);
						GivePlayerMoney(playerid, - 5000);
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_GREY, "   Invalid ID/Name!");
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not an Cop / FBI / National Guard / Family Member !");
			}
		}//not connected
		return 1;
	}
	if(strcmp(cmd, "/ticket", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	    {
	        if(gTeam[playerid] != 2)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not a Cop!");
			    return 1;
			}
	        if(OnDuty[playerid] != 1 && PlayerInfo[playerid][pMember] == 1)
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not on Duty!");
			    return 1;
			}
	    	tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /ticket [playerid/PartOfName] [price] [reason]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
            tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /ticket [playerid/PartOfName] [price] [reason]");
				return 1;
			}
			moneys = strval(tmp);
			if(moneys < 1 || moneys > 99999) { SendClientMessage(playerid, COLOR_GREY, "   Ticket Money can't be below 1 or higher then 99999 !"); return 1; }
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
			        if (ProxDetectorS(8.0, playerid, giveplayerid))
					{
					    GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						new length = strlen(cmdtext);
						while ((idx < length) && (cmdtext[idx] <= ' '))
						{
							idx++;
						}
						new offset = idx;
						new result[64];
						while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
						{
							result[idx - offset] = cmdtext[idx];
							idx++;
						}
						result[idx - offset] = EOS;
						if(!strlen(result))
						{
							SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /ticket [playerid/PartOfName] [price] [reason]");
							return 1;
						}
						format(string, sizeof(string), "* You gave %s a Ticket costing $%d, reason: %s", giveplayer, moneys, (result));
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						format(string, sizeof(string), "* Officer %s has given you a Ticket costing $%d, reason: %s", sendername, moneys, (result));
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, string);
						SendClientMessage(giveplayerid, COLOR_LIGHTBLUE, "* Type /accept ticket, to accept it.");
						TicketOffer[giveplayerid] = playerid;
						TicketMoney[giveplayerid] = moneys;
						return 1;
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, "   That player is not near you !");
						return 1;
					}
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That player is Offline !");
			    return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/arrest", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	   	{
			if(gTeam[playerid] == 2  || IsACop(playerid))
			{
				if(OnDuty[playerid] != 1 && PlayerInfo[playerid][pMember] == 1)
				{
				    SendClientMessage(playerid, COLOR_GREY, "   You are not on Duty!");
				    return 1;
				}
		        if(!PlayerToPoint(6.0, playerid, 268.3327,77.8972,1001.0391))
				{// Jail spot
				    SendClientMessage(playerid, COLOR_GREY, "   You are not near the Jail, can't Arrest !");
				    return 1;
				}
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /arrest [price] [time (minutes)] [bail (0=no 1=yes)] [bailprice]");
					return 1;
				}
				moneys = strval(tmp);
				if(moneys < 1 || moneys > 99999) { SendClientMessage(playerid, COLOR_GREY, "   Jail Price can't be below $1 or above $99999 !"); return 1; }
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /arrest [price] [time (minutes)] [bail (0=no 1=yes)] [bailprice]");
					return 1;
				}
				new time = strval(tmp);
				if(time < 1 || time > 20) { SendClientMessage(playerid, COLOR_GREY, "   Jail Time Minutes can't be below 1 or above 20 (Take the person to prison then) !"); return 1; }
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /arrest [price] [time (minutes)] [bail (0=no 1=yes)] [bailprice]");
					return 1;
				}
				new bail = strval(tmp);
				if(bail < 0 || bail > 1) { SendClientMessage(playerid, COLOR_GREY, "   Jail Bailing can't be below 0 or above 1 !"); return 1; }
				tmp = strtok(cmdtext, idx);
				if(!strlen(tmp))
				{
					SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /arrest [price] [time (minutes)] [bail (0=no 1=yes)] [bailprice]");
					return 1;
				}
				new bailprice = strval(tmp);
				if(bailprice < 0 || bailprice > 3000000) { SendClientMessage(playerid, COLOR_GREY, "   Jail Bailing can't be below $0 or above $3000000 !"); return 1; }
				new suspect = GetClosestPlayer(playerid);
				if(IsPlayerConnected(suspect))
				{
					if(GetDistanceBetweenPlayers(playerid,suspect) < 5)
					{
						GetPlayerName(suspect, giveplayer, sizeof(giveplayer));
						GetPlayerName(playerid, sendername, sizeof(sendername));
						if(WantedLevel[suspect] < 1)
						{
						    SendClientMessage(playerid, COLOR_GREY, "   Player must be at least Wanted Level 1 !");
						    return 1;
						}
						format(string, sizeof(string), "* You arrested %s !", giveplayer);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						GivePlayerMoney(suspect, -moneys);
						format(string, sizeof(string), "arrested by %s ~n~    for $%d", sendername, moneys);
						GameTextForPlayer(suspect, string, 5000, 5);
						ResetPlayerWeapons(suspect);
						if(PlayerInfo[playerid][pMember]==1||PlayerInfo[playerid][pLeader]==1)
						{
							format(string, sizeof(string), "<< Officer %s arrested suspect %s >>", sendername, giveplayer);
							OOCNews(COLOR_LIGHTRED, string);
						}
						else if(PlayerInfo[playerid][pMember]==2||PlayerInfo[playerid][pLeader]==2)
						{
							format(string, sizeof(string), "<< FBI Agent %s arrested suspect %s >>", sendername, giveplayer);
							OOCNews(COLOR_LIGHTRED, string);
						}
						else if(PlayerInfo[playerid][pMember]==3||PlayerInfo[playerid][pLeader]==3)
						{
							format(string, sizeof(string), "<< Soldier %s arrested suspect %s >>", sendername, giveplayer);
							OOCNews(COLOR_LIGHTRED, string);
						}
						SetPlayerInterior(suspect, 6);
						SetPlayerPos(suspect,264.6288,77.5742,1001.0391);
						PlayerInfo[suspect][pJailTime] = time * 60;
						if(bail == 1)
						{
							JailPrice[suspect] = bailprice;
							format(string, sizeof(string), "You are jailed for %d seconds.   Bail: $%d", PlayerInfo[suspect][pJailTime], JailPrice[suspect]);
							SendClientMessage(suspect, COLOR_LIGHTBLUE, string);
						}
						else
						{
						    JailPrice[suspect] = 0;
							format(string, sizeof(string), "You are jailed for %d seconds.   Bail: Unable", PlayerInfo[suspect][pJailTime]);
							SendClientMessage(suspect, COLOR_LIGHTBLUE, string);
						}
						PlayerInfo[suspect][pJailed] = 1;
				        PlayerInfo[suspect][pArrested] += 1;
						SetPlayerFree(suspect,playerid, "Got Arrested");
						WantedPoints[suspect] = 0;
						WantedLevel[suspect] = 0;
						WantLawyer[suspect] = 1;
					}//distance
				}//not connected
				else
				{
				    SendClientMessage(playerid, COLOR_GREY, "   No-one close enough to arrest.");
				    return 1;
				}
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   You are not a Cop / FBI / National Guard !");
			    return 1;
			}
		}//not connected
		return 1;
	}
	if(strcmp(cmd, "/contract", true) == 0)
	{
	    if(IsPlayerConnected(playerid))
	   	{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /contract [playerid/PartOfName] [amount]");
				return 1;
			}
			giveplayerid = ReturnUser(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: /contract [playerid/PartOfName] [amount]");
				return 1;
			}
			moneys = strval(tmp);
			if(moneys < 10000 || moneys > 100000) { SendClientMessage(playerid, COLOR_GREY, "   Contract money must be atleast $10000, and not more then $100000!"); return 1; }
			if(PlayerInfo[playerid][pLevel] < 3)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "You must be level 3 to place a Contract.");
				return 1;
			}
			if (IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
				    if(PlayerInfo[giveplayerid][pMember] == 8 && PlayerInfo[playerid][pMember] == 8)
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   Cannot place Contracts on your own Agency!");
				        return 1;
				    }
				    else if(PlayerInfo[giveplayerid][pLeader] == 8 && PlayerInfo[playerid][pMember] == 8)
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   Cannot place Contracts on your own Agency!");
				        return 1;
				    }
				    else if(PlayerInfo[giveplayerid][pMember] == 8||PlayerInfo[giveplayerid][pLeader] == 8)
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   Can't contract a Hitman !");
				        return 1;
				    }
				    if(gTeam[giveplayerid] == 2 && moneys != 100000)
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   Only $100000 can be placed as a Contract on Cops !");
				        return 1;
				    }
				    if(giveplayerid == playerid) { SendClientMessage(playerid, COLOR_GREY, "You cannot Contract yourself!"); return 1; }
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					GetPlayerName(playerid, sendername, sizeof(sendername));
					playermoney = GetPlayerMoney(playerid);
					if (moneys > 0 && playermoney >= moneys)
					{
						GivePlayerMoney(playerid, (0 - moneys));
						PlayerInfo[giveplayerid][pHeadValue]+=moneys;
						format(string, sizeof(string), "%s has placed a contract on %s, for $%d.",sendername, giveplayer, moneys);
						SendFamilyMessage(8, COLOR_YELLOW, string);
						format(string, sizeof(string), "* You placed a contract on %s, for $%d.",giveplayer, moneys);
						SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
						PlayerPlaySound(playerid, 1052, 0.0, 0.0, 0.0);
					}
					else
					{
						SendClientMessage(playerid, COLOR_GRAD1, "   Invalid transaction amount.");
					}
				}
			}
			else
			{
				format(string, sizeof(string), "   %d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_GRAD1, string);
			}
		}
		return 1;
	}
	return 1;
}
//------------------------------------------------------------------------------------------------------
public HouseLevel(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		new h = PlayerInfo[playerid][pPhousekey];
		if(h == 255) { return 0; }
		if(h <= 4) { return 1; }
		if(h >= 5 && h <= 9)  { return 2; }
		if(h >= 10 && h <= 18) { return 3; }
		if(h >= 19 && h <= 22) { return 4; }
		if(h >= 23 && h <= 25) { return 5; }
		if(h == 26) { return 6; }
		if(h == 27) { return 7; }
		if(h >= 28 && h <= 31) { return 7; }
	}
	return 0;
}

public CHouseLevel(houseid)
{
	if(houseid <= 4) { return 3; }
	if(houseid >= 29 && houseid <= 30) { return 4; }
	if(houseid >= 5 && houseid <= 9) { return 5; }
	if(houseid >= 10 && houseid <= 18 || houseid == 28) { return 7; }
	if(houseid >= 19 && houseid <= 22) { return 8; }
	if(houseid >= 23 && houseid <= 25) { return 9; }
	if(houseid == 26) { return 10; }
	if(houseid == 27) { return 11; }
	if(houseid >= 28 && houseid <= 31) { return 12; }
	return 0;
}

public ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		//radi = 2.0; //Trigger Radius
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(!BigEar[i])
				{
					GetPlayerPos(i, posx, posy, posz);
					tempposx = (oldposx -posx);
					tempposy = (oldposy -posy);
					tempposz = (oldposz -posz);
					//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
					if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
					{
						SendClientMessage(i, col1, string);
					}
					else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
					{
						SendClientMessage(i, col2, string);
					}
					else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
					{
						SendClientMessage(i, col3, string);
					}
					else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
					{
						SendClientMessage(i, col4, string);
					}
					else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
					{
						SendClientMessage(i, col5, string);
					}
				}
				else
				{
					SendClientMessage(i, col1, string);
				}
			}
		}
	}//not connected
	return 1;
}

public CrimInRange(Float:radi, playerid,copid)
{
	if(IsPlayerConnected(playerid)&&IsPlayerConnected(copid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		GetPlayerPos(copid, posx, posy, posz);
		tempposx = (oldposx -posx);
		tempposy = (oldposy -posy);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)))
		{
			return 1;
		}
	}
	return 0;
}

public ProxDetectorS(Float:radi, playerid, targetid)
{
    if(IsPlayerConnected(playerid)&&IsPlayerConnected(targetid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		//radi = 2.0; //Trigger Radius
		GetPlayerPos(targetid, posx, posy, posz);
		tempposx = (oldposx -posx);
		tempposy = (oldposy -posy);
		tempposz = (oldposz -posz);
		//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}

public PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
    if(IsPlayerConnected(playerid))
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		tempposx = (oldposx -x);
		tempposy = (oldposy -y);
		tempposz = (oldposz -z);
		//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}

public CustomPickups()
{
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new string[128];
	NameTimer();
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			GetPlayerPos(i, oldposx, oldposy, oldposz);
			new tmpcar = GetPlayerVehicleID(i);
			if(oldposx!=0.0 && oldposy!=0.0 && oldposz!=0.0)
			{
				for(new h = 0; h < sizeof(SBizzInfo); h++)
				{
					if(IsATruck(tmpcar) && PlayerToPoint(10.0, i, SBizzInfo[h][sbEntranceX], SBizzInfo[h][sbEntranceY], SBizzInfo[h][sbEntranceZ]))
					{
						format(string, sizeof(string), "~w~%s~n~~r~Products Required~w~: %d~n~~y~Price per Product: ~w~: $%d~n~~g~Funds: ~w~: $%d",SBizzInfo[h][sbMessage],(SBizzInfo[h][sbMaxProducts]-SBizzInfo[h][sbProducts]),SBizzInfo[h][sbPriceProd],SBizzInfo[h][sbTill]);
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
					if(PlayerToPoint(2.0, i, SBizzInfo[h][sbEntranceX], SBizzInfo[h][sbEntranceY], SBizzInfo[h][sbEntranceZ]))
					{
						if(SBizzInfo[h][sbOwned] == 1)
						{
							format(string, sizeof(string), "~w~%s~w~~n~Owner : %s~n~Extortion by : %s~n~Entrance Fee : ~g~$%d ~w~Level : %d ~n~to enter type /enter",SBizzInfo[h][sbMessage],SBizzInfo[h][sbOwner],SBizzInfo[h][sbExtortion],SBizzInfo[h][sbEntranceCost],SBizzInfo[h][sbLevelNeeded]);
						}
						else
						{
							format(string, sizeof(string), "~w~%s~w~~n~This Business is for sale~n~Cost: ~g~$%d ~w~Level : %d ~n~to buy this Business type /buybiz",SBizzInfo[h][sbMessage],SBizzInfo[h][sbBuyPrice],SBizzInfo[h][sbLevelNeeded]);
						}
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
				}
				for(new h = 0; h < sizeof(HouseInfo); h++)
				{
					if(PlayerToPoint(2.0, i, HouseInfo[h][hEntrancex], HouseInfo[h][hEntrancey], HouseInfo[h][hEntrancez]))
					{
						if(HouseInfo[h][hOwned] == 1)
						{
							if(HouseInfo[h][hRentabil] == 0)
							{
								format(string, sizeof(string), "~w~This House is owned by~n~%s~n~Level : %d",HouseInfo[h][hOwner],HouseInfo[h][hLevel]);
							}
							else
							{
								format(string, sizeof(string), "~w~This House is owned by~n~%s~n~Rent: $%d Level : %d~n~Type /rentroom to rent a room",HouseInfo[h][hOwner],HouseInfo[h][hRent],HouseInfo[h][hLevel]);
							}
							GameTextForPlayer(i, string, 5000, 3);
							return 1;
						}
						else
						{
							format(string, sizeof(string), "~w~This House is for sale~n~Discription: %s ~n~Cost: ~g~$%d~n~~w~ Level : %d~n~to buy this house type /buyhouse",HouseInfo[h][hDiscription],HouseInfo[h][hValue],HouseInfo[h][hLevel]);
						}
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
				}
				for(new h = 0; h < sizeof(BizzInfo); h++)
				{
					if(IsATruck(tmpcar) && PlayerToPoint(10.0, i, BizzInfo[h][bEntranceX], BizzInfo[h][bEntranceY], BizzInfo[h][bEntranceZ]))
					{
						format(string, sizeof(string), "~w~%s~n~~r~Products Required~w~: %d~n~~y~Price per Product: ~w~: $%d~n~~g~Funds: ~w~: $%d",BizzInfo[h][bMessage],(BizzInfo[h][bMaxProducts]-BizzInfo[h][bProducts]),BizzInfo[h][bPriceProd],BizzInfo[h][bTill]);
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
					if(PlayerToPoint(2.0, i, BizzInfo[h][bEntranceX], BizzInfo[h][bEntranceY], BizzInfo[h][bEntranceZ]))
					{
						if(BizzInfo[h][bOwned] == 1)
						{
							format(string, sizeof(string), "~w~%s~w~~n~Owner : %s~n~Extortion by : %s~n~Entrance Fee : ~g~$%d ~w~Level : %d ~n~to enter type /enter",BizzInfo[h][bMessage],BizzInfo[h][bOwner],BizzInfo[h][bExtortion],BizzInfo[h][bEntranceCost],BizzInfo[h][bLevelNeeded]);
						}
						else
						{
							format(string, sizeof(string), "~w~%s~w~~n~This Business is for sale~n~Cost: ~g~$%d ~w~Level : %d ~n~to buy this Business type /buybiz",BizzInfo[h][bMessage],BizzInfo[h][bBuyPrice],BizzInfo[h][bLevelNeeded]);
						}
						GameTextForPlayer(i, string, 5000, 3);
						return 1;
					}
				}
			}//custompickups end
			if (PlayerToPoint(2.0, i, 1173.2563,-1323.3102,15.3943))
			{// Hospital near Ammu
				GameTextForPlayer(i, "~w~Type /healme to cure yourself", 5000, 5);
			}
			else if (PlayerToPoint(2.0, i, 2029.5945,-1404.6426,17.2512))
			{// Hospital near speedway
				GameTextForPlayer(i, "~w~Type /healme to cure yourself", 5000, 5);
			}
			else if (PlayerToPoint(2.0, i, 323.0342,1118.5804,1083.8828))
			{//Buyable Drugs for Drug Dealers
			    GameTextForPlayer(i, "~w~Type /get drugs, to get some ~r~Drugs~y~~n~Skill Level matters to price", 5000, 3);
			}
			else if (PlayerToPoint(3, i,-2162.2554,-2385.9541,30.6250))
			{
			    GameTextForPlayer(i, "~y~Welcome to the ~r~City Hall~n~~w~Type /enter to go in", 5000, 5);
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,359.5408,206.7693,1008.3828))
			{
			    if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			    else { GameTextForPlayer(i, "~g~Welcome,~n~~y~you can become a ~r~Detective~y~ here ~n~~w~Type /join if you wish to become one", 5000, 3); }
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,347.7374,193.7241,1014.1875))
			{
			    if(PlayerInfo[i][pJob] > 0) {}
			    else { GameTextForPlayer(i, "~g~Welcome,~n~~y~you can become a ~r~Lawyer~y~ here ~n~~w~Type /join if you wish to become one", 5000, 3); }
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,1215.1304,-11.8431,1000.9219))
			{
			    if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			    else { GameTextForPlayer(i, "~g~Welcome,~n~~y~you can become a ~r~Whore~y~ here ~n~~w~Type /join if you wish to become one", 5000, 3); }
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,2166.3772,-1675.3829,15.0859))
			{
			    if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			    else { GameTextForPlayer(i, "~g~Welcome,~n~~y~you can become a ~r~Drugs Dealer~y~ here ~n~~w~Type /join if you wish to become one", 5000, 3); }
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,1109.3318,-1796.3042,16.5938))
			{
			    if(PlayerInfo[i][pJob] > 0) {}
			    else { GameTextForPlayer(i, "~g~Welcome,~n~~y~you can become a ~r~Car Jacker~y~ here ~n~~w~Type /join if you wish to become one", 5000, 3); }
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,-2050.8962,460.0262,35.1719))
			{
			    if(PlayerInfo[i][pMember] == 9 || PlayerInfo[i][pLeader] == 9) { GameTextForPlayer(i, "~w~Type ~r~/paper ~w~to create a newspaper",5000,3); }
			    else if(PlayerInfo[i][pJob] == 15) { GameTextForPlayer(i, "~w~Type ~r~/papers ~w~to see all the made newspapers",5000, 3); }
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,-1932.3859,276.2117,41.0391))
			{
			    if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			    else { GameTextForPlayer(i, "~g~Welcome,~n~~y~you can become a ~r~Car Mechanic~y~ here ~n~~w~Type /join if you wish to become one", 5000, 3); }
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,2226.1716,-1718.1792,13.5165))
			{
			    if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			    else { GameTextForPlayer(i, "~g~Welcome,~n~~y~you can become a ~r~Bodyguard~y~ here ~n~~w~Type /join if you wish to become one", 5000, 3); }
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,1366.4325,-1275.2096,13.5469))
			{
			    if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			    else { GameTextForPlayer(i, "~g~Welcome,~n~~y~you can become a ~r~Arms Dealer~y~ here ~n~~w~Type /join if you wish to become one", 5000, 3); }
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,531.7930,-1292.4044,17.2422))
			{
			    if(PlayerInfo[i][pJob] > 0) {}
			    else { GameTextForPlayer(i, "~g~Welcome,~n~~y~you can become a ~r~Car Dealer~y~ here ~n~~w~Type /join if you wish to become one", 5000, 3); }
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,766.0804,14.5133,1000.7004))
			{
			    if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			    else { GameTextForPlayer(i, "~g~Welcome,~n~~y~you can become a ~r~Boxer~y~ here ~n~~w~Type /join if you wish to become one", 5000, 3); }
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,1154.2208,-1770.8203,16.5992))
			{
			    if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			    else { GameTextForPlayer(i, "~g~Welcome,~n~~y~you can become a ~r~Bus Driver~y~ here ~n~~w~Type /join if you wish to become one", 5000, 3); }
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,-77.7288,-1136.3896,1.0781))
			{
			    if(PlayerInfo[i][pJob] > 0 || PlayerInfo[i][pMember] > 0) {}
			    else { GameTextForPlayer(i, "~g~Welcome,~n~~y~you can become a ~r~Trucker~y~ here ~n~~w~Type /join if you wish to become one", 5000, 3); }
			}
			else if (GetPlayerState(i) == 1 && PlayerToPoint(2.0, i,1381.0413,-1088.8511,27.3906))
			{
			    GameTextForPlayer(i, "~g~Welcome,~n~~y~Use /mission to take on a Mission", 5000, 3);
			}
			else if(PlayerToPoint(2.0, i,1073.0619,-344.5148,73.9922))
			{
			    if(OrderReady[i] > 0)
			    {
			        switch (OrderReady[i])
			        {
			            case 1:
			            {
			                GivePlayerWeapon(i, 24, 50); GivePlayerWeapon(i, 29, 500); GivePlayerWeapon(i, 25, 50); GivePlayerWeapon(i, 4, 1);
			                GivePlayerMoney(i, - 5000);
			                SendClientMessage(i, COLOR_LIGHTBLUE, "* You picked up your Ordered Package.");
			            }
			            case 2:
			            {
			                GivePlayerWeapon(i, 24, 50); GivePlayerWeapon(i, 29, 500); GivePlayerWeapon(i, 25, 50); GivePlayerWeapon(i, 31, 500); GivePlayerWeapon(i, 4, 1);
			                GivePlayerMoney(i, - 6000);
			                SendClientMessage(i, COLOR_LIGHTBLUE, "* You picked up your Ordered Package.");
			            }
			            case 3:
			            {
			                GivePlayerWeapon(i, 24, 50); GivePlayerWeapon(i, 29, 500); GivePlayerWeapon(i, 25, 50); GivePlayerWeapon(i, 30, 500); GivePlayerWeapon(i, 4, 1);
			                GivePlayerMoney(i, - 6000);
			                SendClientMessage(i, COLOR_LIGHTBLUE, "* You picked up your Ordered Package.");
			            }
			            case 4:
			            {
			                GivePlayerWeapon(i, 24, 50); GivePlayerWeapon(i, 29, 500); GivePlayerWeapon(i, 25, 50); GivePlayerWeapon(i, 31, 500); GivePlayerWeapon(i, 4, 1); GivePlayerWeapon(i, 34, 20);
			                GivePlayerMoney(i, - 8000);
			                SendClientMessage(i, COLOR_LIGHTBLUE, "* You picked up your Ordered Package.");
			            }
			            case 5:
			            {
			                GivePlayerWeapon(i, 24, 50); GivePlayerWeapon(i, 29, 500); GivePlayerWeapon(i, 25, 50); GivePlayerWeapon(i, 30, 500); GivePlayerWeapon(i, 4, 1); GivePlayerWeapon(i, 34, 20);
			                GivePlayerMoney(i, - 8000);
			                SendClientMessage(i, COLOR_LIGHTBLUE, "* You picked up your Ordered Package.");
			            }
			            case 6:
			            {
			                GivePlayerWeapon(i, 24, 50); GivePlayerWeapon(i, 29, 500); GivePlayerWeapon(i, 25, 50); GivePlayerWeapon(i, 31, 500); GivePlayerWeapon(i, 4, 1); GivePlayerWeapon(i, 34, 20);
							GivePlayerMoney(i, - 8500);
							SendClientMessage(i, COLOR_LIGHTBLUE, "* You picked up your Ordered Package.");
			            }
			            case 7:
			            {
			                GivePlayerWeapon(i, 24, 50); GivePlayerWeapon(i, 29, 500); GivePlayerWeapon(i, 25, 50); GivePlayerWeapon(i, 30, 500); GivePlayerWeapon(i, 4, 1); GivePlayerWeapon(i, 34, 20);
			                GivePlayerMoney(i, - 8500);
			                SendClientMessage(i, COLOR_LIGHTBLUE, "* You picked up your Ordered Package.");
			            }
			        }
			        OrderReady[i] = 0;
			    }
			}//Hitman delivery stuff
			else if(PlayerOnMission[i] > 0 && PlayMission[kToggle] == 0)
			{
			    if(MissionCheckpoint[i] == 1 && PlayerToPoint(10.0, i,PlayMission[kCP1][0],PlayMission[kCP1][1],PlayMission[kCP1][2]))
				{
				    RingTone[i] = 20;
				    format(string, sizeof(string), "%s", PlayMission[kGText1]);
					GameTextForPlayer(i, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText4]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText5]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText6]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					MissionCheckpoint[i] = 2;
				}
				else if(MissionCheckpoint[i] == 2 && PlayerToPoint(10.0, i,PlayMission[kCP2][0],PlayMission[kCP2][1],PlayMission[kCP2][2]))
				{
				    RingTone[i] = 20;
				    format(string, sizeof(string), "%s", PlayMission[kGText2]);
					GameTextForPlayer(i, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText7]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText8]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText9]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					MissionCheckpoint[i] = 3;
				}
				else if(MissionCheckpoint[i] == 3 && PlayerToPoint(10.0, i,PlayMission[kCP3][0],PlayMission[kCP3][1],PlayMission[kCP3][2]))
				{
				    RingTone[i] = 20;
				    format(string, sizeof(string), "%s", PlayMission[kGText3]);
					GameTextForPlayer(i, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText10]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText11]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText12]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					MissionCheckpoint[i] = 4;
				}
				else if(MissionCheckpoint[i] == 4 && PlayerToPoint(10.0, i,PlayMission[kCP4][0],PlayMission[kCP4][1],PlayMission[kCP4][2]))
				{
				    RingTone[i] = 20;
				    format(string, sizeof(string), "%s", PlayMission[kGText4]);
					GameTextForPlayer(i, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText13]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText14]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText15]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					MissionCheckpoint[i] = 5;
				}
				else if(MissionCheckpoint[i] == 5 && PlayerToPoint(10.0, i,PlayMission[kCP5][0],PlayMission[kCP5][1],PlayMission[kCP5][2]))
				{
				    RingTone[i] = 20;
				    format(string, sizeof(string), "%s", PlayMission[kGText5]);
					GameTextForPlayer(i, string, 8000, 3);
					format(string, sizeof(string), "%s", PlayMission[kText16]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText17]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					format(string, sizeof(string), "%s", PlayMission[kText18]);
					SendClientMessage(i, COLOR_YELLOW2, string);
					MissionCheckpoint[i] = 6;
				}
				else if(MissionCheckpoint[i] == 6 && PlayerToPoint(10.0, i,PlayMission[kCP6][0],PlayMission[kCP6][1],PlayMission[kCP6][2]))
				{
				    RingTone[i] = 20;
				    format(string, sizeof(string), "%s", PlayMission[kGText6]);
					GameTextForPlayer(i, string, 8000, 3);
					format(string, sizeof(string), "..:: Mission Passed : %s | Reward received: $%d ::..", PlayMission[kTitle], PlayMission[kReward]);
					SendClientMessage(i, COLOR_GREEN, string);
					GivePlayerMoney(i, PlayMission[kReward]);
					PlayerInfo[i][pMissionNr] = PlayerOnMission[i];
					MissionCheckpoint[i] = 0;
					PlayerOnMission[i] = 0;
				}
			}
		}
	}
	return 1;
}

public IdleKick()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
		    if(PlayerInfo[i][pAdmin] < 1)
		    {
				GetPlayerPos(i, PlayerPos[i][0], PlayerPos[i][1], PlayerPos[i][2]);
				if(PlayerPos[i][0] == PlayerPos[i][3] && PlayerPos[i][1] == PlayerPos[i][4] && PlayerPos[i][2] == PlayerPos[i][5])
				{
					Kick(i);
				}
				PlayerPos[i][3] = PlayerPos[i][0];
				PlayerPos[i][4] = PlayerPos[i][1];
				PlayerPos[i][5] = PlayerPos[i][2];
			}
		}
	}
}

public OnPlayerText(playerid, text[])
{
	new giver[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new tmp[256];
	new string[256];
	new giveplayerid;
	if(PlayerInfo[playerid][pMuted] == 1)
	{
		SendClientMessage(playerid, TEAM_CYAN_COLOR, "You cannot speak, you have been silenced");
		return 0;
	}
	if(SelectChar[playerid] == 255)
	{
	    new idx;
	    tmp = strtok(text, idx);
	    if ((strcmp("next", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("next")))
		{
		    switch (SelectCharID[playerid])
			{
				case 1: //Police Force
				{
				    if(SelectCharPlace[playerid] == 1) { SetPlayerSkin(playerid, JoinPed[0][0]); SelectCharPlace[playerid] = 2; ChosenSkin[playerid] = JoinPed[0][0]; }
				    else if(SelectCharPlace[playerid] == 2) { SetPlayerSkin(playerid, JoinPed[1][0]); SelectCharPlace[playerid] = 3; ChosenSkin[playerid] = JoinPed[1][0]; }
				    else if(SelectCharPlace[playerid] == 3) { SetPlayerSkin(playerid, JoinPed[2][0]); SelectCharPlace[playerid] = 4; ChosenSkin[playerid] = JoinPed[2][0]; }
				    else if(SelectCharPlace[playerid] == 4) { SetPlayerSkin(playerid, JoinPed[3][0]); SelectCharPlace[playerid] = 5; ChosenSkin[playerid] = JoinPed[3][0]; }
				    else if(SelectCharPlace[playerid] == 5) { SetPlayerSkin(playerid, JoinPed[4][0]); SelectCharPlace[playerid] = 6; ChosenSkin[playerid] = JoinPed[4][0]; }
				    else if(SelectCharPlace[playerid] == 6) { SetPlayerSkin(playerid, JoinPed[5][0]); SelectCharPlace[playerid] = 7; ChosenSkin[playerid] = JoinPed[5][0]; }
				    else if(SelectCharPlace[playerid] == 7) { SetPlayerSkin(playerid, JoinPed[6][0]); SelectCharPlace[playerid] = 8; ChosenSkin[playerid] = JoinPed[6][0]; }
				    else if(SelectCharPlace[playerid] == 8) { SetPlayerSkin(playerid, JoinPed[7][0]); SelectCharPlace[playerid] = 9; ChosenSkin[playerid] = JoinPed[7][0]; }
				    else if(SelectCharPlace[playerid] == 9) { SetPlayerSkin(playerid, JoinPed[8][0]); SelectCharPlace[playerid] = 10; ChosenSkin[playerid] = JoinPed[8][0]; }
				    else if(SelectCharPlace[playerid] == 10) { SetPlayerSkin(playerid, JoinPed[9][0]); SelectCharPlace[playerid] = 11; ChosenSkin[playerid] = JoinPed[9][0]; }
				    else if(SelectCharPlace[playerid] == 11) { SetPlayerSkin(playerid, JoinPed[10][0]); SelectCharPlace[playerid] = 1; ChosenSkin[playerid] = JoinPed[10][0]; }
				}
				case 2: //FBI/ATF
				{
				    if(SelectCharPlace[playerid] == 1) { SetPlayerSkin(playerid, JoinPed[11][0]); SelectCharPlace[playerid] = 2; ChosenSkin[playerid] = JoinPed[11][0]; }
				    else if(SelectCharPlace[playerid] == 2) { SetPlayerSkin(playerid, JoinPed[12][0]); SelectCharPlace[playerid] = 3; ChosenSkin[playerid] = JoinPed[12][0]; }
				    else if(SelectCharPlace[playerid] == 3) { SetPlayerSkin(playerid, JoinPed[13][0]); SelectCharPlace[playerid] = 1; ChosenSkin[playerid] = JoinPed[13][0]; }
    			}
				case 3: //National Guard
				{
				    if(SelectCharPlace[playerid] == 1) { SetPlayerSkin(playerid, JoinPed[14][0]); SelectCharPlace[playerid] = 2; ChosenSkin[playerid] = JoinPed[14][0]; }
				    else if(SelectCharPlace[playerid] == 2) { SetPlayerSkin(playerid, JoinPed[15][0]); SelectCharPlace[playerid] = 1; ChosenSkin[playerid] = JoinPed[15][0]; }
				}
				case 4: //Fire&Ambulance
				{
				    if(SelectCharPlace[playerid] == 1) { SetPlayerSkin(playerid, JoinPed[16][0]); SelectCharPlace[playerid] = 2; ChosenSkin[playerid] = JoinPed[16][0]; }
				    else if(SelectCharPlace[playerid] == 2) { SetPlayerSkin(playerid, JoinPed[17][0]); SelectCharPlace[playerid] = 3; ChosenSkin[playerid] = JoinPed[17][0]; }
				    else if(SelectCharPlace[playerid] == 3) { SetPlayerSkin(playerid, JoinPed[18][0]); SelectCharPlace[playerid] = 4; ChosenSkin[playerid] = JoinPed[18][0]; }
				    else if(SelectCharPlace[playerid] == 4) { SetPlayerSkin(playerid, JoinPed[19][0]); SelectCharPlace[playerid] = 5; ChosenSkin[playerid] = JoinPed[19][0]; }
				    else if(SelectCharPlace[playerid] == 5) { SetPlayerSkin(playerid, JoinPed[20][0]); SelectCharPlace[playerid] = 6; ChosenSkin[playerid] = JoinPed[20][0]; }
				    else if(SelectCharPlace[playerid] == 6) { SetPlayerSkin(playerid, JoinPed[21][0]); SelectCharPlace[playerid] = 7; ChosenSkin[playerid] = JoinPed[21][0]; }
				    else if(SelectCharPlace[playerid] == 7) { SetPlayerSkin(playerid, JoinPed[22][0]); SelectCharPlace[playerid] = 1; ChosenSkin[playerid] = JoinPed[22][0]; }
				}
				case 5: //La Cosa Nostra
				{
				    if(SelectCharPlace[playerid] == 1) { SetPlayerSkin(playerid, JoinPed[23][0]); SelectCharPlace[playerid] = 2; ChosenSkin[playerid] = JoinPed[23][0]; }
				    else if(SelectCharPlace[playerid] == 2) { SetPlayerSkin(playerid, JoinPed[24][0]); SelectCharPlace[playerid] = 3; ChosenSkin[playerid] = JoinPed[24][0]; }
				    else if(SelectCharPlace[playerid] == 3) { SetPlayerSkin(playerid, JoinPed[25][0]); SelectCharPlace[playerid] = 4; ChosenSkin[playerid] = JoinPed[25][0]; }
				    else if(SelectCharPlace[playerid] == 4) { SetPlayerSkin(playerid, JoinPed[26][0]); SelectCharPlace[playerid] = 5; ChosenSkin[playerid] = JoinPed[26][0]; }
				    else if(SelectCharPlace[playerid] == 5) { SetPlayerSkin(playerid, JoinPed[27][0]); SelectCharPlace[playerid] = 6; ChosenSkin[playerid] = JoinPed[27][0]; }
				    else if(SelectCharPlace[playerid] == 6) { SetPlayerSkin(playerid, JoinPed[28][0]); SelectCharPlace[playerid] = 7; ChosenSkin[playerid] = JoinPed[28][0]; }
				    else if(SelectCharPlace[playerid] == 7) { SetPlayerSkin(playerid, JoinPed[29][0]); SelectCharPlace[playerid] = 8; ChosenSkin[playerid] = JoinPed[29][0]; }
				    else if(SelectCharPlace[playerid] == 8) { SetPlayerSkin(playerid, JoinPed[30][0]); SelectCharPlace[playerid] = 1; ChosenSkin[playerid] = JoinPed[30][0]; }
				}
				case 6: //Yakuza
				{
				    if(SelectCharPlace[playerid] == 1) { SetPlayerSkin(playerid, JoinPed[31][0]); SelectCharPlace[playerid] = 2; ChosenSkin[playerid] = JoinPed[31][0]; }
				    else if(SelectCharPlace[playerid] == 2) { SetPlayerSkin(playerid, JoinPed[32][0]); SelectCharPlace[playerid] = 3; ChosenSkin[playerid] = JoinPed[32][0]; }
				    else if(SelectCharPlace[playerid] == 3) { SetPlayerSkin(playerid, JoinPed[33][0]); SelectCharPlace[playerid] = 4; ChosenSkin[playerid] = JoinPed[33][0]; }
				    else if(SelectCharPlace[playerid] == 4) { SetPlayerSkin(playerid, JoinPed[34][0]); SelectCharPlace[playerid] = 5; ChosenSkin[playerid] = JoinPed[34][0]; }
				    else if(SelectCharPlace[playerid] == 5) { SetPlayerSkin(playerid, JoinPed[35][0]); SelectCharPlace[playerid] = 6; ChosenSkin[playerid] = JoinPed[35][0]; }
				    else if(SelectCharPlace[playerid] == 6) { SetPlayerSkin(playerid, JoinPed[36][0]); SelectCharPlace[playerid] = 7; ChosenSkin[playerid] = JoinPed[36][0]; }
				    else if(SelectCharPlace[playerid] == 7) { SetPlayerSkin(playerid, JoinPed[37][0]); SelectCharPlace[playerid] = 1; ChosenSkin[playerid] = JoinPed[37][0]; }
				}
				case 8: //Hitman Agency
				{
				    if(SelectCharPlace[playerid] == 1) { SetPlayerSkin(playerid, JoinPed[38][0]); SelectCharPlace[playerid] = 2; ChosenSkin[playerid] = JoinPed[38][0]; }
				    else if(SelectCharPlace[playerid] == 2) { SetPlayerSkin(playerid, JoinPed[39][0]); SelectCharPlace[playerid] = 3; ChosenSkin[playerid] = JoinPed[39][0]; }
				    else if(SelectCharPlace[playerid] == 3) { SetPlayerSkin(playerid, JoinPed[40][0]); SelectCharPlace[playerid] = 4; ChosenSkin[playerid] = JoinPed[40][0]; }
				    else if(SelectCharPlace[playerid] == 4) { SetPlayerSkin(playerid, JoinPed[41][0]); SelectCharPlace[playerid] = 5; ChosenSkin[playerid] = JoinPed[41][0]; }
				    else if(SelectCharPlace[playerid] == 5) { SetPlayerSkin(playerid, JoinPed[42][0]); SelectCharPlace[playerid] = 1; ChosenSkin[playerid] = JoinPed[42][0]; }
				}
				case 9: //News Reporters
				{
				    if(SelectCharPlace[playerid] == 1) { SetPlayerSkin(playerid, JoinPed[43][0]); SelectCharPlace[playerid] = 2; ChosenSkin[playerid] = JoinPed[43][0]; }
				    else if(SelectCharPlace[playerid] == 2) { SetPlayerSkin(playerid, JoinPed[44][0]); SelectCharPlace[playerid] = 3; ChosenSkin[playerid] = JoinPed[44][0]; }
				    else if(SelectCharPlace[playerid] == 3) { SetPlayerSkin(playerid, JoinPed[45][0]); SelectCharPlace[playerid] = 1; ChosenSkin[playerid] = JoinPed[45][0]; }
				}
				case 10: //Taxi Cab Company
				{
				    if(SelectCharPlace[playerid] == 1) { SetPlayerSkin(playerid, JoinPed[46][0]); SelectCharPlace[playerid] = 2; ChosenSkin[playerid] = JoinPed[46][0]; }
				    else if(SelectCharPlace[playerid] == 2) { SetPlayerSkin(playerid, JoinPed[47][0]); SelectCharPlace[playerid] = 1; ChosenSkin[playerid] = JoinPed[47][0]; }
				}
				case 11: //Driving/Flying School
				{
				    if(SelectCharPlace[playerid] == 1) { SetPlayerSkin(playerid, JoinPed[48][0]); SelectCharPlace[playerid] = 2; ChosenSkin[playerid] = JoinPed[48][0]; }
				    else if(SelectCharPlace[playerid] == 2) { SetPlayerSkin(playerid, JoinPed[49][0]); SelectCharPlace[playerid] = 3; ChosenSkin[playerid] = JoinPed[49][0]; }
				    else if(SelectCharPlace[playerid] == 3) { SetPlayerSkin(playerid, JoinPed[50][0]); SelectCharPlace[playerid] = 4; ChosenSkin[playerid] = JoinPed[50][0]; }
				    else if(SelectCharPlace[playerid] == 4) { SetPlayerSkin(playerid, JoinPed[51][0]); SelectCharPlace[playerid] = 1; ChosenSkin[playerid] = JoinPed[51][0]; }
				}
			}
		    return 0;
		}
		else if ((strcmp("done", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("done")))
		{
		    if(ChangePos2[playerid][1] == 1)
		    {
		        SetPlayerInterior(playerid, ChangePos2[playerid][0]);
		        SetPlayerPos(playerid, ChangePos[playerid][0],ChangePos[playerid][1],ChangePos[playerid][2]);
		        ChangePos2[playerid][1] = 0;
		        return 0;
		    }
		    PlayerInfo[playerid][pModel] = ChosenSkin[playerid];
		    PlayerInfo[playerid][pChar] = ChosenSkin[playerid];
		    SetSpawnInfo(playerid, PlayerInfo[playerid][pTeam], PlayerInfo[playerid][pModel],0.0,0.0,0.0,0,0,0,0,0,0,0);
		    gTeam[playerid] = PlayerInfo[playerid][pTeam];
			SetPlayerToTeamColor(playerid);
			MedicBill[playerid] = 0;
			SpawnPlayer(playerid);
		    SelectCharPlace[playerid] = 0;
		    SelectCharID[playerid] = 0;
		    SelectChar[playerid] = 0;
		    return 0;
		}
		else
		{
		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Use 'next', or 'done'.");
		    return 0;
		}
	}
	if(RegistrationStep[playerid] > 0)
	{
	    if(RegistrationStep[playerid] == 1)
	    {
	        new idx;
	    	tmp = strtok(text, idx);
		    if((strcmp("male", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("male")))
			{
			    PlayerInfo[playerid][pSex] = 1;
			    SendClientMessage(playerid, COLOR_YELLOW2, "Ok, so you are a Male.");
			    SendClientMessage(playerid, COLOR_LIGHTRED, "What is your birthdate? (Use dd/mm/yyyy)");
			    RegistrationStep[playerid] = 2;
			    return 0;
			}
			else if((strcmp("female", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("female")))
			{
			    PlayerInfo[playerid][pSex] = 2;
			    SendClientMessage(playerid, COLOR_YELLOW2, "Ok, so you are a Female.");
			    SendClientMessage(playerid, COLOR_LIGHTRED, "What is your birthdate? (Use dd/mm/yyyy)");
			    RegistrationStep[playerid] = 2;
			    return 0;
			}
			else
			{
			    SendClientMessage(playerid, COLOR_LIGHTRED, "Are you a Male or Female? (Type in what you are).");
			}
			return 0;
		}
		else if(RegistrationStep[playerid] == 2)
	    {
	        new year, month,day;
			getdate(year, month, day);
	        new DateInfo[3][20];
			split(text, DateInfo, '/');
			if(year - strval(DateInfo[2]) > 100 || strval(DateInfo[2]) < 1 || strval(DateInfo[2]) >= year)
			{
			    SendClientMessage(playerid, COLOR_LIGHTRED, "What is your Birthdate? (Use dd/mm/yyyy)");
			    return 0;
			}
			new check = year - strval(DateInfo[2]);
			if(check == year)
			{
			    SendClientMessage(playerid, COLOR_LIGHTRED, "What is your Birthdate? (Use dd/mm/yyyy)");
			    return 0;
			}
			if(strval(DateInfo[1]) > month)
			{
			    check -= 1;
			}
			else if(strval(DateInfo[1]) == month && strval(DateInfo[0]) > day)
			{
			    check -= 1;
			}
			PlayerInfo[playerid][pAge] = check;
			format(string, sizeof(string), "Ok, so you are %d year old.",PlayerInfo[playerid][pAge]);
			SendClientMessage(playerid, COLOR_YELLOW2, string);
			RegistrationStep[playerid] = 3;
			SendClientMessage(playerid, COLOR_LIGHTRED, "What is your Origin? (Type in: USA, Europe or Asia)");
			return 0;
	    }
	    else if(RegistrationStep[playerid] == 3)
	    {
	        new idx;
	    	tmp = strtok(text, idx);
		    if((strcmp("usa", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("usa")))
			{
			    PlayerInfo[playerid][pOrigin] = 1;
			    SendClientMessage(playerid, COLOR_YELLOW2, "Ok, so you are from the USA.");
			    SendClientMessage(playerid, COLOR_LIGHTRED, "Thank you for filling in all the information, now you will proceed to the Tutorial.");
				RegistrationStep[playerid] = 0;
			    TutTime[playerid] = 1;
			    return 0;
			}
			else if((strcmp("europe", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("europe")))
			{
			    PlayerInfo[playerid][pOrigin] = 2;
			    SendClientMessage(playerid, COLOR_YELLOW2, "Ok, so you are from Europe.");
			    SendClientMessage(playerid, COLOR_LIGHTRED, "Thank you for filling in all the information, now you will proceed to the Tutorial.");
				RegistrationStep[playerid] = 0;
			    TutTime[playerid] = 1;
			    return 0;
			}
			else if((strcmp("asia", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("asia")))
			{
			    PlayerInfo[playerid][pOrigin] = 3;
			    SendClientMessage(playerid, COLOR_YELLOW2, "Ok, so you are from Asia.");
			    SendClientMessage(playerid, COLOR_LIGHTRED, "Thank you for filling in all the information, now you will proceed to the Tutorial.");
				RegistrationStep[playerid] = 0;
			    TutTime[playerid] = 1;
			    return 0;
			}
			else
			{
			    SendClientMessage(playerid, COLOR_LIGHTRED, "What is your Origin? (Type in: USA, Europe or Asia)");
			}
			return 0;
	    }
		return 0;
	}
	if(MarriageCeremoney[playerid] > 0)
	{
	    new idx;
	    tmp = strtok(text, idx);
	    if ((strcmp("yes", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("yes")))
		{
		    if(GotProposedBy[playerid] < 999)
		    {
			    if(IsPlayerConnected(GotProposedBy[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(GotProposedBy[playerid], giveplayer, sizeof(giveplayer));
				    format(string, sizeof(string), "Priest: %s do you take %s as your lovely Wife? (type 'yes', anything else will reject the Marriage).", giveplayer,sendername);
					SendClientMessage(GotProposedBy[playerid], COLOR_WHITE, string);
					MarriageCeremoney[GotProposedBy[playerid]] = 1;
					MarriageCeremoney[playerid] = 0;
					GotProposedBy[playerid] = 999;
				    return 1;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        GotProposedBy[playerid] = 999;
			        return 0;
			    }
			}
			else if(ProposedTo[playerid] < 999)
			{
			    if(IsPlayerConnected(ProposedTo[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(ProposedTo[playerid], giveplayer, sizeof(giveplayer));
					if(PlayerInfo[playerid][pSex] == 1 && PlayerInfo[ProposedTo[playerid]][pSex] == 2)
					{
						format(string, sizeof(string), "Priest: %s and %s i pronounce you now...Husband & Wife, you may kiss the Bride.", sendername, giveplayer);
						SendClientMessage(playerid, COLOR_WHITE, string);
				   		format(string, sizeof(string), "Priest: %s and %s i pronounce you now...Husband & Wife, you may kiss the Groom.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "Marriage News: We have a new lovely couple, %s & %s have been married.", sendername, giveplayer);
						OOCNews(COLOR_WHITE, string);
					}
					else if(PlayerInfo[playerid][pSex] == 1 && PlayerInfo[ProposedTo[playerid]][pSex] == 1)
					{
					    format(string, sizeof(string), "Priest: %s and %s i pronounce you now...Husband & Husband, you may kiss the Bride.", sendername, giveplayer);
						SendClientMessage(playerid, COLOR_WHITE, string);
				   		format(string, sizeof(string), "Priest: %s and %s i pronounce you now...Husband & Husband, you may kiss the Groom.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "Marriage News: We have a new Gay couple, %s & %s have been married.", sendername, giveplayer);
						OOCNews(COLOR_WHITE, string);
					}
					else if(PlayerInfo[playerid][pSex] == 2 && PlayerInfo[ProposedTo[playerid]][pSex] == 2)
					{
					    format(string, sizeof(string), "Priest: %s and %s i pronounce you now...Wife & Wife, you may kiss the Bride.", sendername, giveplayer);
						SendClientMessage(playerid, COLOR_WHITE, string);
				   		format(string, sizeof(string), "Priest: %s and %s i pronounce you now...Wife & Wife, you may kiss the Groom.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "Marriage News: We have a new Lesbian couple, %s & %s have been married.", sendername, giveplayer);
						OOCNews(COLOR_WHITE, string);
					}
					//MarriageCeremoney[ProposedTo[playerid]] = 1;
					MarriageCeremoney[ProposedTo[playerid]] = 0;
					MarriageCeremoney[playerid] = 0;
					format(string, sizeof(string), "%s", sendername);
					strmid(PlayerInfo[ProposedTo[playerid]][pMarriedTo], string, 0, strlen(string), 255);
					format(string, sizeof(string), "%s", giveplayer);
					strmid(PlayerInfo[playerid][pMarriedTo], string, 0, strlen(string), 255);
					GivePlayerMoney(playerid, - 100000);
					PlayerInfo[playerid][pMarried] = 1;
					PlayerInfo[ProposedTo[playerid]][pMarried] = 1;
					PlayerInfo[ProposedTo[playerid]][pPhousekey] = PlayerInfo[playerid][pPhousekey];
					PlayerInfo[ProposedTo[playerid]][pPbiskey] = PlayerInfo[playerid][pPbiskey];
					ProposedTo[playerid] = 999;
					MarriageCeremoney[playerid] = 0;
				    return 1;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        ProposedTo[playerid] = 999;
			        return 0;
			    }
			}
		}
		else
		{
		    if(GotProposedBy[playerid] < 999)
		    {
				if(IsPlayerConnected(GotProposedBy[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(GotProposedBy[playerid], giveplayer, sizeof(giveplayer));
					format(string, sizeof(string), "* You didn't want to Marry %s, no 'yes' was said.",giveplayer);
				    SendClientMessage(playerid, COLOR_YELLOW, string);
				    format(string, sizeof(string), "* %s did't want to Marry you, no 'yes' was said.",sendername);
				    SendClientMessage(GotProposedBy[playerid], COLOR_YELLOW, string);
				    return 0;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        GotProposedBy[playerid] = 999;
			        return 0;
			    }
		    }
		    else if(ProposedTo[playerid] < 999)
			{
			    if(IsPlayerConnected(ProposedTo[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(ProposedTo[playerid], giveplayer, sizeof(giveplayer));
					format(string, sizeof(string), "* You didn't want to Marry %s, no 'yes' was said.",giveplayer);
				    SendClientMessage(playerid, COLOR_YELLOW, string);
				    format(string, sizeof(string), "* %s did't want to Marry you, no 'yes' was said.",sendername);
				    SendClientMessage(ProposedTo[playerid], COLOR_YELLOW, string);
				    return 0;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        ProposedTo[playerid] = 999;
			        return 0;
			    }
			}
		}
	    return 0;
	}
	if(WritingPaper[playerid] > 0)
	{
	    new line;
        new nstring[256];
        new idx;
        new length = strlen(text);
		while ((idx < length) && (text[idx] <= ' '))
		{
			idx++;
		}
		new offset = idx;
		new result[64];
		while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
		{
			result[idx - offset] = text[idx];
			idx++;
		}
		result[idx - offset] = EOS;
		if(!strlen(result))
		{
		    if(WritingLine[playerid] == 1) { SendClientMessage(playerid, COLOR_GRAD2, "* Please type in the Title of your Newspaper."); }
		    else { SendClientMessage(playerid, COLOR_LIGHTRED, "* Please type in a Text Line of your Newspaper."); }
			return 0;
		}
		format(nstring, sizeof(nstring), "%s", text);
		switch(WritingLine[playerid])
		{
		    case 1:
		    {
		        new fstring[MAX_PLAYER_NAME];
		        GetPlayerName(playerid, sendername, sizeof(sendername));
				format(fstring, sizeof(fstring), "%s", sendername);
				strmid(PaperInfo[WritingPaperNumber[playerid]][PaperMaker], fstring, 0, strlen(fstring), 255);
		        strmid(PaperInfo[WritingPaperNumber[playerid]][PaperTitle], nstring, 0, strlen(nstring), 255);
		        line = 0; WritingLine[playerid] = 2;
		        SendClientMessage(playerid, COLOR_LIGHTRED, "* Now you can write down the News Lines, 7 remaining.");
		    }
		    case 2:
		    {
		        strmid(PaperInfo[WritingPaperNumber[playerid]][PaperText1], nstring, 0, strlen(nstring), 255);
		        line = 1; WritingLine[playerid] = 3;
		    }
		    case 3:
		    {
		        strmid(PaperInfo[WritingPaperNumber[playerid]][PaperText2], nstring, 0, strlen(nstring), 255);
		        line = 2; WritingLine[playerid] = 4;
		    }
		    case 4:
		    {
		        strmid(PaperInfo[WritingPaperNumber[playerid]][PaperText3], nstring, 0, strlen(nstring), 255);
		        line = 3; WritingLine[playerid] = 5;
		    }
		    case 5:
		    {
		        strmid(PaperInfo[WritingPaperNumber[playerid]][PaperText4], nstring, 0, strlen(nstring), 255);
		        line = 4; WritingLine[playerid] = 6;
		    }
		    case 6:
		    {
		        strmid(PaperInfo[WritingPaperNumber[playerid]][PaperText5], nstring, 0, strlen(nstring), 255);
		        line = 5; WritingLine[playerid] = 7;
		    }
		    case 7:
		    {
		        strmid(PaperInfo[WritingPaperNumber[playerid]][PaperText6], nstring, 0, strlen(nstring), 255);
		        line = 6; WritingLine[playerid] = 8;
		    }
		    case 8:
		    {
		        strmid(PaperInfo[WritingPaperNumber[playerid]][PaperText7], nstring, 0, strlen(nstring), 255);
		        PaperInfo[WritingPaperNumber[playerid]][PaperUsed] = 1;
		        SavePapers();
		        line = 7; WritingLine[playerid] = 0; WritingPaper[playerid] = 0; WritingPaperNumber[playerid] = 999;
		    }
		}
		if(line > 0)
		{
			format(string, sizeof(string), "* You wrote Line %d of the Newspaper.", line);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			if(line == 7)
			{
			    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Your Newspaper has been added to the News List (for Paper Boys).");
			}
		}
	    return 0;
	}
	if(ConnectedToPC[playerid] == 255)
	{
		new idx;
	    tmp = strtok(text, idx);
	    if ((strcmp("Contracts", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Contracts")))
		{
		    if(PlayerInfo[playerid][pRank] < 4)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "   Only Hitman with Rank 4 or above can search and assign Contracts !");
		        return 0;
		    }
		    SearchingHit(playerid);
			return 0;
		}
		else if ((strcmp("News", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("News")))
		{
		    	new x_nr[256];
				x_nr = strtok(text, idx);

				if(!strlen(x_nr)) {
					SendClientMessage(playerid, COLOR_WHITE, "|__________________ Hitman Agency News __________________|");
					SendClientMessage(playerid, COLOR_WHITE, "USAGE: News [number] or News delete [number] or News delete all");
					format(string, sizeof(string), "1: %s :: Hitman: %s", News[hAdd1], News[hContact1]);
					SendClientMessage(playerid, COLOR_GREY, string);
					format(string, sizeof(string), "2: %s :: Hitman: %s", News[hAdd2], News[hContact2]);
					SendClientMessage(playerid, COLOR_GREY, string);
					format(string, sizeof(string), "3: %s :: Hitman: %s", News[hAdd3], News[hContact3]);
					SendClientMessage(playerid, COLOR_GREY, string);
					format(string, sizeof(string), "4: %s :: Hitman: %s", News[hAdd4], News[hContact4]);
					SendClientMessage(playerid, COLOR_GREY, string);
					format(string, sizeof(string), "5: %s :: Hitman: %s", News[hAdd5], News[hContact5]);
					SendClientMessage(playerid, COLOR_GREY, string);
					SendClientMessage(playerid, COLOR_WHITE, "|________________________________________________________|");
					return 0;
				}//lets start
				if(strcmp(x_nr,"1",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { SendClientMessage(playerid, COLOR_GREY, "   Already placed a News Message, it must be deleted first !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "   You must be Rank 3 to write messages to the News Channel !"); return 0; }
				    if(News[hTaken1] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { SendClientMessage(playerid, COLOR_GREY, "   News Text to short !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd1], string, 0, strlen(string), 255);
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact1], string, 0, strlen(string), 255);
						News[hTaken1] = 1; PlacedNews[playerid] = 1;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You placed a News Message on the Hitman Agency's News Channel.");
						return 0;
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   Spot 1 is already Taken !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"2",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { SendClientMessage(playerid, COLOR_GREY, "   Already placed a News Message, it must be deleted first !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "   You must be Rank 3 to write messages to the News Channel !"); return 0; }
				    if(News[hTaken2] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { SendClientMessage(playerid, COLOR_GREY, "   News Text to short !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd2], string, 0, strlen(string), 255);
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact2], string, 0, strlen(string), 255);
						News[hTaken2] = 1; PlacedNews[playerid] = 1;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You placed a News Message on the Hitman Agency's News Channel.");
						return 0;
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   Spot 2 is already Taken !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"3",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { SendClientMessage(playerid, COLOR_GREY, "   Already placed a News Message, it must be deleted first !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "   You must be Rank 3 to write messages to the News Channel !"); return 0; }
				    if(News[hTaken3] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { SendClientMessage(playerid, COLOR_GREY, "   News Text to short !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd3], string, 0, strlen(string), 255);
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact3], string, 0, strlen(string), 255);
						News[hTaken3] = 1; PlacedNews[playerid] = 1;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You placed a News Message on the Hitman Agency's News Channel.");
						return 0;
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   Spot 3 is already Taken !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"4",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { SendClientMessage(playerid, COLOR_GREY, "   Already placed a News Message, it must be deleted first !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "   You must be Rank 3 to write messages to the News Channel !"); return 0; }
				    if(News[hTaken4] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { SendClientMessage(playerid, COLOR_GREY, "   News Text to short !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd4], string, 0, strlen(string), 255);
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact4], string, 0, strlen(string), 255);
						News[hTaken4] = 1; PlacedNews[playerid] = 1;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You placed a News Message on the Hitman Agency's News Channel.");
						return 0;
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   Spot 4 is already Taken !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"5",true) == 0)
				{
				    if(PlacedNews[playerid] == 1) { SendClientMessage(playerid, COLOR_GREY, "   Already placed a News Message, it must be deleted first !"); return 0; }
				    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "   You must be Rank 3 to write messages to the News Channel !"); return 0; }
				    if(News[hTaken5] == 0)
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        if(strlen(text)-(strlen(x_nr)) < 9) { SendClientMessage(playerid, COLOR_GREY, "   News Text to short !"); return 0; }
						format(string, sizeof(string), "%s",right(text,strlen(text)-7)); strmid(News[hAdd5], string, 0, strlen(string), 255);
						format(string, sizeof(string), "%s",sendername); strmid(News[hContact5], string, 0, strlen(string), 255);
						News[hTaken5] = 1; PlacedNews[playerid] = 1;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You placed a News Message on the Hitman Agency's News Channel.");
						return 0;
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   Spot 5 is already Taken !");
				        return 0;
				    }
				}
				else if(strcmp(x_nr,"delete",true) == 0)
				{
				    if(PlayerInfo[playerid][pRank] < 4)
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   You must be Rank 4 to delete messages from the News Channel !");
				        return 0;
				    }
				    new string1[MAX_PLAYER_NAME];
				    new x_tel[256];
					x_tel = strtok(text, idx);
					if(!strlen(x_tel)) {
					    SendClientMessage(playerid, COLOR_WHITE, "USAGE: News delete [number] or News delete all.");
					    return 0;
					}
                    if(strcmp(x_tel,"1",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd1], string, 0, strlen(string), 255);
						format(string1, sizeof(string1), "No-one");	strmid(News[hContact1], string1, 0, strlen(string1), 255);
						News[hTaken1] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You deleted News Message (1) from the Hitman Agency's News Channel.");
						return 0;
                    }
                    else if(strcmp(x_tel,"2",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd2], string, 0, strlen(string), 255);
						format(string1, sizeof(string1), "No-one");	strmid(News[hContact2], string1, 0, strlen(string1), 255);
						News[hTaken2] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You deleted News Message (2) from the Hitman Agency's News Channel.");
						return 0;
                    }
                    else if(strcmp(x_tel,"3",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd3], string, 0, strlen(string), 255);
						format(string1, sizeof(string1), "No-one");	strmid(News[hContact3], string1, 0, strlen(string1), 255);
						News[hTaken3] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You deleted News Message (3) from the Hitman Agency's News Channel.");
						return 0;
                    }
                    else if(strcmp(x_tel,"4",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd4], string, 0, strlen(string), 255);
						format(string1, sizeof(string1), "No-one");	strmid(News[hContact4], string1, 0, strlen(string1), 255);
						News[hTaken4] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You deleted News Message (4) from the Hitman Agency's News Channel.");
						return 0;
                    }
                    else if(strcmp(x_tel,"5",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd5], string, 0, strlen(string), 255);
						format(string1, sizeof(string1), "No-one");	strmid(News[hContact5], string1, 0, strlen(string1), 255);
						News[hTaken5] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You deleted News Message (5) from the Hitman Agency's News Channel.");
						return 0;
                    }
                    else if(strcmp(x_tel,"all",true) == 0)
                    {
                        format(string, sizeof(string), "Nothing"); strmid(News[hAdd1], string, 0, strlen(string), 255);
						format(string1, sizeof(string1), "No-one");	strmid(News[hContact1], string1, 0, strlen(string1), 255);
						News[hTaken1] = 0;
						format(string, sizeof(string), "Nothing"); strmid(News[hAdd2], string, 0, strlen(string), 255);
						format(string1, sizeof(string1), "No-one");	strmid(News[hContact2], string1, 0, strlen(string1), 255);
						News[hTaken2] = 0;
						format(string, sizeof(string), "Nothing"); strmid(News[hAdd3], string, 0, strlen(string), 255);
						format(string1, sizeof(string1), "No-one");	strmid(News[hContact3], string1, 0, strlen(string1), 255);
						News[hTaken3] = 0;
						format(string, sizeof(string), "Nothing"); strmid(News[hAdd4], string, 0, strlen(string), 255);
						format(string1, sizeof(string1), "No-one");	strmid(News[hContact4], string1, 0, strlen(string1), 255);
						News[hTaken4] = 0;
						format(string, sizeof(string), "Nothing"); strmid(News[hAdd5], string, 0, strlen(string), 255);
						format(string1, sizeof(string1), "No-one");	strmid(News[hContact5], string1, 0, strlen(string1), 255);
						News[hTaken5] = 0;
						SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You deleted all the News Message from the Hitman Agency's News Channel.");
						return 0;
                    }
                    else
                    {
                        SendClientMessage(playerid, COLOR_WHITE, "USAGE: News delete [number] or News delete all.");
					    return 0;
                    }
				}
				else { return 0; }
		}
		else if ((strcmp("Givehit", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Givehit")))
		{
		    if(PlayerInfo[playerid][pRank] < 4)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "   You need Rank 4 to Give Contracts to Hitmans !");
		        return 0;
		    }
		    if(hitfound == 0)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "   There is no Hit Founded yet, use Contracts in the Portable first !");
		        return 0;
		    }
		    tmp = strtok(text, idx);
		    if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GRAD1, "USAGE: Givehit [playerid/PartOfName]");
				return 0;
			}
			//giveplayerid = strval(tmp);
			giveplayerid = ReturnUser(tmp);
			if(IsPlayerConnected(giveplayerid))
			{
			    if(giveplayerid != INVALID_PLAYER_ID)
			    {
				    if(PlayerInfo[giveplayerid][pMember] != 8)
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   That player is not a Hitman !");
						return 0;
				    }
				    if(GoChase[giveplayerid] < 999)
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   That Hitman is already busy with a Contract !");
						return 0;
				    }
				    if(IsPlayerConnected(hitid))
				    {
				        GetPlayerName(playerid, sendername, sizeof(sendername));
				        GetPlayerName(giveplayerid, giver, sizeof(giver));
				        GetPlayerName(hitid, giveplayer, sizeof(giveplayer));
				        //format(string, sizeof(string), "* You assigned%s to kill: %s(ID:%d), for $%d.", giver, giveplayer, hitid, PlayerInfo[hitid][pValue]);
		    			//SendClientMessage(playerid, COLOR_YELLOW, string);
				        //format(string, sizeof(string), "* Hitman %s has assigned you to kill: %s(ID:%d), for $%d.", sendername, giveplayer, hitid, PlayerInfo[hitid][pValue]);
		    			//SendClientMessage(giveplayerid, COLOR_YELLOW, string);
		    			format(string, sizeof(string), "* Hitman %s, assigned Hitman %s to kill: %s(ID:%d), for $%d.", sendername, giver, giveplayer, hitid, PlayerInfo[hitid][pHeadValue]);
		    			SendFamilyMessage(8, COLOR_YELLOW, string);
		    			GoChase[giveplayerid] = hitid;
		    			GetChased[hitid] = giveplayerid;
		    			GotHit[hitid] = 1;
		    			hitid = 0;
		    			hitfound = 0;
				        return 0;
				    }
				    else
				    {
				        SendClientMessage(playerid, COLOR_GREY, "   The Contracted Person is offline, use Contracts in the Portable again !");
				        return 0;
				    }
				}
				return 0;
			}
			else
			{
			    SendClientMessage(playerid, COLOR_GREY, "   That Hitman is not Online, or ain't a Hitman !");
			    return 0;
			}
		}
		else if ((strcmp("Ranks", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Ranks")))
		{
			SendClientMessage(playerid, COLOR_WHITE, "|__________________ Agency's Ranks __________________|");
		    for(new i=0; i < MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
				    if(PlayerInfo[i][pMember] == 8||PlayerInfo[i][pLeader] == 8)
				    {
						GetPlayerName(i, giveplayer, sizeof(giveplayer));
				        format(string, sizeof(string), "* %s: Rank %d", giveplayer,PlayerInfo[i][pRank]);
						SendClientMessage(playerid, COLOR_GREY, string);
					}
				}
			}
		}
		else if ((strcmp("Order", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Order")))
		{
		    if(OrderReady[playerid] > 0)
		    {
		        SendClientMessage(playerid, COLOR_GREY, "   You already Ordered a Package, pick it up at your Head Quarter's Front Door first !");
		        return 0;
		    }
		    tmp = strtok(text, idx);
		    if ((strcmp("1", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("1")))
			{
			    if(PlayerInfo[playerid][pRank] < 1) { SendClientMessage(playerid, COLOR_GREY, "   Your Rank is not high enough to Order that Package !"); return 0; }
			    if(GetPlayerMoney(playerid) > 4999)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have Ordered Package 1 ($5000), it will be delivered at your Head Quarter's Front Door.");
			        OrderReady[playerid] = 1;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"   You can't afford that Package !");
			        return 0;
			    }
			}
			else if ((strcmp("2", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("2")))
			{
			    if(PlayerInfo[playerid][pRank] < 2) { SendClientMessage(playerid, COLOR_GREY, "   Your Rank is not high enough to Order that Package !"); return 0; }
			    if(GetPlayerMoney(playerid) > 5999)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have Ordered Package 2 ($6000), it will be delivered at your Head Quarter's Front Door.");
			        OrderReady[playerid] = 2;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"   You can't afford that Package !");
			        return 0;
			    }
			}
			else if ((strcmp("3", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("3")))
			{
			    if(PlayerInfo[playerid][pRank] < 2) { SendClientMessage(playerid, COLOR_GREY, "   Your Rank is not high enough to Order that Package !"); return 0; }
			    if(GetPlayerMoney(playerid) > 5999)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have Ordered Package 3 ($6000), it will be delivered at your Head Quarter's Front Door.");
			        OrderReady[playerid] = 3;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"   You can't afford that Package !");
			        return 0;
			    }
			}
			else if ((strcmp("4", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("4")))
			{
			    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "   Your Rank is not high enough to Order that Package !"); return 0; }
			    if(GetPlayerMoney(playerid) > 7999)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have Ordered Package 4 ($8000), it will be delivered at your Head Quarter's Front Door.");
			        OrderReady[playerid] = 4;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"   You can't afford that Package !");
			        return 0;
			    }
			}
			else if ((strcmp("5", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("5")))
			{
			    if(PlayerInfo[playerid][pRank] < 3) { SendClientMessage(playerid, COLOR_GREY, "   Your Rank is not high enough to Order that Package !"); return 0; }
			    if(GetPlayerMoney(playerid) > 7999)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have Ordered Package 5 ($8000), it will be delivered at your Head Quarter's Front Door.");
			        OrderReady[playerid] = 5;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"   You can't afford that Package !");
			        return 0;
			    }
			}
			else if ((strcmp("6", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("6")))
			{
			    if(PlayerInfo[playerid][pRank] < 4) { SendClientMessage(playerid, COLOR_GREY, "   Your Rank is not high enough to Order that Package !"); return 0; }
			    if(GetPlayerMoney(playerid) > 8499)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have Ordered Package 6 ($8500), it will be delivered at your Head Quarter's Front Door.");
			        OrderReady[playerid] = 6;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"   You can't afford that Package !");
			        return 0;
			    }
			}
			else if ((strcmp("7", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("7")))
			{
			    if(PlayerInfo[playerid][pRank] < 4) { SendClientMessage(playerid, COLOR_GREY, "   Your Rank is not high enough to Order that Package !"); return 0; }
			    if(GetPlayerMoney(playerid) > 8499)
			    {
			        SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have Ordered Package 7 ($8500), it will be delivered at your Head Quarter's Front Door.");
			        OrderReady[playerid] = 7;
			        return 0;
			    }
			    else
			    {
			        SendClientMessage(playerid, COLOR_GREY,"   You can't afford that Package !");
			        return 0;
			    }
			}
			else
			{
			    SendClientMessage(playerid, COLOR_WHITE, "|__________________ Available Packages __________________|");
			    if(PlayerInfo[playerid][pRank] >= 1) { SendClientMessage(playerid, COLOR_GREY, "|(1) ($5000 ) Rank 1 - 5: Knife, Desert Eagle, MP5, Shotgun"); }
			    if(PlayerInfo[playerid][pRank] >= 2) { SendClientMessage(playerid, COLOR_GREY, "|(2) ($6000 ) Rank 2 - 5: Knife, Desert Eagle, M4, MP5, Shotgun"); }
			    if(PlayerInfo[playerid][pRank] >= 2) { SendClientMessage(playerid, COLOR_GREY, "|(3) ($6000 ) Rank 2 - 5: Knife, Desert Eagle, AK47, MP5, Shotgun"); }
			    if(PlayerInfo[playerid][pRank] >= 3) { SendClientMessage(playerid, COLOR_GREY, "|(4) ($8000) Rank 3 - 5: Knife, Desert Eagle, M4, MP5, Shotgun, Sniper"); }
			    if(PlayerInfo[playerid][pRank] >= 3) { SendClientMessage(playerid, COLOR_GREY, "|(5) ($8000) Rank 3 - 5: Knife, Desert Eagle, AK47, MP5, Shotgun, Sniper"); }
			    if(PlayerInfo[playerid][pRank] >= 4) { SendClientMessage(playerid, COLOR_GREY, "|(6) ($8500) Rank 4 - 5: Knife, Desert Eagle, M4, MP5, Shotgun, Sniper"); }
			    if(PlayerInfo[playerid][pRank] >= 4) { SendClientMessage(playerid, COLOR_GREY, "|(7) ($8500) Rank 4 - 5: Knife, Desert Eagle, AK47, MP5, Shotgun, Sniper"); }
			    SendClientMessage(playerid, COLOR_WHITE, "|________________________________________________________|");
			    return 0;
			}
		}
		else if ((strcmp("Logout", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Logout")))
		{
		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* You have shutdowned your Laptop, and Disconnected from your Agency.");
      		ConnectedToPC[playerid] = 0;
		    return 0;
		}
		else
		{
		    SendClientMessage(playerid, COLOR_WHITE, "|___ Hitman Agency ___|");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - News");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Contracts");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Givehit");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Backup");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Order");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Ranks");
		    SendClientMessage(playerid, COLOR_YELLOW2, "| - Logout");
		    SendClientMessage(playerid, COLOR_YELLOW2, "|");
			SendClientMessage(playerid, COLOR_WHITE, "|______________|00:00|");
		    return 0;
		}
	    return 0;
	}
	if(CallLawyer[playerid] == 111)
	{
	    new idx;
	    tmp = strtok(text, idx);
	    if ((strcmp("yes", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("yes")))
		{
		    GetPlayerName(playerid, sendername, sizeof(sendername));
		    format(string, sizeof(string), "** %s is in Jail, and needs a Lawyer. Go to the Police Station.", sendername);
	    	SendJobMessage(2, TEAM_AZTECAS_COLOR, string);
	    	SendJobMessage(2, TEAM_AZTECAS_COLOR, "* When you are at the Police Station, ask an Officer to approve you with /accept lawyer.");
	    	SendClientMessage(playerid, COLOR_LIGHTRED, "A message has been sent to all available Lawyers, please wait.");
	    	WantLawyer[playerid] = 0;
			CallLawyer[playerid] = 0;
	    	return 0;
		}
		else
		{
		    SendClientMessage(playerid, COLOR_LIGHTRED, "There is no Lawyer available to you anymore, Jail Time started.");
		    WantLawyer[playerid] = 0;
			CallLawyer[playerid] = 0;
		    return 0;
		}
	}
	if(TalkingLive[playerid] != 255)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(PlayerInfo[playerid][pJob] == 6)
		{
		    format(string, sizeof(string), "LiveNR %s: %s", sendername, text);
			OOCNews(COLOR_LIGHTGREEN, string);
		}
		else
		{
		    format(string, sizeof(string), "LivePlayer %s: %s", sendername, text);
			OOCNews(COLOR_LIGHTGREEN, string);
		}
		return 0;
	}
	if(Mobile[playerid] != 255)
	{
		new idx;
		tmp = strtok(text, idx);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s Says (cellphone): %s", sendername, text);
		ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		//printf("callers line %d called %d caller %d",Mobile[Mobile[playerid]],Mobile[playerid],playerid);
		if(Mobile[playerid] == 914)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "Dispatch: Sorry I don't understand?");
				return 0;
			}
			new turner[MAX_PLAYER_NAME];
			new wanted[128];
			GetPlayerName(playerid, turner, sizeof(turner));
			SendClientMessage(playerid, TEAM_CYAN_COLOR, "Dispatch: We have alerted all units in the area.");
			SendClientMessage(playerid, TEAM_CYAN_COLOR, "Thank you for reporting this incident");
			format(wanted, sizeof(wanted), "Dispatch: All Units IA: Caller: %s",turner);
			SendTeamBeepMessage(1, TEAM_CYAN_COLOR, wanted);
			format(wanted, sizeof(wanted), "Dispatch: Incident: %s",text);
			SendTeamMessage(1, TEAM_CYAN_COLOR, wanted);
			SendClientMessage(playerid, COLOR_GRAD2, "   They Hung Up...");
			Mobile[playerid] = 255;
			return 0;
		}
		if(Mobile[playerid] == 913)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: Sorry i dont understand?");
				return 0;
			}
			if ((strcmp("no", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("no")))
			{
				new turner[MAX_PLAYER_NAME];
				new wanted[128];
				GetPlayerName(playerid, turner, sizeof(turner));
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: We have alerted all units in the area.");
				SendClientMessage(playerid, COLOR_DBLUE, "Thank you for reporting this crime");
				format(wanted, sizeof(wanted), "HQ: All Units APB: Reporter: %s",turner);
				SendFamilyMessage(1, COLOR_DBLUE, wanted);
				format(wanted, sizeof(wanted), "HQ: Crime: %s, Suspect: Unknown",PlayerCrime[playerid][pAccusing]);
				SendFamilyMessage(1, COLOR_DBLUE, wanted);
				SendClientMessage(playerid, COLOR_GRAD2, "   They Hung Up...");
				Mobile[playerid] = 255;
				return 0;
			}
			new badguy;
			//badguy = strval(tmp);
			badguy = ReturnUser(tmp);
			if (IsPlayerConnected(badguy))
			{
			    if(badguy != INVALID_PLAYER_ID)
			    {
					if (gTeam[badguy] == 2 || gTeam[badguy] == 1)
					{
						SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: You will have to contact internal affairs. This is an emergency line");
						SendClientMessage(playerid, COLOR_GRAD2, "   They Hung Up...");
						Mobile[playerid] = 255;
						return 0;
					}
					if (WantedPoints[badguy] > 0)
					{
						SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: Units are already assigned to that case");
						SendClientMessage(playerid, COLOR_DBLUE, "Thank you for reporting this crime");
						SendClientMessage(playerid, COLOR_GRAD2, "   They Hung Up...");
						Mobile[playerid] = 255;
						return 0;
					}
					if (badguy == playerid)
					{
						SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: Dont Fool Around, This is an emergency line.");
						SendClientMessage(playerid, COLOR_GRAD2, "   They Hung Up...");
						Mobile[playerid] = 255;
						return 0;
					}
					SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: We have alerted all units in the area.");
					SendClientMessage(playerid, COLOR_DBLUE, "Thank you for reporting this crime");
					SetPlayerCriminal(badguy,playerid, PlayerCrime[playerid][pAccusing]);
					if(WantedPoints[badguy] > 0) { } else { WantedPoints[badguy] += 2; }
					SendClientMessage(playerid, COLOR_GRAD2, "   They Hung Up...");
					Mobile[playerid] = 255;
					return 0;
				}//invalid id
				return 0;
			}//not connected
			else
			{
				format(string, sizeof(string), "Police HQ: I have no Information on %s, are you sure thats the right name?",tmp);
				SendClientMessage(playerid, COLOR_DBLUE, string);
				return 0;
			}
		}
		if(Mobile[playerid] == 912)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: Sorry i dont understand?");
				return 0;
			}
			strmid(PlayerCrime[playerid][pAccusing], text, 0, strlen(text), 255);
			SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: If you know the assailant's name or part of it say it now or just say no.");
			Mobile[playerid] = 913;
			return 0;
		}
		if(Mobile[playerid] == 911)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: Sorry i dont understand, police or paramedic?");
				return 0;
			}
			else if ((strcmp("police", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("police")))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: I am patching you to  Police HQ, please hold.");
				Mobile[playerid] = 912;
				SendClientMessage(playerid, COLOR_DBLUE, "Police HQ: Please give me a short description of the crime.");
				return 0;
			}
			else if ((strcmp("paramedic", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("paramedic")))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: I am patching you to  Paramedic HQ, please hold.");
				Mobile[playerid] = 914;
				SendClientMessage(playerid, TEAM_CYAN_COLOR, "Dispatch: Please give me a short description of the Incident.");
				return 0;
			}
			else
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "EMERGENCY: Sorry i dont understand, police or paramedic?");
				return 0;
			}
		}
		if(IsPlayerConnected(Mobile[playerid]))
		{
		    if(Mobile[Mobile[playerid]] == playerid)
		    {
				SendClientMessage(Mobile[playerid], COLOR_YELLOW,string);
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_YELLOW,"Theres nobody there");
		}
		return 0;
	}
	if (realchat)
	{
	    if(gPlayerLogged[playerid] == 0)
	    {
	        return 0;
      	}
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "%s Says: %s", sendername, text);
		ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		return 0;
	}
	return 1;
}

public OnPlayerPrivmsg(playerid, recieverid, text[])
{
	return 0;
}

public SetCamBack(playerid)
{
    if(IsPlayerConnected(playerid))
    {
		new Float:plocx,Float:plocy,Float:plocz;
		GetPlayerPos(playerid, plocx, plocy, plocz);
		SetPlayerPos(playerid, -1863.15, -21.6598, 1060.15); // Warp the player
		SetPlayerInterior(playerid,14);
	}
}

public FixHour(hour)
{
	hour = timeshift+hour;
	if (hour < 0)
	{
		hour = hour+24;
	}
	else if (hour > 23)
	{
		hour = hour-24;
	}
	shifthour = hour;
	return 1;
}

public AddsOn()
{
	adds=1;
	return 1;
}