if !((vehicle player) isEqualTo player) exitWith {};
if (!("ItemRadio" in (items player) || "ItemRadio" in (assigneditems player))) then { ['You need a radio to deploy a bike !',0,0.6,2,0] spawn bis_fnc_dynamictext;};

if (ExileClientPlayerMoney > 500) then {
    titleText ["", "PLAIN DOWN"];
    player playActionNow "Medic";
    _spawnPos = player modelToWorld [0,2,0];
    _spawnDir = (getDir player) -90;
    do_MakeBike = [player, _spawnPos, _spawnDir];
    player unlinkItem "ItemRadio";
    uiSleep 3;
    publicVariableServer "do_MakeBike";
    uiSleep 1;
    ['BIKE DEPLOYED, RADIO REMOVED !',0,0.6,2,0] spawn bis_fnc_dynamictext;
};