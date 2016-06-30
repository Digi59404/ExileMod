switch(toLower worldName)do{
	case "altis":{
		diag_log "Loading Altis Custom Buildings";
		call compile preprocessFileLineNumbers "x\addons\a3_epoch_server_building\buildings\Altis\traders.sqf";
		call compile preprocessFileLineNumbers "x\addons\a3_epoch_server_building\buildings\Altis\roadblock.sqf";
	};
	case "bornholm":{
		diag_log "Loading Bornholm Custom Buildings";
		call compile preprocessFileLineNumbers "x\addons\a3_epoch_server_building\buildings\Bornholm\traders.sqf";
	};
	case "chernarus":{
		diag_log "Loading Chernarus Custom Buildings";
		call compile preprocessFileLineNumbers "x\addons\a3_epoch_server_building\buildings\Chernarus\traders.sqf";
		call compile preprocessFileLineNumbers "x\addons\a3_epoch_server_building\buildings\Chernarus\water.sqf";
		call compile preprocessFileLineNumbers "x\addons\a3_epoch_server_building\buildings\Chernarus\millitary.sqf";
		call compile preprocessFileLineNumbers "x\addons\a3_epoch_server_building\buildings\Chernarus\bor.sqf";
	};
	case "panthera3":{
		diag_log "Loading Panthera Custom Buildings";
		call compile preprocessFileLineNumbers "x\addons\a3_epoch_server_building\buildings\Panthera\traders.sqf";
	};
};