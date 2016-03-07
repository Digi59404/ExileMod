/*
	Zupa's Capture Points
	Mission starter of ZCP
	Capture points and earn money over time.

	╔════╗─────────╔═══╗────────╔╗─────────────╔╗
	╚══╗═║─────────╚╗╔╗║────────║║────────────╔╝╚╗
	──╔╝╔╬╗╔╦══╦══╗─║║║╠══╦╗╔╦══╣║╔══╦╗╔╦══╦═╗╚╗╔╬══╗
	─╔╝╔╝║║║║╔╗║╔╗║─║║║║║═╣╚╝║║═╣║║╔╗║╚╝║║═╣╔╗╗║║║══╣
	╔╝═╚═╣╚╝║╚╝║╔╗║╔╝╚╝║║═╬╗╔╣║═╣╚╣╚╝║║║║║═╣║║║║╚╬══║
	╚════╩══╣╔═╩╝╚╝╚═══╩══╝╚╝╚══╩═╩══╩╩╩╩══╩╝╚╝╚═╩══╝
	────────║║
	────────╚╝
*/

private["_currentCapper","_ZCP_continue","_ZCP_flag","_currentGroup","_ZCP_name","_ZCP_baseFile","_ZCP_baseClasses",
"_ZCP_lastOwnerChange","_proximityList","_ZCP_baseObjects","_theFlagPos","_theFlagX","_theFlagY","_XChange","_YChange",
"_ZCP_currentCapper","_ZCP_previousCapper","_ZCP_currentGroup","_ZCP_wasContested","_finishText",
"_ZCP_ContestStartTime","_ZCP_index","_capturePosition","_randomTime","_changedReward","_ZCP_Halfway","_ZCP_min"
];

_randomTime = (floor random  ZCP_MaxWaitTime) + ZCP_MinWaitTime ;

_capturePosition = [0,0,0];
_ZCP_name = _this select 0;
_ZCP_index = _this select 4;

uiSleep _randomTime;

diag_log text format ["[ZCP]: Waiting for %1 players to be online.",ZCP_Minimum_Online_Players];
waitUntil { uiSleep 60; count( playableUnits ) > ( ZCP_Minimum_Online_Players - 1 ) };
diag_log text format ["[ZCP]: %1 players reached, starting %2.",ZCP_Minimum_Online_Players, _ZCP_name];

_capturePosition = [0,0,0];
_ZCP_name = _this select 0;
_ZCP_index = _this select 4;

if(_this select 6)then{
	_capturePosition = _this select 1;
	diag_log text format ["[ZCP]: %1 :Spawning static on %2",_ZCP_name,_capturePosition];
}else{
	_capturePosition = [10] call ZCP_fnc_findPosition;
	diag_log text format ["[ZCP]: %1 :Spawning dynamic on %2",_ZCP_name,_capturePosition];
};

_ZCP_baseFile = format["x\addons\ZCP\capbases\%1",(ZCP_CapBases call BIS_fnc_selectRandom)];
_ZCP_baseClasses = call compile preprocessFileLineNumbers _ZCP_baseFile;
_ZCP_baseObjects = [];
_theFlagPos = (_ZCP_baseClasses select 0) select 1;
_theFlagX = _theFlagPos select 0;
_theFlagY = _theFlagPos select 1;
_XChange = _capturePosition select 0;
_YChange = _capturePosition select 1;
_this set [1,_capturePosition];

_ZCP_baseObjects = _ZCP_baseClasses call ZCP_fnc_createBase;
if(_this select 5) then {
	[_capturePosition] call ZCP_fnc_spawnAI;
};

if(count _ZCP_baseObjects != 0)then{

	ZCP_Bases set [_ZCP_index , _ZCP_baseObjects];
	PV_ZCP_zupastic = ["ZCP",[format["%1 capbase set up. Capture for %2 min!",_ZCP_name, (ZCP_CapTime / 60)]],"ZCP_Init"];
	publicVariable "PV_ZCP_zupastic";

	_ZCP_changedOwner = true;
	_ZCP_currentCapper = objNull;
	_ZCP_previousCapper = objNull;
	_ZCP_currentGroup = objNull;
	_ZCP_ContestStartTime = 0;
	_ZCP_wasContested = false;
	_ZCP_continue = true;
	_ZCP_Halfway = false;
	_ZCP_min = false;

	_ZCP_CapStartTime = 0;
	_ZCP_ContestStartTime = 0;
	_ZCP_ContestEndTime = 0;
	_ZCP_ContestTotalTime = 0;

	_ZCP_needReset = false;

	_this spawn ZCP_fnc_keepMarker;

	while{_ZCP_continue}do{
			_proximityList = [];
			{
				if(isPlayer _x && alive _x)then{
					_nil =  _proximityList pushBack _x;
				};
			}count (_capturePosition nearEntities["CAManBase",ZCP_CapRadius]);

			if(count(_proximityList) == 0) then{

				// no one inside so reset everything
				if(_ZCP_needReset) then {
					_ZCP_isCapping = false;
					_ZCP_currentCapper = objNull;
					_ZCP_previousCapper = objNull;
					_ZCP_currentGroup = grpNull;
					(ZCP_Data select _ZCP_index) set[1,0];
					_ZCP_wasContested = false;
					_ZCP_isCapping = false;
					_ZCP_Halfway = false;
					_ZCP_min = false;
					_ZCP_CapStartTime = 0;
					_ZCP_needReset = false;
					_ZCP_isContested = false;
					_ZCP_wasContested = false;
				}
			}else{
				// people inside so capping! maybe contested??
				_ZCP_isCapping = true;
				_ZCP_needReset = true;
				if(_ZCP_previousCapper in _proximityList)then{
					_ZCP_currentCapper = _ZCP_previousCapper;
					(ZCP_Data select _ZCP_index) set[1,1]; // to set market to capping
				}else{
					_ZCP_wasContested = false;
					_ZCP_isContested = false;
					_ZCP_Halfway = false;
					_ZCP_min = false;
					_ZCP_currentCapper = _proximityList select 0;
					_ZCP_CapStartTime = diag_tickTime;
					_ZCP_ContestStartTime = 0;
					_ZCP_ContestEndTime = 0;
					_ZCP_ContestTotalTime = 0;

					(ZCP_Data select _ZCP_index) set[1,1];

					_capperName = 'A player';
					if(ZCP_UseSpecificNamesForCappers) then {
						_capperName = name _ZCP_currentCapper;
					};

					PV_ZCP_zupastic = ["ZCP",[format["%2 is capping %1. %3m left.",_ZCP_name,_capperName,(ZCP_CapTime / 60)]],'ZCP_Capping'];


					publicVariable "PV_ZCP_zupastic";
				};

				// to set the market to contested.
				_ZCP_currentGroup = group _ZCP_currentCapper;
				_ZCP_isContested = false;
				{
					if( _x != _ZCP_currentCapper)then{
						if( _ZCP_currentGroup ==  grpNull || group _x != _ZCP_currentGroup)then{
							(ZCP_Data select _ZCP_index) set[1,2];
							_ZCP_isContested = true;
						};
					};
				}count _proximityList;
				// marker stop

				// Set contest start timer
				if(!_ZCP_wasContested && _ZCP_isContested)then{
					_ZCP_ContestStartTime = diag_tickTime;
					_ZCP_wasContested = true;
				};

				// set contest end timer
				if(!_ZCP_isContested && _ZCP_wasContested) then {
					_ZCP_ContestEndTime = diag_tickTime;
					_ZCP_ContestTotalTime = _ZCP_ContestTotalTime + (_ZCP_ContestEndTime - _ZCP_ContestStartTime);
				};

				// TSM Wonned #Kappa
				if( !_ZCP_isContested && (diag_tickTime - _ZCP_ContestTotalTime - _ZCP_CapStartTime >  ZCP_CapTime ) ) then {
						_ZCP_continue = false;
						//Capper Won, loop will break
				};

				// only when not contested
				if (!_ZCP_isContested) then {
					// 50% mark
					if(!_ZCP_Halfway && _ZCP_CapStartTime != 0 && (diag_tickTime - _ZCP_ContestTotalTime - _ZCP_CapStartTime) >  (ZCP_CapTime / 2))then{
						_capperName = 'A player';
						if(ZCP_UseSpecificNamesForCappers) then {
							_capperName = name _ZCP_currentCapper;
						};
						PV_ZCP_zupastic = ["ZCP",[format["%1 is 50%4 captured by %2. %3min left",_ZCP_name,_capperName,(ZCP_CapTime / 2 / 60),"%"]], 'ZCP_Capping'];
						publicVariable "PV_ZCP_zupastic";
						_ZCP_Halfway = true;
					};

					// 1 min mark
					if(!_ZCP_min && _ZCP_CapStartTime != 0 && (diag_tickTime - _ZCP_ContestTotalTime - _ZCP_CapStartTime) >  (ZCP_CapTime - 60))then{
						_capperName = 'A player';
						if(ZCP_UseSpecificNamesForCappers) then {
							_capperName = name _ZCP_currentCapper;
						};
						PV_ZCP_zupastic = ["ZCP",[format["%1 is almost captured by %2. 60s left.",_ZCP_name,_capperName]], 'ZCP_Capping'];
						publicVariable "PV_ZCP_zupastic";
						_ZCP_min = true;
					};
				} else {
					_ZCP_wasContested = true;
				};

				_ZCP_previousCapper = _ZCP_currentCapper;
			};
		uiSleep 1;
	};

  _finishText = '';

	if(ZCP_CleanupBase)then{
				if(ZCP_CleanupBaseWithAIBomber)then{
					_finishText = format ['Bombing in %1s.',ZCP_BaseCleanupDelay];
				}else{
					_finishText = format ['Cleanup in %1s.',ZCP_BaseCleanupDelay];
				};
	};

	PV_ZCP_zupastic = ["ZCP",[format["%1 is captured. %2.",_ZCP_name,_finishText]], 'ZCP_Capped'];
	publicVariable "PV_ZCP_zupastic";
	[_ZCP_currentCapper,_ZCP_name,_capturePosition,_this select 2] call ZCP_fnc_giveReward;
	(ZCP_Data select _ZCP_index) set[0,false];
	(ZCP_Data select _ZCP_index) set[1,0];
	ZCP_MissionCounter = ZCP_MissionCounter - 1;
	diag_log format["[ZCP]: %1 will be cleaned up in %2s and ended.",_ZCP_name, ZCP_BaseCleanupDelay];
	[] spawn ZCP_fnc_missionLooper;
	if(ZCP_CleanupBase)then{
        uiSleep ZCP_BaseCleanupDelay;
        if(ZCP_CleanupBaseWithAIBomber)then{
            _ZCP_baseObjects call ZCP_fnc_airstrike;
        }else{
            _ZCP_baseObjects call ZCP_fnc_cleanupBase;
        };
	};
}else{
	diag_log format["[ZCP]: No correct Basefile found for %1", _ZCP_name];
};