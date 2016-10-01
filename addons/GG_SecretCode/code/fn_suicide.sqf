if (handgunWeapon player == "") exitWith {hint "You need a handgun to suicide!";};

_animation = ["GestureExileSuicide01","GestureExileSuicide02"] call BIS_fnc_selectRandom; 

player switchMove "STAND";
player selectWeapon handgunWeapon player;
sleep 2;
player playActionNow _animation;

if (_animation == "GestureExileSuicide01") then { sleep 5; }; 
if (_animation == "GestureExileSuicide02") then { sleep 5.5; }; 

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "sounds\gunShot.ogg";
playSound3D [_soundToPlay, _sourceObject, false, getPosASL player, 10, 1, 100]; 

player setHitPointDamage ["hitHead", 1];
player allowDamage true;
player setDamage 1;