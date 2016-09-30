/**
 * ExileClient_gui_FamilylockerDialog_show
 */
 
private["_lockerTitle","_dialog","_lockerAmount","_lockerLimit","_depositInput","_withdrawInput","_lockerAmountLabel","_inventoryAmount","_inventoryAmountString","_inventoryAmountLabel"];
disableSerialization;
createDialog "RscExileLockerDialog";
_dialog = uiNameSpace getVariable ["RscExileLockerDialog", displayNull];
_lockerAmount = [(player getVariable ["ExileLocker", 0])] call BIS_fnc_numberText;
_lockerLimit = [(getNumber(missionConfigFile >> "CfgLocker" >> "maxFamilyDeposit"))] call BIS_fnc_numberText;
_lockerTitle = _dialog displayCtrl 1001;
_lockerTitle ctrlSetText "Family Bank";
_depositInput = _dialog displayCtrl 4006;
_depositInput ctrlSetText "";
_withdrawInput = _dialog displayCtrl 4005;
_withdrawInput ctrlSetText "";
_lockerAmountLabel = _dialog displayCtrl 4000;
_lockerAmountLabel ctrlSetStructuredText (parseText format["<t size='1.4'>%1 / %2 <img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' /></t>", _lockerAmount, _lockerLimit]);
_inventoryAmount = player getVariable ["ExileMoney", 0];
_inventoryAmountString = _inventoryAmount call ExileClient_util_string_exponentToString;
_inventoryAmountLabel = _dialog displayCtrl 4001;
_inventoryAmountLabel ctrlSetStructuredText (parseText format["<t size='1.4'>%1 <img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' /></t>", _inventoryAmountString]);
true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
true