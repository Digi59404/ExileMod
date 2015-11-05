/*
	A lot of these configs are influenced by WAI :P
	https://github.com/nerdalertdk/WICKED-AI

	Created by eraser1
*/


// Enables debug logging in DMS functions. This will also make missions spawn and timeout more quickly (for testing purposes).
// Disable this on live servers, unless you know what you're doing.
DMS_DEBUG = false;



DMS_Use_Map_Config = true;	// Whether or not to use config overwrites specific to the map.
/*
	If you are using a map other than Altis, Bornholm, Esseker, or Tavi (Taviana) you should set this to false OR create a new file within the map_configs folder for the map so that you don't get a missing file error.
	To share your map-specific config, please create a merge request on GitHub and/or leave a message on the DMS thread in the Exile forums.
	For any questions regarding map-specific configs, please leave a reply in the DMS thread on the Exile forums.
*/


/* Mission System Settings */
	/*General settings for dynamic missions*/
	DMS_DynamicMission					= true;						// Enable/disable dynamic mission system.
	DMS_MaxBanditMissions				= 3;						// Maximum number of Bandit Missions running at the same time
	DMS_TimeToFirstMission				= [180,420];				// [Minimum,Maximum] time between first mission spawn. | DEFAULT: 3-7 minutes.
	DMS_TimeBetweenMissions				= [600,900];				// [Minimum,Maximum] time between missions (if mission limit is not reached) | DEFAULT: 10-15 mins
	DMS_MissionTimeOut					= [900,1800]; 				// [Minimum,Maximum] time it will take for a mission to timeout | DEFAULT: 15-30 mins
	DMS_MissionTimeoutResetRange		= 1000;						// If a player is this close to a mission then it won't time-out. Set to 0 to disable this check.
	/*General settings for dynamic missions*/

	/*General settings for static missions*/
	DMS_StaticMission					= true;						// Enable/disable static mission system.
	DMS_MaxStaticMissions				= 1;						// Maximum number of Static Missions running at the same time. It's recommended you set this to the same amount of static missions that you have in total.
	DMS_TimeToFirstStaticMission		= [180,420];				// [Minimum,Maximum] time between first static mission spawn. | DEFAULT: 3-7 minutes.
	DMS_TimeBetweenStaticMissions		= [900,1800];				// [Minimum,Maximum] time between static missions (if static mission limit is not reached) | DEFAULT: 15-30 mins
	DMS_StaticMissionTimeOut			= [1800,3600]; 				// [Minimum,Maximum] time it will take for a static mission to timeout | DEFAULT: 30-60 mins
	DMS_StaticMissionTimeoutResetRange	= 1500;						// If a player is this close to a mission then it won't time-out. Set to 0 to disable this check.
	DMS_StaticMinPlayerDistance			= 1500;						// If a player is this close to a mission location, then it won't spawn the mission and will wait 60 seconds before attempting to spawn it.
	/*General settings for static missions*/

	DMS_playerNearRadius				= 100;						// How close a player has to be to a mission in order to satisfy the "playerNear" mission requirement (can be customized per mission).

	DMS_AI_KillPercent					= 100;						// The percent amount of AI that need to be killed for "killPercent" mission requirement (NOT IMPLEMENTED)

	/*Mission Marker settings*/
	DMS_ShowDifficultyColorLegend		= true;						// Whether or not to show a "color legend" at the bottom left of the map that shows which color corresponds to which difficulty. I know it's not very pretty, meh.
	DMS_MarkerText_ShowMissionPrefix	= true;						// Whether or not to place a prefix before the mission marker text. Enable this if your players get confused by the marker names :P
	DMS_MarkerText_MissionPrefix		= "Mission:";				// The text displayed before the mission name in the mission marker.
	DMS_MarkerText_ShowAICount			= true;						// Whether or not to display the number of remaining AI in the marker name.
	DMS_MarkerText_AIName				= "Units";					// What the AI will be called in the map marker. For example, the marker text can show: "Car Dealer (3 Units remaining)"
	DMS_MarkerPosRandomization			= false;					// Randomize the position of the circle marker of a mission
	DMS_MarkerPosRandomRadius			= [25,100];					// Minimum/Maximum distance that the circle marker position will be randomized | DEFAULT: 0 meters to 200 meters
	DMS_RandomMarkerBrush				= "Cross";					// See: https://community.bistudio.com/wiki/setMarkerBrush
	DMS_MissionMarkerWinDot				= true;						// Keep the mission marker dot with a "win" message after mission is over
	DMS_MissionMarkerLoseDot			= true;						// Keep the mission marker dot with a "lose" message after mission is over
	DMS_MissionMarkerWinDotTime			= 30;						// How many seconds the "win" mission dot will remain on the map
	DMS_MissionMarkerLoseDotTime		= 30;						// How many seconds the "lose" mission dot will remain on the map
	DMS_MissionMarkerWinDotColor		= "ColorBlue";				// The color of the "win" marker dot
	DMS_MissionMarkerLoseDotColor		= "ColorRed";				// The color of the "lose" marker dot
	/*Mission Marker settings*/

	/*Mission Cleanup settings*/
	DMS_CompletedMissionCleanup			= true;						// Cleanup mission-spawned buildings and AI bodies after some time
	DMS_CompletedMissionCleanupTime		= 3600;						// Minimum time until mission-spawned buildings and AI are cleaned up
	DMS_CleanUp_PlayerNearLimit			= 20;						// Cleanup of an object is aborted if a player is this many meters close to the object
	DMS_AIVehCleanUpTime				= 900;						// Time until a destroyed AI vehicle is cleaned up.
	/*Mission Cleanup settings*/

	/*Mission spawn location settings*/
	DMS_UsePredefinedMissionLocations	= false;					// Whether or not to use a list of pre-defined mission locations instead before attempting to find a random (valid) position. The positions will still be checked for validity. If none of the provided positions are valid, a random one will be generated.
	DMS_PredefinedMissionLocations = 	[							// List of Preset/Predefined mission locations.

										];
	DMS_ThrottleBlacklists				= true;						// Whether or not to "throttle" the blacklist distance parameters in DMS_fnc_FindSafePos. This will reduce the values of the minimum
																		//distances for some of the below parameters if several attempts have been made, but a suitable position was not yet found. This
																		//should help with server performance drops when spawning a mission, as DMS_fnc_findSafePos is the most resource-intensive function.
	DMS_AttemptsUntilThrottle			= 15;						// How many attempts until the parameters are throttled.
	DMS_ThrottleCoefficient				= 0.9;						// How much the parameters are throttled. The parameters are multiplied by the coefficient, so 0.9 means 90% of whatever the parameter was.
	DMS_MinThrottledDistance			= 100;						// The minimum distance to which it will throttle. If the throttled value is less than this, then this value is used instead.
	DMS_PlayerNearBlacklist				= 2000;						// Missions won't spawn in a position this many meters close to a player
	DMS_SpawnZoneNearBlacklist			= 2500;						// Missions won't spawn in a position this many meters close to a spawn zone
	DMS_TraderZoneNearBlacklist			= 2500;						// Missions won't spawn in a position this many meters close to a trader zone
	DMS_MissionNearBlacklist			= 2500;						// Missions won't spawn in a position this many meters close to another mission
	DMS_WaterNearBlacklist				= 500;						// Missions won't spawn in a position this many meters close to water
	DMS_TerritoryNearBlacklist			= 100;						// Missions won't spawn in a position this many meters close to a territory flag
	DMS_MinSurfaceNormal				= 0.9;						// Missions won't spawn in a position where its surfaceNormal is less than this amount. The lower the value, the steeper the location. Greater values means flatter locations. Values can range from 0-1, with 0 being sideways, and 1 being perfectly flat. For reference: SurfaceNormal of about 0.7 is when you are forced to walk up a surface. If you want to convert surfaceNormal to degrees, use the arc-cosine of the surfaceNormal. 0.9 is about 25 degrees. Google "(arccos 0.9) in degrees"
	DMS_MinDistFromWestBorder			= 250;						// Missions won't spawn in a position this many meters close to the western map border.
	DMS_MinDistFromEastBorder			= 250;						// Missions won't spawn in a position this many meters close to the easter map border.
	DMS_MinDistFromSouthBorder			= 250;						// Missions won't spawn in a position this many meters close to the southern map border.
	DMS_MinDistFromNorthBorder			= 250;						// Missions won't spawn in a position this many meters close to the northern map border.
	/*Mission spawn location settings*/

	DMS_MinWaterDepth					= 20;						// Minimum depth of water that an underwater mission can spawn at.

	/*Crate/Box settings*/
	DMS_HideBox							= false;					// "Hide" the box from being visible by players until the mission is completed.
	DMS_SpawnBoxSmoke					= true;						// Spawn a smoke grenade on mission box upon misson completion during daytime
	DMS_SpawnBoxIRGrenade				= true;						// Spawn an IR grenade on mission box upon misson completion during nighttime
	/*Crate/Box settings*/

	/*Mine settings*/
	DMS_SpawnMinefieldForEveryMission	= false;					// Whether or not to spawn a minefield for every dynamic mission.
	DMS_SpawnMinesAroundMissions		= true;						// Whether or not to spawn mines around AI missions that have them.
	DMS_despawnMines_onCompletion		= true;						// Despawn mines spawned around missions when the mission is completed
	DMS_MineInfo_easy					= [5,50];					// Mine info for "easy" missions. This will spawn 5 mines within a 50m radius.
	DMS_MineInfo_moderate				= [10,50];					// Mine info for "moderate" missions. This will spawn 10 mines within a 50m radius.
	DMS_MineInfo_difficult				= [15,75];					// Mine info for "difficult" missions. This will spawn 15 mines within a 75m radius.
	DMS_MineInfo_hardcore				= [25,100];					// Mine info for "hardcore" missions. This will spawn 25 mines within a 100m radius.
	DMS_SpawnMineWarningSigns			= true;						// Whether or not to spawn mine warning signs around a minefield.
	DMS_BulletProofMines				= true;						// Whether or not you want to make the mines bulletproof. Prevents players from being able to shoot the mines and creating explosions.
	/*Mine settings*/
	
	DMS_MinPlayerCount					= 0; 						// Minimum number of players until mission start
	DMS_MinServerFPS					= 5; 						// Minimum server FPS for missions to start

	/*Mission notification settings*/
	DMS_PlayerNotificationTypes =		[							// Notification types. Supported values are: ["dynamicTextRequest", "standardHintRequest", "systemChatRequest", "textTilesRequest"]
											//"dynamicTextRequest",			// You should use either "dynamicTextRequest" or "textTilesRequest", and I think "textTilesRequest" looks better.
											//"standardHintRequest",		// Hints are a bit wonky...
											"textTilesRequest",				// Keep in mind you can only have 1 "text tile" message up at a time, so the message will disappear if the player gets a kill or something while the message is shown.
											"systemChatRequest"				// Always nice to show in chat so that players can scroll up to read the info if they need to.
										];

		/*Dynamic Text Notification Settings*/
	DMS_dynamicText_Duration			= 7;						// Number of seconds that the message will last on the screen.
	DMS_dynamicText_FadeTime			= 1.5;						// Number of seconds that the message will fade in/out (does not affect duration).
	DMS_dynamicText_Title_Size			= 1.2;						// Size for Client Dynamic Text mission titles.
	DMS_dynamicText_Title_Font			= "puristaMedium";			// Font for Client Dynamic Text mission titles.
	DMS_dynamicText_Message_Color		= "#FFFFFF";				// Dynamic Text color for "dynamicTextRequest" client notification type.
	DMS_dynamicText_Message_Size		= 0.65;						// Dynamic Text size for "dynamicTextRequest" client notification type.
	DMS_dynamicText_Message_Font		= "OrbitronMedium";			// Dynamic Text font for "dynamicTextRequest" client notification type.
		/*Dynamic Text Notification Settings*/

		/*Standard Hint Notification Settings*/
	DMS_standardHint_Title_Size			= 2.5;						// Size for Client Standard Hint mission titles.
	DMS_standardHint_Title_Font			= "puristaMedium";			// Font for Client Standard Hint mission titles.
	DMS_standardHint_Message_Color		= "#FFFFFF";				// Standard Hint color for "standardHintRequest" client notification type.
	DMS_standardHint_Message_Size		= 1;						// Standard Hint size for "standardHintRequest" client notification type.
	DMS_standardHint_Message_Font		= "OrbitronMedium";			// Standard Hint font for "standardHintRequest" client notification type.
		/*Standard Hint Notification Settings*/

		/*Text Tiles Notification Settings*/
	DMS_textTiles_Duration				= 7;						// Number of seconds that the message will last on the screen.
	DMS_textTiles_FadeTime				= 1.5;						// Number of seconds that the message will fade in/out (does not affect duration).
	DMS_textTiles_Title_Size			= 2.3;						// Size for Client Text Tiles mission titles.
	DMS_textTiles_Title_Font			= "puristaMedium";			// Font for Client Text Tiles mission titles.
	DMS_textTiles_Message_Color			= "#FFFFFF";				// Text Tiles color for "textTilesRequest" client notification type.
	DMS_textTiles_Message_Size			= 1.25;						// Text Tiles size for "textTilesRequest" client notification type.
	DMS_textTiles_Message_Font			= "OrbitronMedium";			// Text Tiles font for "textTilesRequest" client notification type.
		/*Text Tiles Notification Settings*/

	/*Mission notification settings*/

	DMS_BanditMissionTypes =			[							//	List of missions with spawn chances. If they add up to 100%, they represent the percentage chance each one will spawn
											["blackhawkdown",7],
											["donthasslethehoff",6],
											["bandits",5],
											["bauhaus",5],
											["cardealer",5],
											["humanitarian",5],
											["foodtransport",5],
											["construction",4],
											["walmart",4],
											["mercenaries",4],
											["guntransport",4],
											["beertransport",3],
											["roguenavyseals",3],
											["thieves",2],
											["lost_battalion",2],
											["behindenemylines",2],
											["mercbase",1]
										];
	

	DMS_StaticMissionTypes =			[							// List of STATIC missions with spawn chances.
											
										];



	DMS_findSafePosBlacklist =			[							// For BIS_fnc_findSafePos position blacklist info refer to: https://community.bistudio.com/wiki/BIS_fnc_findSafePos 
											// An example is given in the altis_config.sqf (it blacklists the salt flats).
										];
/* Mission System Settings */


/* AI Settings */

	DMS_Show_Kill_Poptabs_Notification	= true;						// Whether or not to show the poptabs gained/lost message on the player's screen when killing an AI. (It will still change the player's money, it just won't show the "Money Received" notification)
	DMS_Show_Kill_Respect_Notification	= true;						// Whether or not to show the "Frag Message" on the player's screen when killing an AI. (It will still change the player's respect, it just won't show the "AI Killed" frag message)

	DMS_Bandit_Soldier_MoneyGain		= 50;						// The amount of Poptabs gained for killing a bandit soldier
	DMS_Bandit_Soldier_RepGain			= 10;						// The amount of Respect gained for killing a bandit soldier
	DMS_Bandit_Static_MoneyGain			= 75;						// The amount of Poptabs gained for killing a bandit static gunner
	DMS_Bandit_Static_RepGain			= 15;						// The amount of Respect gained for killing a bandit static gunner
	DMS_Bandit_Vehicle_MoneyGain		= 100;						// The amount of Poptabs gained for killing a bandit vehicle crew member
	DMS_Bandit_Vehicle_RepGain			= 25;						// The amount of Respect gained for killing a bandit vehicle crew member

	DMS_Diff_RepOrTabs_on_roadkill 		= true;						// Whether or not you want to use different values for giving respect/poptabs when you run an AI over. Default values are NEGATIVE. This means player will LOSE respect or poptabs.
	DMS_Bandit_Soldier_RoadkillMoney	= -10;						// The amount of Poptabs gained/lost for running over a bandit soldier
	DMS_Bandit_Soldier_RoadkillRep		= -5;						// The amount of Respect gained/lost for running over a bandit soldier
	DMS_Bandit_Static_RoadkillMoney		= -10;						// The amount of Poptabs gained/lost for running over a bandit static gunner
	DMS_Bandit_Static_RoadkillRep		= -5;						// The amount of Respect gained/lost for running over a bandit static gunner
	DMS_Bandit_Vehicle_RoadkillMoney	= -10;						// The amount of Poptabs gained/lost for running over a bandit vehicle crew member
	DMS_Bandit_Vehicle_RoadkillRep		= -5;						// The amount of Respect gained/lost for running over a bandit vehicle crew member

	DMS_banditSide						= EAST;						// The side (team) that AI Bandits will spawn on
	DMS_clear_AI_body					= false;					// Clear AI body as soon as they die
	DMS_clear_AI_body_chance			= 50;						// Percentage chance that AI bodies will be cleared when they die
	DMS_ai_disable_ramming_damage 		= true;						// Disables damage due to ramming into AI. !!!NOTE: THIS WILL NOT BE RELIABLE WITH "DMS_ai_offload_to_client"!!!
	DMS_remove_roadkill					= true; 					// Remove gear from AI bodies that are roadkilled
	DMS_remove_roadkill_chance			= 50;						// Percentage chance that roadkilled AI bodies will be deleted
	DMS_explode_onRoadkill				= true;						// Whether or not to spawn an explosion when an AI gets run over. It will likely take out the 2 front wheels. Should help mitigate the ineffective AI vs. striders issue ;)
	DMS_RemoveNVG						= false;					// Remove NVGs from AI bodies

	DMS_MaxAIDistance					= 500;						// The maximum distance an AI unit can be from a mission before he is killed. Helps with AI running away and forcing the mission to keep running. Set to 0 if you don't want it.
	DMS_AIDistanceCheckFrequency		= 60;						// How often to check within DMS_fnc_TargetsKilled whether or not the AI is out of the maximum radius. Lower values increase frequency and increase server load, greater values decrease frequency and may cause longer delays for "runaway" AI.

	DMS_ai_offload_to_client			= true;						// Offload spawned AI groups to random clients. Helps with server performance.
	DMS_ai_offload_Only_DMS_AI			= false;					// Do you use other mission systems on your server but still want to offload AI? You should probably enable this then, unless you have tested it for compatibility.

	DMS_ai_share_info					= true;						// Share info about killer
	DMS_ai_share_info_distance			= 300;						// The distance killer's info will be shared to other AI

	DMS_ai_nighttime_accessory_chance	= 75;						// Percentage chance that AI will have a flashlight or laser pointer on their guns if spawned during nighttime
	DMS_ai_enable_water_equipment		= true;						// Enable/disable overriding default weapons of an AI if it spawns on/in water

	// https://community.bistudio.com/wiki/AI_Sub-skills#general
	DMS_ai_skill_static					= [["aimingAccuracy",0.20],["aimingShake",0.70],["aimingSpeed",0.75],["spotDistance",0.70],["spotTime",0.50],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];	// Static AI Skills
	DMS_ai_skill_easy					= [["aimingAccuracy",0.30],["aimingShake",0.50],["aimingSpeed",0.50],["spotDistance",0.50],["spotTime",0.50],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",0.50]];	// Easy
	DMS_ai_skill_moderate				= [["aimingAccuracy",0.60],["aimingShake",0.60],["aimingSpeed",0.60],["spotDistance",0.60],["spotTime",0.60],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",0.60]];	// Moderate
	DMS_ai_skill_difficult				= [["aimingAccuracy",0.70],["aimingShake",0.70],["aimingSpeed",0.70],["spotDistance",0.70],["spotTime",0.80],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",0.70]]; 	// Difficult
	DMS_ai_skill_hardcore				= [["aimingAccuracy",1.00],["aimingShake",1.00],["aimingSpeed",1.00],["spotDistance",1.00],["spotTime",1.00],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]]; 	// Hardcore
	DMS_ai_skill_random					= ["hardcore","difficult","difficult","difficult","moderate","moderate","moderate","moderate","easy","easy"];	// Skill frequencies for "random" AI skills | Default: 10% hardcore, 30% difficult, 40% moderate, and 20% easy
	DMS_AI_WP_Radius_easy				= 20;						// Waypoint radius for "easy" AI
	DMS_AI_WP_Radius_moderate			= 30;						// Waypoint radius for "moderate" AI
	DMS_AI_WP_Radius_difficult			= 50;						// Waypoint radius for "difficult" AI
	DMS_AI_WP_Radius_hardcore			= 75;						// Waypoint radius for "hardcore" AI
	DMS_AI_WP_Radius_base				= 5;						// Waypoint radius for AI in bases

	DMS_static_weapons =				[							// Static weapons for AI
											"O_HMG_01_high_F"
										];

	DMS_ai_default_items =				[							// Toolbelt items each AI will spawn with
											"ItemWatch",
											"ItemMap",
											"ItemCompass",
											"ItemRadio"
										];
	
	DMS_ai_BipodList =					[
											"bipod_01_F_blk",
											"bipod_01_F_mtp",
											"bipod_01_F_snd",
											"bipod_02_F_blk",
											"bipod_02_F_hex",
											"bipod_02_F_tan",
											"bipod_03_F_blk",
											"bipod_03_F_oli"
										];

	//Assault Class
	DMS_assault_weps =					[							// Assault Rifles
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
											"rhs_weap_m16a4",
											"rhs_weap_m16a4_carryhandle",
											"rhs_weap_m16a4_carryhandle_grip",
											"rhs_weap_m16a4_carryhandle_grip_pmag",
											"rhs_weap_m16a4_carryhandle_M203",
											"rhs_weap_m16a4_carryhandle_pmag",
											"rhs_weap_m16a4_grip",
											"rhs_weap_m4",
											"rhs_weap_m4_grip2",
											"rhs_weap_m4_carryhandle",
											"rhs_weap_m4_carryhandle_pmag",
											"rhs_weap_m4_grip",
											"rhs_weap_m4_m203",
											"rhs_weap_m4_m320",
											"rhs_weap_m4a1_carryhandle",
											"rhs_weap_m4a1_carryhandle_grip2",
											"rhs_weap_m4a1_carryhandle_pmag",
											"rhs_weap_m4a1_carryhandle_m203",
											"rhs_weap_m4a1",
											"rhs_weap_m4a1_grip2",
											"rhs_weap_m4a1_grip",
											"rhs_weap_m4a1_m203",
											"rhs_weap_m4a1_m320",
											"rhs_weap_m4a1_blockII",
											"rhs_weap_m4a1_blockII_KAC",
											"rhs_weap_m4a1_blockII_grip2",
											"rhs_weap_m4a1_blockII_grip2_KAC",
											"rhs_weap_m4a1_blockII_M203",
											"rhs_weap_mk18",
											"rhs_weap_mk18_KAC",
											"rhs_weap_mk18_grip2",
											"rhs_weap_mk18_grip2_KAC",
											"rhs_weap_mk18_m320",
											"rhs_weap_ak103",
											"rhs_weap_ak103_npz",
											"rhs_weap_ak103_1",
											"rhs_weap_ak74m",
											"rhs_weap_ak74m_2mag",
											"rhs_weap_ak74m_2mag_camo",
											"rhs_weap_ak74m_2mag_npz",
											"rhs_weap_ak74m_camo",
											"rhs_weap_ak74m_desert",
											"rhs_weap_ak74m_desert_npz",
											"rhs_weap_ak74m_desert_folded",
											"rhs_weap_ak74m_plummag_folded",
											"rhs_weap_ak74m_folded",
											"rhs_weap_ak74m_camo_folded",
											"rhs_weap_ak74m_gp25",
											"rhs_weap_ak74m_gp25_npz",
											"rhs_weap_ak74m_npz",
											"rhs_weap_ak74m_plummag",
											"rhs_weap_ak74m_plummag_npz",
											"rhs_weap_akm",
											"rhs_weap_akm_gp25",
											"rhs_weap_akms",
											"rhs_weap_akms_gp25"
										];
	DMS_assault_pistols =				[							// Pistols for Assault Class (Set to empty array if you don't want to give them any pistols)
											"hgun_ACPC2_F",
											"hgun_Rook40_F",
											"hgun_P07_F",
											"hgun_Pistol_heavy_01_F",
											"hgun_Pistol_heavy_02_F",
											"rhs_weap_pya",
											"rhs_weap_makarov_pmm",
											"rhsusf_weap_m1911a1"
										];
	DMS_assault_optics =				[							// Optics for Assault Class
											"optic_Arco",
											"optic_Hamr",
											"optic_Aco",
											"optic_Holosight",
											"optic_MRCO",
											"optic_DMS",
											"rhsusf_acc_eotech_552",
											"rhsusf_acc_LEUPOLDMK4",
											"rhsusf_acc_ELCAN",
											"rhsusf_acc_ELCAN_pip",
											"rhsusf_acc_ACOG",
											"rhsusf_acc_ACOG_pip",
											"rhs_acc_1pn93_2",
											"rhsusf_acc_ACOG2",
											"rhsusf_acc_ACOG_USMC",
											"rhsusf_acc_ACOG2_USMC",
											"rhsusf_acc_ACOG3_USMC",
											"rhsusf_acc_LEUPOLDMK4_2",
											"rhsusf_acc_EOTECH",
											"rhs_acc_1p29",
											"rhs_acc_1p78",
											"rhs_acc_pkas",
											"rhs_acc_1p63",
											"rhs_acc_ekp1",
											"rhs_acc_pso1m2",
											"rhs_acc_pgo7v",
											"rhs_acc_1pn93_1"
										];
	DMS_assault_optic_chance			= 75;						// Percentage chance that an Assault Class AI will get an optic
	DMS_assault_bipod_chance			= 25;						// Percentage chance that an Assault Class AI will get a bipod
	DMS_assault_suppressor_chance		= 25;						// Percentage chance that an Assault Class AI will get a suppressor

	DMS_assault_items =					[							// Items for Assault Class AI (Loot stuff that goes in uniform/vest/backpack)
											"Exile_Item_InstaDoc",
											"Exile_Item_BBQSandwich",
											"Exile_Item_Energydrink"
										];
	DMS_assault_equipment =				[							// Equipment for Assault Class AI (stuff that goes in toolbelt slots)
											"ItemGPS"
										];
	DMS_assault_helmets	=				[							// Helmets for Assault Class
											"H_HelmetSpecB_paint1",
											"H_HelmetIA_camo",
											"H_HelmetLeaderO_ocamo",
											"H_HelmetLeaderO_oucamo",
											"TRYK_H_Helmet_Winter",
											"TRYK_H_Helmet_Snow",
											"TRYK_H_Helmet_Winter_2"
										];
	DMS_assault_clothes	=				[							// Uniforms for Assault Class
											"U_O_CombatUniform_ocamo",
											"U_O_PilotCoveralls",
											"U_B_Wetsuit",
											"U_BG_Guerilla3_1",
											"U_BG_Guerilla2_3",
											"U_BG_Guerilla2_2",
											"U_BG_Guerilla1_1",
											"U_BG_Guerrilla_6_1",
											"U_IG_Guerilla3_2",
											"U_B_SpecopsUniform_sgg",
											"U_I_OfficerUniform",
											"U_B_CTRG_3",
											"U_I_G_resistanceLeader_F",
											"TRYK_HRP_UCP",
											"TRYK_HRP_USMC",
											"TRYK_HRP_khk",
											"TRYK_U_B_OD_OD_CombatUniform",
											"TRYK_U_B_OD_OD_R_CombatUniform",
											"TRYK_U_B_TANTAN_CombatUniform",
											"TRYK_U_B_TANTAN_R_CombatUniform",
											"TRYK_U_B_BLKBLK_CombatUniform",
											"TRYK_U_B_BLKBLK_R_CombatUniform",
											"TRYK_U_B_GRYOCP_CombatUniform",
											"TRYK_U_B_GRYOCP_R_CombatUniformTshirt",
											"TRYK_U_B_TANOCP_CombatUniform",
											"TRYK_U_B_TANOCP_R_CombatUniformTshirt",
											"TRYK_U_B_BLKOCP_CombatUniform",
											"TRYK_U_B_BLKOCP_R_CombatUniformTshirt",
											"TRYK_U_B_BLKTAN_CombatUniform",
											"TRYK_U_B_BLKTANR_CombatUniformTshirt",
											"TRYK_U_B_ODTAN_CombatUniform",
											"TRYK_U_B_ODTANR_CombatUniformTshirt",
											"TRYK_U_B_GRTAN_CombatUniform",
											"TRYK_U_B_GRTANR_CombatUniformTshirt",
											"TRYK_U_B_wood_CombatUniform",
											"TRYK_U_B_woodR_CombatUniformTshirt",
											"TRYK_U_B_wood3c_CombatUniform",
											"TRYK_U_B_wood3c_CombatUniformTshirt",
											"TRYK_U_B_MARPAT_WOOD_CombatUniform",
											"TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt",
											"TRYK_U_B_WOOD_MARPAT_CombatUniform",
											"TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt",
											"TRYK_U_B_woodtan_CombatUniform",
											"TRYK_U_B_woodtanR_CombatUniformTshirt",
											"TRYK_U_B_JSDF_CombatUniform",
											"TRYK_U_B_JSDF_CombatUniformTshirt",
											"TRYK_U_B_3CD_Delta_BDU",
											"TRYK_U_B_3CD_Delta_BDUTshirt",
											"TRYK_U_B_3CD_Ranger_BDU",
											"TRYK_U_B_3CD_Ranger_BDUTshirt",
											"TRYK_U_B_3CD_BLK_BDUTshirt",
											"TRYK_U_B_3CD_BLK_BDUTshirt2",
											"TRYK_U_B_ACU",
											"TRYK_U_B_ACUTshirt",
											"TRYK_U_B_MARPAT_Wood",
											"TRYK_U_B_MARPAT_Wood_Tshirt",
											"TRYK_U_B_MARPAT_Desert",
											"TRYK_U_B_MARPAT_Desert_Tshirt",
											"TRYK_U_B_MARPAT_Desert2",
											"TRYK_U_B_MARPAT_Desert2_Tshirt",
											"TRYK_U_B_3c",
											"TRYK_U_B_3cr",
											"TRYK_U_B_Sage_Tshirt",
											"TRYK_U_B_BLK3CD",
											"TRYK_U_B_BLK3CD_Tshirt",
											"TRYK_U_B_BLK",
											"TRYK_U_B_BLK_Tshirt",
											"TRYK_U_B_BLKTAN",
											"TRYK_U_B_BLKTAN_Tshirt",
											"TRYK_U_B_ODTAN",
											"TRYK_U_B_ODTAN_Tshirt",
											"TRYK_U_B_BLK_OD",
											"TRYK_U_B_BLK_OD_Tshirt",
											"TRYK_U_B_C01_Tsirt",
											"TRYK_U_B_C02_Tsirt",
											"TRYK_U_B_OD_BLK",
											"TRYK_U_B_OD_BLK_2",
											"TRYK_U_B_BLK_TAN_1",
											"TRYK_U_B_BLK_TAN_2",
											"TRYK_U_B_wh_tan_Rollup_CombatUniform",
											"TRYK_U_B_wh_OD_Rollup_CombatUniform",
											"TRYK_U_B_wh_blk_Rollup_CombatUniform",
											"TRYK_U_B_BLK_tan_Rollup_CombatUniform",
											"TRYK_U_B_BLK_OD_Rollup_CombatUniform",
											"TRYK_U_B_NATO_UCP_GRY_CombatUniform",
											"TRYK_U_B_NATO_UCP_GRY_R_CombatUniform",
											"TRYK_U_B_NATO_UCP_CombatUniform",
											"TRYK_U_B_NATO_UCP_R_CombatUniform",
											"TRYK_U_B_NATO_OCP_c_BLK_CombatUniform",
											"TRYK_U_B_NATO_OCP_BLK_c_R_CombatUniform",
											"TRYK_U_B_NATO_OCP_BLK_CombatUniform",
											"TRYK_U_B_NATO_OCP_BLK_R_CombatUniform",
											"TRYK_U_B_NATO_OCPD_CombatUniform",
											"TRYK_U_B_NATO_OCPD_R_CombatUniform",
											"TRYK_U_B_NATO_OCP_CombatUniform",
											"TRYK_U_B_NATO_OCP_R_CombatUniform",
											"TRYK_U_B_AOR1_Rollup_CombatUniform",
											"TRYK_U_B_AOR2_Rollup_CombatUniform",
											"TRYK_U_B_MTP_CombatUniform",
											"TRYK_U_B_MTP_R_CombatUniform",
											"TRYK_U_B_MTP_BLK_CombatUniform",
											"TRYK_U_B_MTP_BLK_R_CombatUniform",
											"TRYK_U_B_Woodland",
											"TRYK_U_B_Woodland_Tshirt",
											"TRYK_U_B_WDL_GRY_CombatUniform",
											"TRYK_U_B_WDL_GRY_R_CombatUniform",
											"TRYK_U_B_ARO1_GR_CombatUniform",
											"TRYK_U_B_ARO1_GR_R_CombatUniform",
											"TRYK_U_B_ARO1_GRY_CombatUniform",
											"TRYK_U_B_ARO1_GRY_R_CombatUniform",
											"TRYK_U_B_ARO1_CombatUniform",
											"TRYK_U_B_ARO1R_CombatUniform",
											"TRYK_U_B_ARO1_BLK_CombatUniform",
											"TRYK_U_B_ARO1_BLK_R_CombatUniform",
											"TRYK_U_B_ARO1_CBR_CombatUniform",
											"TRYK_U_B_ARO1_CBR_R_CombatUniform",
											"TRYK_U_B_ARO2_CombatUniform",
											"TRYK_U_B_ARO2R_CombatUniform",
											"TRYK_U_B_AOR2_BLK_CombatUniform",
											"TRYK_U_B_AOR2_BLK_R_CombatUniform",
											"TRYK_U_B_AOR2_OD_CombatUniform",
											"TRYK_U_B_AOR2_OD_R_CombatUniform",
											"TRYK_U_B_AOR2_GRY_CombatUniform",
											"TRYK_U_B_AOR2_GRY_R_CombatUniform",
											"TRYK_U_B_Snow_CombatUniform",
											"TRYK_U_B_Snowt",
											"TRYK_U_B_Denim_T_WH",
											"TRYK_U_B_Denim_T_BK",
											"TRYK_U_B_BLK_T_WH",
											"TRYK_U_B_BLK_T_BK",
											"TRYK_U_B_RED_T_BR",
											"TRYK_U_B_Denim_T_BG_WH",
											"TRYK_U_B_Denim_T_BG_BK",
											"TRYK_U_B_BLK_T_BG_WH",
											"TRYK_U_B_BLK_T_BG_BK",
											"TRYK_U_B_RED_T_BG_BR",
											"TRYK_U_B_fleece",
											"TRYK_U_B_fleece_UCP",
											"TRYK_U_B_UCP_PCUs",
											"TRYK_U_B_GRY_PCUs",
											"TRYK_U_B_Wood_PCUs",
											"TRYK_U_B_PCUs",
											"TRYK_U_B_UCP_PCUs_R",
											"TRYK_U_B_GRY_PCUs_R",
											"TRYK_U_B_Wood_PCUs_R",
											"TRYK_U_B_PCUs_R",
											"TRYK_U_B_PCUGs",
											"TRYK_U_B_PCUODs",
											"TRYK_U_B_PCUGs_gry",
											"TRYK_U_B_PCUGs_BLK",
											"TRYK_U_B_PCUGs_OD",
											"TRYK_U_B_PCUGs_gry_R",
											"TRYK_U_B_PCUGs_BLK_R",
											"TRYK_U_B_PCUGs_OD_R",
											"TRYK_U_Bts_GRYGRY_PCUs",
											"TRYK_U_Bts_UCP_PCUs",
											"TRYK_U_Bts_Wood_PCUs",
											"TRYK_U_Bts_PCUs",
											"TRYK_U_pad_j",
											"TRYK_U_pad_j_blk",
											"TRYK_U_pad_hood_Cl",
											"TRYK_U_pad_hood_Cl_blk",
											"TRYK_U_pad_hood_tan",
											"TRYK_U_pad_hood_Blk",
											"TRYK_U_pad_hood_CSATBlk",
											"TRYK_U_pad_hood_Blod",
											"TRYK_U_pad_hood_odBK",
											"TRYK_U_pad_hood_BKT2",
											"TRYK_hoodie_Blk",
											"TRYK_hoodie_FR",
											"TRYK_hoodie_Wood",
											"TRYK_hoodie_3c",
											"TRYK_T_camo_tan",
											"TRYK_T_camo_3c",
											"TRYK_T_camo_Wood",
											"TRYK_T_camo_wood_marpat",
											"TRYK_T_camo_Desert_marpat",
											"TRYK_T_camo_3c_BG",
											"TRYK_T_camo_Wood_BG",
											"TRYK_T_camo_wood_marpat_BG",
											"TRYK_T_camo_desert_marpat_BG",
											"TRYK_T_PAD",
											"TRYK_T_OD_PAD",
											"TRYK_T_TAN_PAD",
											"TRYK_T_BLK_PAD",
											"TRYK_T_T2_PAD",
											"TRYK_T_CSAT_PAD",
											"TRYK_U_nohoodPcu_gry",
											"TRYK_U_hood_nc",
											"TRYK_U_hood_mc",
											"TRYK_U_denim_hood_blk",
											"TRYK_U_denim_hood_mc",
											"TRYK_U_denim_hood_3c",
											"TRYK_U_denim_hood_nc",
											"TRYK_U_denim_jersey_blu",
											"TRYK_U_denim_jersey_blk",
											"TRYK_shirts_PAD",
											"TRYK_shirts_OD_PAD",
											"TRYK_shirts_TAN_PAD",
											"TRYK_shirts_BLK_PAD",
											"TRYK_shirts_PAD_BK",
											"TRYK_shirts_OD_PAD_BK",
											"TRYK_shirts_TAN_PAD_BK",
											"TRYK_shirts_BLK_PAD_BK",
											"TRYK_shirts_PAD_BLW",
											"TRYK_shirts_OD_PAD_BLW",
											"TRYK_shirts_TAN_PAD_BLW",
											"TRYK_shirts_BLK_PAD_BLW",
											"TRYK_shirts_PAD_YEL",
											"TRYK_shirts_OD_PAD_YEL",
											"TRYK_shirts_TAN_PAD_YEL",
											"TRYK_shirts_BLK_PAD_YEL",
											"TRYK_shirts_PAD_RED2",
											"TRYK_shirts_OD_PAD_RED2",
											"TRYK_shirts_TAN_PAD_RED2",
											"TRYK_shirts_BLK_PAD_RED2",
											"TRYK_shirts_PAD_BLU3",
											"TRYK_shirts_OD_PAD_BLU3",
											"TRYK_shirts_TAN_PAD_BLU3",
											"TRYK_shirts_BLK_PAD_BLU3",
											"TRYK_shirts_DENIM_R",
											"TRYK_shirts_DENIM_BL",
											"TRYK_shirts_DENIM_BK",
											"TRYK_shirts_DENIM_WH",
											"TRYK_shirts_DENIM_BWH",
											"TRYK_shirts_DENIM_RED2",
											"TRYK_shirts_DENIM_WHB",
											"TRYK_shirts_DENIM_ylb",
											"TRYK_shirts_DENIM_od",
											"TRYK_shirts_DENIM_R_Sleeve",
											"TRYK_shirts_DENIM_BL_Sleeve",
											"TRYK_shirts_DENIM_BK_Sleeve",
											"TRYK_shirts_DENIM_WH_Sleeve",
											"TRYK_shirts_DENIM_BWH_Sleeve",
											"TRYK_shirts_DENIM_RED2_Sleeve",
											"TRYK_shirts_DENIM_WHB_Sleeve",
											"TRYK_shirts_DENIM_ylb_Sleeve",
											"TRYK_shirts_DENIM_od_Sleeve",
											"TRYK_shirts_PAD_BL",
											"TRYK_shirts_OD_PAD_BL",
											"TRYK_shirts_TAN_PAD_BL",
											"TRYK_shirts_BLK_PAD_BL",
											"TRYK_U_taki_wh",
											"TRYK_U_taki_COY",
											"TRYK_U_taki_BL",
											"TRYK_U_taki_BLK",
											"TRYK_U_Bts_PCUGs",
											"TRYK_U_Bts_PCUODs",
											"TRYK_U_taki_G_WH",
											"TRYK_U_taki_G_COY",
											"TRYK_U_taki_G_BL",
											"TRYK_U_taki_G_BLK",
											"TRYK_U_B_PCUHs",
											"TRYK_U_B_PCUGHs",
											"TRYK_U_B_PCUODHs",
											"TRYK_B_USMC_R",
											"TRYK_B_USMC_R_ROLL",
											"TRYK_ZARATAKI",
											"TRYK_ZARATAKI2",
											"TRYK_ZARATAKI3",
											"TRYK_B_TRYK_UCP_T",
											"TRYK_B_TRYK_3C_T",
											"TRYK_B_TRYK_MTP_T",
											"TRYK_B_TRYK_OCP_T",
											"TRYK_B_TRYK_OCP_D_T",
											"TRYK_DMARPAT_T",
											"TRYK_C_AOR2_T",
											"TRYK_U_B_Sage_T",
											"TRYK_U_B_Wood_T",
											"TRYK_U_B_BLTAN_T",
											"TRYK_U_B_BLOD_T",
											"TRYK_OVERALL_flesh",
											"TRYK_OVERALL_nok_flesh",
											"TRYK_OVERALL_SAGE_BLKboots",
											"TRYK_OVERALL_SAGE_BLKboots_nk_blk",
											"TRYK_OVERALL_SAGE_BLKboots_nk",
											"TRYK_OVERALL_SAGE_BLKboots_nk_blk2",
											"TRYK_OVERALL_SAGE",
											"TRYK_SUITS_BLK_F",
											"TRYK_SUITS_BR_F",
											"TRYK_shoulder_armor_BK",
											"TRYK_shoulder_armor_OD",
											"TRYK_shoulder_armor_CY",
											"TRYK_U_B_PCUHsW",
											"TRYK_U_B_PCUHsW2",
											"TRYK_U_B_PCUHsW3",
											"TRYK_U_B_PCUHsW3nh",
											"TRYK_U_B_PCUHsW4",
											"TRYK_U_B_PCUHsW5",
											"TRYK_U_B_PCUHsW6"
										];
	DMS_assault_vests =					[							// Vests for Assault Class
											"V_PlateCarrierH_CTRG",
											"V_PlateCarrierSpec_rgr",
											"V_PlateCarrierGL_blk",
											"V_PlateCarrierGL_mtp",
											"V_PlateCarrierGL_rgr",
											"V_PlateCarrierSpec_blk",
											"V_PlateCarrierSpec_mtp",
											"V_PlateCarrierL_CTRG",
											"V_TacVest_blk_POLICE",
											"V_PlateCarrierIA2_dgtl",
											"TRYK_Hrp_vest_ucp",
											"TRYK_V_PlateCarrier_JSDF",
											"TRYK_V_ArmorVest_AOR1",
											"TRYK_V_ArmorVest_AOR2",
											"TRYK_V_ArmorVest_coyo",
											"TRYK_V_ArmorVest_Brown",
											"TRYK_V_ArmorVest_CBR",
											"TRYK_V_ArmorVest_khk",
											"TRYK_V_ArmorVest_rgr",
											"TRYK_V_ArmorVest_green",
											"TRYK_V_ArmorVest_tan",
											"TRYK_V_ArmorVest_Delta",
											"TRYK_V_ArmorVest_Ranger",
											"TRYK_V_ArmorVest_AOR1_2",
											"TRYK_V_ArmorVest_AOR2_2",
											"TRYK_V_ArmorVest_coyo2",
											"TRYK_V_ArmorVest_Brown2",
											"TRYK_V_ArmorVest_cbr2",
											"TRYK_V_ArmorVest_khk2",
											"TRYK_V_ArmorVest_rgr2",
											"TRYK_V_ArmorVest_green2",
											"TRYK_V_ArmorVest_tan2",
											"TRYK_V_ArmorVest_Delta2",
											"TRYK_V_ArmorVest_Ranger2",
											"TRYK_V_PlateCarrier_blk",
											"TRYK_V_PlateCarrier_coyo",
											"TRYK_V_PlateCarrier_wood",
											"TRYK_V_PlateCarrier_ACU",
											"TRYK_V_TacVest_coyo",
											"TRYK_V_harnes_blk_L",
											"TRYK_V_harnes_od_L",
											"TRYK_V_harnes_TAN_L",
											"TRYK_V_PlateCarrier_blk_L",
											"TRYK_V_PlateCarrier_wood_L",
											"TRYK_V_PlateCarrier_ACU_L",
											"TRYK_V_PlateCarrier_coyo_L",
											"TRYK_V_ChestRig_L",
											"TRYK_V_ChestRig",
											"TRYK_V_Bulletproof",
											"TRYK_V_Bulletproof_BLK",
											"TRYK_V_Bulletproof_BL",
											"TRYK_V_IOTV_BLK",
											"TRYK_V_tacv1M_BK",
											"TRYK_V_tacv1MLC_BK",
											"TRYK_V_tacv1",
											"TRYK_V_tacv1_CY",
											"TRYK_V_tacv1_BK",
											"TRYK_V_tacv1_P_BK",
											"TRYK_V_tacv1_SHERIFF_BK",
											"TRYK_V_tacv1_FBI_BK",
											"TRYK_V_tacv1LP_BK",
											"TRYK_V_tacv1LSRF_BK",
											"TRYK_V_tacv1LC_BK",
											"TRYK_V_tacv1LC_CY",
											"TRYK_V_tacv1LC_OD",
											"TRYK_V_tacv1LC_FBI_BK",
											"TRYK_V_tacv1LC_SRF_BK",
											"TRYK_V_tacv1LC_SRF_OD",
											"TRYK_V_tacv1LC_P_BK",
											"TRYK_V_PlateCarrier_POLICE",
											"TRYK_V_ArmorVest_HRT_B",
											"TRYK_V_ArmorVest_HRT_OD",
											"TRYK_V_ArmorVest_HRT2_B",
											"TRYK_V_ArmorVest_HRT2_OD",
											"TRYK_V_ArmorVest_Winter",
											"TRYK_V_Sheriff_BA_OD",
											"TRYK_V_tacv10_BK",
											"TRYK_V_tacv10_OD",
											"TRYK_V_tacv10_TN",
											"TRYK_V_tacv10LC_BK",
											"TRYK_V_tacv10LC_OD",
											"TRYK_V_tacv10LC_TN",
											"TRYK_V_tacv1L_BK",
											"TRYK_V_tacv1L_OD",
											"TRYK_V_tacv1L_CY",
											"TRYK_V_tacv1LC_FBI2_BK",
											"TRYK_V_tacv1LC_SRF2_BK",
											"TRYK_V_tacv1LC_SRF2_OD",
											"TRYK_V_tacv1LC_P2_BK",
											"TRYK_V_tacv1_MSL_BK",
											"TRYK_V_tacv1_MSL_NV",
											"TRYK_V_tacv1LMSL_BK",
											"TRYK_V_tacv1LMSL_NV",
											"TRYK_V_tacv1LC_MSL_BK",
											"TRYK_V_tacv1LC_MSL_NV",
											"TRYK_V_tacSVD_BK",
											"TRYK_V_tacSVD_OD"
										];
	DMS_assault_backpacks =				[							// Backpacks for Assault Class
											"B_Bergen_rgr",
											"B_Carryall_oli",
											"B_Kitbag_mcamo",
											"B_Carryall_cbr",
											"B_FieldPack_oucamo",
											"B_FieldPack_cbr",
											"B_Bergen_blk",
											"TRYK_B_AssaultPack_UCP",
											"TRYK_B_AssaultPack_Type2camo",
											"TRYK_B_AssaultPack_MARPAT_Desert",
											"TRYK_B_AssaultPack_MARPAT_Wood",
											"TRYK_B_Kitbag_Base",
											"TRYK_B_Kitbag_blk",
											"TRYK_B_Kitbag_aaf",
											"TRYK_B_Carryall_blk",
											"TRYK_B_Carryall_wh",
											"TRYK_B_Carryall_wood",
											"TRYK_B_Carryall_JSDF",
											"TRYK_B_Kitbag_Base_JSDF",
											"TRYK_B_Coyotebackpack",
											"TRYK_B_Coyotebackpack_OD",
											"TRYK_B_Coyotebackpack_BLK",
											"TRYK_B_Coyotebackpack_WH"
										];

	//Machine Gun Class
	DMS_MG_weps	=						[							// Machine Guns
											"LMG_Zafir_F",
											"LMG_Mk200_F",
											"arifle_MX_SW_Black_F",
											"MMG_01_hex_F",
											"rhs_weap_m249_pip_L",
											"rhs_weap_m249_pip_L_para",
											"rhs_weap_m249_pip_L_vfg",
											"rhs_weap_m249_pip_S",
											"rhs_weap_m249_pip_S_para",
											"rhs_weap_m249_pip_S_vfg",
											"rhs_weap_m240B",
											"rhs_weap_m240B_CAP",
											"rhs_weap_m240G",
											"rhs_weap_pkm",
											"rhs_weap_pkp"
										];
	DMS_MG_pistols =					[							// Pistols for MG Class (Set to empty array if you don't want to give them any pistols)
											"hgun_ACPC2_F",
											"hgun_Rook40_F",
											"hgun_P07_F",
											"hgun_Pistol_heavy_01_F",
											"hgun_Pistol_heavy_02_F",
											"rhs_weap_pya",
											"rhs_weap_makarov_pmm",
											"rhsusf_weap_m1911a1"
										];
	DMS_MG_optics =						[							//	Optics for MG Class
											"optic_Hamr",
											"optic_Aco",
											"optic_Holosight",
											"optic_MRCO",
											"rhsusf_acc_eotech_552",
											"rhsusf_acc_LEUPOLDMK4",
											"rhsusf_acc_ELCAN",
											"rhsusf_acc_ELCAN_pip",
											"rhsusf_acc_ACOG",
											"rhsusf_acc_ACOG_pip",
											"rhs_acc_1pn93_2",
											"rhsusf_acc_ACOG2",
											"rhsusf_acc_ACOG_USMC",
											"rhsusf_acc_ACOG2_USMC",
											"rhsusf_acc_ACOG3_USMC",
											"rhsusf_acc_LEUPOLDMK4_2",
											"rhsusf_acc_EOTECH",
											"rhs_acc_1p29",
											"rhs_acc_1p78",
											"rhs_acc_pkas",
											"rhs_acc_1p63",
											"rhs_acc_ekp1",
											"rhs_acc_pso1m2",
											"rhs_acc_pgo7v",
											"rhs_acc_1pn93_1"
										];
	DMS_MG_optic_chance					= 50;						// Percentage chance that an MG Class AI will get an optic
	DMS_MG_bipod_chance					= 90;						// Percentage chance that an MG Class AI will get a bipod
	DMS_MG_suppressor_chance			= 10;						// Percentage chance that an MG Class AI will get a suppressor

	DMS_MG_items =						[							// Items for MG Class AI (Loot stuff that goes in uniform/vest/backpack)
											"Exile_Item_InstaDoc",
											"Exile_Item_Catfood_Cooked",
											"Exile_Item_PlasticBottleFreshWater",
											"Exile_Item_CookingPot"
										];
	DMS_MG_equipment =					[							// Equipment for MG Class AI (stuff that goes in toolbelt slots)
											"Binocular"
										];
	DMS_MG_helmets =					[							// Helmets for MG Class
											"H_PilotHelmetHeli_I",
											"H_PilotHelmetHeli_O",
											"H_PilotHelmetFighter_I",
											"H_PilotHelmetFighter_O",
											"H_HelmetCrew_O",
											"H_CrewHelmetHeli_I",
											"H_HelmetSpecB_paint1",
											"H_HelmetIA_camo",
											"H_HelmetLeaderO_ocamo",
											"H_HelmetLeaderO_oucamo",
											"TRYK_H_Helmet_Winter",
											"TRYK_H_Helmet_Snow",
											"TRYK_H_Helmet_Winter_2"
										];
	DMS_MG_clothes =					[							// Uniforms for MG Class
											"U_O_CombatUniform_ocamo",
											"U_O_PilotCoveralls",
											"U_B_Wetsuit",
											"U_BG_Guerilla3_1",
											"U_BG_Guerilla2_3",
											"U_BG_Guerilla2_2",
											"U_BG_Guerilla1_1",
											"U_BG_Guerrilla_6_1",
											"U_IG_Guerilla3_2",
											"U_B_SpecopsUniform_sgg",
											"U_I_OfficerUniform",
											"U_B_CTRG_3",
											"U_I_G_resistanceLeader_F",
											"TRYK_HRP_UCP",
											"TRYK_HRP_USMC",
											"TRYK_HRP_khk",
											"TRYK_U_B_OD_OD_CombatUniform",
											"TRYK_U_B_OD_OD_R_CombatUniform",
											"TRYK_U_B_TANTAN_CombatUniform",
											"TRYK_U_B_TANTAN_R_CombatUniform",
											"TRYK_U_B_BLKBLK_CombatUniform",
											"TRYK_U_B_BLKBLK_R_CombatUniform",
											"TRYK_U_B_GRYOCP_CombatUniform",
											"TRYK_U_B_GRYOCP_R_CombatUniformTshirt",
											"TRYK_U_B_TANOCP_CombatUniform",
											"TRYK_U_B_TANOCP_R_CombatUniformTshirt",
											"TRYK_U_B_BLKOCP_CombatUniform",
											"TRYK_U_B_BLKOCP_R_CombatUniformTshirt",
											"TRYK_U_B_BLKTAN_CombatUniform",
											"TRYK_U_B_BLKTANR_CombatUniformTshirt",
											"TRYK_U_B_ODTAN_CombatUniform",
											"TRYK_U_B_ODTANR_CombatUniformTshirt",
											"TRYK_U_B_GRTAN_CombatUniform",
											"TRYK_U_B_GRTANR_CombatUniformTshirt",
											"TRYK_U_B_wood_CombatUniform",
											"TRYK_U_B_woodR_CombatUniformTshirt",
											"TRYK_U_B_wood3c_CombatUniform",
											"TRYK_U_B_wood3c_CombatUniformTshirt",
											"TRYK_U_B_MARPAT_WOOD_CombatUniform",
											"TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt",
											"TRYK_U_B_WOOD_MARPAT_CombatUniform",
											"TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt",
											"TRYK_U_B_woodtan_CombatUniform",
											"TRYK_U_B_woodtanR_CombatUniformTshirt",
											"TRYK_U_B_JSDF_CombatUniform",
											"TRYK_U_B_JSDF_CombatUniformTshirt",
											"TRYK_U_B_3CD_Delta_BDU",
											"TRYK_U_B_3CD_Delta_BDUTshirt",
											"TRYK_U_B_3CD_Ranger_BDU",
											"TRYK_U_B_3CD_Ranger_BDUTshirt",
											"TRYK_U_B_3CD_BLK_BDUTshirt",
											"TRYK_U_B_3CD_BLK_BDUTshirt2",
											"TRYK_U_B_ACU",
											"TRYK_U_B_ACUTshirt",
											"TRYK_U_B_MARPAT_Wood",
											"TRYK_U_B_MARPAT_Wood_Tshirt",
											"TRYK_U_B_MARPAT_Desert",
											"TRYK_U_B_MARPAT_Desert_Tshirt",
											"TRYK_U_B_MARPAT_Desert2",
											"TRYK_U_B_MARPAT_Desert2_Tshirt",
											"TRYK_U_B_3c",
											"TRYK_U_B_3cr",
											"TRYK_U_B_Sage_Tshirt",
											"TRYK_U_B_BLK3CD",
											"TRYK_U_B_BLK3CD_Tshirt",
											"TRYK_U_B_BLK",
											"TRYK_U_B_BLK_Tshirt",
											"TRYK_U_B_BLKTAN",
											"TRYK_U_B_BLKTAN_Tshirt",
											"TRYK_U_B_ODTAN",
											"TRYK_U_B_ODTAN_Tshirt",
											"TRYK_U_B_BLK_OD",
											"TRYK_U_B_BLK_OD_Tshirt",
											"TRYK_U_B_C01_Tsirt",
											"TRYK_U_B_C02_Tsirt",
											"TRYK_U_B_OD_BLK",
											"TRYK_U_B_OD_BLK_2",
											"TRYK_U_B_BLK_TAN_1",
											"TRYK_U_B_BLK_TAN_2",
											"TRYK_U_B_wh_tan_Rollup_CombatUniform",
											"TRYK_U_B_wh_OD_Rollup_CombatUniform",
											"TRYK_U_B_wh_blk_Rollup_CombatUniform",
											"TRYK_U_B_BLK_tan_Rollup_CombatUniform",
											"TRYK_U_B_BLK_OD_Rollup_CombatUniform",
											"TRYK_U_B_NATO_UCP_GRY_CombatUniform",
											"TRYK_U_B_NATO_UCP_GRY_R_CombatUniform",
											"TRYK_U_B_NATO_UCP_CombatUniform",
											"TRYK_U_B_NATO_UCP_R_CombatUniform",
											"TRYK_U_B_NATO_OCP_c_BLK_CombatUniform",
											"TRYK_U_B_NATO_OCP_BLK_c_R_CombatUniform",
											"TRYK_U_B_NATO_OCP_BLK_CombatUniform",
											"TRYK_U_B_NATO_OCP_BLK_R_CombatUniform",
											"TRYK_U_B_NATO_OCPD_CombatUniform",
											"TRYK_U_B_NATO_OCPD_R_CombatUniform",
											"TRYK_U_B_NATO_OCP_CombatUniform",
											"TRYK_U_B_NATO_OCP_R_CombatUniform",
											"TRYK_U_B_AOR1_Rollup_CombatUniform",
											"TRYK_U_B_AOR2_Rollup_CombatUniform",
											"TRYK_U_B_MTP_CombatUniform",
											"TRYK_U_B_MTP_R_CombatUniform",
											"TRYK_U_B_MTP_BLK_CombatUniform",
											"TRYK_U_B_MTP_BLK_R_CombatUniform",
											"TRYK_U_B_Woodland",
											"TRYK_U_B_Woodland_Tshirt",
											"TRYK_U_B_WDL_GRY_CombatUniform",
											"TRYK_U_B_WDL_GRY_R_CombatUniform",
											"TRYK_U_B_ARO1_GR_CombatUniform",
											"TRYK_U_B_ARO1_GR_R_CombatUniform",
											"TRYK_U_B_ARO1_GRY_CombatUniform",
											"TRYK_U_B_ARO1_GRY_R_CombatUniform",
											"TRYK_U_B_ARO1_CombatUniform",
											"TRYK_U_B_ARO1R_CombatUniform",
											"TRYK_U_B_ARO1_BLK_CombatUniform",
											"TRYK_U_B_ARO1_BLK_R_CombatUniform",
											"TRYK_U_B_ARO1_CBR_CombatUniform",
											"TRYK_U_B_ARO1_CBR_R_CombatUniform",
											"TRYK_U_B_ARO2_CombatUniform",
											"TRYK_U_B_ARO2R_CombatUniform",
											"TRYK_U_B_AOR2_BLK_CombatUniform",
											"TRYK_U_B_AOR2_BLK_R_CombatUniform",
											"TRYK_U_B_AOR2_OD_CombatUniform",
											"TRYK_U_B_AOR2_OD_R_CombatUniform",
											"TRYK_U_B_AOR2_GRY_CombatUniform",
											"TRYK_U_B_AOR2_GRY_R_CombatUniform",
											"TRYK_U_B_Snow_CombatUniform",
											"TRYK_U_B_Snowt",
											"TRYK_U_B_Denim_T_WH",
											"TRYK_U_B_Denim_T_BK",
											"TRYK_U_B_BLK_T_WH",
											"TRYK_U_B_BLK_T_BK",
											"TRYK_U_B_RED_T_BR",
											"TRYK_U_B_Denim_T_BG_WH",
											"TRYK_U_B_Denim_T_BG_BK",
											"TRYK_U_B_BLK_T_BG_WH",
											"TRYK_U_B_BLK_T_BG_BK",
											"TRYK_U_B_RED_T_BG_BR",
											"TRYK_U_B_fleece",
											"TRYK_U_B_fleece_UCP",
											"TRYK_U_B_UCP_PCUs",
											"TRYK_U_B_GRY_PCUs",
											"TRYK_U_B_Wood_PCUs",
											"TRYK_U_B_PCUs",
											"TRYK_U_B_UCP_PCUs_R",
											"TRYK_U_B_GRY_PCUs_R",
											"TRYK_U_B_Wood_PCUs_R",
											"TRYK_U_B_PCUs_R",
											"TRYK_U_B_PCUGs",
											"TRYK_U_B_PCUODs",
											"TRYK_U_B_PCUGs_gry",
											"TRYK_U_B_PCUGs_BLK",
											"TRYK_U_B_PCUGs_OD",
											"TRYK_U_B_PCUGs_gry_R",
											"TRYK_U_B_PCUGs_BLK_R",
											"TRYK_U_B_PCUGs_OD_R",
											"TRYK_U_Bts_GRYGRY_PCUs",
											"TRYK_U_Bts_UCP_PCUs",
											"TRYK_U_Bts_Wood_PCUs",
											"TRYK_U_Bts_PCUs",
											"TRYK_U_pad_j",
											"TRYK_U_pad_j_blk",
											"TRYK_U_pad_hood_Cl",
											"TRYK_U_pad_hood_Cl_blk",
											"TRYK_U_pad_hood_tan",
											"TRYK_U_pad_hood_Blk",
											"TRYK_U_pad_hood_CSATBlk",
											"TRYK_U_pad_hood_Blod",
											"TRYK_U_pad_hood_odBK",
											"TRYK_U_pad_hood_BKT2",
											"TRYK_hoodie_Blk",
											"TRYK_hoodie_FR",
											"TRYK_hoodie_Wood",
											"TRYK_hoodie_3c",
											"TRYK_T_camo_tan",
											"TRYK_T_camo_3c",
											"TRYK_T_camo_Wood",
											"TRYK_T_camo_wood_marpat",
											"TRYK_T_camo_Desert_marpat",
											"TRYK_T_camo_3c_BG",
											"TRYK_T_camo_Wood_BG",
											"TRYK_T_camo_wood_marpat_BG",
											"TRYK_T_camo_desert_marpat_BG",
											"TRYK_T_PAD",
											"TRYK_T_OD_PAD",
											"TRYK_T_TAN_PAD",
											"TRYK_T_BLK_PAD",
											"TRYK_T_T2_PAD",
											"TRYK_T_CSAT_PAD",
											"TRYK_U_nohoodPcu_gry",
											"TRYK_U_hood_nc",
											"TRYK_U_hood_mc",
											"TRYK_U_denim_hood_blk",
											"TRYK_U_denim_hood_mc",
											"TRYK_U_denim_hood_3c",
											"TRYK_U_denim_hood_nc",
											"TRYK_U_denim_jersey_blu",
											"TRYK_U_denim_jersey_blk",
											"TRYK_shirts_PAD",
											"TRYK_shirts_OD_PAD",
											"TRYK_shirts_TAN_PAD",
											"TRYK_shirts_BLK_PAD",
											"TRYK_shirts_PAD_BK",
											"TRYK_shirts_OD_PAD_BK",
											"TRYK_shirts_TAN_PAD_BK",
											"TRYK_shirts_BLK_PAD_BK",
											"TRYK_shirts_PAD_BLW",
											"TRYK_shirts_OD_PAD_BLW",
											"TRYK_shirts_TAN_PAD_BLW",
											"TRYK_shirts_BLK_PAD_BLW",
											"TRYK_shirts_PAD_YEL",
											"TRYK_shirts_OD_PAD_YEL",
											"TRYK_shirts_TAN_PAD_YEL",
											"TRYK_shirts_BLK_PAD_YEL",
											"TRYK_shirts_PAD_RED2",
											"TRYK_shirts_OD_PAD_RED2",
											"TRYK_shirts_TAN_PAD_RED2",
											"TRYK_shirts_BLK_PAD_RED2",
											"TRYK_shirts_PAD_BLU3",
											"TRYK_shirts_OD_PAD_BLU3",
											"TRYK_shirts_TAN_PAD_BLU3",
											"TRYK_shirts_BLK_PAD_BLU3",
											"TRYK_shirts_DENIM_R",
											"TRYK_shirts_DENIM_BL",
											"TRYK_shirts_DENIM_BK",
											"TRYK_shirts_DENIM_WH",
											"TRYK_shirts_DENIM_BWH",
											"TRYK_shirts_DENIM_RED2",
											"TRYK_shirts_DENIM_WHB",
											"TRYK_shirts_DENIM_ylb",
											"TRYK_shirts_DENIM_od",
											"TRYK_shirts_DENIM_R_Sleeve",
											"TRYK_shirts_DENIM_BL_Sleeve",
											"TRYK_shirts_DENIM_BK_Sleeve",
											"TRYK_shirts_DENIM_WH_Sleeve",
											"TRYK_shirts_DENIM_BWH_Sleeve",
											"TRYK_shirts_DENIM_RED2_Sleeve",
											"TRYK_shirts_DENIM_WHB_Sleeve",
											"TRYK_shirts_DENIM_ylb_Sleeve",
											"TRYK_shirts_DENIM_od_Sleeve",
											"TRYK_shirts_PAD_BL",
											"TRYK_shirts_OD_PAD_BL",
											"TRYK_shirts_TAN_PAD_BL",
											"TRYK_shirts_BLK_PAD_BL",
											"TRYK_U_taki_wh",
											"TRYK_U_taki_COY",
											"TRYK_U_taki_BL",
											"TRYK_U_taki_BLK",
											"TRYK_U_Bts_PCUGs",
											"TRYK_U_Bts_PCUODs",
											"TRYK_U_taki_G_WH",
											"TRYK_U_taki_G_COY",
											"TRYK_U_taki_G_BL",
											"TRYK_U_taki_G_BLK",
											"TRYK_U_B_PCUHs",
											"TRYK_U_B_PCUGHs",
											"TRYK_U_B_PCUODHs",
											"TRYK_B_USMC_R",
											"TRYK_B_USMC_R_ROLL",
											"TRYK_ZARATAKI",
											"TRYK_ZARATAKI2",
											"TRYK_ZARATAKI3",
											"TRYK_B_TRYK_UCP_T",
											"TRYK_B_TRYK_3C_T",
											"TRYK_B_TRYK_MTP_T",
											"TRYK_B_TRYK_OCP_T",
											"TRYK_B_TRYK_OCP_D_T",
											"TRYK_DMARPAT_T",
											"TRYK_C_AOR2_T",
											"TRYK_U_B_Sage_T",
											"TRYK_U_B_Wood_T",
											"TRYK_U_B_BLTAN_T",
											"TRYK_U_B_BLOD_T",
											"TRYK_OVERALL_flesh",
											"TRYK_OVERALL_nok_flesh",
											"TRYK_OVERALL_SAGE_BLKboots",
											"TRYK_OVERALL_SAGE_BLKboots_nk_blk",
											"TRYK_OVERALL_SAGE_BLKboots_nk",
											"TRYK_OVERALL_SAGE_BLKboots_nk_blk2",
											"TRYK_OVERALL_SAGE",
											"TRYK_SUITS_BLK_F",
											"TRYK_SUITS_BR_F",
											"TRYK_shoulder_armor_BK",
											"TRYK_shoulder_armor_OD",
											"TRYK_shoulder_armor_CY",
											"TRYK_U_B_PCUHsW",
											"TRYK_U_B_PCUHsW2",
											"TRYK_U_B_PCUHsW3",
											"TRYK_U_B_PCUHsW3nh",
											"TRYK_U_B_PCUHsW4",
											"TRYK_U_B_PCUHsW5",
											"TRYK_U_B_PCUHsW6"
										];
	DMS_MG_vests =						[							// Vests for MG Class
											"V_PlateCarrierH_CTRG",
											"V_PlateCarrierSpec_rgr",
											"V_PlateCarrierGL_blk",
											"V_PlateCarrierGL_mtp",
											"V_PlateCarrierGL_rgr",
											"V_PlateCarrierSpec_blk",
											"V_PlateCarrierSpec_mtp",
											"V_PlateCarrierL_CTRG",
											"V_TacVest_blk_POLICE",
											"V_PlateCarrierIA2_dgtl",
											"V_HarnessO_brn",
											"V_HarnessO_gry",
											"TRYK_Hrp_vest_ucp",
											"TRYK_V_PlateCarrier_JSDF",
											"TRYK_V_ArmorVest_AOR1",
											"TRYK_V_ArmorVest_AOR2",
											"TRYK_V_ArmorVest_coyo",
											"TRYK_V_ArmorVest_Brown",
											"TRYK_V_ArmorVest_CBR",
											"TRYK_V_ArmorVest_khk",
											"TRYK_V_ArmorVest_rgr",
											"TRYK_V_ArmorVest_green",
											"TRYK_V_ArmorVest_tan",
											"TRYK_V_ArmorVest_Delta",
											"TRYK_V_ArmorVest_Ranger",
											"TRYK_V_ArmorVest_AOR1_2",
											"TRYK_V_ArmorVest_AOR2_2",
											"TRYK_V_ArmorVest_coyo2",
											"TRYK_V_ArmorVest_Brown2",
											"TRYK_V_ArmorVest_cbr2",
											"TRYK_V_ArmorVest_khk2",
											"TRYK_V_ArmorVest_rgr2",
											"TRYK_V_ArmorVest_green2",
											"TRYK_V_ArmorVest_tan2",
											"TRYK_V_ArmorVest_Delta2",
											"TRYK_V_ArmorVest_Ranger2",
											"TRYK_V_PlateCarrier_blk",
											"TRYK_V_PlateCarrier_coyo",
											"TRYK_V_PlateCarrier_wood",
											"TRYK_V_PlateCarrier_ACU",
											"TRYK_V_TacVest_coyo",
											"TRYK_V_harnes_blk_L",
											"TRYK_V_harnes_od_L",
											"TRYK_V_harnes_TAN_L",
											"TRYK_V_PlateCarrier_blk_L",
											"TRYK_V_PlateCarrier_wood_L",
											"TRYK_V_PlateCarrier_ACU_L",
											"TRYK_V_PlateCarrier_coyo_L",
											"TRYK_V_ChestRig_L",
											"TRYK_V_ChestRig",
											"TRYK_V_Bulletproof",
											"TRYK_V_Bulletproof_BLK",
											"TRYK_V_Bulletproof_BL",
											"TRYK_V_IOTV_BLK",
											"TRYK_V_tacv1M_BK",
											"TRYK_V_tacv1MLC_BK",
											"TRYK_V_tacv1",
											"TRYK_V_tacv1_CY",
											"TRYK_V_tacv1_BK",
											"TRYK_V_tacv1_P_BK",
											"TRYK_V_tacv1_SHERIFF_BK",
											"TRYK_V_tacv1_FBI_BK",
											"TRYK_V_tacv1LP_BK",
											"TRYK_V_tacv1LSRF_BK",
											"TRYK_V_tacv1LC_BK",
											"TRYK_V_tacv1LC_CY",
											"TRYK_V_tacv1LC_OD",
											"TRYK_V_tacv1LC_FBI_BK",
											"TRYK_V_tacv1LC_SRF_BK",
											"TRYK_V_tacv1LC_SRF_OD",
											"TRYK_V_tacv1LC_P_BK",
											"TRYK_V_PlateCarrier_POLICE",
											"TRYK_V_ArmorVest_HRT_B",
											"TRYK_V_ArmorVest_HRT_OD",
											"TRYK_V_ArmorVest_HRT2_B",
											"TRYK_V_ArmorVest_HRT2_OD",
											"TRYK_V_ArmorVest_Winter",
											"TRYK_V_Sheriff_BA_OD",
											"TRYK_V_tacv10_BK",
											"TRYK_V_tacv10_OD",
											"TRYK_V_tacv10_TN",
											"TRYK_V_tacv10LC_BK",
											"TRYK_V_tacv10LC_OD",
											"TRYK_V_tacv10LC_TN",
											"TRYK_V_tacv1L_BK",
											"TRYK_V_tacv1L_OD",
											"TRYK_V_tacv1L_CY",
											"TRYK_V_tacv1LC_FBI2_BK",
											"TRYK_V_tacv1LC_SRF2_BK",
											"TRYK_V_tacv1LC_SRF2_OD",
											"TRYK_V_tacv1LC_P2_BK",
											"TRYK_V_tacv1_MSL_BK",
											"TRYK_V_tacv1_MSL_NV",
											"TRYK_V_tacv1LMSL_BK",
											"TRYK_V_tacv1LMSL_NV",
											"TRYK_V_tacv1LC_MSL_BK",
											"TRYK_V_tacv1LC_MSL_NV",
											"TRYK_V_tacSVD_BK",
											"TRYK_V_tacSVD_OD",
											"TRYK_V_Sheriff_BA_TL",
											"TRYK_V_Sheriff_BA_TBL",
											"TRYK_V_Sheriff_BA_TCL",
											"TRYK_V_Sheriff_BA_TL2",
											"TRYK_V_Sheriff_BA_TBL2",
											"TRYK_V_Sheriff_BA_TCL2",
											"TRYK_V_Sheriff_BA_T",
											"TRYK_V_Sheriff_BA_TB",
											"TRYK_V_Sheriff_BA_T2",
											"TRYK_V_Sheriff_BA_TB2",
											"TRYK_V_Sheriff_BA_T3",
											"TRYK_V_Sheriff_BA_TB3",
											"TRYK_V_Sheriff_BA_T4",
											"TRYK_V_Sheriff_BA_TB4",
											"TRYK_V_Sheriff_BA_T5",
											"TRYK_V_Sheriff_BA_TB5",
											"TRYK_V_Sheriff_BA_TBL3_BK",
											"TRYK_V_Sheriff_BA_TBL3_OD",
											"TRYK_V_Sheriff_BA_TBL3_TN",
											"TRYK_LOC_AK_chestrig_OD",
											"TRYK_LOC_AK_chestrig_TAN"
										];
	DMS_MG_backpacks =					[							// Backpacks for MG Class
											"B_Bergen_rgr",
											"B_Carryall_oli",
											"B_Kitbag_mcamo",
											"B_Carryall_cbr",
											"B_Bergen_blk",
											"TRYK_B_Alicepack",
											"TRYK_B_Medbag",
											"TRYK_B_Medbag_OD",
											"TRYK_B_Medbag_BK",
											"TRYK_B_Medbag_ucp",
											"TRYK_B_Belt",
											"TRYK_B_Belt_BLK",
											"TRYK_B_Belt_CYT",
											"TRYK_B_Belt_tan",
											"TRYK_B_Belt_br",
											"TRYK_B_Belt_GR",
											"TRYK_B_Belt_AOR1",
											"TRYK_B_Belt_AOR2"
										];

	//Sniper Class
	DMS_sniper_weps =					[							// Sniper Rifles
											"srifle_EBR_F",
											"srifle_DMR_01_F",
											"srifle_GM6_F",
											"srifle_LRR_F",
											"arifle_MXM_F",
											"arifle_MXM_Black_F",
											"srifle_DMR_02_F",
											"rhs_weap_M107",
											"rhs_weap_sr25",
											"rhs_weap_sr25_ec",
											"rhs_weap_m14ebrri",
											"rhs_weap_XM2010",
											"rhs_weap_XM2010_wd",
											"rhs_weap_XM2010_d",
											"rhs_weap_XM2010_sa",
											"rhs_weap_svd",
											"rhs_weap_svdp_wd",
											"rhs_weap_svdp_wd_npz",
											"rhs_weap_svdp_npz",
											"rhs_weap_svds",
											"rhs_weap_svds_npz"
										];
	DMS_sniper_pistols =				[							// Pistols for Sniper Class (Set to empty array if you don't want to give them any pistols)
											"hgun_ACPC2_F",
											"hgun_Rook40_F",
											"hgun_P07_F",
											"hgun_Pistol_heavy_01_F",
											"hgun_Pistol_heavy_02_F",
											"rhs_weap_pya",
											"rhs_weap_makarov_pmm",
											"rhsusf_weap_m1911a1"
										];
	DMS_sniper_optics =					[							// Optics for Sniper Class
											"optic_SOS",
											"optic_DMS",
											"optic_LRPS",
											"rhsusf_acc_eotech_552",
											"rhsusf_acc_LEUPOLDMK4",
											"rhsusf_acc_ELCAN",
											"rhsusf_acc_ELCAN_pip",
											"rhsusf_acc_ACOG",
											"rhsusf_acc_ACOG_pip",
											"rhs_acc_1pn93_2",
											"rhsusf_acc_ACOG2",
											"rhsusf_acc_ACOG_USMC",
											"rhsusf_acc_ACOG2_USMC",
											"rhsusf_acc_ACOG3_USMC",
											"rhsusf_acc_LEUPOLDMK4_2",
											"rhsusf_acc_EOTECH",
											"rhs_acc_1p29",
											"rhs_acc_1p78",
											"rhs_acc_pkas",
											"rhs_acc_1p63",
											"rhs_acc_ekp1",
											"rhs_acc_pso1m2",
											"rhs_acc_pgo7v",
											"rhs_acc_1pn93_1"
										];
	DMS_sniper_optic_chance				= 100;						// Percentage chance that a Sniper Class AI will get an optic
	DMS_sniper_bipod_chance				= 90;						// Percentage chance that a Sniper Class AI will get a bipod
	DMS_sniper_suppressor_chance		= 15;						// Percentage chance that a Sniper Class AI will get a suppressor

	DMS_sniper_items =					[							// Items for Sniper Class AI (Loot stuff that goes in uniform/vest/backpack)
											"Exile_Item_InstaDoc",
											"Exile_Item_Surstromming_Cooked",
											"Exile_Item_PlasticBottleFreshWater",
											"Exile_Item_PlasticBottleFreshWater",
											"Exile_Item_Matches"
										];
	DMS_sniper_equipment =				[							// Equipment for Sniper Class AI (stuff that goes in toolbelt slots)
											"Rangefinder",
											"ItemGPS"
										];
	DMS_sniper_helmets =				[							// Helmets for Sniper Class
											"H_HelmetSpecB_paint1",
											"H_HelmetIA_camo",
											"H_HelmetLeaderO_ocamo",
											"H_HelmetLeaderO_oucamo"
										];
	DMS_sniper_clothes =				[							// Uniforms for Sniper Class
											"U_O_GhillieSuit",
											"U_B_FullGhillie_ard",
											"U_B_FullGhillie_lsh",
											"U_B_FullGhillie_sard",
											"U_B_GhillieSuit",
											"U_I_FullGhillie_ard",
											"U_I_FullGhillie_lsh",
											"U_I_FullGhillie_sard",
											"U_I_GhillieSuit",
											"U_O_FullGhillie_ard",
											"U_O_FullGhillie_lsh",
											"U_O_FullGhillie_sard",
											"TRYK_H_ghillie_over",
											"TRYK_H_ghillie_top",
											"TRYK_H_ghillie_top_headless",
											"TRYK_H_ghillie_over_green",
											"TRYK_H_ghillie_top_green",
											"TRYK_H_ghillie_top_headless_green",
											"TRYK_H_ghillie_top_headless3"
										];
	DMS_sniper_vests =					[							// Vests for Sniper Class
											"V_PlateCarrierH_CTRG",
											"V_PlateCarrierSpec_rgr",
											"V_PlateCarrierGL_blk",
											"V_PlateCarrierGL_mtp",
											"V_PlateCarrierGL_rgr",
											"V_PlateCarrierSpec_blk",
											"V_PlateCarrierSpec_mtp",
											"V_PlateCarrierL_CTRG",
											"V_TacVest_blk_POLICE",
											"V_PlateCarrierIA2_dgtl",
											"V_HarnessO_brn",
											"V_HarnessO_gry",
											"TRYK_V_PlateCarrier_blk",
											"TRYK_V_PlateCarrier_coyo",
											"TRYK_V_PlateCarrier_wood",
											"TRYK_V_PlateCarrier_ACU",
											"TRYK_V_harnes_blk_L",
											"TRYK_V_harnes_od_L",
											"TRYK_V_harnes_TAN_L",
											"TRYK_V_PlateCarrier_blk_L",
											"TRYK_V_PlateCarrier_wood_L",
											"TRYK_V_PlateCarrier_ACU_L",
											"TRYK_V_PlateCarrier_coyo_L",
											"TRYK_V_Bulletproof",
											"TRYK_V_Bulletproof_BLK",
											"TRYK_V_Bulletproof_BL",
											"TRYK_V_IOTV_BLK",
											"TRYK_V_tacv1M_BK",
											"TRYK_V_tacv1MLC_BK",
											"TRYK_V_tacv1",
											"TRYK_V_tacv1_CY",
											"TRYK_V_tacv1_BK",
											"TRYK_V_tacv1_P_BK",
											"TRYK_V_tacv1_SHERIFF_BK",
											"TRYK_V_tacv1_FBI_BK",
											"TRYK_V_tacv1LP_BK",
											"TRYK_V_tacv1LSRF_BK",
											"TRYK_V_tacv1LC_BK",
											"TRYK_V_tacv1LC_CY",
											"TRYK_V_tacv1LC_OD",
											"TRYK_V_tacv1LC_FBI_BK",
											"TRYK_V_tacv1LC_SRF_BK",
											"TRYK_V_tacv1LC_SRF_OD",
											"TRYK_V_tacv1LC_P_BK",
											"TRYK_V_PlateCarrier_POLICE",
											"TRYK_V_ArmorVest_HRT_B",
											"TRYK_V_ArmorVest_HRT_OD",
											"TRYK_V_ArmorVest_HRT2_B",
											"TRYK_V_ArmorVest_HRT2_OD",
											"TRYK_V_ArmorVest_Winter",
											"TRYK_V_Sheriff_BA_OD",
											"TRYK_V_tacv10_BK",
											"TRYK_V_tacv10_OD",
											"TRYK_V_tacv10_TN",
											"TRYK_V_tacv10LC_BK",
											"TRYK_V_tacv10LC_OD",
											"TRYK_V_tacv10LC_TN",
											"TRYK_V_tacv1L_BK",
											"TRYK_V_tacv1L_OD",
											"TRYK_V_tacv1L_CY",
											"TRYK_V_tacv1LC_FBI2_BK",
											"TRYK_V_tacv1LC_SRF2_BK",
											"TRYK_V_tacv1LC_SRF2_OD",
											"TRYK_V_tacv1LC_P2_BK",
											"TRYK_V_tacv1_MSL_BK",
											"TRYK_V_tacv1_MSL_NV",
											"TRYK_V_tacv1LMSL_BK",
											"TRYK_V_tacv1LMSL_NV",
											"TRYK_V_tacv1LC_MSL_BK",
											"TRYK_V_tacv1LC_MSL_NV",
											"TRYK_V_tacSVD_BK",
											"TRYK_V_tacSVD_OD",
											"TRYK_LOC_AK_chestrig_OD",
											"TRYK_LOC_AK_chestrig_TAN"
										];
	DMS_sniper_backpacks =				[							// Backpacks for Sniper Class
											"B_Bergen_rgr",
											"B_Carryall_oli",
											"B_Kitbag_mcamo",
											"B_Carryall_cbr",
											"B_Bergen_blk",
											"TRYK_B_Belt_AOR1",
											"TRYK_B_Belt_AOR2",
											"TRYK_B_BAF_BAG_BLK",
											"TRYK_B_BAF_BAG_CYT",
											"TRYK_B_BAF_BAG_OD",
											"TRYK_B_BAF_BAG_rgr",
											"TRYK_B_BAF_BAG_mcamo",
											"TRYK_B_tube_cyt",
											"TRYK_B_tube_od",
											"TRYK_B_tube_blk",
											"TRYK_B_FieldPack_Wood",
											"TRYK_Winter_pack"
										];
	
	DMS_ai_SupportedClasses =			[							// Allowed AI classes. If you want to create your own class, make sure you define everything as I've defined above, and add it here
											"assault",
											"MG",
											"sniper"
										];

	DMS_random_AI =						[							// The classes that a "random" AI can spawn as | DEFAULT: 60% Assault, 20% MG, 20% Sniper
											"assault",
											"assault",
											"assault",
											"MG",
											"sniper"
										];

	DMS_ai_use_launchers				= true;						// Enable/disable spawning an AI in a group with a launcher
	DMS_ai_launchers_per_group			= 2;						// How many units per AI group can get a launcher.
	DMS_ai_use_launchers_chance			= 50;						// Percentage chance to actually spawn the launcher (per-unit). With "DMS_ai_launchers_per_group" set to 2, and "DMS_ai_use_launchers_chance" set to 50, there will be an average of 1 launcher per group.
	DMS_AI_launcher_ammo_count			= 2;						// How many rockets an AI will get with its launcher
	DMS_ai_remove_launchers				= true;						// Remove rocket launchers on AI death

	DMS_AI_wep_launchers_AT =			[							// AT Launchers
											"launch_NLAW_F",
											"launch_RPG32_F",
											"launch_B_Titan_short_F"
										];
	DMS_AI_wep_launchers_AA =			[							// AA Launchers
											"launch_B_Titan_F"
										];

/* AI Settings */


/* Loot Settings */
	DMS_GodmodeCrates 					= true;						// Whether or not crates will have godmode after being filled with loot.
	DMS_CrateCase_Sniper =				[							// If you pass "Sniper" in _lootValues, then it will spawn these weapons/items/backpacks
											[
												["Rangefinder",1],
												["srifle_GM6_F",1],
												["srifle_LRR_F",1],
												["srifle_EBR_F",1],
												["rhs_weap_M107",1],
												["rhs_weap_sr25",1],
												["rhs_weap_sr25_ec",1],
												["hgun_Pistol_heavy_01_F",1],
												["hgun_PDW2000_F",1]
											],
											[
												["ItemGPS",1],
												["U_B_FullGhillie_ard",1],
												["U_I_FullGhillie_lsh",1],
												["U_O_FullGhillie_sard",1],
												["U_O_GhillieSuit",1],
												["TRYK_H_ghillie_over",1],
												["TRYK_H_ghillie_top_headless",1],
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
												["TRYK_B_Coyotebackpack_WH",1]
												["TRYK_B_Coyotebackpack_BLK",1]
											]
										];
	DMS_BoxWeapons =					[							// List of weapons that can spawn in a crate
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
											"MMG_01_hex_F",
											"srifle_EBR_F",
											"srifle_DMR_01_F",
											"srifle_GM6_F",
											"srifle_LRR_F",
											"arifle_MXM_F",
											"arifle_MXM_Black_F",
											"srifle_DMR_02_F",
											"rhs_weap_m16a4",
											"rhs_weap_m16a4_carryhandle",
											"rhs_weap_m16a4_carryhandle_grip",
											"rhs_weap_m16a4_carryhandle_grip_pmag",
											"rhs_weap_m16a4_carryhandle_M203",
											"rhs_weap_m16a4_carryhandle_pmag",
											"rhs_weap_m16a4_grip",
											"rhs_weap_m4",
											"rhs_weap_m4_grip2",
											"rhs_weap_m4_carryhandle",
											"rhs_weap_m4_carryhandle_pmag",
											"rhs_weap_m4_grip",
											"rhs_weap_m4_m203",
											"rhs_weap_m4_m320",
											"rhs_weap_m4a1_carryhandle",
											"rhs_weap_m4a1_carryhandle_grip2",
											"rhs_weap_m4a1_carryhandle_pmag",
											"rhs_weap_m4a1_carryhandle_m203",
											"rhs_weap_m4a1",
											"rhs_weap_m4a1_grip2",
											"rhs_weap_m4a1_grip",
											"rhs_weap_m4a1_m203",
											"rhs_weap_m4a1_m320",
											"rhs_weap_m4a1_blockII",
											"rhs_weap_m4a1_blockII_KAC",
											"rhs_weap_m4a1_blockII_grip2",
											"rhs_weap_m4a1_blockII_grip2_KAC",
											"rhs_weap_m4a1_blockII_M203",
											"rhs_weap_mk18",
											"rhs_weap_mk18_KAC",
											"rhs_weap_mk18_grip2",
											"rhs_weap_mk18_grip2_KAC",
											"rhs_weap_mk18_m320",
											"rhs_weap_ak103",
											"rhs_weap_ak103_npz",
											"rhs_weap_ak103_1",
											"rhs_weap_ak74m",
											"rhs_weap_ak74m_2mag",
											"rhs_weap_ak74m_2mag_camo",
											"rhs_weap_ak74m_2mag_npz",
											"rhs_weap_ak74m_camo",
											"rhs_weap_ak74m_desert",
											"rhs_weap_ak74m_desert_npz",
											"rhs_weap_ak74m_desert_folded",
											"rhs_weap_ak74m_plummag_folded",
											"rhs_weap_ak74m_folded",
											"rhs_weap_ak74m_camo_folded",
											"rhs_weap_ak74m_gp25",
											"rhs_weap_ak74m_gp25_npz",
											"rhs_weap_ak74m_npz",
											"rhs_weap_ak74m_plummag",
											"rhs_weap_ak74m_plummag_npz",
											"rhs_weap_akm",
											"rhs_weap_akm_gp25",
											"rhs_weap_akms",
											"rhs_weap_akms_gp25",
											"rhs_weap_M107",
											"rhs_weap_sr25",
											"rhs_weap_sr25_ec",
											"rhs_weap_m14ebrri",
											"rhs_weap_XM2010",
											"rhs_weap_XM2010_wd",
											"rhs_weap_XM2010_d",
											"rhs_weap_XM2010_sa",
											"rhs_weap_svd",
											"rhs_weap_svdp_wd",
											"rhs_weap_svdp_wd_npz",
											"rhs_weap_svdp_npz",
											"rhs_weap_svds",
											"rhs_weap_svds_npz",
											"rhs_weap_m249_pip_L",
											"rhs_weap_m249_pip_L_para",
											"rhs_weap_m249_pip_L_vfg",
											"rhs_weap_m249_pip_S",
											"rhs_weap_m249_pip_S_para",
											"rhs_weap_m249_pip_S_vfg",
											"rhs_weap_m240B",
											"rhs_weap_m240B_CAP",
											"rhs_weap_m240G",
											"rhs_weap_pkm",
											"rhs_weap_pkp",
											"rhs_weap_pya",
											"rhs_weap_makarov_pmm",
											"rhsusf_weap_m1911a1"
										];
	DMS_BoxSurvivalSupplies	=			[							//List of survival supplies (food/drink/meds) that can spawn in a crate
											"Exile_Item_Catfood_Cooked",
											"Exile_Item_SausageGravy_Cooked",
											"Exile_Item_BBQSandwich_Cooked",
											"Exile_Item_PlasticBottleFreshWater",
											"Exile_Item_PlasticBottleFreshWater",
											"Exile_Item_Matches",
											"Exile_Item_CookingPot"
										];
	DMS_BoxBuildingSupplies	=			[							// List of building supplies that can spawn in a crate
											"Exile_Item_CamoTentKit",
											"Exile_Item_MetalPole",
											"Exile_Item_MetalBoard",
											"Exile_Item_LightBulb",
											"Exile_Item_JunkMetal",
											"Exile_Item_ExtensionCord",
											"Exile_Item_DuctTape"
										];
	DMS_BoxOptics =						[							// List of optics that can spawn in a crate
											"optic_Arco",
											"optic_Hamr",
											"optic_Aco",
											"optic_Holosight",
											"optic_MRCO",
											"optic_SOS",
											"optic_DMS",
											"optic_LRPS",
											"optic_Nightstalker",
											"rhsusf_acc_eotech_552",
											"rhsusf_acc_LEUPOLDMK4",
											"rhsusf_acc_ELCAN",
											"rhsusf_acc_ELCAN_pip",
											"rhsusf_acc_ACOG",
											"rhsusf_acc_ACOG_pip",
											"rhs_acc_1pn93_2",
											"rhsusf_acc_ACOG2",
											"rhsusf_acc_ACOG_USMC",
											"rhsusf_acc_ACOG2_USMC",
											"rhsusf_acc_ACOG3_USMC",
											"rhsusf_acc_LEUPOLDMK4_2",
											"rhsusf_acc_EOTECH",
											"rhs_acc_1p29",
											"rhs_acc_1p78",
											"rhs_acc_pkas",
											"rhs_acc_1p63",
											"rhs_acc_ekp1",
											"rhs_acc_pso1m2",
											"rhs_acc_pgo7v",
											"rhs_acc_1pn93_1"
										];
	DMS_BoxBackpacks =					[							//List of backpacks that can spawn in a crate
											"B_Bergen_rgr",
											"B_Carryall_oli",
											"B_Kitbag_mcamo",
											"B_Carryall_cbr",
											"B_FieldPack_oucamo",
											"B_FieldPack_cbr",
											"B_Bergen_blk",
											"TRYK_B_AssaultPack_UCP",
											"TRYK_B_AssaultPack_Type2camo",
											"TRYK_B_AssaultPack_MARPAT_Desert",
											"TRYK_B_AssaultPack_MARPAT_Wood",
											"TRYK_B_Kitbag_Base",
											"TRYK_B_Kitbag_blk",
											"TRYK_B_Kitbag_aaf",
											"TRYK_B_Carryall_blk",
											"TRYK_B_Carryall_wh",
											"TRYK_B_Carryall_wood",
											"TRYK_B_Carryall_JSDF",
											"TRYK_B_Kitbag_Base_JSDF",
											"TRYK_B_Coyotebackpack",
											"TRYK_B_Coyotebackpack_OD",
											"TRYK_B_Coyotebackpack_BLK",
											"TRYK_B_Coyotebackpack_WH",
											"TRYK_B_Alicepack",
											"TRYK_B_Medbag",
											"TRYK_B_Medbag_OD",
											"TRYK_B_Medbag_BK",
											"TRYK_B_Medbag_ucp",
											"TRYK_B_Belt",
											"TRYK_B_Belt_BLK",
											"TRYK_B_Belt_CYT",
											"TRYK_B_Belt_tan",
											"TRYK_B_Belt_br",
											"TRYK_B_Belt_GR",
											"TRYK_B_Belt_AOR1",
											"TRYK_B_Belt_AOR2",
											"TRYK_B_BAF_BAG_BLK",
											"TRYK_B_BAF_BAG_CYT",
											"TRYK_B_BAF_BAG_OD",
											"TRYK_B_BAF_BAG_rgr",
											"TRYK_B_BAF_BAG_mcamo",
											"TRYK_B_tube_cyt",
											"TRYK_B_tube_od",
											"TRYK_B_tube_blk",
											"TRYK_B_FieldPack_Wood",
											"TRYK_Winter_pack"
										];
	DMS_BoxItems						= DMS_BoxSurvivalSupplies+DMS_BoxBuildingSupplies+DMS_BoxOptics;	// Random "items" can spawn optics, survival supplies, or building supplies

	DMS_RareLoot						= true;						// Potential chance to spawn rare loot in any crate.
	DMS_RareLootList =					[							// List of rare loot to spawn
											"Exile_Item_SafeKit",
											"Exile_Item_CodeLock"
										];
	DMS_RareLootChance					= 10;						// Percentage Chance to spawn rare loot in any crate | Default: 10%

	// Vehicles
	DMS_ArmedVehicles =					[							// List of armed vehicles that can spawn
											"Exile_Car_Offroad_Armed_Guerilla01"
										];
										
	DMS_MilitaryVehicles =				[							// List of military vehicles that can spawn
											"Exile_Car_Strider",
											"Exile_Car_Hunter",
											"Exile_Car_Ifrit",
											"rhsusf_M1078A1P2_wd_fmtv_usarmy",
											"rhsusf_M1078A1P2_d_fmtv_usarmy",
											"rhsusf_M1078A1P2_wd_open_fmtv_usarmy",
											"rhsusf_M1078A1P2_d_open_fmtv_usarmy",
											"rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy",
											"rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy",
											"rhsusf_M1078A1P2_B_d_fmtv_usarmy",
											"rhsusf_M1078A1P2_B_wd_fmtv_usarmy",
											"rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy",
											"rhsusf_M1078A1P2_B_d_open_fmtv_usarmy",
											"rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy",
											"rhsusf_M1078A1P2_B_d_flatbed_fmtv_usarmy"
										];

	DMS_TransportTrucks =				[							// List of transport trucks that can spawn
											"Exile_Car_Van_Guerilla01",
											"Exile_Car_Zamak",
											"Exile_Car_Tempest",
											"Exile_Car_HEMMT",
											"RHS_Ural_Open_Civ_01",
											"RHS_Ural_Open_Civ_02",
											"RHS_Ural_Open_Civ_03",
											"RHS_Ural_MSV_01",
											"RHS_Ural_Fuel_MSV_01",
											"RHS_Ural_Open_MSV_01",
											"rhs_Ural_Flat_MSV_01"
										];

	DMS_RefuelTrucks =					[							// List of refuel trucks that can spawn
											"Exile_Car_Van_Fuel_Black",
											"Exile_Car_Van_Fuel_White",
											"Exile_Car_Van_Fuel_Red",
											"Exile_Car_Van_Fuel_Guerilla01",
											"Exile_Car_Van_Fuel_Guerilla02",
											"Exile_Car_Van_Fuel_Guerilla03"
										];

	DMS_CivilianVehicles =				[							// List of civilian vehicles that can spawn
											"Exile_Car_SUV_Red",
											"Exile_Car_Hatchback_Rusty1",
											"Exile_Car_Hatchback_Rusty2",
											"Exile_Car_Hatchback_Sport_Red",
											"Exile_Car_SUV_Red",
											"Exile_Car_Offroad_Rusty2",
											"Exile_Bike_QuadBike_Fia",
											"rhs_gaz66_r142_vmf",
											"rhs_gaz66_repair_vmf",
											"rhs_gaz66_vmf",
											"rhs_gaz66_flat_vdv",
											"rhs_gaz66o_vdv",
											"rhs_gaz66o_flat_vdv",
											"rhs_gaz66_ammo_vmf"
										];
	
	DMS_TransportHelis =				[							// List of transport helis that can spawn
											"Exile_Chopper_Hummingbird_Green",
											"Exile_Chopper_Orca_BlackCustom",
											"Exile_Chopper_Mohawk_FIA",
											"Exile_Chopper_Huron_Black",
											"Exile_Chopper_Hellcat_Green",
											"Exile_Chopper_Taru_Transport_Black",
											"RHS_CH_47F",
											"rhs_ka60_c",
											"rhs_ka60_grey",
											"RHS_UH60M",
											"rhs_UH60M_MEV2_d",
											"rhs_Mi8mt_vvs",
											"rhs_Mi8mt_cargo_vvs",
											"rhs_UH1Y_unarmed"
										];
/* Loot Settings */
