/*
	ANTI CAMPING SAFEZONES
	BY GR8
	v2.1
*/
 
private["_vehicle"];
if (!isNil "Gr8timer") then { terminate Gr8timer; };
if (!isNil "ExileSafeZoneFiredEH") then { player removeEventHandler ["Fired",ExileSafeZoneFiredEH]; };

["SafezoneEnter"] call ExileClient_gui_notification_event_addNotification;
["Whoops",["All vehicles inside safezones will be deleted after restart."]] call ExileClient_gui_notification_event_addNotification;

ExilePlayerInSafezone = true;
ExileClientSafeZoneESPEventHandler = addMissionEventHandler ["Draw3D", {20 call ExileClient_gui_safezone_safeESP}];
ExileSafeZoneFiredEH = player addEventHandler ["Fired", {_this call ExileClient_gui_safezone_fired}];
player allowDamage false;
player removeAllEventHandlers "HandleDamage";
_vehicle = vehicle player;
if !(_vehicle isEqualTo player) then 
{
	if (local _vehicle) then 
	{
		_vehicle allowDamage false;
	};
	_attachedObjects = attachedObjects _vehicle;
	if !(_attachedObjects isEqualTo []) then 
	{
		_position = getPosATL _vehicle;
		{
			detach _x;
			_x setPosATL [(_position select 0) + random 2, (_position select 1) + random 2, 0.05];
			_x setDir (random 260);
		}
		forEach _attachedObjects;
	};
	ExileClientSafeZoneVehicle = _vehicle;
	ExileClientSafeZoneVehicleFiredEventHandler = _vehicle addEventHandler ["Fired", {_this call ExileClient_object_player_event_onFiredSafeZoneVehicle}];
};
// By Gr8
true