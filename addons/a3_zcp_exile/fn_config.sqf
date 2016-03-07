/*
	Zupa's Capture Points
	Configuration of ZCP
	Capture points and earn rewards.
	╔════╗─────────╔═══╗────────╔╗─────────────╔╗
	╚══╗═║─────────╚╗╔╗║────────║║────────────╔╝╚╗
	──╔╝╔╬╗╔╦══╦══╗─║║║╠══╦╗╔╦══╣║╔══╦╗╔╦══╦═╗╚╗╔╬══╗
	─╔╝╔╝║║║║╔╗║╔╗║─║║║║║═╣╚╝║║═╣║║╔╗║╚╝║║═╣╔╗╗║║║══╣
	╔╝═╚═╣╚╝║╚╝║╔╗║╔╝╚╝║║═╬╗╔╣║═╣╚╣╚╝║║║║║═╣║║║║╚╬══║
	╚════╩══╣╔═╩╝╚╝╚═══╩══╝╚╝╚══╩═╩══╩╩╩╩══╩╝╚╝╚═╩══╝
	────────║║
	────────╚╝
*/

// First person in the Cap zone is the capper (If he leaves, the closest on of the group is the new capper but time is reset!).
// When multiple people are in the zone and not in the same group, the zone is contested.
// Being first in the zone starts the timer.
// Holding a zone  gives you a reward after x Min.

ZCP_dev = false; // Devmode for shorter development capture times

ZCP_DMS_doIUseDMS = true; // Use DMS to spawn AI IF CapturePoint has spawnAI = true
ZCP_Min_AI_Amount = 4; // Min ammount of AI at a ZCP
ZCP_Random_AI_Max = 8; // so min 4 and max 12 (4+8) AI

ZCP_CapTime = 300; // Seconds to cap an area uncontested
ZCP_CapRadius = 60; // Meter radius of the capture circle around the first object.
ZCP_MinWaitTime = 120; // seconds to wait to spawn a new capturepoint when 1 was capped.
ZCP_MaxWaitTime = 120; // random between 0 and THIS number added to the ZCP_MinWaitTime to counter spawning points at the same time
ZCP_BaseCleanupDelay = 120; // seconds to wait to delete a captured base.

ZCP_Minimum_Online_Players = 0; // Amount of players to be online before it allows to spawn capture points. !!! O = always

ZCP_RewardRelativeToPlayersOnline = true; // This will recalculate the crypto reward according the amount of online players.
ZCP_PoptabReward = 25; // Poptab reward for capping per player online. ( When poptab reward is selected or randomly chosen ).
ZCP_MinPoptabReward = 1000; // Poptabreward is added to this number

/* Reputation is ALWAYS given as addition on the normal reward.*/
ZCP_ReputationReward = 25; // Respect reward for capping per  player online.
ZCP_MinReputationReward = 1000; // ZCP_ReputationReward is added to this number
ZCP_ReputationRewardForGroup = 500; // Each group members gets this amount of reputation ( for the trouble).
ZCP_MinGroupDistance = 200; // meters to be close to the capper to get the group award

ZCP_CleanupBase = true; // Let the base dissappear after completing
ZCP_CleanupBaseWithAIBomber = true; // Cleanup with a airstrike
ZCP_CleanupAIVehicleClasses = ['B_Plane_CAS_01_F']; // Any flying vehicle in arma (default B_Plane_CAS_01_F = A10)
ZCP_FlyHeight = 150; // Height of the flying plane;

ZCP_UseSpecificNamesForCappers = true; // Use the player name, if false it say 'A player'

// Server will keep as many missions up as ZCP_MaxMissions, And they will be randomly choosen from the following list
// Location is ignored if not using static points. just put [0,0,0] then. activate static buy using isStatic = true
// valid rewards -> Random, Poptabs, Vehicle, Buildingbox, WeaponBox
ZCP_CapPoints = [ // [name,[x,y,z],reward, varname,index, spanwnAI, isStatic]
	["ZCP Alpha",[0,0,0],"Random","alpha",0, true, false] ,
	["ZCP Bravo",[0,0,0],"Random","beta",1, true, false]
];

ZCP_MaxMissions = count ZCP_CapPoints; // Amount of cap points at the same time.

// For every spawned mission,
ZCP_CapBases = [ // located in capbases folder
	"base1.sqf"
];

ZCP_TerrainGradient = 40; // Max meter terrain gradient ( height difference)
ZCP_MinDistanceFromObject = 60; // Missions needs an open spot. You can lower it but it might collide with other objects ( not always a problem)

// Same as DMS -> Credits DMS
ZCP_SpawnZoneDistance = 500;
ZCP_TradeZoneDistance = 500;
ZCP_TraderZoneMarkerTypes =			[							// If you're using custom trader markers, make sure you define them here. CASE SENSITIVE!!!
										"ExileTraderZone"
									];
ZCP_SpawnZoneMarkerTypes =			[							// If you're using custom spawn zone markers, make sure you define them here. CASE SENSITIVE!!!
										"ExileSpawnZone"
									];


/* These are arma 3 colors, look up the color naming if you are going to change this */
ZCP_FreeColor = "ColorIndependent"; // uncontested marker color
ZCP_CappedColor = "ColorCivilian"; // uncontested + capping color
ZCP_ContestColor = "ColorOPFOR"; // contested + capping color

ZCP_DisableVehicleReward = false; // Because it doesnt save without changing epoch code.

/** Uses DMS system, why make one if it already excist? Credits DMS **/
ZCP_DMS_MinimumMagCount					= 2;						// Minimum number of magazines for weapons.
ZCP_DMS_MaximumMagCount					= 4;						// Maximum number of magazines for weapons.
ZCP_DMS_CrateCase_Sniper =				[							// If you pass "Sniper" in _lootValues, then it will spawn these weapons/items/backpacks
										[
											["Rangefinder",1],
											["srifle_GM6_F",1],
											["srifle_LRR_F",1],
											["srifle_EBR_F",1],
											["hgun_Pistol_heavy_01_F",1],
											["hgun_PDW2000_F",1]
										],
										[
											["ItemGPS",1],
											["U_B_FullGhillie_ard",1],
											["U_I_FullGhillie_lsh",1],
											["U_O_FullGhillie_sard",1],
											["U_O_GhillieSuit",1],
											["V_PlateCarrierGL_blk",1],
											["V_HarnessO_brn",1],
											["Exile_Item_InstaDoc",3],
											["Exile_Item_Surstromming_Cooked",5],
											["Exile_Item_PlasticBottleFreshWater",5],
											["optic_DMS",1],
											["acc_pointer_IR",1],
											["muzzle_snds_B",1],
											["optic_LRPS",1],
											["optic_MRD",1],
											["muzzle_snds_acp",1],
											["optic_Holosight_smg",1],
											["muzzle_snds_L",1],
											["5Rnd_127x108_APDS_Mag",3],
											["7Rnd_408_Mag",3],
											["20Rnd_762x51_Mag",5],
											["11Rnd_45ACP_Mag",3],
											["30Rnd_9x21_Mag",3]
										],
										[
											["B_Carryall_cbr",1],
											["B_Kitbag_mcamo",1]
										]
									];
ZCP_DMS_BoxWeapons =					[							// List of weapons that can spawn in a crate
										"Exile_Melee_Axe",
										"arifle_Katiba_GL_F",
										"arifle_MX_GL_Black_F",
										"arifle_Mk20_GL_F",
										"arifle_TRG21_GL_F",
										"arifle_Katiba_F",
										"arifle_MX_Black_F",
										"arifle_TRG21_F",
										"arifle_TRG20_F",
										"arifle_Mk20_plain_F",
										"arifle_Mk20_F",
										"LMG_Zafir_F",
										"LMG_Mk200_F",
										"arifle_MX_SW_Black_F",
										"srifle_EBR_F",
										"srifle_DMR_01_F",
										"srifle_GM6_F",
										"srifle_LRR_F",
										"arifle_MXM_F",
										"arifle_MXM_Black_F",
										"srifle_DMR_02_F"
									];
ZCP_DMS_BoxFood =						[							// List of food that can spawn in a crate.
										"Exile_Item_GloriousKnakworst_Cooked",
										"Exile_Item_Surstromming_Cooked",
										"Exile_Item_SausageGravy_Cooked",
										"Exile_Item_ChristmasTinner_Cooked",
										"Exile_Item_BBQSandwich_Cooked",
										"Exile_Item_Catfood_Cooked",
										"Exile_Item_DogFood_Cooked"
									];
ZCP_DMS_BoxDrinks =						[
										"Exile_Item_PlasticBottleCoffee",
										"Exile_Item_PowerDrink",
										"Exile_Item_PlasticBottleFreshWater",
										"Exile_Item_EnergyDrink",
										"Exile_Item_MountainDupe"
									];
ZCP_DMS_BoxMeds =						[
										"Exile_Item_InstaDoc",
										"Exile_Item_Vishpirin",
										"Exile_Item_Bandage"
									];
ZCP_DMS_BoxSurvivalSupplies	=			[							//List of survival supplies (food/drink/meds) that can spawn in a crate. "ZCP_DMS_BoxFood", "ZCP_DMS_BoxDrinks", and "ZCP_DMS_BoxMeds" is automatically added to this list.
										"Exile_Item_Matches",
										"Exile_Item_CookingPot",
										"Exile_Melee_Axe",
										"Exile_Item_CanOpener"
									] + ZCP_DMS_BoxFood + ZCP_DMS_BoxDrinks + ZCP_DMS_BoxMeds;
ZCP_DMS_BoxBaseParts =					[
										"Exile_Item_CamoTentKit",
										"Exile_Item_WoodWallKit",
										"Exile_Item_WoodWallHalfKit",
										"Exile_Item_WoodDoorwayKit",
										"Exile_Item_WoodDoorKit",
										"Exile_Item_WoodFloorKit",
										"Exile_Item_WoodFloorPortKit",
										"Exile_Item_WoodStairsKit",
										"Exile_Item_WoodSupportKit",
										"Exile_Item_FortificationUpgrade"
									];
ZCP_DMS_BoxCraftingMaterials =			[
										"Exile_Item_MetalPole",
										"Exile_Item_MetalBoard",
										"Exile_Item_JunkMetal"
									];
ZCP_DMS_BoxTools =						[
										"Exile_Item_Grinder",
										"Exile_Item_Handsaw"
									];
ZCP_DMS_BoxBuildingSupplies	=			[							// List of building supplies that can spawn in a crate ("ZCP_DMS_BoxBaseParts", "ZCP_DMS_BoxCraftingMaterials", and "ZCP_DMS_BoxTools" are automatically added to this list. "ZCP_DMS_BoxCraftingMaterials" is added twice for weight.)
										"Exile_Item_DuctTape",
										"Exile_Item_PortableGeneratorKit"
									] + ZCP_DMS_BoxBaseParts + ZCP_DMS_BoxCraftingMaterials + ZCP_DMS_BoxCraftingMaterials + ZCP_DMS_BoxTools;
ZCP_DMS_BoxOptics =						[							// List of optics that can spawn in a crate
										"optic_Arco",
										"optic_Hamr",
										"optic_Aco",
										"optic_Holosight",
										"optic_MRCO",
										"optic_SOS",
										"optic_DMS",
										"optic_LRPS"
										//"optic_Nightstalker"			// Nightstalker scope lost thermal in Exile v0.9.4
									];
ZCP_DMS_BoxBackpacks =					[							//List of backpacks that can spawn in a crate
										"B_Bergen_rgr",
										"B_Carryall_oli",
										"B_Kitbag_mcamo",
										"B_Carryall_cbr",
										"B_FieldPack_oucamo",
										"B_FieldPack_cbr",
										"B_Bergen_blk"
									];
ZCP_DMS_BoxItems						= ZCP_DMS_BoxSurvivalSupplies+ZCP_DMS_BoxBuildingSupplies+ZCP_DMS_BoxOptics;	// Random "items" can spawn optics, survival supplies, or building supplies

ZCP_DMS_RareLoot						= true;						// Potential chance to spawn rare loot in any crate.
ZCP_DMS_RareLootList =					[							// List of rare loot to spawn
										"Exile_Item_SafeKit",
										"Exile_Item_CodeLock"
									];
ZCP_DMS_RareLootChance	= 10;						// Percentage Chance to spawn rare loot in any crate | Default: 10%

// Vehicles
ZCP_DMS_ArmedVehicles =					[							// List of armed vehicles that can spawn
										"Exile_Car_Offroad_Armed_Guerilla01"
									];

ZCP_DMS_MilitaryVehicles =				[							// List of military vehicles that can spawn
										"Exile_Car_Strider",
										"Exile_Car_Hunter",
										"Exile_Car_Ifrit"
									];

ZCP_DMS_TransportTrucks =				[							// List of transport trucks that can spawn
										"Exile_Car_Van_Guerilla01",
										"Exile_Car_Zamak",
										"Exile_Car_Tempest",
										"Exile_Car_HEMMT",
										"Exile_Car_Ural_Open_Military",
										"Exile_Car_Ural_Covered_Military"
									];

ZCP_DMS_RefuelTrucks =					[							// List of refuel trucks that can spawn
										"Exile_Car_Van_Fuel_Black",
										"Exile_Car_Van_Fuel_White",
										"Exile_Car_Van_Fuel_Red",
										"Exile_Car_Van_Fuel_Guerilla01",
										"Exile_Car_Van_Fuel_Guerilla02",
										"Exile_Car_Van_Fuel_Guerilla03"
									];

ZCP_DMS_CivilianVehicles =				[							// List of civilian vehicles that can spawn
										"Exile_Car_SUV_Red",
										"Exile_Car_Hatchback_Rusty1",
										"Exile_Car_Hatchback_Rusty2",
										"Exile_Car_Hatchback_Sport_Red",
										"Exile_Car_SUV_Red",
										"Exile_Car_Offroad_Rusty2",
										"Exile_Bike_QuadBike_Fia"
									];

ZCP_DMS_TransportHelis =				[							// List of transport helis that can spawn
										"Exile_Chopper_Hummingbird_Green",
										"Exile_Chopper_Orca_BlackCustom",
										"Exile_Chopper_Mohawk_FIA",
										"Exile_Chopper_Huron_Black",
										"Exile_Chopper_Hellcat_Green",
										"Exile_Chopper_Taru_Transport_Black"
									];

ZCP_VehicleReward = ZCP_DMS_TransportTrucks;
ZCP_DMS_DEBUG = false;


if(ZCP_dev) then {
	ZCP_CapTime = 20;
	ZCP_CapRadius = 60;
	ZCP_MinWaitTime = 10;
	ZCP_MaxWaitTime = 1;
	ZCP_BaseCleanupDelay = 1;
};

/* Do not change this*/
ZCP_Version = "ZCP_Exile_1.0";
ZCP_Data = [];
ZCP_Bases = [];
ZCP_MissionCounter = 0;
ZCP_DMS_MagRange = DMS_MaximumMagCount - DMS_MinimumMagCount;