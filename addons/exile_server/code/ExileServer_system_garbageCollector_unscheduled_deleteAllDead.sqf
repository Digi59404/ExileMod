/**
 * ExileServer_system_garbageCollector_unscheduled_deleteAllDead
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_lifeTime","_diedAt"];
_lifeTime = 60 * getNumber (configFile >> "CfgSettings" >> "GarbageCollector" >> "Ingame" >> "AllDead" >> "lifeTime");
{
	_diedAt = _x getVariable ["ExileDiedAt", -1];
	if (_diedAt isEqualTo -1) then 
	{
		_x setVariable ["ExileDiedAt", time];
	}
	else 
	{
		if ([(position _x), 500] call ExileClient_util_world_isSpawnZoneInRange) then 
		{
		    if ((time - _diedAt) >= 300) then
		    {
		        _x call ExileServer_system_garbageCollector_deleteObject;
		    };
		} else {
		    if ((time - _diedAt) >= _lifeTime) then
		    {
		    	_x call ExileServer_system_garbageCollector_deleteObject;
		    };
		}
	};
}
forEach allDead;