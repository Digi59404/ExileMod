/**
 * ExileClient_gui_upgradeTerritoryDialog_event_onTerritoryDropDownSelectionChanged
 */
 
private["_display","_territoryDropDown","_index","_flagObject","_level","_territoryConfig","_territoryLevels","_territoryPrice","_territoryRange","_costControl","_radiusControl","_levelControl","_upgradeButton","_territoryRespect"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileUpgradeTerritoryDialog", displayNull];
_territoryDropDown = _this select 0;
_index = _this select 1;
_flagObject = objectFromNetId (_territoryDropDown lbData _index);
_level = _flagObject getVariable ["ExileTerritoryLevel", 1];
_territoryConfig = getArray(missionConfigFile >> "CfgTerritories" >> "Prices");
_territoryLevels = count _territoryConfig;
if((_level + 1) > _territoryLevels)then
{
	_territoryPrice = (_territoryConfig select (_territoryLevels - 1)) select 0;
	_territoryRange = (_territoryConfig select (_territoryLevels - 1)) select 1;
	_territoryRespect = (_territoryConfig select (_territoryLevels - 1)) select 3;
}
else
{
	_territoryPrice = (_territoryConfig select _level) select 0;
	_territoryRange = (_territoryConfig select _level) select 1;	
	_territoryRespect = (_territoryConfig select _level) select 3;	
};
_costControl = _display displayCtrl 4002;
_costControl ctrlSetStructuredText(parseText format["<t size='1.4'>%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' />  + %2 Respect</t>", _territoryPrice,_territoryRespect]);
_radiusControl = _display displayCtrl 4003;
_radiusControl ctrlSetStructuredText parseText format ["<t size='1.4'>%1m</t>",_territoryRange];
_levelControl = _display displayCtrl 4004;
_levelControl ctrlSetStructuredText parseText format ["<t size='1.4'>%1/%2</t>",_level + 1,_territoryLevels];
_upgradeButton = _display displayCtrl 4001;
_upgradeButton ctrlEnable true;