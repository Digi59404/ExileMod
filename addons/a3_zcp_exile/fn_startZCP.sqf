/*
	Zupa's Capture Points
	Initiates the cap actions.
	Capture points and earn money.

	╔════╗─────────╔═══╗────────╔╗─────────────╔╗
	╚══╗═║─────────╚╗╔╗║────────║║────────────╔╝╚╗
	──╔╝╔╬╗╔╦══╦══╗─║║║╠══╦╗╔╦══╣║╔══╦╗╔╦══╦═╗╚╗╔╬══╗
	─╔╝╔╝║║║║╔╗║╔╗║─║║║║║═╣╚╝║║═╣║║╔╗║╚╝║║═╣╔╗╗║║║══╣
	╔╝═╚═╣╚╝║╚╝║╔╗║╔╝╚╝║║═╬╗╔╣║═╣╚╣╚╝║║║║║═╣║║║║╚╬══║
	╚════╩══╣╔═╩╝╚╝╚═══╩══╝╚╝╚══╩═╩══╩╩╩╩══╩╝╚╝╚═╩══╝
	────────║║
	────────╚╝
*/


if !(isServer) exitWith
{
	for "_i" from 0 to 99 do
	{
		diag_log "Not a fucking server CUNT";
	};
};

diag_log text format ["[ZCP]: Giving server some time to boot."];

/*
// This code is NECESSARY for spawning persistent vehicles. DO NOT REMOVE THIS CODE UNLESS YOU KNOW WHAT YOU ARE DOING
if !("isKnownAccount:DMS_PersistentVehicle" call ExileServer_system_database_query_selectSingleField) then
{
	"createAccount:DMS_PersistentVehicle:DMS_PersistentVehicle" call ExileServer_system_database_query_fireAndForget;
};
*/

ZCP_MapCenterPos =  [8500,8500];
ZCP_MapRadius = 8500;

// Some custom maps don't have the proper safePos config entries.
// If you are using one and you have an issue with mission spawns, please create an issue on GitHub or post a comment in the DMS thread.
switch (toLower worldName) do
{
	case "altis":										// [16000,16000] w/ radius of 16000 works well for Altis
	{
		ZCP_MapCenterPos 	= [16000,16000];
		ZCP_MapRadius 		= 16000;
	};
	case "bornholm":									// Thanks to thirdhero for testing this info
	{
		ZCP_MapCenterPos 	= [11265,11265];
		ZCP_MapRadius 		= 12000;
	};
	case "esseker":										// Thanks to Flowrider for this info
	{
		ZCP_MapCenterPos 	= [6275,6350];
		ZCP_MapRadius 		= 5000;
	};
	case "taviana";										// Thanks to JamieKG for this info
	case "tavi":
	{
		ZCP_MapCenterPos 	= [12800,12800];
		ZCP_MapRadius 		= 12800;
	};
	default 											// Use "worldSize" to determine map center/radius (not always very nice).
	{
		private "_middle";
		_middle = worldSize/2;
		ZCP_MapCenterPos 	= [_middle,_middle];
		ZCP_MapRadius 		= _middle;
	};
};

// Since we use primarily ATL
ZCP_MapCenterPos set [2,0];

diag_log text format ["[ZCP]: Initiate Zupa's Capture Points"];
call ZCP_fnc_config;
call ZCP_fnc_initCPData;
[] spawn ZCP_fnc_missionLooper;
diag_log text format ["[ZCP]: Capture Points is fully running."];
