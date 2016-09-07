/*
*  Ported From Wasteland
*  Author: ContractCoders.net
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/

showmarkers = true;
while {showmarkers} do
{
    {
        _friendlyCount = 0;
        _enemyCount = 0;
        {
            if (isPlayer _x && alive _x) then
            {
                if (group _x isEqualTo group player) then
                {
                    _friendlyCount = _friendlyCount + 1;
                }
                else
                {
                    _enemyCount = _enemyCount + 1;
                };
            };
        } forEach playableUnits;
 
        if (_enemyCount > 0) then
        {
            if (_friendlyCount > 0) then
            {
                [_forEachIndex, "MIXED", false] call _setStatus;
            }
            else
            {
                [_forEachIndex, "ENEMY", false] call _setStatus;
            };
        }
        else
        {
            if (_friendlyCount > 0) then
            {
                [_forEachIndex, "FRIENDLY", false] call _setStatus;
            }
            else
            {
                [_forEachIndex, "EMPTY", false] call _setStatus;
            };
        };
    } forEach _gunStores;
    sleep 1;
};