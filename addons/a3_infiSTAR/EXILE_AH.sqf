/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
*/
/* *******************Developer : infiSTAR (infiSTAR23@gmail.com)******************* */
/* **************infiSTAR Copyright�� 2011 - 2015 All rights reserved.************** */
/* *********************************www.infiSTAR.de********************************* */
diag_log format['<infiSTAR.de> %1 - VERSION: 17122015 infiSTAR.de AHAT (v0023)',time];
comment 'Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de - License: (CC)';
UPDATEEMAIL='psychotic_closure@hotmail.com';
INFISTARVERSION='17122015-(v0023)';
_found = false;
diag_log format['<infiSTAR.de> %1 - checking for EXILE_SERVER..',time];
_cfgPatches = configFile >> 'CfgPatches';
for '_i' from 0 to (count _cfgPatches - 1) do
{
	_patchClass = _cfgPatches select _i;
	if(configName _patchClass == 'exile_server')exitWith
	{
		_found = true;
	};
};
if(!_found)exitWith
{
	for '_i' from 0 to 10 do
	{
		diag_log format['<infiSTAR.de> %1 - Could not find EXILE_SERVER, infiSTAR will not start!',time];
	};
};
diag_log format['<infiSTAR.de> %1 - EXILE_SERVER has been found, STARTING',time];
FN_CHECK_CHARACTERS = compileFinal "
	_allowedCharacters = [48,49,50,51,52,53,54,55,56,57,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90];
	_upper = toUpper(_this select [0,10]);
	_array = toArray _upper;
	_tmparray = [];
	{if(_x in _allowedCharacters)then{_tmparray pushBack _x;};} forEach _array;
	toString _tmparray
";
CUSTOM_briefingName = briefingName call FN_CHECK_CHARACTERS;
CUSTOM_worldName = worldName call FN_CHECK_CHARACTERS;
if(_WRITE_TXT_LOG_FILES)then
{
	FN_CALL_LOG_DLL = compileFinal "
		'ARMA_LOG' callExtension format['%1_%2_%3',briefingName select [0,10],worldName select [0,10],_this];
	";
}
else
{
	FN_CALL_LOG_DLL = compileFinal "
		diag_log format['%1_%2_%3',briefingName select [0,10],worldName select [0,10],_this];
	";
};
FN_CALL_BAN_DLL = compileFinal "
	'ARMA_BAN' callExtension format[':%1',_this];
";
FN_CALL_LOAD_DLL = compileFinal "
	'ARMA_LOAD' callExtension _this
";
FNC_A3_LOG_RAND_VAR = compileFinal "
	format['A3_RANDOMVAR_LOG:%1 (v0023)',_this] call FN_CALL_LOG_DLL;
	diag_log ('<infiSTAR.de>RandomVarLog| '+_this+' (v0023)');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de_RAND_VAR'] call MAR_fnc_log;};
";
FNC_A3_HACKLOG = compileFinal "
	format['A3_HACKLOG:%1 [FPS: %2|SERVERTHREADS: %3] (v0023)',_this,diag_fps,count diag_activeSQFScripts] call FN_CALL_LOG_DLL;
	diag_log ('<infiSTAR.de>HL| '+_this+' (v0023)');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de_HACKLOG'] call MAR_fnc_log;};
";
FNC_A3_SURVEILLANCELOG = compileFinal "
	format['A3_SURVEILLANCELOG:%1 [FPS: %2|SERVERTHREADS: %3] (v0023)',_this,diag_fps,count diag_activeSQFScripts] call FN_CALL_LOG_DLL;
	diag_log ('<infiSTAR.de>SL| '+_this+' (v0023)');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de_SURVEILLANCELOG'] call MAR_fnc_log;};
";
FNC_A3_ADMINLOG = compileFinal "
	format['A3_ADMINLOG:%1 (v0023)',_this] call FN_CALL_LOG_DLL;
	diag_log ('<infiSTAR.de>AdminLog| '+_this+' (v0023)');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de__ADMINLOG'] call MAR_fnc_log;};
";
FNC_A3_CUSTOMLOG = compileFinal "
	format['A3_%1:%2 [FPS: %3|SERVERTHREADS: %4] (v0023)',_this select 0,_this select 1,diag_fps,count diag_activeSQFScripts] call FN_CALL_LOG_DLL;
	diag_log format['<infiSTAR.de>%1| %2 (v0023)',_this select 0,_this select 1];
	if(!isNil'MAR_fnc_log')then{[_this select 1,format['infiSTAR.de_%1',_this select 0]] call MAR_fnc_log;};
";
FNC_A3_CONNECTLOG = compileFinal "
	format['A3_CONNECTLOG:%1 (v0023)',_this] call FN_CALL_LOG_DLL;
	diag_log format['<infiSTAR.de>ConnectLog| %1 (v0023)',_this];
";
FNC_A3_TOKENLOG = compileFinal "
	format['A3_TOKENLOG:%1 (v0023)',_this] call FN_CALL_LOG_DLL;
	diag_log ('<infiSTAR.de>TokenLog| '+_this+' (v0023)');
";
FNC_A3_RESOLVESTEAMNAMELOG = compileFinal "
	format['A3_RESOLVESTEAMNAMELOG:%1 (v0023)',_this] call FN_CALL_LOG_DLL;
	diag_log ('<infiSTAR.de>ResolveSteamName| '+_this+' (v0023)');
	if(!isNil'MAR_fnc_log')then{[_this,'infiSTAR.de_RESOLVESTEAMNAMELOG'] call MAR_fnc_log;};
";
_allowTPArray = [];_allowTPArray = _allowTP;
_allRandomGenVars = [];
_counts = [];
{
	_counts pushBack (count _x);
} forEach (allVariables missionnamespace);
_num = 0;
{
	_num = _num + _x;
} forEach _counts;
_count = count _counts;
_average = ceil(_num / _count);
_randminval = (_average/3);
_randmaxval = (_average/1.5);
_fnc_RandomGen =
{
	_fnc_actualGen = {
		_abc = ['z','y','x','w','v','u','t','s','r','q','p','o','n','m','l','k','j','i','h','g','f','e','d','c','b','a'];
		_gen = _abc select (random ((count _abc)-1));
		_arr = ['G','R','I','i','C','o','B','E','s','Q','Y','A','m','G','W','B','Y','v','z','C','1','J','O','7','U','r','7','r','v','b'];
		_arrL = count _arr;_arrL = _arrL - 1;
		_randmax = {((round(random _randminval)) + (round(random _randmaxval))) max _randminval};
		for '_i' from 0 to (call _randmax)do
		{
			_gen = _gen + str(ceil(random 9)) + (_arr select (floor(random _arrL)));
		};
	};
	_gen = '';
	while{_gen=='' || _gen in _allRandomGenVars}do{
		call _fnc_actualGen;
	};
	_allRandomGenVars pushBack _gen;
	_gen
};diag_log format['<infiSTAR.de> _fnc_RandomGen: %1',_fnc_RandomGen];
format['----START-LINE----   (%1)',INFISTARVERSION] call FNC_A3_LOG_RAND_VAR;
_FNC_AH_KICKLOG = call _fnc_RandomGen;format['_FNC_AH_KICKLOG: %1',_FNC_AH_KICKLOG] call FNC_A3_LOG_RAND_VAR;
_FNC_AH_KICKLOGSPAWN = call _fnc_RandomGen;format['_FNC_AH_KICKLOGSPAWN: %1',_FNC_AH_KICKLOGSPAWN] call FNC_A3_LOG_RAND_VAR;
_tokenvar = call _fnc_RandomGen;format['_tokenvar: %1',_tokenvar] call FNC_A3_LOG_RAND_VAR;
_replaceOnCD = call _fnc_RandomGen;format['_replaceOnCD: %1',_replaceOnCD] call FNC_A3_LOG_RAND_VAR;
_onPlayerConnected = call _fnc_RandomGen;format['_onPlayerConnected: %1',_onPlayerConnected] call FNC_A3_LOG_RAND_VAR;
_server_setTokenR = call _fnc_RandomGen;format['_server_setTokenR: %1',_server_setTokenR] call FNC_A3_LOG_RAND_VAR;
_FN_INJECT_ON_CLIENT = call _fnc_RandomGen;format['_FN_INJECT_ON_CLIENT: %1',_FN_INJECT_ON_CLIENT] call FNC_A3_LOG_RAND_VAR;
_fnc_pvc_token = call _fnc_RandomGen;format['_fnc_pvc_token: %1',_fnc_pvc_token] call FNC_A3_LOG_RAND_VAR;
_server_checkTokenR = call _fnc_RandomGen;format['_server_checkTokenR: %1',_server_checkTokenR] call FNC_A3_LOG_RAND_VAR;
_TokenCT = call _fnc_RandomGen;format['_TokenCT: %1',_TokenCT] call FNC_A3_LOG_RAND_VAR;
_adminStartupCode = call _fnc_RandomGen;format['_adminStartupCode: %1',_adminStartupCode] call FNC_A3_LOG_RAND_VAR;
_AHKickOFF = call _fnc_RandomGen;format['_AHKickOFF: %1',_AHKickOFF] call FNC_A3_LOG_RAND_VAR;
_AHKickLog = call _fnc_RandomGen;format['_AHKickLog: %1',_AHKickLog] call FNC_A3_LOG_RAND_VAR;
_AH_RunCheckENDVAR = call _fnc_RandomGen;format['_AH_RunCheckENDVAR: %1',_AH_RunCheckENDVAR] call FNC_A3_LOG_RAND_VAR;
_AH_RunCheck = call _fnc_RandomGen;format['_AH_RunCheck: %1',_AH_RunCheck] call FNC_A3_LOG_RAND_VAR;
_AH_HackLogArrayRND = call _fnc_RandomGen;format['_AH_HackLogArrayRND: %1',_AH_HackLogArrayRND] call FNC_A3_LOG_RAND_VAR;
_AH_SurvLogArrayRND = call _fnc_RandomGen;format['_AH_SurvLogArrayRND: %1',_AH_SurvLogArrayRND] call FNC_A3_LOG_RAND_VAR;
_AH_AdmiLogArrayRND = call _fnc_RandomGen;format['_AH_AdmiLogArrayRND: %1',_AH_AdmiLogArrayRND] call FNC_A3_LOG_RAND_VAR;
_TMPBAN = call _fnc_RandomGen;format['_TMPBAN: %1',_TMPBAN] call FNC_A3_LOG_RAND_VAR;
_AHpos = call _fnc_RandomGen;format['_AHpos: %1',_AHpos] call FNC_A3_LOG_RAND_VAR;
_adminsA = call _fnc_RandomGen;format['_adminsA: %1',_adminsA] call FNC_A3_LOG_RAND_VAR;
_MCS = call _fnc_RandomGen;format['_MCS: %1',_MCS] call FNC_A3_LOG_RAND_VAR;
_vartc = call _fnc_RandomGen;format['_vartc: %1',_vartc] call FNC_A3_LOG_RAND_VAR;
_LogicVariable = call _fnc_RandomGen;format['_LogicVariable: %1',_LogicVariable] call FNC_A3_LOG_RAND_VAR;
_vehicle_needs_check = call _fnc_RandomGen;format['_vehicle_needs_check: %1',_vehicle_needs_check] call FNC_A3_LOG_RAND_VAR;
_t1 = call _fnc_RandomGen;format['_t1: %1',_t1] call FNC_A3_LOG_RAND_VAR;
_t2 = call _fnc_RandomGen;format['_t2: %1',_t2] call FNC_A3_LOG_RAND_VAR;
_t3 = call _fnc_RandomGen;format['_t3: %1',_t3] call FNC_A3_LOG_RAND_VAR;
_t4 = call _fnc_RandomGen;format['_t4: %1',_t4] call FNC_A3_LOG_RAND_VAR;
_t5 = call _fnc_RandomGen;format['_t5: %1',_t5] call FNC_A3_LOG_RAND_VAR;
_t6 = call _fnc_RandomGen;format['_t6: %1',_t6] call FNC_A3_LOG_RAND_VAR;
format['----END-LINE----   (%1)',INFISTARVERSION] call FNC_A3_LOG_RAND_VAR;
_KK_fnc_arrayShuffle = {
	private '_cnt';
	_cnt = count _this;
	for '_i' from 1 to _cnt do {
		_this pushBack (_this deleteAt floor random _cnt);
	};
	_this
};
_allRandomGenVars call _KK_fnc_arrayShuffle;
diag_log format['<infiSTAR.de> %1 - loading AntiHack..',time];
_verybadStringsOLD =
[
	'menu loaded','rustler','hangender','hungender',
	'douggem','monstercheats','fireworks','antiantihack',
	'jxmxe','hydroxus','kill target','no recoil','rapid fire','explode all','teleportall',
	'destroyall','destroy all','g-e-f','box-esp','god on','god mode','unlimited mags',
	'ctrlcreate','_execscript','_theban','rhynov1','b1g_b3n','infishit',
	'e_x_t_a_s_y','jjjj','weppp3','att4chm3nt','f0od_dr1nk','m3d1c4l','t0ol_it3ms','b4ckp4cks',
	'it3m5','cl0th1ng','lystic','extasy','glasssimon_flo','remote_execution','gladtwoown','_pathtoscripts',
	'flo_simon','sonicccc_','fury_','phoenix_','_my_new_bullet_man','_jm3','disablecollisionwith _bullet',
	'thirtysix','dmc_fnc_4danews','w_o_o_k_i_e_m_e_n_u','xbowbii_','jm3_','wuat','menutest_','listening to jack',
	'dmcheats.de','kichdm','_news_banner','fucked up','lystics menu','rsccombo_2100','\dll\datmalloc','rsclistbox_1501',
	'rsclistbox_1500','\dll\tcmalloc_bi','___newbpass','updated_playerlist','recking_ki','gg_ee_ff','ggggg_eeeee_fffff',
	'gggg_eeee_ffff','mord all','teleport all','__byass','_altislifeh4x','antifrezze','ownscripts','ownscripted','mesnu',
	'mystic_','init re','init life re','spoody','gef_','throx_','_adasaasasa','_dsfnsjf','cheatmenu','in54nity','markad','fuck_me_','_v4fin',
	'a3randvar','infinite ammo','player markers','+ _code +'
];
_verybadStrings =
[
	'menu loaded','kill target','no recoil','rapid fire','explode all','teleportall',
	'destroyall','destroy all','g-e-f','box-esp','god on','god mode','unlimited mags',
	'infishit','cheatmenu','in54nity','infinite ammo','player markers'
];
_tmp_blacklistedVariables = _blacklistedVariables;
_blacklistedVariables =
[
	'BIS_fnc_dbg_reminder_value','BIS_fnc_dbg_reminder','BIS_MENU_GroupCommunication',
	'rscspectator','rscspectator_hints','rscspectator_display','rscspectator_playericon',
	'rscspectator_view','rscspectator_map','rscspectator_vision','rscspectator_keys',
	'rscspectator_interface'
];
_blacklistedVariables append [
	'time','serverTime','myplayeruid','hhahaaaaar','CharlieSheenkeybinds','KickOFF','yolo','runonce','notakeybind','action1','Supa_Licenses','autokick','wallaisseikun','MainMenu',
	'GEFClose','GEFWhite','GEFRed','GEFGreen','GEFCyan','FirstHint','new_queued','fn_Exec','FND_fnc_select','fnx3','ANTIHACKKICK','tele','dmap','GOLDENS_GLOBAL_SHIT_YEAH','GLASS911_Run',
	'gearDialog_create','lystoKeypress','ThirtySix','LY_SwaggerLikeUs','Jkeyszz','n2','boxofmagic','MainScripts','DMC_fnc_4danews','INFISTARBYPASS','EXEC_TEXT','vehicle_dblclick','init_main',
	'ESP_Count','Nute_Dat_Bomber','s_cash100k','XposPlayer','ly_re_onetime','SKAR_checkA','MainScriptsV4','ViewDistance','check_load','already_load','meins','f1','Dummy','Plane_Jump',
	'c_player','MouseClickEH','distp','nec2','Menu_I_Run_Color_LP','GLASSv1nce_BindHandler','thecar','FastAnimes','GetinPassenger','iaimon','DMC_Re_onetime','func_execOnServer','fnc_serverKickNice',
	'Kick_Admins','DASMOKEON','hovering','r_kelly_be_flying','VinceLOL_ALTISLIFE','life_fnc_byassSkaroAH','AH_fnc_MP','jayRE','fn_newsbanner','Hack_News','TrollFuncs',
	'Fanatic_InfiPass','keybindings_xxx','AndysClosed','UserFuncs','AltisFuncs','RemExe','BB_nofatigue','bis_fnc_diagkey_var_code','First_PAGE','Get_in_D','i_t_s__m_e_o','smissles','Whippy_ESP',
	'TargetFuncs2','life_fnc_antiFreeeeze','LY_keyForward','TY_re_onetime','life_fnc_XaAxAA','mein1','GodDamnVehiclesXD','Mystic_FNC_ESP_distance','Esp_Id_setter','DummyMen','whipbut','UserFuncs',
	'KrohdoFreedom','selectedPlayer','Lmenu1','ggplayer','throx_menu_item','lvl1','Init_Menu_Slew','D_B_R_T_Y_Slew','V6_GEF','xasfjisisafudmmyx','kekse','UPDATED_RE_36','first','second',
	'SNI_PRZ_ZZZ_TargetPlayer','healit','O_fnc_ArmA','MLRN_EXEC','running_threads','catchemall4093'
];

if(!isNil'_tmp_blacklistedVariables')then
{
	if(typeName _tmp_blacklistedVariables isEqualTo 'ARRAY')then
	{
		_blacklistedVariables append _tmp_blacklistedVariables;
	};
};

_blacklistedAdminVariables =
[
	'AH_HackLogArray','AH_SurvLogArray','AH_AdmiLogArray',
	'fnc_infiAdminKeyDown','MAIN_DISPLAY_ID','fnc_Disconnect_selected','fnc_adminLog','go_in_nearestvehicle_callmevar','noRecoilRun',
	'FNC_CUSTOM_fn_loadInventory','ADMIN_LOCAL_MARKER','ALLOW_ME_THIS_KEYBIND','freeFlightCam','fnc_ButtonClick_44466','fnc_LBSelChanged_LEFT','unlimAmmRun',
	'fnc_infiSTAR_A3noRecoil','VEHBOOST_FUNCTION','fnc_infiSTAR_get_LeftClicks','fnc_AdminReq','infiSTAR_MAIN_CODE'
];
_allowedMarkers = ['TreasureMarker','ExilePartyMarker','Death','_USER_DEFINED','[',']'];
_VehicleWhiteListTEMP = _VehicleWhiteList;_VehicleWhiteList = [];{_VehicleWhiteList pushBack (toLower _x);} forEach _VehicleWhiteListTEMP;_VehicleWhiteListTEMP=nil;
_ForbiddenVehiclesTEMP = _ForbiddenVehicles;_ForbiddenVehicles = [];{_ForbiddenVehicles pushBack (toLower _x);} forEach _ForbiddenVehiclesTEMP;_ForbiddenVehiclesTEMP=nil;
if(_UMW)then{_allowedMarkers append _aLocalM;};
FN_GET_SERVERPW = compileFinal format["
	_t = (getText(configfile >> 'CfgSettings' >> 'RCON' >> 'serverPassword'));
	if(_t isEqualTo '')then{_t = '%1'};
	_t
",_serverCommandPassword];
fnc_CompilableString = {
	_input = _this select 0;
	_output = call {
		if(typename _input == 'CODE')exitWith{(str(_input)) select [1,((count(str(_input)))-2)]};
		if(typename _input == 'STRING')exitWith{_input};
		''
	};
	_output
};
fnc_CompilableString = compileFinal ([fnc_CompilableString] call fnc_CompilableString);
publicVariable "fnc_CompilableString";
fnc_getserverTime = compileFinal "
	_hours = floor(time / 60 / 60);
	_minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);
	_seconds = time - (_hours*60*60) - (_minutes * 60);
	format['%1h %2min %3s | ',_hours,_minutes,round _seconds]
";
FN_GET_OBJ_BY_OWNER = compileFinal "
	_playerObj = objNull;{if(owner _x isEqualTo _owner)exitWith{_playerObj=_x};} forEach allPlayers;_playerObj
";
FN_infiSTAR_CS = compileFinal "_this remoteExecCall ['fnc_AdminReq', 2, false]";publicVariable"FN_infiSTAR_CS";
FN_infiSTAR_F = compileFinal "missionNameSpace setVariable[(_this select 0),compileFinal(_this select 1)]";publicVariable"FN_infiSTAR_F";
FN_infiSTAR_C = compileFinal "(_this select 0) call (_this select 1)";publicVariable"FN_infiSTAR_C";
FN_infiSTAR_S = compileFinal "
params [['_input',''],['_code',{}],['_id',-5],['_jip',false]];
if(_id isEqualTo -5)exitWith{
	diag_log format['<infiSTAR.de> FN_infiSTAR_S _input: %1',_input];
	diag_log format['<infiSTAR.de> FN_infiSTAR_S _code: %1',_code];
	diag_log format['<infiSTAR.de> FN_infiSTAR_S _jip: %1',_jip];
};
if(typename _code isEqualTo 'STRING')then{_code=compile _code;};
[_input,_code] remoteExecCall ['FN_infiSTAR_C',_id,_jip];
";
fnc_call_ARMALOAD = compileFinal "
	private['_option','_input','_url','_packet1','_jobid','_packet2','_res','_timeout'];
	_option = _this select 0;
	_input = _this select 1;
	_url = _this select 2;
	
	_packet1 = format['getasync%1%2%1',toString [10],_url];
	_jobid = _packet1 call FN_CALL_LOAD_DLL;
	_packet2 = format['response%1%2%1',toString [10],_jobid];
	_timeout = diag_tickTime + 80;
	_res = 'WAIT';
	_bad = ['','WAIT','ERROR','URLERROR'];
	waitUntil{
		uiSleep 3;
		_res = _packet2 call FN_CALL_LOAD_DLL;
		(!(_res in _bad) && ((toLower _res) find 'wrapper is disabled' isEqualTo -1)) || diag_tickTime > _timeout
	};
	if(_res in _bad)exitWith{};if((toLower _res) find 'wrapper is disabled' != -1)exitWith{};
	if(_option == 0)exitWith
	{
		if(isNil'ARMALOAD_urlARRAY')then{ARMALOAD_urlARRAY=[];};
		if(_url in ARMALOAD_urlARRAY)exitWith{diag_log '<infiSTAR.de> terminated double LOAD call';};
		ARMALOAD_urlARRAY pushBack _url;
		
		private['_name','_puid','_clientID'];
		_name = _input select 0;
		_puid = _input select 1;
		missionNameSpace setVariable[format['STEAM_NAME_%1',_puid],_res];
		
		if(count _input == 3)then
		{
			_clientID = _input select 2;
			_code = {
				params['_name','_uid',['_steamname','']];
				_log = format['<infiSTAR.de> %1(%2) SteamName is: %3',_name,_uid,_steamname];
				cutText [_log, 'PLAIN DOWN'];
				hint _log;
				systemchat _log;
				diag_log _log;
			};
			[[_name,_puid,_res],_code,_clientID,false] call FN_infiSTAR_S;
			format['%1(%2) is %3',_name,_puid,_res] call FNC_A3_RESOLVESTEAMNAMELOG;
		};
	};
";
fnc_resolveSteamName = compileFinal "
	private['_name','_puid','_clientID','_inputToForward','_steamName'];
	_name = _this select 0;
	_puid = _this select 1;
	_inputToForward = [_name,_puid];
	if(count _this == 3)then
	{
		_clientID = _this select 2;
		_inputToForward = [_name,_puid,_clientID];
	};
	_steamName = missionNameSpace getVariable[format['STEAM_NAME_%1',_puid],''];
	if(_steamName isEqualTo '')then
	{
		if(isNil 'STEAM_NAME_ARRAY_Q')then{STEAM_NAME_ARRAY_Q = [];};
		if!(_puid in STEAM_NAME_ARRAY_Q)then
		{
			STEAM_NAME_ARRAY_Q pushBack _puid;
			if(isNil'STEAM_NAME_URL')then{STEAM_NAME_URL = toString[104,116,116,112,58,47,47,105,110,102,105,115,116,97,114,46,100,101,47,115,116,101,97,109,110,97,109,101,46,112,104,112,63,115,116,101,97,109,117,105,100,61];};
			[0,_inputToForward,(STEAM_NAME_URL+_puid)] spawn fnc_call_ARMALOAD;
		};
	};
	_steamName
";
fnc_getSteamNameIfSaved = compileFinal "
	_steamName = missionNameSpace getVariable[format['STEAM_NAME_%1',_uid],''];
	_steamName
";
fnc_deleteObject = compileFinal "
	_objToDelete = _this;
	if(_objToDelete isKindOf 'Exile_Construction_Flag_Static')exitWith
	{
		_objectID = _objToDelete getVariable ['ExileDatabaseID',-1];
		if(_objectID != -1)then
		{
			_pos = getPosATL _objToDelete;
			_holder = createVehicle ['groundWeaponHolder', _pos, [], 0, 'CAN_COLLIDE'];
			_holder addItemCargoGlobal ['Exile_Item_Flag',1];
			_pos set[2,(_pos select 2)+0.1];
			_holder setPosATL _pos;
			
			_flagID = _objToDelete getVariable ['ExileDatabaseID',0];
			format ['deleteTerritory:%1', _flagID] call ExileServer_system_database_query_fireAndForget;
		};
		deleteVehicle _objToDelete;
	};
	if(isNumber(configFile >> 'CfgVehicles' >> (typeOf _objToDelete) >> 'exileContainer'))exitWith
	{
		_objToDelete call ExileServer_object_container_packContainer;
	};
	if(_objToDelete isKindOf 'Exile_Construction_Abstract_Static')exitWith
	{
		_type = typeOf _objToDelete;
		_pos = getPosATL _objToDelete;
		if!(_objToDelete isKindOf 'Exile_Construction_Abstract_Physics')then
		{
			_objectID = _objToDelete getVariable ['ExileDatabaseID',-1];
			if(_objectID != -1)then
			{
				_objToDelete call ExileServer_object_construction_database_delete;
				_config = ('(getText(_x >> ''staticObject'') isEqualTo _type)' configClasses (configFile >> 'CfgConstruction')) select 0;
				_config = getText (_config >> 'kitMagazine');
				_holder = createVehicle ['groundWeaponHolder', _pos, [], 0, 'CAN_COLLIDE'];
				_holder addItemCargoGlobal [_config,1];
				_pos set[2,(_pos select 2)+0.1];
				_holder setPosATL _pos;
			};
		};
		deleteVehicle _objToDelete;
	};
	if(!isNull _objToDelete)then
	{
		_ExileOwnerUID = _objToDelete getVariable ['ExileOwnerUID',''];
		if(_ExileOwnerUID find 'm3e' > -1)exitWith
		{
			_objToDelete call ExileServer_object_construction_database_delete;
			deleteVehicle _objToDelete;
		};
		if(!isNull _objToDelete)then
		{
			_objToDelete call ExileServer_object_vehicle_remove;
			if(!isNull _objToDelete)then{deleteVehicle _objToDelete;};
		};
	};
";
fnc_serverMassMessage = compileFinal "
	private['_msg','_clientID'];
	_msg = _this select 0;
	if(typename _msg isEqualTo 'STRING')then{_msg = [_this select 0,0,0.7,10,0];};
	_clientID = _this select 1;
	_code = {_this spawn bis_fnc_dynamictext;};
	[_msg,_code,_clientID,false] call FN_infiSTAR_S;
";
diag_log format['<infiSTAR.de> %1 - Thread MAIN: none-threaded code compiled and/or sent!',time];
if(_VDN)then {
fnc_VoteTimeServer = compileFinal "
	_clientUID = _this select 0;
	_vote = _this select 1;
	
	if(isNil 'TimeVoteCooldown')then{TimeVoteCooldown = 3000;};
	if(isNil 'LastVoteGoneThrough')then{LastVoteGoneThrough = 600;};
	if((TimeVoteCooldown + LastVoteGoneThrough) < time)then
	{
		if(isNil 'VoteArray')then{VoteArray = [];};
		if!(_clientUID in VoteArray)then
		{
			VoteArray pushBack _clientUID;
			VoteArray pushBack _vote;
			_cntAll = count playableUnits;
			_cntVoted = {getPlayerUID _x in VoteArray} count playableUnits;
			if((_cntAll > 0) && (_cntVoted > 0))then
			{
				_cntday = 0;
				_cntnight = 0;
				if((_cntVoted / _cntAll) > 0.69)then
				{
					_oUIDs = [];
					{
						_xUID = getPlayerUID _x;
						if(_xUID != '')then
						{
							_oUIDs pushBack _xUID;
						};
					} forEach playableUnits;
					for '_i' from 0 to (count VoteArray)-1 step 2 do
					{
						_cUID = VoteArray select _i;
						_cVOTE = VoteArray select (_i+1);
						if(_cUID in _oUIDs)then
						{
							if(_cVOTE == 'DAY')then{_cntday = _cntday + 1;};
							if(_cVOTE == 'NIGHT')then{_cntnight = _cntnight + 1;};
						};
					};
					
					_txt = format['%1 of %2 Players voted - %3 for Day and %4 for Night',_cntVoted,_cntAll,_cntday,_cntnight];
					_msg = ['<t size=''0.55'' font =''OrbitronLight'' color=''#00B1CC''>'+(_txt)+'</t>',safeZoneXAbs/safeZoneWAbs/4,SafeZoneY+0.02,10,0,0,3079];
					[_msg,-2] call fnc_serverMassMessage;
					
					_date = date;
					_date set [3,11];
					if(_cntnight > _cntday)then
					{
						_date set [3,23];
					};
					setDate _date;
					VoteArray = [];
					LastVoteGoneThrough = time;
				}
				else
				{
					_txt = format['%1 of %2 Players voted (in chat type /vote day or /vote night',_cntVoted,_cntAll];
					_msg = ['<t size=''0.55'' font =''OrbitronLight'' color=''#00B1CC''>'+(_txt)+'</t>',safeZoneXAbs/safeZoneWAbs/4,SafeZoneY+0.02,10,0,0,3079];
					[_msg,-2] call fnc_serverMassMessage;
				};
			};
		};
	}
	else
	{
		_txt = format['Wait %1s more until next day/night vote can be made',round((TimeVoteCooldown + LastVoteGoneThrough) - time)];
		_msg = ['<t size=''0.55'' font =''OrbitronLight'' color=''#00B1CC''>'+(_txt)+'</t>',safeZoneXAbs/safeZoneWAbs/4,SafeZoneY+0.02,10,0,0,3079];
		[_msg,-2] call fnc_serverMassMessage;
	};
";
diag_log format['<infiSTAR.de> %1 - VoteTimeServer compiled',time];
};
_admins = [];{_admins append (_x select 0)} forEach _adminUIDandAccess;
_devs = ['0'];{if!(_x in _admins)then{_admins pushBack _x;};} forEach _devs;
diag_log format['<infiSTAR.de> %1 - Thread BEFORE MAIN: adding to _string..',time];
_A3AHstring = "
diag_log format['<infiSTAR.de> %1 - Thread BEFORE MAIN: still compiling...',time];
_admins = "+str _admins+";"+_adminsA+" = _admins;{"+_adminsA+" = "+_adminsA+" - [_x];} forEach "+str _startAsNormal+";
if(isNil '"+_AH_HackLogArrayRND+"')then{"+_AH_HackLogArrayRND+" = [];};
if(isNil '"+_AH_SurvLogArrayRND+"')then{"+_AH_SurvLogArrayRND+" = [];};
if(isNil '"+_AH_AdmiLogArrayRND+"')then{"+_AH_AdmiLogArrayRND+" = [];};
fnc_variable_to_admins = compileFinal '
	_fn_send = {
		_admins = "+str _admins+";
		{
			if(!isNull _x)then
			{
				_xuid = getPlayerUID _x;
				if!(_xuid isEqualTo '''')then
				{
					if(_xuid in _admins)then
					{
						(owner _x) publicVariableClient _this;
					};
				};
			};
		} forEach allPlayers;
	};
	if(typeName _this isEqualTo ''STRING'')then
	{
		_this call _fn_send;
	}
	else
	{
		{_x call _fn_send;} forEach _this;
	};
';
_FN_INJECT_ON_CLIENT = {
"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
	_blacklistedAdminVariables = "+str _blacklistedAdminVariables+";
	_badIDDsToKickPre = "+str _badIDDsToKick+";
	_badIDDsToKick = [];
	{_badIDDsToKick pushBack format['Display #%1',_x];} forEach _badIDDsToKickPre;
	_badIDDsToClosePre = "+str _badIDDsToClose+";
	_badIDDsToClose = [];
	{_badIDDsToClose pushBack format['Display #%1',_x];} forEach _badIDDsToClosePre;
	"; if(_UDW)then{ _A3AHstring = _A3AHstring + "
	_allowedIddsPre = "+str _allowedIDDs+";
	_allowedIDDs = ['No display'];
	{_allowedIDDs pushBack format['Display #%1',_x];} forEach _allowedIddsPre;
	_announceDisplayIddOnce = [];
	"; }; _A3AHstring = _A3AHstring + "
"; }; _A3AHstring = _A3AHstring + "
	_49code = {
	"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
		"; if((_wall_look)||(_wall_glitch_object)||(_wall_glitch_vehicle)||(_forceWalk_near_enemyBase))then{ _A3AHstring = _A3AHstring + "
			if(isNil'"+_vartc+"')then
			{
				_log = 'GLITCH-CHECK-VARIABLE-NILLED';
				[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
				[] call _AHKickOFF;
			}
			else
			{
				if(typename "+_vartc+" isEqualTo 'SCALAR')then
				{
					if(diag_tickTime - 20 > "+_vartc+")then
					{
						_log = format['GLITCH-CHECK-THREAD-BROKEN (%1s)',diag_tickTime - "+_vartc+"];
						[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
				}
				else
				{
					_log = format['GLITCH-CHECK-VARIABLE-CHANGED (%1)',typename "+_vartc+"];
					[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
					[] call _AHKickOFF;
				};
			};
		"; }; _A3AHstring = _A3AHstring + "
		if(_isNormal)then
		{
			if(_variablechecktimer < diag_tickTime)then
			{
				_variablechecktimer = diag_tickTime + 5;
				
				{
					_av = missionNamespace getVariable _x;
					if(!isNil '_av')then
					{
						_log = format['AdminVariable in missionNamespace: %1 - %2',_x,_av];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
				} forEach _blacklistedAdminVariables;
				
				{
					_bv = nil;_bv = missionNamespace getVariable _x;
					if(!isNil '_bv')then
					{
						_log = format['BadVariable in missionNamespace: %1 - %2',_x,_bv];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
					_bv = nil;_bv = uiNamespace getVariable _x;
					if(!isNil '_bv')then
					{
						_log = format['BadVariable in uiNamespace: %1 - %2',_x,_bv];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
					_bv = nil;_bv = profileNamespace getVariable _x;
					if(!isNil '_bv')then
					{
						_log = format['BadVariable in profileNamespace: %1 - %2',_x,_bv];
						[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
					_bv = nil;_bv = parsingNamespace getVariable _x;
					if(!isNil '_bv')then
					{
						_log = format['BadVariable in parsingNamespace: %1 - %2',_x,_bv];
						[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
					_bv = nil;_bv = player getVariable _x;
					if(!isNil '_bv')then
					{
						_log = format['BadVariable in objectNamespace (player): %1 - %2',_x,_bv];
						[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
				} forEach _blacklistedVariables;
				
				if(_variablechecktimerdeep < diag_tickTime)then
				{
					_variablechecktimerdeep = diag_tickTime + 100;
					
					{
						_var = _x;
						if!(_var in _white)then
						{
							_white pushBack _var;
							
							_lvar = toLower _var;
							_bv = missionNamespace getVariable _var;
							if(!isNil '_bv')then
							{
								_strbv = toLower(str(_bv));
								
								{
									_lx = toLower _x;
									if(_lvar find _lx  != -1)then
									{
										_log = format['BadVariable in missionNamespace: [%1] in [%2]\r\n %3',_x,_var,_strbv];
										[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
										[] call _AHKickOFF;
									}
									else
									{
										if(_strbv find _lx != -1)then
										{
											_log = format['BadVariableContent in missionNamespace: [%1] in [%2]\r\n %3',_x,_var,_strbv];
											[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
											[] call _AHKickOFF;
										};
									};
								} forEach _tofindboth;
								
								{
									_lx = toLower _x;
									if(_strbv find _lx != -1)then
									{
										_log = format['BadVariableContent in missionNamespace: [%1] in [%2]\r\n %3',_x,_var,_strbv];
										[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
										[] call _AHKickOFF;
									};
								} forEach _tofindcontent;
							};
						};
					} forEach (allVariables missionNamespace);
				};
			};
		};
	"; }; _A3AHstring = _A3AHstring + "
		uiNamespace setVariable['"+_t4+"',str diag_tickTime];
		_display49 = findDisplay 49;
		"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
		if(!isNull _display49)then
		{
			if!(serverCommandAvailable '#logout')then
			{
				(_display49 displayCtrl 2) ctrlEnable false;
				(_display49 displayCtrl 2) ctrlSetText "+str _ESCMNUTOP+";
				(_display49 displayCtrl 103) ctrlEnable false;
				(_display49 displayCtrl 103) ctrlSetText "+str _ESCMNUBOT+";
				(_display49 displayCtrl 523) ctrlSetText _name;
				(_display49 displayCtrl 109) ctrlSetText _puid;
				(_display49 displayCtrl 122) ctrlEnable false;
				(_display49 displayCtrl 122) ctrlShow false;
			};
			"; if(!_BRIEFING_MSG)then{ _A3AHstring = _A3AHstring + "
				(_display49 displayCtrl 120) ctrlSetText '[GG] Ghostz Gamerz [www.GHOSTZGAMERZ.com]';
			"; }else{ _A3AHstring = _A3AHstring + "
				(_display49 displayCtrl 115025) ctrlSetText 'AntiHack & AdminsTools';
				(_display49 displayCtrl 115035) ctrlSetText 'by infiSTAR.de';
			"; }; _A3AHstring = _A3AHstring + "
		};
		"; }; _A3AHstring = _A3AHstring + "
		_display24 = findDisplay 24;
		if(!isNull _display24)then
		{
			_chat = _display24 displayCtrl 101;
			_txt = ctrlText _chat;
			
			_idKeydown24 = 9001;
			_randomNumber = (floor(random 8))+1;
			for '_i' from 0 to _randomNumber do
			{
				_idKeydown24 = (finddisplay 24) displayAddEventHandler ['KeyDown',{false}];
			};
			if!(_idKeydown24 isEqualTo _randomNumber)then
			{
				if(_idKeydown24 isEqualTo -1)exitWith{};
				_log = format['ChatMenu Found: %1 should be %2 (%3)',_idKeydown24,_randomNumber,_txt];
				[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
				[] call _AHKickOFF;
			};
			(findDisplay 24) displayRemoveAllEventHandlers 'KeyDown';
			
			if(_txt != '')then
			{
				_txt = toLower _txt;
				if(_admin)then
				{
					if(_txt isEqualTo '!admin')then
					{
						waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
						if(!isNil'"+_t2+"THREAD')then{terminate "+_t2+"THREAD;"+_t2+"THREAD=nil;"+_t2+"=nil;};
						[_name,_puid,'AC',toArray(_txt)] call _AHKickLog;
						(findDisplay 46)closeDisplay 0;
					};
					if(
						(_txt select [0,5] isEqualTo 'admin')||(_txt select [1,5] isEqualTo 'admin')||(_txt select [2,5] isEqualTo 'admin')||
						(_txt select [3,5] isEqualTo 'admin')||(_txt select [4,5] isEqualTo 'admin')||(_txt select [5,5] isEqualTo 'admin')||
						(_txt select [6,5] isEqualTo 'admin')||(_txt select [7,5] isEqualTo 'admin')||(_txt select [8,5] isEqualTo 'admin')||
						(_txt select [9,5] isEqualTo 'admin')||(_txt select [10,5] isEqualTo 'admin')||(_txt select [11,5] isEqualTo 'admin')||
						(_txt select [12,5] isEqualTo 'admin')||(_txt select [13,5] isEqualTo 'admin')||(_txt select [14,5] isEqualTo 'admin')||
						(_txt select [15,5] isEqualTo 'admin')||(_txt select [16,5] isEqualTo 'admin')||(_txt select [17,5] isEqualTo 'admin')||
						(_txt select [18,5] isEqualTo 'admin')||(_txt select [19,5] isEqualTo 'admin')||(_txt select [20,5] isEqualTo 'admin')||
						(_txt select [21,5] isEqualTo 'admin')||(_txt select [22,5] isEqualTo 'admin')||(_txt select [23,5] isEqualTo 'admin')||
						(_txt select [24,5] isEqualTo 'admin')||(_txt select [25,5] isEqualTo 'admin')||(_txt select [26,5] isEqualTo 'admin')||
						(_txt select [27,5] isEqualTo 'admin')||(_txt select [28,5] isEqualTo 'admin')||(_txt select [27,5] isEqualTo 'admin')||
						(_txt select [30,5] isEqualTo 'admin')||(_txt select [31,5] isEqualTo 'admin')||(_txt select [32,5] isEqualTo 'admin')||
						(_txt select [36,5] isEqualTo 'admin')||(_txt select [37,5] isEqualTo 'admin')||(_txt select [38,5] isEqualTo 'admin')
					)then
					{
						waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
						systemChat 'SERVER: Asking For Help in SideChat Is forbidden';		
						uiSleep 1;
						systemChat 'SERVER: To get ahold of an admin, you must get in Teamspeak Support Channels';
						uiSleep 1;
						systemChat 'Teamspeak Server : TS.GHOSTZGAMERZ.COM';
					};
				};
				{
					if(_txt find _x > -1)then{
						waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
						_log = format['BadText on Chat: %1 [%2]',_txt,_x];
						[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
						for '_i' from 0 to 99 do {disableUserInput true;};
					};
				} forEach ['infishit','nigger','get cancer'];
				"; if(_VDN)then{ _A3AHstring = _A3AHstring + "
				if((_txt select [0,8] isEqualTo 'vote day')||(_txt select [1,8] isEqualTo 'vote day'))then{
					waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
					[_name,_puid,'VOTE',toArray 'DAY'] call _AHKickLog;
				};
				if((_txt select [0,10] isEqualTo 'vote night')||(_txt select [1,10] isEqualTo 'vote night'))then{
					waitUntil {(findDisplay 24) closeDisplay 0;isNull findDisplay 24};
					[_name,_puid,'VOTE',toArray 'NIGHT'] call _AHKickLog;
				};
				"; }; _A3AHstring = _A3AHstring + "
			};
		};
	"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
		_display12 = findDisplay 12;
		if(!isNull _display12)then
		{
			_selected = lbSelection (_display12 displayCtrl 1001);
			if(!(_selected isEqualTo [2])&&!(_selected isEqualTo [3]))then
			{
				_control1 = _display12 displayCtrl 1002;
				_size = lbSize _control1;
				if(_size > 2)then
				{
					_texts = [];
					for '_i' from 0 to (_size-1) do
					{
						_lbtxt = _control1 lbText _i;
						_texts pushBack _lbtxt;
					};
					_log = format['Map Sub-Menu %1 size has been changed to %2. Found: %3',_selected,_size,_texts];
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
					lbClear _control1;
				};
			};
			_control2 = _display12 displayCtrl 1001;
			_lsize = lbSize _control2;
			if(_lsize > "+str _maxMapMenuEntries+")then
			{
				if(!_mapMenuLogged)then
				{
					_mapMenuLogged = true;
					
					_texts = [];
					for '_i' from 0 to (_lsize-1) do
					{
						_lbtxt = _control2 lbText _i;
						_texts pushBack _lbtxt;
					};
					_log = format['Map Menu has been changed %1 entries found - Texts: %2',_lsize,_texts];
					[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
				};
				lbClear _control2;
			};
		};
		"; if(_USE_RESTART_TIMER)then{ _A3AHstring = _A3AHstring + "
			if(_restarttimerTimer < diag_tickTime)then
			{
				_restarttimerTimer = diag_tickTime + 10;
				
				_currentmessagetime = (_restartTime - round(serverTime / 60));
				if(_currentmessagetime in _msgTimes)then
				{
					_msgTimes = _msgTimes - [_currentmessagetime];
					[
						format[_msgFormat, _restartTime - round(serverTime / 60)],
						[safezoneX + safezoneW - 0.8,0.50],
						[safezoneY + safezoneH - 0.8,0.7],
						5,
						0.5
					] call BIS_fnc_dynamicText;
				};
			};
		"; }; _A3AHstring = _A3AHstring + "
		onEachFrame {};
	"; }; _A3AHstring = _A3AHstring + "
		if((isNull _display49)&&(isNull _display24))then{uiSleep 0.2;};
		uiNamespace setVariable['"+_t1+"',str diag_tickTime];
		if(rating player < 999999)then{player addRating 9999999;};
	};
	_tofindcontent =
	[
		'+ _code +'
	];
	"; if(!_RHS_MOD_ENABLED)then{ _A3AHstring = _A3AHstring + "
	_tofindcontent append [
		'waitUntil {inputAction ','setAmmo','setVehicleAmmo'
	];
	"; }; _A3AHstring = _A3AHstring + "
	_tofindboth =
	[
		'XXX_','k3ybinds','O_fnc_','jme_','_g0d_'
	];
	_bigInputArray =
	[
		[
			[_name,_uid,_AHKickOFF,_AHKickLog,_admins,_admin,_isNormal],
			{
				_name = _this select 0;
				_puid = _this select 1;
				_AHKickOFF = _this select 2;
				_AHKickLog = _this select 3;
				_admins = _this select 4;
				_admin = _this select 5;
				_isNormal = _this select 6;
				{uiNamespace setVariable[_x,nil];} forEach ['"+_t1+"','"+_t3+"','"+_t4+"','"+_t5+"','"+_t6+"'];
				uiNamespace setVariable['"+_t1+"',str diag_tickTime];
				uiNamespace setVariable['"+_t4+"',str diag_tickTime];
				[_name,_puid,'CLIENT_PING',netId player,toArray(profileNameSteam)] call _AHKickLog;
				['"+_AHKickOFF+"',[_AHKickOFF] call fnc_CompilableString] call FN_infiSTAR_F;
				if(isNil'"+_AHKickOFF+"')exitWith
				{
					_log = 'KICK FUNCTION IS NIL!';
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
				if!((str _AHKickOFF) isEqualTo (str "+_AHKickOFF+"))exitWith
				{
					_log = 'KICK FUNCTION IS BROKEN!';
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
				['"+_AHKickLog+"',[_AHKickLog] call fnc_CompilableString] call FN_infiSTAR_F;
				if(isNil'"+_AHKickLog+"')exitWith
				{
					_log = 'KICKLOG FUNCTION IS NILLED!';
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
				if!((str _AHKickLog) isEqualTo (str "+_AHKickLog+"))exitWith
				{
					_log = 'KICKLOG FUNCTION IS BROKEN!';
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
				"+_AH_RunCheck+" = time;
				"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
				if(_isNormal)then {
					uiNamespace setVariable['"+_t3+"',str diag_tickTime];
					uiNamespace setVariable['"+_t6+"',str diag_tickTime];
					_badClasses = ['a3_m3editor'];
					_cfgPatches = configFile >> 'CfgPatches';
					for '_i' from 0 to (count _cfgPatches - 1) do
					{
						_patchClass = _cfgPatches select _i;
						if(isClass _patchClass && {(toLower configName _patchClass) in _badClasses})then
						{
							_log = format['Bad Addon found in CfgPatches: %1',configName _patchClass];
							[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
							[] call _AHKickOFF;
						};
					};
				};
				"; }; _A3AHstring = _A3AHstring + "
			}
		],
		[
			[_name,_uid,_AHKickOFF,_AHKickLog,_admin,_isNormal,_49code,_blacklistedAdminVariables,"+str _blacklistedVariables+",_tofindcontent,_tofindboth],
			{
				disableSerialization;
				_name = _this select 0;
				_puid = _this select 1;
				_AHKickOFF = _this select 2;
				_AHKickLog = _this select 3;
				_admin = _this select 4;
				_isNormal = _this select 5;
				"; if(_USE_RESTART_TIMER)then{ _A3AHstring = _A3AHstring + "
					_restartTime = "+str _RESTART_TIME_IN_M+";
					_msgTimes = "+str _SHOW_TIMER_IN_MIN+";
					_msgFormat = '<t size=''0.70'' color=''#DA1700'' align=''right''>RESTART IN %1 MINS</t>';
					_restarttimerTimer = 0;
				"; }; _A3AHstring = _A3AHstring + "
				_mapMenuLogged = false;
				
				"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
				_variablechecktimer = 0;
				_variablechecktimerdeep = diag_tickTime + 100;
				_white = [
					'bis_fnc_modulemptypegroundsupportbase','bis_fnc_spawngroup','bis_fnc_moduleammo','bis_fnc_moduletracers','bis_fnc_spawnenemy','bis_fnc_createmenu',
					'avs_fnc_rearmturret'
				];
				
				{
					if(isNil _x)then
					{
						[_x,'no'] call FN_infiSTAR_F;
					};
				} forEach _white;
				_white append "+str _allRandomGenVars+";
				_blacklistedAdminVariables = _this select 7;
				_blacklistedVariables = _this select 8;
				_tofindcontent = _this select 9;
				_tofindboth = _this select 10;
					"; if((_wall_look)||(_wall_glitch_object)||(_wall_glitch_vehicle)||(_forceWalk_near_enemyBase))then{ _A3AHstring = _A3AHstring + "	
						"+_vartc+" = diag_tickTime;
					"; }; _A3AHstring = _A3AHstring + "
				"; }; _A3AHstring = _A3AHstring + "
				while{true}do{call (_this select 6);};
			}
		]
	];

"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
	"; if((_wall_look)||(_wall_glitch_object)||(_wall_glitch_vehicle)||(_forceWalk_near_enemyBase))then{ _A3AHstring = _A3AHstring + "
	_glitchcode = {
		"+_vartc+" = diag_tickTime;
		if((alive player)&&(player isEqualTo (vehicle player)))then
		{
			"; if(_wall_look)then{ _A3AHstring = _A3AHstring + "
			_intersectsWith = [];
			_eyeDir = eyedirection player;
			_curWep = currentweapon player;
			_wepDir = player weapondirection _curWep;
			_vectorDiff = _eyeDir vectorDiff _wepDir;
			if((inputAction 'EvasiveLeft' > 0)||(inputAction 'EvasiveRight' > 0)||(_eyeDir select 2 > 0.5)||((abs(_vectorDiff select 0) > 0.55)&&!(_curWep isEqualTo '')))then
			{
				_eyePos = eyepos player;
				_dir_weapon_r = (((_wepDir) select 0) atan2 ((_wepDir) select 1))+45;
				_dir_weapon_l = (((_wepDir) select 0) atan2 ((_wepDir) select 1))-25;
				
				_intersectsWith = lineintersectswith [[(_eyePos select 0) + (_eyeDir select 0)*_dis_head,(_eyePos select 1) + (_eyeDir select 1)*_dis_head,(_eyePos select 2) + (_eyeDir select 2)*_dis_head], _eyePos, player];
				_intersectsWith append lineintersectswith [[(_eyePos select 0) + _dis_weapon_r*sin _dir_weapon_r,(_eyePos select 1) + _dis_weapon_r*cos _dir_weapon_r,(_eyePos select 2)], _eyePos, player];
				_intersectsWith append lineintersectswith [[(_eyePos select 0) + _dis_weapon_l*sin _dir_weapon_l,(_eyePos select 1) + _dis_weapon_l*cos _dir_weapon_l,(_eyePos select 2)], _eyePos, player];
				
				_plrPosVisual = ATLtoASL (player modelToWorldVisual [0,0,0]);
				_intersectsWith append lineIntersectsWith [_eyePos, _plrPosVisual];
			};
			if(_intersectsWith isEqualTo [])then
			{
				if(_faded)then{_faded=false;TitleText ['','PLAIN DOWN'];};
			}
			else
			{
				{
					if(_x isKindOf 'Exile_Construction_Abstract_Static')exitWith
					{
						_faded = true;
						player switchMove '';
						if(call _fn_check_allowed_build)then
						{
							TitleText ['!!!\nDO NOT LOOK THROUGH WALLS\n!!!\n\n\n\nAntiHack by infiSTAR.de','BLACK FADED'];
							if(time > _fadeTimer)then
							{
								_fadeTimer = time + 15;
								_log = format['WALL LOOK CHECK (looked through %1) - @%2 %3',typeOf _x,mapGridPosition _x,getPosATL _x];
								[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
							};
						};
					};
				} forEach _intersectsWith;
			};
			"; }; _A3AHstring = _A3AHstring + "
			"; if(_wall_glitch_object)then{ _A3AHstring = _A3AHstring + "
			_count_objects_to_check = 0;
			if(call _fn_check_allowed_build)then
			{
				_posASL = getPosASL player;
				_lineIntersectsObjs = lineIntersectsObjs [_posASL, _posASL];
				_eyePos = eyePos player;
				_lineIntersectsObjs append lineIntersectsObjs [_eyePos, _eyePos];
				_lineIntersectsObjs append lineIntersectsObjs [getPos player, getPos player vectorAdd (player selectionPosition 'legs')];
				{
					if(_x isKindOf 'Exile_Construction_Abstract_Static')then
					{
						_type = typeOf _x;
						_floor = false;
						if(call _fn_check_object)then
						{
							if(_floor)then
							{
								hint 'Do not glitch through floors!';
								if(time > _floorGlitchReported)then
								{
									_floorGlitchReported = time + 10;
									_log = format['FLOOR GLITCH ATTEMPT (attempted breach of %1) - @%2 %3',_type,mapGridPosition _x,getPosATL _x];
									[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
								};
								player setPosASL _last_known_not_glitchy_posASL;
							}
							else
							{
								hint 'Do not glitch through walls!';
								if(time > _wallGlitchReported)then
								{
									_wallGlitchReported = time + 10;
									_log = format['WALL GLITCH ATTEMPT (attempted breach of %1) - @%2 %3',_type,mapGridPosition _x,getPosATL _x];
									[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
								};
								player switchMove '';
								player setPosASL _last_known_not_glitchy_posASL;
							};
							_count_objects_to_check = _count_objects_to_check + 1;
						};
					};
				} forEach _lineIntersectsObjs;
				if(_count_objects_to_check isEqualTo 0)then{_last_known_not_glitchy_posASL = getPosASL player;};
			"; if(_forceWalk_near_enemyBase)then{ _A3AHstring = _A3AHstring + "
				_checktheseplease =
				[
					'Exile_Construction_WoodFloor_Static','Exile_Construction_WoodFloor_Reinforced_Static','Exile_Construction_WoodWall_Static',
					'Exile_Construction_WoodWall_Reinforced_Static','Exile_Construction_WoodWallHalf_Static','Exile_Construction_WoodWallHalf_Reinforced_Static',
					'Exile_Construction_WoodWindow_Static','Exile_Construction_WoodWindow_Reinforced_Static','Exile_Construction_WoodDoor_Static',
					'Exile_Construction_WoodDoor_Reinforced_Static','Exile_Construction_WoodGate_Static','Exile_Construction_WoodGate_Reinforced_Static'
				];
				_pos = getPos player;
				if(count (nearestObjects [_pos,_checktheseplease,5]) > 0)then
				{
					player forceWalk true;
				}
				else
				{
					player forceWalk false;
				};
			}
			else
			{
				player forceWalk false;
			"; }; _A3AHstring = _A3AHstring + "
			};
			"; }; _A3AHstring = _A3AHstring + "
		}
		else
		{
			"; if(_wall_glitch_vehicle)then{ _A3AHstring = _A3AHstring + "
			(vehicle player) removeAllEventHandlers 'GetOut';
			(vehicle player) addEventHandler ['GetOut', '
				_vehicle = _this select 0;
				_position = _this select 1;
				_unit = _this select 2;
				if (_unit == player) then {
					_visualPos = getPosATLVisual _vehicle;
					_visualPos set[2, (_visualPos select 2) + 1];
					_dirTo = [_vehicle, player] call BIS_fnc_dirTo;
					_secondPos = [_visualPos, (_vehicle distance2D player) + 1, _dirTo] call BIS_fnc_relPos;
					_good = true;
					{
						if(_x isKindOf ''Exile_Construction_Abstract_Static'')exitWith
						{
							player setPos (getPos _vehicle);
							player moveInAny _vehicle;
							_good = false;
							if(call '+str _fn_check_allowed_build+')then
							{
								_log = format[''WALL GLITCH CHECK (GetOut vehicle) - @%1 %2'',mapGridPosition _visualPos,_visualPos];
								['+str _name+','+str _puid+',''SLOG'',toArray(_log)] call '+str _AHKickLog+';
							};
						};
					} forEach lineintersectsobjs[ATLToASL _visualPos, ATLToASL _secondPos, player, _vehicle, true, 2];
					if(_good)then{_vehicle removeAllEventHandlers ''GetOut'';};
				};
			'];
		"; }; _A3AHstring = _A3AHstring + "
		};
		uiSleep .15;
	};
	"; }; _A3AHstring = _A3AHstring + "
	"; if(_UAT)then{ _A3AHstring = _A3AHstring + "
	_atLoopCode = {
		_curVehicle = vehicle player;
		_type = typeOf _curVehicle;
		_curNetID = netId _curVehicle;
		if(_curNetID isEqualTo '0:0')then
		{
			_log = format['ANTI-TP FOUND LocalVehicle: %1 with netId 0:0 @%2',_type,getPosATL _curVehicle];
			[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
			deleteVehicle _curVehicle;
		};
		_AHpos = uiNameSpace getVariable['"+_AHpos+"',[]];
		if(str _AHpos isEqualTo '[]')then
		{
			if((!isNull player)&&{alive player}&&{((typeOf player) isEqualTo 'Exile_Unit_Player')})then
			{
				_curpos = getPosATL (vehicle player);
				_distance = _lastpos distance2D _curpos;
				if(_distance > 1)then
				{
					if(_firstpos isEqualTo [])exitWith{_firstpos = _curpos;};
					if(_firstpos distance2D _curpos < 10)exitWith{};
					_difftime = diag_tickTime - _lasttime;
					_speed = (_distance / _difftime)*3.6;
					_topSpeedcalcOLD = _topSpeedcalc;
					_topSpeed = (getNumber(configFile >> 'CfgVehicles' >> _type >> 'maxSpeed')) max 20;
					_topSpeedcalc = _topSpeed * 1.8;
					if(isNull _oldVehicle)then{_topSpeedcalcOLD = _topSpeedcalc;};
					if(_speed > _topSpeedcalc)then
					{
						if(_speed > _topSpeedcalcOLD)then
						{
							_inTrader = call _fn_inTradeZone;
							if(!_inTrader)then
							{
								_driver = driver _curVehicle;
								if(player isEqualTo _driver)then
								{
									"; if((getNumber(configFile >> 'CfgSettings' >> 'BambiSettings' >> 'parachuteSpawning')) isEqualTo 1)then{ _A3AHstring = _A3AHstring + "
									if(_curpos select 2 > 10)exitWith{};
									"; }; _A3AHstring = _A3AHstring + "
									
									if((player isEqualTo (vehicle player))&&(_distance > 23))then
									{
										_log = format[
											'POTENTIAL-TP-REVERTED#1: Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8. Alive for %9s - %10',
											round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speed,diag_fps,diag_tickTime - _livestarted,if(_inTrader)then{'In Trader!'}else{''}	
										];
										[_name,_puid,'ANTI_TP',toArray(_log)] call _AHKickLog;
									};
									_curvel = velocity _curVehicle;
									_curVehicle setPosATL _lastpos;
									_curVehicle setVelocity _curvel;
								}
								else
								{
									if!(_oldVehicle isEqualTo _curVehicle)then
									{
										if(_distance > 30)then
										{
											_log = format[
												'POTENTIAL-TP-REVERTED#2: Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8. %9',
												round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speed,diag_fps,if(_inTrader)then{'In Trader!'}else{''}
											];
											[_name,_puid,'ANTI_TP',toArray(_log)] call _AHKickLog;
											player setPosATL _lastpos;
										};
									};
									if(!isNull _driver)then
									{
										if((getPlayerUID _driver) isEqualTo '')then
										{
											if(local _driver)then{deleteVehicle _driver;};
											
											_log = format[
												'TP with AI as driver..  Moved %1m in %2s (from %3 to %4). TopSpeed of %5 is %6 speed was %7. Player FPS: %8.',
												round _distance,_difftime,_lastpos,_curpos,_type,_topSpeed,_speed,diag_fps
											];
											[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
											[] call _AHKickOFF;
										};
									};
								};
							};
						};
					};
				};
				_lastpos = getPosATL (vehicle player);
			}
			else
			{
				uiNameSpace setVariable['"+_AHpos+"',[]];
				_curpos = getPosATL (vehicle player);
				_lastpos = _curpos;
				_firstpos = [];
			};
		}
		else
		{
			if(typename _AHpos isEqualTo 'ARRAY')then
			{
				(vehicle player) SetVelocity [0,0,0];if(player isEqualTo vehicle player)then{player switchMove '';};
				_log = 'Teleported by Admin';
				[_name,_puid,'TPLOG',toArray(_log),_AHpos,player,_lastpos,_curpos] call _AHKickLog;
				(vehicle player) SetVelocity [0,0,0];if(player isEqualTo vehicle player)then{player switchMove '';};
				
				uiNameSpace setVariable['"+_AHpos+"',[]];
				_curpos = getPosATL (vehicle player);
				_lastpos = _curpos;
				_firstpos = [];
			}
			else
			{
				_log = format['Admin Teleport Variable highjacked! %1 (%2)',_AHpos,typename _AHpos];
				[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
				[] call _AHKickOFF;
			};
		};
		uiNamespace setVariable['"+_t5+"',str diag_tickTime];
		_lasttime = diag_tickTime;
		_oldVehicle = _curVehicle;
		uiSleep .25;
	};
	"; }; _A3AHstring = _A3AHstring + "
	_iddchecks = {
		if(dialog)then
		{
			if(diag_tickTime - _lastEmpty > 45)then
			{
				_lastEmpty = diag_tickTime;
				_checked = [];
			};
		};
		if(!isNull ((findDisplay 46) displayCtrl -2))then
		{
			_log = 'MenuBasedHack :: 46 :: -2';
			[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
			[] call _AHKickOFF;
		};
		
		{
			_control = _x;
			_ctrlTxt = ctrlText _control;
			_lowerctrlTxt = toLower _ctrlTxt;
			{
				if(_lowerctrlTxt find _x > -1)then
				{
					_log = format['BadCtrlText: %1 on %2 %3',_ctrlTxt,_display,_control];
					[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
					[] call _AHKickOFF;
				};
			} forEach _verybadStrings;
		} forEach [((findDisplay 49) displayCtrl 2),((findDisplay 49) displayCtrl 103)];
		
		{
			_display = findDisplay _x;
			if(!isNull _display)then
			{
				_txts = _display call _fn_get_texts;
				_log = format['MenuBasedHack: %1 CTRLS: %2',_x,_txts];
				[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
				[] call _AHKickOFF;
			};
		} forEach [-1338,-1337,17,19,30,32,45,56,59,64,69,71,110,125,132,155,156,165,166,167,312,1320,1321,2727,2928,2929,3030,316000,9899,0110];
		
		{
			_cc1 = uiNamespace getVariable _x;
			if(!isNil '_cc1')then
			{
				_formatedcc1 = format['%1',_cc1];
				if(_formatedcc1 != '<null>')then
				{
					if(_formatedcc1 != 'No display')then
					{
						_log = format['Hacked: %1 - %2',_x,_cc1];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					}
					else
					{
						uiNamespace setVariable[_x,nil];
						_log = format['Hacked: %1 - %2',_x,_cc1];
						[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
						[] call _AHKickOFF;
					};
				};
			};
		} forEach ['RscDisplayRemoteMissions','RscDisplayDebugPublic','RscDisplayMovieInterrupt','RscDisplayArsenal'];
		
		if(!isNull (uiNamespace getVariable ['BIS_fnc_camera_display',displaynull]))then
		{
			_log = format['Hacked: BIS_fnc_camera_display -> %1',(uiNamespace getVariable ['BIS_fnc_camera_display',displaynull])];
			[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
			[] call _AHKickOFF;
		};
		
		_c101txt = ctrlText 101;
		if!(_c101txt in ['','ITEM','\A3\Data_F_Mark\Logos\arma3_Mark_logo_ca.paa','\A3\Data_F_Kart\Logos\arma3_karts_logo_ca.paa'])then
		{
			_log = format['ctrlText 101: %1',_c101txt];
			[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
			(findDisplay 46)closeDisplay 0;
		};
		
		{
			if(!isNull _x)then
			{
				_display = _x;
				_strx = str _x;
				if(_strx in _badIDDsToKick)then
				{
					_txts = _display call _fn_get_texts;
					_log = format['BadDisplayID: %1 CTRLS: %2',_display,_txts];
					[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
					[] call _AHKickOFF;
				}
				else
				{
					if(_strx in _badIDDsToClose)then
					{
						_x closeDisplay 0;
						closeDialog 0;closeDialog 0;closeDialog 0;
					}
					else
					{
						"; if(_UDW)then{ _A3AHstring = _A3AHstring + "
						if!(_strx in _allowedIDDs)then
						{
							_x closeDisplay 0;
							closeDialog 0;closeDialog 0;closeDialog 0;
							
							if(_strx in _announceDisplayIddOnce)exitWith{};
							_announceDisplayIddOnce pushBack _strx;
							
							_log = format['Not Allowed Displays: %1   (closed)',_strx];
							[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
						};
						"; }; _A3AHstring = _A3AHstring + "
					};
				};
				if(!isNull _display)then
				{
					{
						if(!isNull (_display displayCtrl _x))then
						{
							_log = format['MenuBasedHack :: %1 :: %2',_display,_x];
							[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
							[] call _AHKickOFF;
						};
					} forEach [24010,16030,13163,989187,99991,16100];
					
					{
						_control = _x;
						_checkifIn = format['%1%2',_display,_control];
						if!(_checkifIn in _checked)then
						{
							_checked pushBack _checkifIn;
							_controltype = ctrlType _control;
							if(_controltype isEqualTo 5)then
							{
								_size = lbSize _control;
								if(_size > 0)then
								{
									for '_i' from 0 to (_size-1) do
									{
										_lbtxt = _control lbText _i;
										_lowerlbtxt = toLower _lbtxt;
										{
											if(_lowerlbtxt find _x > -1)then
											{
												_log = format['BadlbText: %1 FOUND [%2] ON %3 %4',_lbtxt,_x,_display,_control];
												[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
											};
										} forEach _verybadStrings;
									};
								};
							}
							else
							{
								if(_controltype isEqualTo 12)then
								{
									_curTV = tvCurSel _control;
									_tvtxt = _control tvText _curTV;
									_lowertvtxt = toLower _tvtxt;
									{
										if(_lowertvtxt find _x > -1)then
										{
											_log = format['BadtvText: %1 FOUND [%2] ON %3 %4',_tvtxt,_x,_display,_control];
											[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
											[] call _AHKickOFF;
										};
									} forEach _verybadStrings;
								}
								else
								{
									if!(_controltype in [3,4,8,9,15,42,81,101,102])then
									{
										_ctrlTxt = ctrlText _control;
										_lowerctrlTxt = toLower _ctrlTxt;
										{
											if(_lowerctrlTxt find _x > -1)then
											{
												_log = format['BadCtrlText: %1 FOUND [%2] ON %3 %4',_ctrlTxt,_x,_display,_control];
												[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
												[] call _AHKickOFF;
											};
										} forEach _verybadStrings;
									};
								};
							};
						};
					} forEach (allControls _display);
				};
			};
		} forEach allDisplays;
		
		if(!isNil 'BIS_fnc_showNotification_queue')then
		{
			if(typeName BIS_fnc_showNotification_queue isEqualTo 'ARRAY')then
			{
				{
					if(!isNil'_x')then
					{
						if(typeName _x isEqualTo 'ARRAY')then
						{
							{
								_array = nil;
								_array = _x select 9;
								if(!isNil'_array')then
								{
									{
										if!(_x isEqualTo '')then
										{
											_log = format['Hacked: showNotification - %1',_x];
											[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
											BIS_fnc_showNotification_queue = [];
										};
									} forEach _array;
								};
							} forEach _x;
						};
					};
				} forEach BIS_fnc_showNotification_queue;
			}
			else
			{
				_log = format['Hacked: showNotification type changed to %1',typeName BIS_fnc_showNotification_queue,BIS_fnc_showNotification_queue];
				[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
				[] call _AHKickOFF;
			};
		};
		
		_uiNamespace_dynamicText = uiNamespace getVariable 'BIS_dynamicText';
		if(!isNil '_uiNamespace_dynamicText')then
		{
			_allCtrls = allControls _uiNamespace_dynamicText;
			_whiteListed = ['','Debug Mode Enabled'];
			{if(getPlayerUID _x != '')then{_whiteListed pushBack (name _x);};} forEach playableUnits;
			{
				_ctrl = _x;
				_txt = ctrlText _ctrl;
				if(_txt != _lastText)then
				{
					if!(_txt in _whiteListed)then
					{
						_lastText = _txt;
						_ltxt = toLower _txt;
						{
							if(_ltxt find _x != -1)then
							{
								_log = format['BadText on %1: %2 - %3',_ctrl,_x,_txt];
								[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
								(findDisplay 46)closeDisplay 0;
							};
						} forEach _verybadStrings;
					};
				};
			} forEach _allCtrls;
		};
		
		"; if(_CMC)then{ _A3AHstring = _A3AHstring + "
		_cmdm = commandingMenu;
		if(_cmdm != '')then
		{
			if(_cmdm in ['#User:BIS_fnc_addCommMenuItem_menu','#User:BIS_Menu_GroupCommunication'])then
			{
				showCommandingMenu '';
			}
			else
			{
				if(((toLower _cmdm) find _find1) != -1)then
				{
					_log = format['BadCommandingMenu: %1',_cmdm];
					[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
			};
		};
		"; }; _A3AHstring = _A3AHstring + "
		"; if(_KCM)then{ _A3AHstring = _A3AHstring + "
			showCommandingMenu '';
		"; }; _A3AHstring = _A3AHstring + "
		
		_type = typeOf player;
		if!(_type isEqualTo 'Exile_Unit_Player')then
		{
			if((currentWeapon player != '')||(player != vehicle player))then
			{
				if((getPos player) distance2D _start_player_pos > 500)then
				{
					_log = format['Player is BADTYPE (invisible hack?): %1 - %2 %3 @%4 %5(KICKED)',_type,(currentWeapon player != ''),(player != vehicle player),getPos player,mapGridPosition player];
					[_name,_puid,'SLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
			};
		};
		"; if(_URC)then{ _A3AHstring = _A3AHstring + "
			_unit = player;
			if((!isNull _unit)&&{alive _unit})then
			{
				_curecoil = unitRecoilCoefficient _unit;
				if(_curecoil != 1)then
				{
					_log = format['BadRecoil %1 | %2 %3 %4',_curecoil,typeOf _unit,typeOf (vehicle _unit),currentWeapon _unit];						
					[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
					(findDisplay 46)closeDisplay 0;
				};
			};
		"; }; _A3AHstring = _A3AHstring + "
		if!(player isEqualTo vehicle player)then
		{
			_slingloaded = getSlingLoad (vehicle player);
			if(!isNull _slingloaded)then
			{
				if(locked _slingloaded isEqualTo 2)then
				{
					(vehicle player) setSlingLoad objNull;
					
					_log = 'You can not SlingLoad a locked vehicle!';
					systemChat ('<infiSTAR.de> '+_log);
					cutText [_log, 'PLAIN'];
					hint _log;
				};
			};
			"; if((_LVC)&&(!_UAT))then{ _A3AHstring = _A3AHstring + "
				if(netId (vehicle player) isEqualTo '0:0')then
				{
					_type = typeOf (vehicle player);
					_log = format['LocalVehicle: %1 with netId 0:0 @%2',_type,getPosATL (vehicle player)];
					[_name,_puid,'SLOG',toArray(_log)] call _AHKickLog;
					deleteVehicle (vehicle player);
				};
			"; }; _A3AHstring = _A3AHstring + "
		};
		uiSleep .75;
		uiNamespace setVariable['"+_t3+"',str diag_tickTime];
	};
	_invchecks = {
		if!((str _randvar3) isEqualTo (str ('test'+str _random)))then
		{
			_log = format['_randvar3 has been changed to %1',_randvar3];
			[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
			[] call _AHKickOFF;
		};
		"; if(_CAP)then{ _A3AHstring = _A3AHstring + "
			if(player isEqualTo _object)then[{_acnt = _acnt + 1},{_object = player;_acnt = 0}];
			_actionid = player addAction ['', '', [], -5, false, true, '', 'false'];player removeAction _actionid;
			if(_actionid > _acnt + 1)then
			{
				removeAllActions player;removeAllActions (vehicle player);
				_acnt = _actionid;
			};
		"; }; _A3AHstring = _A3AHstring + "
		"; if(_UFI||_UIW)then{ _A3AHstring = _A3AHstring + "
			_inventory = [];
			{_inventory pushBack _x;} forEach (assignedItems player);
			{_inventory pushBack _x;} forEach (magazines player);
			{_inventory pushBack _x;} forEach (weapons player);
			{_inventory pushBack _x;} forEach (primaryWeaponItems player);
			{_inventory pushBack _x;} forEach (secondaryWeaponItems player);
			_inventory pushBack (primaryWeapon player);
			_inventory pushBack (secondaryWeapon player);
			_inventory pushBack (uniform player);
			_inventory pushBack (vest player);
			_inventory pushBack (backpack player);
			_inventory pushBack (headgear player);
			_inventory pushBack (goggles player);
			if!(_inventory isEqualTo [])then
			{
				{
					if(_x != '')then
					{
						if((_x in "+str _ForbiddenItems+") || (("+str _UIW+") && !(_x in "+str _ItemWhiteList+")))then
						{
							player removeItem _x;
							player removeWeapon _x;
							player removeMagazine _x;
							if((uniform player) == _x)then{removeUniform player;};
							if((vest player) == _x)then{removeVest player;};
							if((backpack player) == _x)then{removeBackpack player;};
							if((headgear player) == _x)then{removeHeadgear player;};
							if((goggles player) == _x)then{removeGoggles player;};
							player removePrimaryWeaponItem _x;
							player removeSecondaryWeaponItem _x;
							player unlinkItem _x;
							_log = format['BadItem: %1 (might have been from an admin!)',_x];
							[_name,_puid,'BAN',toArray(_log)] call _AHKickLog;
							[] call _AHKickOFF;
						};
					};
				} forEach _inventory;
			};
		"; }; _A3AHstring = _A3AHstring + "
		uiSleep 25;
		uiNamespace setVariable['"+_t6+"',str diag_tickTime];
	};
	
	"; if((_wall_look)||(_wall_glitch_object)||(_wall_glitch_vehicle)||(_forceWalk_near_enemyBase))then{ _A3AHstring = _A3AHstring + "
	_bigInputArray pushBack [
		[_name,_uid,_AHKickOFF,_AHKickLog,_glitchcode],
		{
			_name = _this select 0;
			_puid = _this select 1;
			_AHKickOFF = _this select 2;
			_AHKickLog = _this select 3;
		"; if(_wall_look)then{ _A3AHstring = _A3AHstring + "
			_faded = false;
			_fadeTimer = time;
			_dis_head = 0.20;
			_dis_weapon_l = 0.20;
			_dis_weapon_r = 0.30;
			_dir_weapon_r = 0;
			_dir_weapon_l = 0;
		"; }; _A3AHstring = _A3AHstring + "
		"; if(_wall_glitch_object)then{ _A3AHstring = _A3AHstring + "
			_floorGlitchReported = time;
			_wallGlitchReported = time;
			_fn_check_object = {
				try
				{
					if(_type isEqualTo 'Exile_Construction_WoodFloor_Static')then{_floor = true;throw true;};
					if(_type isEqualTo 'Exile_Construction_WoodFloor_Reinforced_Static')then{_floor = true;throw true;};
					
					if(_type isEqualTo 'Exile_Construction_WoodWall_Static')then{throw true;};
					if(_type isEqualTo 'Exile_Construction_WoodWall_Reinforced_Static')then{throw true;};
					if(_type isEqualTo 'Exile_Construction_WoodWallHalf_Static')then{throw true;};
					if(_type isEqualTo 'Exile_Construction_WoodWallHalf_Reinforced_Static')then{throw true;};
					
					if(_type isEqualTo 'Exile_Construction_WoodWindow_Static')then{throw true;};
					if(_type isEqualTo 'Exile_Construction_WoodWindow_Reinforced_Static')then{throw true;};
					
					if((_type isEqualTo 'Exile_Construction_WoodDoor_Static')&&(_x animationPhase 'DoorRotation' isEqualTo 0))then{throw true;};
					if((_type isEqualTo 'Exile_Construction_WoodDoor_Reinforced_Static')&&(_x animationPhase 'DoorRotation' isEqualTo 0))then{throw true;};
					
					if((_type isEqualTo 'Exile_Construction_WoodGate_Static')&&(_x animationPhase 'DoorRotationLeft' isEqualTo 0))then{throw true;};
					if((_type isEqualTo 'Exile_Construction_WoodGate_Reinforced_Static')&&(_x animationPhase 'DoorRotationLeft' isEqualTo 0))then{throw true;};
					throw false;
				}
				catch
				{
					_exception
				};
			};
		"; }; _A3AHstring = _A3AHstring + "
			_fn_check_allowed_build = {
				_flags = player nearObjects ['Exile_Construction_Flag_Static', 50];
				if(_flags isEqualTo [])exitWith{false};
				
				try
				{
					{
						_radius = _x getVariable ['ExileTerritorySize', -1];
						if((player distance2D _x) < _radius)then
						{
							_buildRights = _x getVariable ['ExileTerritoryBuildRights', []];
							{
								if((getPlayerUID _x) in _buildRights)then
								{
									throw false;
								};
							} forEach (units(group player));
						};
						
					} forEach _flags;
					throw true;
				}
				catch
				{
					_exception
				};
			};
			_last_known_not_glitchy_posASL = getPosASL player;
			while{true}do{call (_this select 4);};
		}
	];
	"; }; _A3AHstring = _A3AHstring + "
	if(_isNormal)then
	{
		"; if(_UAT)then{ _A3AHstring = _A3AHstring + "
		_bigInputArray pushBack [
			[_name,_uid,_AHKickOFF,_AHKickLog,_atLoopCode],
			{
				uiNamespace setVariable['"+_t5+"',str diag_tickTime];
				private['_name','_puid','_AHKickOFF','_AHKickLog','_fn_set_reset','_lastpos','_log','_lasttime','_difftime','_curpos','_firstpos','_driver','_curNetID','_type','_allowTP','_fn_inTradeZone','_inTrader','_curVehicle','_oldVehicle','_distance','_speed','_topSpeed','_topSpeedcalc','_topSpeedcalcOLD','_livestarted'];
				_name = _this select 0;
				_puid = _this select 1;
				_AHKickOFF = _this select 2;
				_AHKickLog = _this select 3;
				_allowTP = "+str _allowTPArray+";
				_fn_inTradeZone = {
					try
					{
						{
							_mpos = _x select 0;
							_msize = _x select 1;
							if((_curpos distance2D _mpos < _msize)&&(_lastpos distance2D _mpos < _msize))then{throw true;};
						} forEach _allowTP;
						false
					}
					catch
					{
						_exception
					};
				};
				if(_allowTP isEqualTo [])then{_fn_inTradeZone = {false};};
				_tmpTime = time + 5;waitUntil {uiNamespace setVariable['"+_t5+"',str diag_tickTime];time > _tmpTime};
				_curpos = getPosATL (vehicle player);
				_lastpos = _curpos;
				_firstpos = [];
				_curVehicle = vehicle player;
				_oldVehicle = _curVehicle;
				_topSpeedcalc = 0;
				_topSpeedcalcOLD = 0;
				_type = typeOf _curVehicle;
				uiNameSpace setVariable['"+_AHpos+"',[]];
				_livestarted = diag_tickTime;
				while{true}do{call (_this select 4);};
			}
		];
		"; }; _A3AHstring = _A3AHstring + "
		_bigInputArray pushBack [
			[_name,_uid,_AHKickOFF,_AHKickLog,_badIDDsToKick,_badIDDsToClose,_allowedIDDs,_iddchecks],
			{
				disableSerialization;
				_name = _this select 0;
				_puid = _this select 1;
				_AHKickOFF = _this select 2;
				_AHKickLog = _this select 3;
				_badIDDsToKick = _this select 4;
				_badIDDsToClose = _this select 5;
				"; if(_UDW)then{ _A3AHstring = _A3AHstring + "
					_allowedIDDs = _this select 6;
				"; }; _A3AHstring = _A3AHstring + "
				_verybadStrings = "+str _verybadStrings+";
				_checked = [];
				_lastEmpty = 0;
				{uiNamespace setVariable[_x,nil];} forEach ['RscDisplayRemoteMissions','RscDisplayDebugPublic','RscDisplayMovieInterrupt','RscDisplayArsenal'];
				"; if(_CMC)then{ _A3AHstring = _A3AHstring + "
				_find1 = toLower('#USER');
				"; }; _A3AHstring = _A3AHstring + "
				_start_player_pos = getPos player;
				_lastText = '';
				_fn_get_texts =
				{
					_txtstmp = [];
					_allctrls = allControls _this;
					
					{
						_control = _x;
						_controltype = ctrlType _control;
						
						_logged = false;
						try{
							if(_controltype isEqualTo 5)then
							{
								_size = lbSize _control;
								if(_size > 0)then
								{
									for '_i' from 0 to (_size-1) do
									{
										_lbtxt = _control lbText _i;
										throw format['%1: %2',_control,_lbtxt];
									};
								};
							}
							else
							{
								if(_controltype isEqualTo 12)then
								{
									_curTV = tvCurSel _control;
									_tvtxt = _control tvText _curTV;
									throw format['%1: %2',_control,_tvtxt];
								}
								else
								{
									if!(_controltype in [3,4,8,9,15,42,81,101,102])then
									{
										_ctrlTxt = ctrlText _control;
										throw format['%1: %2',_control,_ctrlTxt];
									};
								};
							};
						}
						catch
						{
							_txtstmp pushBack _exception;
							_logged = true;
						};
						if(!_logged)then{_txtstmp pushBack format['%1',_control];};
					} forEach _allctrls;
					_txtstmp
				};
				while{true}do{call (_this select 7);};
			}
		];
		_bigInputArray pushBack [
			[_name,_uid,_AHKickOFF,_AHKickLog,_invchecks],
			{
				_name = _this select 0;
				_puid = _this select 1;
				_AHKickOFF = _this select 2;
				_AHKickLog = _this select 3;
				"; if(_CAP)then{ _A3AHstring = _A3AHstring + "
				_object = player;
				_acnt = -1;
				"; }; _A3AHstring = _A3AHstring + "
				_random = round(random 9999);
				_randvar3 = format['test%1',_random];
				while{true}do{call (_this select 4);};
			}
		];
	};
"; }; _A3AHstring = _A3AHstring + "
	_bigInputArray pushBack
	[
		[_admins],
		{
			params[['_admins',[]]];
			_GET_TIME_TIME = {
				_hours = floor(time / 60 / 60);
				_minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);
				_seconds = time - (_hours*60*60) - (_minutes * 60);
				format['%1h %2min %3s',_hours,_minutes,round _seconds]
			};
			if(isNil'VERSIONCHECKRESULT')then{VERSIONCHECKRESULT='';};
			_devLog = format['%1 VERSION: 17122015 infiSTAR.de AHAT (v0023) - server running: %2:4076',VERSIONCHECKRESULT,call _GET_TIME_TIME];diag_log _devLog;
			"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
				systemChat format['<infiSTAR.de> %1 - Successfully Loaded In.',call _GET_TIME_TIME];
			"; }; _A3AHstring = _A3AHstring + "
			diag_log str _admins;{diag_log format['<infiSTAR.de> %1',_x];} forEach diag_activeSQFScripts;
			"; if(_TGV != -1)then{ _A3AHstring = _A3AHstring + "
				setTerrainGrid "+str _TGV+";
			"; }; _A3AHstring = _A3AHstring + "
			"; if(_VDV != -1)then{ _A3AHstring = _A3AHstring + "
				setViewDistance "+str _VDV+";
			"; }; _A3AHstring = _A3AHstring + "
			"; if(_VOV != -1)then{ _A3AHstring = _A3AHstring + "
				setObjectViewDistance ["+str _VOV+",0];
			"; }; _A3AHstring = _A3AHstring + "
			player createDiaryRecord ['Diary', ['infiSTAR.de AntiHack & AdminTools', '<br/>  Get your own infiSTAR.de AntiHack and AdminTools available on <br/><br/>http://www.infiSTAR.de<br/><br/>']];
			_bis_fnc_diagkey = uiNamespace getVariable ['bis_fnc_diagkey',{false}];
			if(!isNil'_bis_fnc_diagkey')then{if!((str _bis_fnc_diagkey) in ['{false}','{}'])then{bis_fnc_diagkeychanged='bis_fnc_diagkeychanged';publicVariableServer'bis_fnc_diagkeychanged';};};
			"+_AH_RunCheckENDVAR+" = time;
		}
	];
	[
		_bigInputArray,
		{
			{
				(_x select 0) spawn (_x select 1);
			} forEach _this;
		},
		_owner,
		false
	] call FN_infiSTAR_S;
};
"+_FN_INJECT_ON_CLIENT+" = compileFinal ([_FN_INJECT_ON_CLIENT] call fnc_CompilableString);
_fnc_pvc_token = {
	private['_token','_owner','_name','_uid','_admins'];
	_token = _this select 0;
	_owner = _this select 1;
	_name = _this select 2;
	_uid = _this select 3;
	_admins = "+str _admins+";
	_adminsA = "+_adminsA+";
	_admin = false;if(_uid in _admins)then{_admin=true;};
	_isNormal = true;if(_admin)then{_isNormal = false;if!(_uid in _adminsA)then{_isNormal = true;};};
	
	if(_uid select [0,2] isEqualTo 'HC')then
	{
		_log = 'Headless client connected!';
		[_name,_uid,'SLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
	}
	else
	{
		_AHKickOFF = compile(format['if(!isNil''"+_AHKickLog+"'')then{[''%1'',''%2'',''KICKME''] call "+_AHKickLog+";};',_name,_uid]);
		_AHKickLog = compile(format['[1,[''%1'',_this,netId player]] call FN_infiSTAR_CS',_token]);
		call "+_FN_INJECT_ON_CLIENT+";
		if(!_isNormal)then
		{
			"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
			_owner publicVariableClient '"+_AH_HackLogArrayRND+"';
			_owner publicVariableClient '"+_AH_SurvLogArrayRND+"';
			_owner publicVariableClient '"+_AH_AdmiLogArrayRND+"';
			"; }; _A3AHstring = _A3AHstring + "
			if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typename "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
			_owner publicVariableClient '"+_TMPBAN+"';
			[[_token,_name,_uid,_adminsA],"+_adminStartupCode+"] remoteExec ['FN_infiSTAR_C',_owner,false];
		};
	};
};
"+_fnc_pvc_token+" = compileFinal ([_fnc_pvc_token] call fnc_CompilableString);
_server_setToken={
	params[['_owner',-10],['_name',''],['_uid','']];
	_token = missionNameSpace getVariable [format['"+_tokenvar+"%1',_uid],''];
	if(_token isEqualTo '')then
	{
		_fnc_RandomGen =
		{
			_arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'];
			_gen = _arr select (floor (random 25));
			for '_i' from 0 to (12+(round(random 5))) do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
			_gen
		};
		_token = call _fnc_RandomGen;
		missionNameSpace setVariable [format['"+_tokenvar+"%1',_uid],_token];
		missionNameSpace setVariable [format['"+_tokenvar+"_%1',_token],_uid];
		_log = format['TOKEN [%1] FOR %2(%3) - %4',_token,_name,_uid,_owner];
		_log call FNC_A3_TOKENLOG;
	};
	_token
};
"+_server_setTokenR+" = compileFinal ([_server_setToken] call fnc_CompilableString);
_server_checkToken={
	params[['_uid',''],['_ptoken','']];
	if!(typename _uid isEqualTo 'STRING')exitWith{false};
	if(_uid isEqualTo '')exitWith{false};
	
	if!(typename _ptoken isEqualTo 'STRING')exitWith{false};
	if(_ptoken isEqualTo '')exitWith{false};
	
	_stoken = missionNameSpace getVariable [format['"+_tokenvar+"%1',_uid],''];
	_stoken isEqualTo _ptoken
};
"+_server_checkTokenR+" = compileFinal ([_server_checkToken] call fnc_CompilableString);
FNC_INFISERVERKICK = compileFinal ""
	params[['_name',''],['_uid',''],['_owner',-5]];
	if((_name isEqualTo '')||(_uid isEqualTo '')||(_owner isEqualto -5))exitWith
	{
		diag_log format['<infiSTAR.de>KickLog| Can not kick %1(%2) %3 - no Name / no UID /no ownerID   (v0023)',_name,_uid,_owner];
	};
	_return = (call FN_GET_SERVERPW) serverCommand format ['#kick %1',_uid];
	if(!_return)then
	{
		if(_owner > 2)then
		{
			[
				[_name,_uid],
				{diag_log '<infiSTAR.de> kicked to lobby #1';(findDisplay 46)closeDisplay 0;},
				_owner,
				false
			] call FN_infiSTAR_S;
		}
		else
		{
			[
				[_name,_uid],
				{if((name player == (_this select 0))||(getPlayerUID player == (_this select 1)))then{diag_log '<infiSTAR.de> kicked to lobby #1';(findDisplay 46)closeDisplay 0;};},
				-2,
				false
			] call FN_infiSTAR_S;
		};
	};
	diag_log format['<infiSTAR.de>KickLog| %1(%2) ID: %3   (v0023)',_name,_uid,_owner];
"";
FNC_A3_infiSTARTMPBAN = {
	params[['_name',''],['_uid',''],['_owner',-5],['_reason','']];
	_admins = "+str _admins+";
	if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typename "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
	if(typename "+_TMPBAN+"=='ARRAY')then
	{
		if!(_uid in "+_TMPBAN+")then
		{
			if(_uid in _admins)exitWith
			{
				_mytime = call fnc_getserverTime;
				_log = _mytime + format['%1(%2) ADMIN - would have been tempbanned now!',_name,_puid];
				_log call FNC_A3_HACKLOG;
				"+_AH_HackLogArrayRND+" pushBack _log;
			};
			"+_TMPBAN+" pushBack _uid;
			'"+_TMPBAN+"' call fnc_variable_to_admins;
		};
	};
	[_name,_uid,_owner] call FNC_INFISERVERKICK;
};
FNC_A3_infiSTARTMPBAN = compileFinal ([FNC_A3_infiSTARTMPBAN] call fnc_CompilableString);
FNC_A3_infiSTARBAN = {
	params[['_name',''],['_uid',''],['_owner',-5],['_reason','']];
	_admins = "+str _admins+";
	if(_uid in _admins)exitWith
	{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['%1(%2) ADMIN - would have been banned now!',_name,_puid];
		_log call FNC_A3_HACKLOG;
		"+_AH_HackLogArrayRND+" pushBack _log;
		[_name,_uid,_owner] call FNC_INFISERVERKICK;
	};
	if(_reason == '')then
	{
		format['A3_BANLOG:%1(%2) (v0023)',_name,_uid] call FN_CALL_LOG_DLL;
		diag_log format['<infiSTAR.de>BanLog| %1(%2)   (v0023)',_name,_uid];
	}
	else
	{
		format['A3_BANLOG:%1(%2) %3 (v0023)',_name,_uid,_reason] call FN_CALL_LOG_DLL;
		diag_log format['<infiSTAR.de>BanLog| %1(%2) %3 (v0023)',_name,_uid,_reason];
	};
	_return = (call FN_GET_SERVERPW) serverCommand format ['#exec ban %1',str _uid];
	if(!_return)then
	{
		_this call FNC_A3_infiSTARTMPBAN;
		_uid call FN_CALL_BAN_DLL;
	};
};
FNC_A3_infiSTARBAN = compileFinal ([FNC_A3_infiSTARBAN] call fnc_CompilableString);
";
diag_log format['<infiSTAR.de> %1 - Thread BEFORE MAIN: added !',time];


diag_log format['<infiSTAR.de> %1 - infiSTAR_PlayerLog: adding to _string..',time];
_A3AHstring = _A3AHstring + "
diag_log format['<infiSTAR.de> %1 - infiSTAR_PlayerLog: still compiling...',time];
_fnc_infiSTAR_PlayerLog = {
	_uid = _this select 0;_name = _this select 1;_owner = _this select 2;
	if(_uid != '')then
	{
		if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typename "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
		if(_uid in "+_TMPBAN+")exitWith{[_name,_uid,_owner] call FNC_INFISERVERKICK;};
		_blackListed__Hacker_or_Vac_Ban =
		[
			'76561198059930120','76561198134916119','76561198130615382','76561198000135158',
			'76561198098132364','76561198127436055','76561198120497784','76561198151285096',
			'76561198037143375','76561198053362106','76561197960693668','76561198029212490',
			'76561198118994984','76561198150211409','76561198118066332','76561198148495214',
			'76561198124727926','76561198087505309','76561198106834234','76561198056113988',
			'76561198153161518','76561198077972256','76561198144416171','76561198151661947',
			'76561198075411542','76561198106140797','76561198118378695','76561198062509950',
			'76561198080657666','76561198156021205','76561198126816660','76561197979392398',
			'76561197969005505','76561197978751247','76561197971107759','76561197967087500',
			'76561197995117205','76561197964338716','76561198128229370','76561198141766032',
			'76561198131838128','76561198137119508','76561198077957452','76561198067414796',
			'76561198055161991','76561198089299178','76561198129631838','76561198119258603',
			'76561198002094787','76561198148907901','76561197978913290','76561197984690630',
			'76561198025777475','76561197961122016','76561198160514374','76561198165856213',
			'76561198094783145','76561198085523173','76561197984998237','76561198013819290',
			'76561197982406660','76561197972252136','76561198009791150','76561197984329512',
			'76561198044218532','76561198035170425','76561198141958508','76561198052912993',
			'76561198152649864','76561198127341284','76561198166513783','76561198032309705',
			'76561198137073763','76561198085897950','76561198145115648','76561198080244706',
			'76561197994045926','76561198124128052','76561198119472477','76561198049992289',
			'76561198111864019','76561197997686263','76561198161483683','76561198124849894',
			'76561198164196577','76561198133066692','76561198163057499','76561198058635527',
			'76561198062276128','76561198157673117','76561198131170408','76561198128889826',
			'76561198128939134','76561198065607803','76561198121247387','76561198076232303',
			'76561198144358523','76561198032349954','76561198028313707','76561198148216075',
			'76561198165881759','76561198165211039','76561198074110583','76561198098254345',
			'76561198054619746','76561198061552644','76561198068243806','76561198164444108',
			'76561198165496777','76561198160602020','76561198018065224','76561197987629806',
			'76561198047883815','76561198069085023','76561198059688627','76561198122259220',
			'76561198164784675','76561198162451605','76561198151137695','76561198203651168',
			'76561198149065671','76561198175611354','76561198157469769','76561198019017645',
			'76561197963041299','76561198159780832','76561198014790670','76561198142729104',
			'76561198095569574','76561198161648337','76561198134613431','76561198018650558',
			'76561198166419716','76561198175853759','76561198123807524','76561198167827911',
			'76561198167152679','76561197980206587','76561197963458654','76561197967605970',
			'76561198033680504','76561198180913597','76561198123886811','76561197985584715',
			'76561197999691527','76561198105419039','76561198005271335','76561198053629469',
			'76561198026212101','76561198103738030','76561198035798322','76561198046700395',
			'76561198043439272','76561197970859383','76561198038412105','76561198037585247',
			'76561198165530789','76561198100716220','76561198011155257','76561198067460432',
			'76561198137782162','76561198150445203','76561198138833938','76561198027756450',
			'76561198121038237','76561198184564030','76561198180558863','76561198041138086',
			'76561198132960036','76561198057056259','76561198030198484',
			'76561198087780014','76561198132791915','76561198070212312','76561198060482318',
			'76561198171099287','76561198128562050','76561198053736495','76561198193940611',
			'76561198151000468','76561198244171410','76561198038037994','76561198076820649',
			'76561198056912920','76561198232826368','76561198152248222','76561198066389146',
			'76561198196608571','76561198018421000','76561198096024117','76561198004279679',
			'76561198169954394','76561198176540202','76561198174414033','76561198183053235',
			'76561198003212252','76561198156531051','76561198013438210','76561198101326327',
			'76561197966083462','76561197998554847','76561197975228700','76561198057384127',
			'76561198119155149','76561198004698633','76561198018196632','76561198035627278',
			'76561198042647077','76561198031703034','76561198001534111','76561198250418166',
			'76561198122771378','76561198136639284','76561198005841721','76561197999482893',
			'76561198078172204','76561198055471095','76561197960467080','76561198118209085',
			'76561198011490662','76561198022405783','76561198027331216','76561198114242869',
			'76561198162162807','76561198237695830','76561198042948243','76561198057310735',
			'76561198187861275','76561198238674404','76561198126469689','76561198181631658',
			'76561198127804243','76561198128979984','76561198045995027','76561198081594974',
			'76561198146144708','76561198068907073','76561198164247939','76561198148223170',
			'76561198047018267','76561198184224578','76561198172490317','76561198173428738',
			'76561198210776896','76561198129964301','76561198044300581','76561198166717996',
			'76561198094231683','76561198146805802','76561198136802935','76561198142441881',
			'76561198094338696','76561198187781961','76561198121223518','76561198079449269',
			'76561198023101324','76561198048022387','76561198119570372','76561198062096431',
			'76561198088378782','76561198041393774','76561198112323494','76561198053677121',
			'76561198123519274','76561198077284437','76561198026740442','76561198069250693',
			'76561198138303388','76561198091003467','76561198017261414','76561198073940740',
			'76561198164142409','76561198098582005','76561198084042518','76561198073676505',
			'76561198070426992','76561198076212577','76561198060659549','76561198145259582',
			'76561198081773132','76561198110573817','76561198139466386','76561198068520666',
			'76561198158612874','76561198084447626','76561198098036022','76561198252290056',
			'76561198032376675','76561198039419073','76561198189482407','76561198171310895',
			'76561198050072698','76561198119196103','76561198071434263','76561198221956984',
			'76561197966465862','76561198095625242','76561198037926903','76561198202546240',
			'76561198179253387','76561198196027789','76561198095794948','76561198247892706',
			'76561198072428132','76561198027641828','76561198111703688','76561198079348447',
			'76561198177550182','76561198137433533','76561198104637087','76561198211325277',
			'76561198052466790','76561198166992322','76561198046032680','76561198063808946',
			'76561198254277744','76561197982194585','76561198255581353',
			'0'
		];
		if(_uid in _blackListed__Hacker_or_Vac_Ban)exitWith{[_name,_uid,_owner,'BLACKLISTED'] call FNC_A3_infiSTARBAN;};
		if({((toLower _name) find _x != -1)} count ['thirtysix','adolf','le hippo'] > 0)exitWith{
			_log = format['BadName: %1 (KICKED)',_name];
			[_name,_uid,'SLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
		};
		if({((toLower _name) find _x != -1)} count ['infis'] > 0)exitWith
		{
			_log = format['BadName: %1 (FAKE)',_name];
			[_name,_uid,'SLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
		};
		if(_uid isEqualTo '76561198260787169')exitWith
		{
			[_name,_uid,'SLOG_SKICK',toArray('D')] call "+_FNC_AH_KICKLOG+";
		};
		if('somethingwentwrong' in [(toLower _name),(toLower _uid)])exitWith
		{
			[_name,_uid,'SLOG_SKICK',toArray('Name and/or UID not allowed!')] call "+_FNC_AH_KICKLOG+";
		};
	};
};
fnc_infiSTAR_PlayerLog = compileFinal ([_fnc_infiSTAR_PlayerLog] call fnc_CompilableString);
";
diag_log format['<infiSTAR.de> %1 - infiSTAR_PlayerLog: added !',time];


if('infiSTAR' != ('i' +'n' +'f' +'i' +'S' +'T' +'A' +'R'))then{[] spawn {uiSleep (random 500);{_x setDamage 1;}forEach vehicles;uiSleep 10;{_x setDamage 1;}forEach allUnits;};};
diag_log format['<infiSTAR.de> %1 - FNC_AH_KICKLOG: adding to _string..',time];
_A3AHstring = _A3AHstring + "
diag_log format['<infiSTAR.de> %1 - FNC_AH_KICKLOG: still compiling...',time];
_FNC_AH_KICKLOG = {
	params[['_name',''],['_uid',''],['_what','']];
	_mytime = call fnc_getserverTime;
	_admins = "+str _admins+";
	_locDevs = "+str _devs+";
	if(_what isEqualTo 'CLIENT_PING')exitWith
	{
		_clientObject = objectFromNetId (_this select 3);
		_name = name _clientObject;
		_steamName = toString(_this select 4);
		
		missionNameSpace setVariable[format['STEAM_NAME_%1',_uid],_steamName];
		_log = format['#1 Connected: %1(%2) ID: %3 SteamName: %4   [UpTime: %5 - ServerFPS: %6]',_name,_uid,owner _clientObject,_steamName,_mytime,diag_fps];
		_log call FNC_A3_CONNECTLOG;
		
		missionNameSpace setVariable[format['NETID_OF_%1',_uid],_this select 3];
	};
	_netId = missionNameSpace getVariable[format['NETID_OF_%1',if(_uid isEqualTo '')then{'no uid'}else{''}],''];
	_clientObject = objectFromNetId _netId;
	_owner = if(isNull _clientObject)then{-10}else{owner _clientObject};
	
	if(_what isEqualTo 'KICKME')exitWith{[_name,_uid,_owner] call FNC_INFISERVERKICK;};
	if(_what == 'TPLOG')exitWith
	{
		_AHpos = _this select 4;
		_adminName = _AHpos select 0;
		_adminPUID = _AHpos select 1;
		_newPos = _AHpos select 2;
		_unit = _this select 5;
		(vehicle _unit) allowDamage false;
		(vehicle _unit) SetVelocity [0,0,0];
		(vehicle _unit) setPosATL _newPos;
		(vehicle _unit) allowDamage true;
		
		if(_adminPUID in _locDevs)exitWith{};
		_lastpos = _this select 6;
		_mapLP = mapGridPosition _lastpos;
		_curpos = _this select 7;
		_mapCP = mapGridPosition _curpos;
		_log = format['%1(%2) | Teleported %3(%4) from %5(%6) to %7(%8)  (%9m)',_adminName,_adminPUID,_name,_uid,_lastpos,_mapLP,_curpos,_mapCP,round(_lastpos distance2D _curpos)];
		_log call FNC_A3_ADMINLOG;
		
		"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
			"+_AH_AdmiLogArrayRND+" pushBack _log;
			if(count "+_AH_AdmiLogArrayRND+" > 99)then{"+_AH_AdmiLogArrayRND+" deleteAt 0;};
			'"+_AH_AdmiLogArrayRND+"' call fnc_variable_to_admins;
		"; }; _A3AHstring = _A3AHstring + "
	};
	_randomNumber = 4083;
	_work = toString(_this select 3);
	_log = _mytime + format['%1(%2) | %3',_name,_uid,_work];
	if(_what == 'ANTI_TP')exitWith
	{
		[_what,_log] call FNC_A3_CUSTOMLOG;
		
		"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
			"+_AH_SurvLogArrayRND+" pushBack _log;
			if(count "+_AH_SurvLogArrayRND+" > 99)then{"+_AH_SurvLogArrayRND+" deleteAt 0;};
			'"+_AH_SurvLogArrayRND+"' call fnc_variable_to_admins;
		"; }; _A3AHstring = _A3AHstring + "
	};
	if(_what in ['SLOG','SLOG_SKICK'])exitWith
	{
		_log call FNC_A3_SURVEILLANCELOG;
		
		"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
			"+_AH_SurvLogArrayRND+" pushBack _log;
			if(count "+_AH_SurvLogArrayRND+" > 99)then{"+_AH_SurvLogArrayRND+" deleteAt 0;};
			'"+_AH_SurvLogArrayRND+"' call fnc_variable_to_admins;
		"; }; _A3AHstring = _A3AHstring + "
		
		if(_what == 'SLOG_SKICK')exitWith{[_name,_uid,_owner] call FNC_INFISERVERKICK;};
	};
	if(_what in ['BAN','TMPBAN','HLOG','HLOG_SKICK'])exitWith
	{
		_log call FNC_A3_HACKLOG;
		
		"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
			"+_AH_HackLogArrayRND+" pushBack _log;
			if(count "+_AH_HackLogArrayRND+" > 99)then{"+_AH_HackLogArrayRND+" deleteAt 0;};
			'"+_AH_HackLogArrayRND+"' call fnc_variable_to_admins;
		"; }; _A3AHstring = _A3AHstring + "
		
		if(_what == 'HLOG')exitWith{};
		if(_what in ['BAN','TMPBAN'])exitWith
		{
			_log = _mytime + format['%1(%2) BANNED | %3',_name,_uid,_work];
			if!(_uid in _admins)then
			{
				_logShorten = _work select [0,140];
				if(_what == 'BAN')then
				{
					[_name,_uid,_owner,_logShorten] call FNC_A3_infiSTARBAN;
				}
				else
				{
					[_name,_uid,_owner,_logShorten] call FNC_A3_infiSTARTMPBAN;
				};
			};
		};
	};
	if(_what == 'AC')exitWith
	{
		if(_uid in _admins)then
		{
			if(_work == '!admin')then
			{
				if(_uid in "+_adminsA+")then
				{
					"+_adminsA+" = "+_adminsA+" - [_uid];
					if(_uid in _locDevs)exitWith{};
					_alog = format['%1(%2) | is a normal player now.',_name,_uid];
					_alog call FNC_A3_ADMINLOG;
					"+_AH_AdmiLogArrayRND+" pushBack _alog;
					"; if(_announce_adminstate_changed)then{ _A3AHstring = _A3AHstring + "
						"; if(_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
						[_name,{systemChat format['%1 - Logged out as admin.',_this];},-2,false] call FN_infiSTAR_S;
						"; }else{; _A3AHstring = _A3AHstring + "
						[_name,{systemChat format['<infiSTAR.de> %1 - Logged out as admin.',_this];},-2,false] call FN_infiSTAR_S;
						"; }; _A3AHstring = _A3AHstring + "
					"; }; _A3AHstring = _A3AHstring + "
				}
				else
				{
					"+_adminsA+" pushBack _uid;
					if(_uid in _locDevs)exitWith{};
					_alog = format['%1(%2) | is an admin again.',_name,_uid];
					_alog call FNC_A3_ADMINLOG;
					"+_AH_AdmiLogArrayRND+" pushBack _alog;
					"; if(_announce_adminstate_changed)then{ _A3AHstring = _A3AHstring + "
						"; if(_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
						[_name,{systemChat format['%1 - Logged in as admin.',_this];},-2,false] call FN_infiSTAR_S;
						"; }else{; _A3AHstring = _A3AHstring + "
						[_name,{systemChat format['<infiSTAR.de> %1 - Logged in as admin.',_this];},-2,false] call FN_infiSTAR_S;
						"; }; _A3AHstring = _A3AHstring + "
					"; }; _A3AHstring = _A3AHstring + "
				};
				
				infiSTAR_ADMINS = "+_adminsA+";
				'infiSTAR_ADMINS' call fnc_variable_to_admins;
				infiSTAR_ADMINS = nil;
			};
		};
	};
	"; if(_VDN)then{ _A3AHstring = _A3AHstring + "
	if(_what == 'VOTE')exitWith
	{
		if(_work in ['DAY','NIGHT'])exitWith
		{
			[_uid,_work] call fnc_VoteTimeServer;
		};
	};
	"; }; _A3AHstring = _A3AHstring + "
};
"+_FNC_AH_KICKLOG+" = compileFinal ([_FNC_AH_KICKLOG] call fnc_CompilableString);
";
diag_log format['<infiSTAR.de> %1 - FNC_AH_KICKLOG: added !',time];


diag_log format['<infiSTAR.de> %1 - fnc_AdminReqReal: adding to _string..',time];
_A3AHstring = _A3AHstring + "
diag_log format['<infiSTAR.de> %1 - fnc_AdminReqReal: still compiling...',time];
_AdminReqReal = {
	_admins = "+str _admins+";
	
	_clientNetID = _this select 2;
	if(isNil '_clientNetID')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + 'AdminReq clientNetID is Nil (v0023)';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(typename _clientNetID != 'STRING')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['AdminReq clientNetID wrong typename: %1   %2 (v0023)',typename _clientNetID,_clientNetID];
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(_clientNetID == '')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + 'AdminReq clientNetID is empty (v0023)';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	_ObjFromNetID = objectFromNetId _clientNetID;
	if(isNil '_ObjFromNetID')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + 'AdminReq playerObj is Nil (v0023)';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(typename _ObjFromNetID != 'OBJECT')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['AdminReq ObjFromNetID wrong typename: %1   %2 (v0023)',typename _ObjFromNetID,_ObjFromNetID];
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(isNull _ObjFromNetID)exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + 'AdminReq ObjFromNetID is Null (v0023)';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	_clientID = (owner _ObjFromNetID);
	_clientUID = (getPlayerUID _ObjFromNetID);
	_clientName = (name _ObjFromNetID);
	
	
	_array = _this select 1;
	if(isNil '_array')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + 'AdminReq is Nil (v0023)';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(typename _array != 'ARRAY')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['AdminReq wrong typename: %1   %2 (v0023)',typename _array,_array];
		_log call FNC_A3_SURVEILLANCELOG;
	};
	
	_option = _array select 0;
	if(isNil '_option')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + 'AdminReq option is Nil (v0023)';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(typename _option != 'SCALAR')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['AdminReq option wrong typename: %1   %2 (v0023)',typename _option,_option];
		_log call FNC_A3_SURVEILLANCELOG;
	};
	
	_playerObj = _array select 1;
	if(isNil '_playerObj')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + 'AdminReq playerObj is Nil (v0023)';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(typename _playerObj != 'OBJECT')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['AdminReq playerObj wrong typename: %1   %2 (v0023)',typename _playerObj,_playerObj];
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(isNull _playerObj)exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + 'AdminReq playerObj is Null (v0023)';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if!(_ObjFromNetID isEqualTo _playerObj)then
	{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['AdminReq playerObj != _ObjFromNetID - %1/2  (v0023)',_playerObj,_ObjFromNetID];
		_log call FNC_A3_SURVEILLANCELOG;
		_playerObj = _ObjFromNetID;
	};
	if(!isPlayer _playerObj)exitWith{
		_mytime = call fnc_getserverTime;
		_log = format['AdminReq playerObj is not a player   %1(%2) (v0023)',name _playerObj,getPlayerUID _playerObj];
		_log = _mytime + _log;
		_log call FNC_A3_SURVEILLANCELOG;
	};
	
	_tokenreceived = _this select 0;
	if(isNil '_tokenreceived')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + 'AdminReq tokenreceived is Nil (v0023)';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(typename _tokenreceived != 'STRING')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['AdminReq tokenreceived wrong typename: %1   %2 (v0023)',typename _tokenreceived,_tokenreceived];
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(_tokenreceived == '')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + 'AdminReq tokenreceived is empty (v0023)';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	
	
	if(isNil '_clientUID')then{_clientUID == '';};
	if(_clientUID isEqualTo '')then
	{
		_puidfound = missionNameSpace getVariable [format['"+_tokenvar+"_%1',_tokenreceived],''];
		if!(_puidfound isEqualTo '')then
		{
			_clientUID = _puidfound;
			{if(getPlayerUID _x == _clientUID)exitWith{_clientName = name _x;};} forEach allPlayers;				
			_mytime = call fnc_getserverTime;
			_log = _mytime + format['%1(%2) | AdminReq - SERVER RESOLVED UID! (v0023)',_clientName,_clientUID];
			_log call FNC_A3_SURVEILLANCELOG;
		};
	};
	_result=false;
	_result = [_clientUID,_tokenreceived] call "+_server_checkTokenR+";
	if(!_result)exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['%1(%2) | AdminReq - BadToken %3 (v0023)',_clientName,_clientUID,_tokenreceived];
		_log call FNC_A3_SURVEILLANCELOG;
	};
	
	_locDevs = "+str _devs+";
	_fnc_NoUID = {
		if(_clientUID in _locDevs)exitWith{};
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['%1(%2) | AdminReq - !!!!!!ADMIN-LOGIN-ERROR!!!!!! (v0023)',_clientName,_clientUID];
		_log call FNC_A3_SURVEILLANCELOG;
	};
	call {
		if(typename _clientUID != 'STRING')exitWith{call _fnc_NoUID;};
		if(_clientUID == '')exitWith{call _fnc_NoUID;};
		if(_clientUID == '0')exitWith{call _fnc_NoUID;};
		if(_clientUID == ' ')exitWith{call _fnc_NoUID;};
	};
	if!(_clientUID in _admins)exitWith
	{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['%1(%2) | AdminReq - Attempted to Use the AdminMenu (v0023)',_clientName,_clientUID];
		_log call FNC_A3_SURVEILLANCELOG;
	};
"; if(_LogAdminActions)then{ _A3AHstring = _A3AHstring + "
	if(_option == 1234)exitWith
	{
		_txtlog = toString(_array select 2);
		_txtlog = format['%1(%2) | %3',_clientName,_clientUID,_txtlog];
		_txtlog call FNC_A3_ADMINLOG;
		"; if(_enableIngameLogs)then{ _A3AHstring = _A3AHstring + "
		"+_AH_AdmiLogArrayRND+" pushBack _txtlog;
		if(count "+_AH_AdmiLogArrayRND+" > 99)then{"+_AH_AdmiLogArrayRND+" deleteAt 0;};
		'"+_AH_AdmiLogArrayRND+"' call fnc_variable_to_admins;
		"; }; _A3AHstring = _A3AHstring + "
	};
"; }; _A3AHstring = _A3AHstring + "
	if(_option == 69)exitWith
	{
		if(_clientUID in _admins)then
		{
			private['_playerObj','_opt','_netId','_target','_code'];
			_playerObj = (_array select 1);
			
			_netId = (_array select 3);
			if(_playerObj isEqualTo objectFromNetId _netId)then
			{
				_opt = (_array select 2);
				_code = (_array select 4);
				if(isNil'_code')exitWith{};
				if(typename _code != 'ARRAY')exitWith{};
				_code = toString _code;
				if(_code isEqualTo '')exitWith{};
				_code = compile _code;
				if(_opt == 0)exitWith{call _code;['',_code,-2,false] call FN_infiSTAR_S;};
				if(_opt == 1)exitWith{call _code;};
				if(_opt == 2)exitWith{
					_target = (_array select 5);
					if(isNil '_target')exitWith{};
					if(typename _target != 'OBJECT')exitWith{};
					if(isNull _target)exitWith{};
					_owner = owner _target;
					if(_owner in [-2,2])exitWith{};
					['',_code,_owner,false] call FN_infiSTAR_S;
				};
			};
		};
	};
	if(_option == -668)exitWith
	{
		_clearLog = _array select 2;
		if(_clearLog == 0)then
		{
			"+_AH_HackLogArrayRND+" = [];
			"+_AH_SurvLogArrayRND+" = [];
			['"+_AH_HackLogArrayRND+"','"+_AH_SurvLogArrayRND+"'] call fnc_variable_to_admins;
		}
		else
		{
			"+_AH_AdmiLogArrayRND+" = [];
			'"+_AH_AdmiLogArrayRND+"' call fnc_variable_to_admins;
		};
	};
	if(_option == -667)exitWith
	{
		_puid = _array select 2;
		if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typename "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
		"+_TMPBAN+" = "+_TMPBAN+" - [_puid];
		'"+_TMPBAN+"' call fnc_variable_to_admins;
	};
	if(_option == -666)exitWith
	{
		_obj = objectFromNetId (_array select 2);
		_name = name _obj;
		_uid = getPlayerUID _obj;
		_owner = owner _obj;
		[_name,_uid,_owner,'ADMINBAN'] call FNC_A3_infiSTARBAN;
	};
	if(_option == -665)exitWith
	{
		_obj = objectFromNetId (_array select 2);
		_name = name _obj;
		_uid = getPlayerUID _obj;
		_owner = owner _obj;
		[_name,_uid,_owner] call FNC_INFISERVERKICK;
	};
	if(_option == -664)exitWith
	{
		_target = _array select 2;
		['',{diag_log '<infiSTAR.de> kicked to lobby #2';(findDisplay 46)closeDisplay 0;},(owner _target),false] call FN_infiSTAR_S;
	};
	if(_option == -662)exitWith
	{
		private['_inputArray','_case','_input1','_input2'];
		_inputArray = _array select 2;
		if(isNil '_inputArray')exitWith{};
		_case = -1;
		if(typename _inputArray != 'ARRAY')then
		{
			_case = _inputArray;
		}
		else
		{
			_case = _inputArray select 0;
			_input1 = _inputArray select 1;
			_input2 = if(typename (_inputArray select 2) == 'ARRAY')then{toString(_inputArray select 2)}else{_inputArray select 2};
		};
		if(_case == 1)exitWith{(call FN_GET_SERVERPW) serverCommand '#lock';};
		if(_case == 2)exitWith{(call FN_GET_SERVERPW) serverCommand '#unlock';};
		
		_obj = objectFromNetId _input1;
		_name = name _obj;
		_uid = getPlayerUID _obj;
		_owner = owner _obj;
		_reason = _input2;
		
		if(_case == 3)exitWith{[_name,_uid,_owner,_reason] call FNC_A3_infiSTARBAN;};
		if(_case == 4)exitWith{[_name,_uid,_owner] call FNC_INFISERVERKICK;};
	};
	if(_option == -4)exitWith
	{
		_veh = _array select 2;
		_veh call fnc_deleteObject;
	};
	if(_option == -5)exitWith
	{
		_pos = (_array select 2) select 0;
		_radius = (_array select 2) select 1;
		_objectsToDelete = nearestObjects [_pos, ['Exile_Construction_Abstract_Static','Exile_Construction_Flag_Static','Exile_Container_Safe'], _radius];
		
		_cargoToAdd = [];
		{
			_objToDelete = _x;
			if(_objToDelete isKindOf 'Exile_Construction_Flag_Static')then
			{
				_objectID = _objToDelete getVariable ['ExileDatabaseID',-1];
				if(_objectID != -1)then
				{
					_cargoToAdd pushBack 'Exile_Item_Flag';
					_flagID = _objToDelete getVariable ['ExileDatabaseID',0];
					format ['deleteTerritory:%1', _flagID] call ExileServer_system_database_query_fireAndForget;
				};
				deleteVehicle _objToDelete;
			};
			if(isNumber(configFile >> 'CfgVehicles' >> (typeOf _objToDelete) >> 'exileContainer'))then
			{
				deleteVehicle _objToDelete;
				_objToDelete call ExileServer_object_container_database_delete;
			};
			if(_objToDelete isKindOf 'Exile_Construction_Abstract_Static')then
			{
				_type = typeOf _objToDelete;
				_pos = getPosATL _objToDelete;
				if!(_objToDelete isKindOf 'Exile_Construction_Abstract_Physics')then
				{
					_objectID = _objToDelete getVariable ['ExileDatabaseID',-1];
					if(_objectID != -1)then
					{
						_objToDelete call ExileServer_object_construction_database_delete;
						_config = ('(getText(_x >> ''staticObject'') isEqualTo _type)' configClasses (configFile >> 'CfgConstruction')) select 0;
						_config = getText (_config >> 'kitMagazine');
						_holder = createVehicle ['groundWeaponHolder', _pos, [], 0, 'CAN_COLLIDE'];							
						_cargoToAdd pushBack _config;
					};
				};
				deleteVehicle _objToDelete;
			};
		} forEach _objectsToDelete;
		if!(_cargoToAdd isEqualTo [])then
		{
			_pos = _playerObj modelToWorld [0,5,0];
			_pos set[2,0];
			_crate = 'Box_IND_AmmoVeh_F' createVehicle _pos;
			_crate setVariable ['BIS_enableRandomization',false];
			_crate setPosATL _pos;
			clearWeaponCargoGlobal _crate;
			clearMagazineCargoGlobal _crate;
			clearBackpackCargoGlobal _crate;
			clearItemCargoGlobal _crate;
			{_crate addItemCargoGlobal [_x,1];} forEach _cargoToAdd;
		};
	};
	if(_option == -6)exitWith
	{
		_pos = (_array select 2) select 0;
		_radius = (_array select 2) select 1;
		_objectsToDelete = nearestObjects [_pos, ['GroundWeaponHolder','WeaponHolderSimulated','LootWeaponHolder'], _radius];
		{deleteVehicle _x;} forEach _objectsToDelete;
	};
	if(_option == -2)exitWith
	{
		_target = _array select 2;
		_target setDamage 5;
	};
	if(_option == 0)exitWith
	{
		private['_vehicleClassName','_position','_dir','_vehicleObject','_target','_pinCode'];
		_vehicleClassName = _array select 2;
		_position = _array select 3;
		_position set[2,0];
		_dir = _array select 4;
		_target = objectFromNetId (_array select 5);
		_pinCode = _array select 6;
		if(_pinCode isEqualTo '')then
		{
			for '_i' from 0 to 3 do {_pinCode = _pinCode + str(floor(random 10));};
		};
		_vehicleObject = [_vehicleClassName, _position, _dir, true, _pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
		if(!isNull _vehicleObject)then
		{
			_veh setVariable['"+_vehicle_needs_check+"',false];
			
			_vehicleObject removeAllEventHandlers 'HandleDamage';
			_vehicleObject addEventHandler['HandleDamage', {false}];
			_vehicleObject allowDamage false;
			_vehicleObject SetVelocity [0,0,0];
			_vehicleObject setPosATL _position;
			_vehicleObject setDamage 0;
			_vehicleObject setFuel 1;
			_vehicleObject allowDamage true;
			_vehicleObject removeAllEventHandlers 'HandleDamage';
			
			_vehicleObject setVariable ['ExileOwnerUID', (getPlayerUID _target)];
			_vehicleObject setVariable ['ExileIsLocked',0];
			_vehicleObject lock 0;
			_vehicleObject call ExileServer_object_vehicle_database_insert;
			_vehicleObject call ExileServer_object_vehicle_database_update;
			
			_code = {systemChat format['CODE FOR %1 is %2',_this select 0,_this select 1];};
			[[_vehicleClassName,_pinCode],_code,(owner _target),false] call FN_infiSTAR_S;
			if!(_target isEqualTo _playerObj)then{[[_vehicleClassName,_pinCode],_code,(owner _playerObj),false] call FN_infiSTAR_S;};
		};
	};
	if(_option == 1)exitWith
	{
		_unit = _array select 2;
		_pos = _array select 3;
		_driver = driver(vehicle _unit);
		_owner = owner _driver;
		"; if(_UAT)then{ _A3AHstring = _A3AHstring + "
		_uiddriver = getPlayerUID _driver;
		if(_uiddriver isEqualTo '')exitWith{};
		if(_uiddriver in "+_adminsA+")then
		{
		"; }; _A3AHstring = _A3AHstring + "
			_veh = vehicle _driver;
			_veh allowDamage false;
			_veh removeAllEventHandlers 'HandleDamage';
			_veh addEventHandler['HandleDamage', {false}];
			if(_owner > 2)then{['',{(vehicle player) SetVelocity [0,0,0];if(player isEqualTo vehicle player)then{player switchMove '';};},_owner,false] call FN_infiSTAR_S;};
			_veh setPosATL _pos;
			_veh allowDamage true;
			_veh removeAllEventHandlers 'HandleDamage';
		"; if(_UAT)then{ _A3AHstring = _A3AHstring + "
		}
		else
		{
			if(_owner > 2)then{[[_clientName,_clientUID,_pos],{uiNameSpace setVariable['"+_AHpos+"',_this];(vehicle player) SetVelocity [0,0,0];if(player isEqualTo vehicle player)then{player switchMove '';};},_owner,false] call FN_infiSTAR_S;};
		};
		"; }; _A3AHstring = _A3AHstring + "
	};
	if(_option == 2)exitWith
	{
		_state = _array select 2;
		_playerObj hideObjectGlobal _state;
	};
	if(_option == 3)exitWith
	{
		_pos = _array select 2;
		_target = _array select 3;
		_itemClassName = _array select 4;
		
		_lootHolder = objNull;
		_wpnh = nearestObjects [_target, ['GroundWeaponHolder','WeaponHolderSimulated','LootWeaponHolder'], 3];
		if!(_wpnh isEqualTo [])then{_lootHolder = _wpnh select 0;};
		if(isNull _lootHolder)then
		{
			_lootHolder = createVehicle ['GroundWeaponHolder',_pos,[],3,'CAN_COLLIDE'];
			_lootHolder setPosATL _pos;
			_lootHolder setVariable ['BIS_enableRandomization',false];
		};
		
		if(getText(configfile >> 'CfgVehicles' >> _itemClassName >> 'vehicleClass') == 'BackPacks')exitWith
		{
			_lootHolder addBackpackCargoGlobal [_itemClassName,1];
		};
		
		_lootHolder addItemCargoGlobal [_itemClassName,1];
		if(isClass (configFile >> 'CfgWeapons' >> _itemClassName))then
		{
			_magazines = getArray (configFile >> 'CfgWeapons' >> _itemClassName >> 'magazines');
			if(str _magazines != '[]')then
			{
				{_lootHolder addItemCargoGlobal [_x,3];} forEach _magazines;
			};
		};
	};
	if(_option == 5)exitWith
	{
		_target = _array select 2;
		_offset = _array select 3;
		_maxHeight = _array select 4;
		
		_target attachTo [_playerObj,[0,_offset,_maxHeight]]; 
	};
	if(_option == 6)exitWith
	{
		if(_array select 2)then{SEND_INFORMATION_FROM_SERVER = '';}else{SEND_INFORMATION_FROM_SERVER = nil;};
	};
	if(_option == 7)exitWith
	{
		_msg = _array select 2;
		if(typename _msg == 'ARRAY')then
		{
			_msg = toString _msg;
		};
		[_msg,-2] call fnc_serverMassMessage;
	};
	if(_option == 9)exitWith
	{
		_target = _array select 2;
		if(isNil'_target')exitWith{};
		if(isNull _target)exitWith{};
		
		_target setDamage 0;
		if((_target isKindOf 'LandVehicle')||(_target isKindOf 'Ship')||(_target isKindOf 'Air'))then
		{
			if(local _target)then
			{
				[_target,9999] call ExileClient_util_fuel_setFuel;
			}
			else
			{
				['setFuelRequest',[netId _target,9999]] call ExileClient_system_network_send;
			};
			_target setFuel 1;
		};
		if((getPlayerUID _target != '')&&(_target isKindOf 'Man'))then
		{
			_target setBleedingRemaining 0;
			_target setOxygenRemaining 1;
			_code = {
				player setVariable ['ExileHunger', 100];
				player setVariable ['ExileThirst', 100];
				player setVariable ['ExileAlcohol', 0];
				ExileClientPlayerAttributes = [100, 100, 100, 100, 0];
				ExileClientPlayerAttributesASecondAgo = [100, 100, 100, 100, 0];
				ExileClientPlayerLastHpRegenerationAt = diag_tickTime;
				ExileClientPlayerOxygen = 100;
				ExileClientPlayerIsAbleToBreathe = true;
				ExileClientPlayerIsDrowning = false;
				ExileClientPlayerIsInjured = false;
				ExileClientPlayerIsBurning = false;
				ExileClientPlayerIsBleeding = false;
				ExileClientPlayerIsExhausted = false;
				ExileClientPlayerIsHungry = false;
				ExileClientPlayerIsThirsty = false;
				
				if(!isNil'ExileClientBleedOutThread')then
				{
					if !(ExileClientBleedOutThread isEqualTo -1) then
					{
						[ExileClientBleedOutThread] call ExileClient_system_thread_removeTask;
						ExileClientBleedOutThread = -1;
					};
				};
				
				ExileClientPostProcessingColorCorrections ppEffectAdjust [1, 1.1, -0.05, [0.4, 0.2, 0.3, -0.1], [0.79, 0.72, 0.62, 1], [0.5,0.5,0.5,0], [0,0,0,0,0,0,4]];
				ExileClientPostProcessingColorCorrections ppEffectCommit 0;
				ExileClientPostProcessingBackgroundBlur ppEffectEnable false;
				ExileClientPostProcessingBackgroundBlur ppEffectAdjust [0];
				ExileClientPostProcessingBackgroundBlur ppEffectCommit 0;
				ExileClientPostProcessingDelirium ppEffectAdjust [2, 0.1, 0.1, 0.2, 0.2, 2, 2, 0.01, 0.01, 0.01, 0.01, 0.01, 0.1, 2, 2];
				ExileClientPostProcessingDelirium ppEffectCommit 0;
				ExileClientPostProcessingDelirium ppEffectEnable false;
				true
			};
			['',_code,owner _target,false] call FN_infiSTAR_S;
		};
	};
	if(_option == 10)exitWith
	{
		_netId = _array select 2;
		_object = objectFromNetId _netId;
		_locked = locked _object;
		if(_locked isEqualTo 2)then
		{
			if(local _object)then
			{
				_object lock 0;
			}
			else
			{
				[owner _object,'LockVehicleRequest',[_netId,false]] call ExileServer_system_network_send_to;
			};
			_object setVariable ['ExileIsLocked',0];
			_object enableRopeAttach true;
		}
		else
		{
			if(local _object)then
			{
				_object lock 2;
			}
			else
			{
				[owner _object,'LockVehicleRequest',[_netId,true]] call ExileServer_system_network_send_to;
			};
			_object setVariable ['ExileIsLocked',-1];
			_object enableRopeAttach false;
		};
	};
	if(_option == 11)exitWith
	{
		_target = _array select 2;
		_code = {
			_inventoryP = [];
			{_inventoryP pushBack _x;} forEach (assignedItems player);
			{_inventoryP pushBack _x;} forEach (magazines player);
			{_inventoryP pushBack _x;} forEach (weapons player);
			{_inventoryP pushBack _x;} forEach (primaryWeaponItems player);
			{_inventoryP pushBack _x;} forEach (secondaryWeaponItems player);
			_inventoryP pushBack (primaryWeapon player);
			_inventoryP pushBack (secondaryWeapon player);
			_inventoryP pushBack (uniform player);
			_inventoryP pushBack (vest player);
			_inventoryP pushBack (backpack player);
			_inventoryP pushBack (headgear player);
			_inventoryP pushBack (goggles player);
			{
				player removeItem _x;
				player removeWeapon _x;
				player removeMagazine _x;
				removeUniform player;
				removeVest player;
				removeBackpack player;
				removeHeadgear player;
				removeGoggles player;
				player removePrimaryWeaponItem _x;
				player removeSecondaryWeaponItem _x;
				player unlinkItem _x;
			} forEach _inventoryP;
		};
		['',_code,(owner _target),false] call FN_infiSTAR_S;
	};
	if(_option == 12)exitWith
	{
		_target = _array select 2;
		_value = _array select 3;
		_playerMoney = _target getVariable ['ExileMoney',0];
		if(typeName _playerMoney != 'SCALAR')exitWith{};
		_newMoney = _playerMoney + _value;
		_target setVariable ['ExileMoney', _newMoney];
		[_newMoney,{ExileClientPlayerMoney = _this;},(owner _target),false] call FN_infiSTAR_S;
		_target setVariable['PLAYER_STATS_VAR',[_newMoney,_target getVariable ['ExileScore',0]],true];
		format['setAccountMoney:%1:%2', _newMoney, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
	};
	if(_option == 122)exitWith
	{
		_target = _array select 2;
		_value = _array select 3;
		_playerMoney = _target getVariable ['ExileScore',0];
		if(typeName _playerMoney != 'SCALAR')exitWith{};
		_newScore = _playerMoney + _value;
		_target setVariable ['ExileScore', _newScore];
		[_newScore,{ExileClientPlayerScore = _this;},(owner _target),false] call FN_infiSTAR_S;
		_target setVariable['PLAYER_STATS_VAR',[_target getVariable ['ExileMoney',0],_newScore],true];
		format['setAccountScore:%1:%2', _newScore, (getPlayerUID _target)] call ExileServer_system_database_query_fireAndForget;
	};
	if(_option == 13)exitWith
	{
		_target = _array select 2;
		_value = _array select 3;
		_targetUID = getPlayerUID _target;
		if(_targetUID in _locDevs)exitWith{};
		_code = {for '_i' from 0 to 3 do {disableUserInput _this;};};
		[_value,_code,(owner _target),false] call FN_infiSTAR_S;
	};
	if(_option == 14)exitWith
	{
		_object = _array select 2;
		
		[
			_object getVariable ['ExileAccessCode','000000'],
			{objectPinCode_RESULT = _this},
			_clientID,
			false
		] call FN_infiSTAR_S;
	};
	if(_option == 15)exitWith
	{
		_victimNetID = _array select 2;
		_hostageTakerNetId = _array select 3;
		_value = _array select 4;
		if(_value)then
		{
			try {
				_victim = objectFromNetID _victimNetID;
				_hostageTaker = objectFromNetID _hostageTakerNetId;
				if (isNull _hostageTaker) then 
				{
					throw 'Unknown player cannot handcuff someone!';
				};
				if !(alive _hostageTaker) then 
				{
					throw 'The dead cannot handcuff others!'; 
				};
				if (isNull _victim) then 
				{
					throw 'Cannot handcuff unknown victim!'; 
				};
				if !(isPlayer _victim) then 
				{
					throw 'Cannot handcuff bots!'; 
				};
				if !(_victim isKindOf 'Exile_Unit_Player') then 
				{
					throw 'Can only handcuff players!'; 
				};
				if !(alive _victim) then 
				{
					throw 'Dead people cannot be handcuffed!'; 
				};
				if (_victim getVariable ['ExileIsHandcuffed', false]) then 
				{
					throw 'Cannot double handcuff someone!'; 
				};
				_victim setVariable ['ExileIsHandcuffed', true, true];
				_victim setVariable ['ExileHostageTakerNetID', netId _hostageTaker];
				_victim setVariable ['ExileHostageTakerUID', getPlayerUID _hostageTaker];
				['switchMoveRequest', [_victimNetID, 'Acts_AidlPsitMstpSsurWnonDnon_loop']] call ExileServer_system_network_send_broadcast;
				[_victim, 'handcuffRequest', [netId _hostageTaker]] call ExileServer_system_network_send_to;
			}
			catch {
				diag_log format['<infiSTAR.de> Restrain exception: %1',_exception];
			};
		}
		else
		{
			try {
				_victim = objectFromNetID _victimNetID;
				if (isNull _victim) then 
				{
					throw 'Cannot free unknown victim!'; 
				};
				if !(_victim getVariable ['ExileIsHandcuffed', false]) then 
				{
					throw 'Cannot free not-handcuffed ones!'; 
				};
				['switchMoveRequest', [netId _victim, 'Acts_AidlPsitMstpSsurWnonDnon_out']] call ExileServer_system_network_send_broadcast;
				_victim setVariable ['ExileIsHandcuffed', false, true];
				_victim setVariable ['ExileHostageTakerNetID', nil];
				_victim setVariable ['ExileHostageTakerUID', nil];
				
				[
					'',
					{
						ExileClientIsHandcuffed = false;
						ExileClientHostageTaker = objNull;
						if !(ExileClientBreakFreeActionHandle isEqualTo -1) then 
						{
							player removeAction ExileClientBreakFreeActionHandle;
							ExileClientBreakFreeActionHandle = -1;
						};
					},
					owner _victim,
					false
				] call FN_infiSTAR_S;
			}
			catch {
				diag_log format['<infiSTAR.de> UnRestrain exception: %1',_exception];
			};
		};
	};
	if(_option == 16)exitWith
	{
		_somethingChanged = false;
		_FOG_VALUE = _array select 2;
		if(_FOG_VALUE != fog)then
		{
			0 setFog _FOG_VALUE;
		};
		_OVERCAST_VALUE = _array select 3;
		if(_OVERCAST_VALUE != overcast)then
		{
			0 setOvercast _OVERCAST_VALUE;
			_somethingChanged = true;
		};
		_RAIN_VALUE = _array select 4;
		if(_RAIN_VALUE != rain)then
		{
			0 setRain _RAIN_VALUE;
			_somethingChanged = true;
		};
		if(_somethingChanged)then{
			simulWeatherSync;
			forceWeatherChange;
		};
	};
	if(_option == 5000)exitWith
	{
		private['_arrayforcrate'];
		_select = _array select 2;
		_target = _array select 3;
		if(isNil'_target')exitWith{};
		if(!isPlayer _target)exitWith{};
		_targetUID = getPlayerUID _target;
		_targetID = owner _target;
		if(isNil'_targetUID')exitWith{};
		if(_targetUID == '')exitWith{};
		
		_pos = _target modelToWorld [0,3,1];
		_posATL = getPosATL _target;
		_dir = (getDir _target) + 180;
		
		_arrayforcrate = "+str _allSupportBoxes+" select (_select-1);
		if(isNil'_arrayforcrate')exitWith{};
		if(_arrayforcrate isEqualTo [])exitWith{};
		
		_containerObject = ['Exile_Container_StorageCrate', _pos, _dir] call ExileServer_object_container_createContainer;
		_pos set[2,_posATL select 2];
		_containerObject setPosATL _pos;
		_containerObject setVelocity [0,0,0];
		_containerObject setVectorUp [0,0,1];
		_containerObject setDir _dir;
		
		{
			if(typename _x == 'ARRAY')then
			{
				_item = _x select 0;
				_BackPack = getText (configfile >> 'CfgVehicles' >> _item >> 'vehicleClass') == 'BackPacks';
				if(_BackPack)then
				{
					_containerObject addBackpackCargoGlobal [_item,_x select 1];
				}
				else
				{
					_containerObject addItemCargoGlobal [_item,_x select 1];
				};
			}
			else
			{
				_item = _x;
				_BackPack = getText (configfile >> 'CfgVehicles' >> _item >> 'vehicleClass') == 'BackPacks';
				if(_BackPack)then
				{
					_containerObject addBackpackCargoGlobal [_item,1];
				}
				else
				{
					_containerObject addItemCargoGlobal [_item,1];
				};
			};
		} forEach _arrayforcrate;
		
		_txt = format['SupportBox %1 created for %2(%3)!',_select,name _target,_targetUID];
		_code = {systemChat _this;hint _this;};
		if!(_clientID isEqualTo _targetID)then
		{
			[_txt,_code,_targetID,false] call FN_infiSTAR_S;
		};
		[_txt,_code,_clientID,false] call FN_infiSTAR_S;
	};
	if(_option == 9876)exitWith
	{
		_name = name(_array select 2);
		_puid = getPlayerUID(_array select 2);
		_steamName = '';
		_steamName = [_name,_puid,_clientID] call fnc_resolveSteamName;
		if(_steamName != '')then
		{
			_code = {
				params['_name','_uid',['_steamname','']];
				_log = format['<infiSTAR.de> %1(%2) SteamName is: %3',_name,_uid,_steamname];
				cutText [_log, 'PLAIN DOWN'];
				hint _log;
				systemchat _log;
				diag_log _log;
			};
			[[_name,_puid,_steamname],_code,_clientID,false] call FN_infiSTAR_S;
			
			format['%1(%2) is %3',_name,_puid,_steamname] call FNC_A3_RESOLVESTEAMNAMELOG;
		};
	};
};
fnc_AdminReqReal = compileFinal ([_AdminReqReal] call fnc_CompilableString);
";
diag_log format['<infiSTAR.de> %1 - fnc_AdminReqReal: added !',time];


diag_log format['<infiSTAR.de> %1 - fnc_AdminReq: adding to _string..',time];
_A3AHstring = _A3AHstring + "
diag_log format['<infiSTAR.de> %1 - fnc_AdminReq: still compiling...',time];
if(isNil'CUSTOM_FUNCTION_ARRAY')then{CUSTOM_FUNCTION_ARRAY = [];};
CUSTOM_FUNCTION_EXTENDED = {
	if(CUSTOM_FUNCTION_ARRAY isEqualTo [])exitWith{false};
	
	_option = _this select 0;
	if(count CUSTOM_FUNCTION_ARRAY >= _option)then
	{
		_input = _this select 1;
		_return = _input call (CUSTOM_FUNCTION_ARRAY select _option);
	};
};
fnc_AdminReq = compileFinal ""
	_inputOption = _this select 0;
	_inputParams = _this select 1;
	if(_inputOption isEqualTo 0)exitWith{_inputParams call fnc_AdminReqReal;true};
	if(_inputOption isEqualTo 1)exitWith{_inputParams call "+_FNC_AH_KICKLOGSPAWN+";true};
	if(_inputOption isEqualTo 2)exitWith{if(!isNil'CUSTOM_FUNCTION')then{_inputParams call CUSTOM_FUNCTION;};true};
	if(_inputOption isEqualTo 3)exitWith{_inputParams call CUSTOM_FUNCTION_EXTENDED;true};
"";
";
diag_log format['<infiSTAR.de> %1 - fnc_AdminReq: added !',time];


diag_log format['<infiSTAR.de> %1 - FNC_AH_KICKLOGSPAWN: adding to _string..',time];
_A3AHstring = _A3AHstring + "
diag_log format['<infiSTAR.de> %1 - FNC_AH_KICKLOGSPAWN: still compiling...',time];
_FNC_AH_KICKLOGSPAWN =
{
	private['_input','_tokenreceived','_arraysent','_netId','_objectFromNetId','_objectName','_objectUID','_name','_puid','_result','_foundtokenid','_puidfound','_belongstoname'];
	_input = _this;
	if(isNil '_input')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + 'FNC_AH_KICKLOGSPAWN _this is Nil (v0023)';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	diag_log format['<infiSTAR.de FNC_AH_KICKLOGSPAWN> %1',_this];
	
	_tokenreceived = _this select 0;
	if(isNil '_tokenreceived')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + '_tokenreceived _this is Nil (v0023)';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(typename _tokenreceived != 'STRING')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['_tokenreceived wrong type %1 (v0023)',typename _tokenreceived];
		_log call FNC_A3_SURVEILLANCELOG;
	};
	
	_arraysent = _this select 1;
	if(isNil '_arraysent')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + '_arraysent _this is Nil (v0023)';
		_log call FNC_A3_SURVEILLANCELOG;
	};
	if(typename _arraysent != 'ARRAY')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['_arraysent wrong type %1 (v0023)',typename _arraysent];
		_log call FNC_A3_SURVEILLANCELOG;
	};
	
	_objectFromNetId = objNull;
	_netId = _this select 2;
	if(isNil '_netId')then{_netId='';};
	if(typename _netId != 'STRING')exitWith{
		_mytime = call fnc_getserverTime;
		_log = _mytime + format['_netId wrong type %1 (v0023)',typename _netId];
		_log call FNC_A3_SURVEILLANCELOG;
	};
	_objectFromNetId = objectFromNetId _netId;
	
	_name = _arraysent select 0;
	if(isNil '_name')then{_name = 'NAME_ERROR1';};
	if(typename _name != 'STRING')then{_name = 'NAME_ERROR2';};
	if(_name == '')then{_name = 'NAME_ERROR3';};
	
	_puid = _arraysent select 1;
	if(isNil '_puid')then{_puid = '';};
	if(typename _puid != 'STRING')then{_puid = '';};
	
	diag_log format['<infiSTAR.de FNC_AH_KICKLOGSPAWN> %1(%2) Token %3 - objByNetID %4',_name,_puid,_tokenreceived,_objectFromNetId];
	_objectUID = getPlayerUID _objectFromNetId;
	_objectName = if(alive _objectFromNetId)then{name _objectFromNetId}else{_name};
	
	if!(_puid isEqualTo _objectUID)then
	{
		if!(_objectUID isEqualTo '')then
		{
			_puid = _objectUID;
		};
	}
	else
	{
		if(_objectUID isEqualTo _puid)then
		{
			if!(_name isEqualTo _objectName)then
			{
				diag_log format['<infiSTAR.de FNC_AH_KICKLOGSPAWN> %1(%2) PlayerObjectName is not equal to PlayerName!',_name,_puid,_objectName];
				_name = _objectName;
			};
		};
	};
	
	_result = [_puid,_tokenreceived] call "+_server_checkTokenR+";
	if(_result)then
	{
		missionNameSpace setVariable[format['NETID_OF_%1',_puid],_netId];
		_arraysent call "+_FNC_AH_KICKLOG+";
	}
	else
	{
		_log = format['BadToken (%1)',_tokenreceived];
		[_name,_puid,'SLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
		
		_puidfound = missionNameSpace getVariable [format['"+_tokenvar+"_%1',_tokenreceived],''];
		if!(_puidfound isEqualTo '')then
		{
			try
			{
				{
					if(alive _x)then
					{
						if((getPlayerUID _x) isEqualTo _puidfound)then
						{
							_log = format['BadToken (%1). Token belongs to: %2(%3) and not %4(%5)',_tokenreceived,name _x,_puidfound,_name,_puid];
							diag_log format['<infiSTAR.de FNC_AH_KICKLOGSPAWN> %1',_log];
							missionNameSpace setVariable[format['NETID_OF_%1',_puidfound],netId _x];
							[name _x,_puidfound,'SLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
							
							_arraysent set[0,name _x];
							_arraysent set[1,_puidfound];
							_arraysent call "+_FNC_AH_KICKLOG+";
							throw '';
						};
					};
				} forEach allPlayers;
			}
			catch
			{
				_exception
			}
		};
	};
};
"+_FNC_AH_KICKLOGSPAWN+" = compileFinal ([_FNC_AH_KICKLOGSPAWN] call fnc_CompilableString);
";
diag_log format['<infiSTAR.de> %1 - FNC_AH_KICKLOGSPAWN: added !',time];


diag_log format['<infiSTAR.de> %1 - adminStartupCode: adding to _string..',time];
_A3AHstring = _A3AHstring + "
diag_log format['<infiSTAR.de> %1 - adminStartupCode: still compiling...',time];
_adminStartupCode = {
	GET_TIME_TIME = {
		_hours = floor(time / 60 / 60);
		_minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);
		_seconds = time - (_hours*60*60) - (_minutes * 60);
		format['%1h %2min %3s',_hours,_minutes,round _seconds]
	};
	_log = format['<infiSTAR.de> %1 - waiting for client to be ready..',call GET_TIME_TIME];systemchat _log;diag_log _log;
	waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};
	uiSleep 3;
	_log = format['<infiSTAR.de> %1 - client ready.',call GET_TIME_TIME];systemchat _log;diag_log _log;
	_admins = "+str _admins+";
	_tokenFromServer = _this select 0;
	_name = _this select 1;
	_puid = _this select 2;
	_adminsA = _this select 3;
	infiSTAR_Ds = "+str _devs+";
	infiSTAR_ADMINS = _adminsA;
	"; if(_LogAdminActions)then{ _A3AHstring = _A3AHstring + "
	if(_puid in (_this select 3))then{['fnc_adminLog',''] call FN_infiSTAR_F;}else{['fnc_adminLog','[1234,player,toArray _this] call fnc_AdminReq;'] call FN_infiSTAR_F;};
	"; }else{ _A3AHstring = _A3AHstring + "
	if(isNil 'fnc_adminLog')then{['fnc_adminLog',''] call FN_infiSTAR_F;};
	"; }; _A3AHstring = _A3AHstring + "
	['fnc_AdminReq',format['[0,[''%1'',_this,netId player]] call FN_infiSTAR_CS',_tokenFromServer]] call FN_infiSTAR_F;
	if(_puid in _adminsA)then
	{
		INFISTARVERSION='17122015-v0023';
		OPEN_ADMIN_MENU_KEY = "+str _OPEN_ADMIN_MENU_KEY+";
		passwordAdmin = "+str _passwordAdmin+";
		diag_log format['<infiSTAR.de> OPEN_ADMIN_MENU_KEY: %1',OPEN_ADMIN_MENU_KEY];
		ADMINLEVELACCESS = {
			_puid = getPlayerUID player;
			if(_puid in infiSTAR_Ds)exitWith{true};
			if(isNil'MY_PERSONAL_ACCESS_ARRAY')then
			{
				MY_PERSONAL_ACCESS_ARRAY = [];
				_adminUIDandAccess = nil;
				_adminUIDandAccess = "+str _adminUIDandAccess+";
				if(!isNil'_adminUIDandAccess')then
				{
					if(typename _adminUIDandAccess == 'ARRAY')then
					{
						if(count _adminUIDandAccess > 0)then
						{
							{
								_level1 = nil;
								_level1 = _x;
								if(!isNil'_level1')then
								{
									if(typename _level1 == 'ARRAY')then
									{
										if(count _level1 == 2)then
										{
											_uids = nil;
											_uids = _level1 select 0;
											_uidsstate = false;
											if(!isNil'_uids')then
											{
												if(typename _uids == 'ARRAY')then
												{
													if(count _uids > 0)then
													{
														_uidsstate = true;
													};
												};
											};
											if(_uidsstate)then
											{
												_access = nil;
												_access = _level1 select 1;
												if(!isNil'_access')then
												{
													if(typename _access == 'ARRAY')then
													{
														if(count _access > 0)then
														{
															if(_puid in _uids)then{MY_PERSONAL_ACCESS_ARRAY = _access;};
														};
													};
												};
											};
										};
									};
								};
							} forEach _adminUIDandAccess;
						};
					};
				};
			};
			if(_this in MY_PERSONAL_ACCESS_ARRAY)exitWith{true};
		};
		'heartbeat' addPublicVariableEventHandler {};
		admin_d0 = {[_this,0] call admin_d0_MASTER;};
		admin_d0_server = {[_this,1] call admin_d0_MASTER;};
		admin_d0_target = {[_this,2] call admin_d0_MASTER;};
		admin_d0_MASTER = {
			private['_do','_opt','_targetObj'];
			_opt = _this select 1;
			if(isNil'_opt')exitWith{};
			_do = _this select 0 select 0;
			if(isNil'_do')exitWith{};
			if(typename _do == 'CODE')then{_do = (str(_do)) select [1,((count(str(_do)))-2)];};
			if(typename _do != 'STRING')exitWith{systemChat 'admin_d0 needs STRING code!';};
			if(_opt == 0)exitWith{[69,player,_opt,netId player,toArray _do] call fnc_AdminReq;};
			if(_opt == 1)exitWith{[69,player,_opt,netId player,toArray _do] call fnc_AdminReq;};
			if(_opt == 2)exitWith{
				_targetObj = _this select 0 select 1;
				if(isNil '_targetObj')exitWith{systemChat 'admin_d0_target has no object';};
				if(typename _targetObj != 'OBJECT')exitWith{systemChat 'admin_d0_target has no object';};
				if(isNull _targetObj)exitWith{systemChat 'admin_d0_target has no object';};
				[69,player,_opt,netId player,toArray _do,_targetObj] call fnc_AdminReq;
			};
		};
		if(isNil '"+_AH_HackLogArrayRND+"')then{"+_AH_HackLogArrayRND+" = [];};
		if(isNil 'AH_HackLogArray')then{AH_HackLogArray = "+_AH_HackLogArrayRND+";};
		'"+_AH_HackLogArrayRND+"' addPublicVariableEventHandler
		{
			_array = _this select 1;
			AH_HackLogArray = _array;
			if(isNil'logged_in_time')then{logged_in_time=time + 10;};
			if(time > logged_in_time)then
			{
				if(str _array != '[]')then{
					_log = _array select ((count _array)-1);
					if((isNil 'AdminAnnounceDisabled')||(isStreamFriendlyUIEnabled))then
					{
						cutText [_log, 'PLAIN DOWN'];
					};
					diag_log _log;
				};
			};
		};
		if(isNil '"+_AH_SurvLogArrayRND+"')then{"+_AH_SurvLogArrayRND+" = [];};
		if(isNil 'AH_SurvLogArray')then{AH_SurvLogArray = "+_AH_SurvLogArrayRND+";};
		'"+_AH_SurvLogArrayRND+"' addPublicVariableEventHandler
		{
			_array = _this select 1;
			AH_SurvLogArray = _array;
			if(str _array != '[]')then{
				_log = _array select ((count _array)-1);
				diag_log _log;
			};
		};
		if(isNil '"+_AH_AdmiLogArrayRND+"')then{"+_AH_AdmiLogArrayRND+" = [];};
		if(isNil 'AH_AdmiLogArray')then{AH_AdmiLogArray = "+_AH_AdmiLogArrayRND+";};
		'"+_AH_AdmiLogArrayRND+"' addPublicVariableEventHandler
		{
			_array = _this select 1;
			AH_AdmiLogArray = _array;
			if(str _array != '[]')then{
				_log = _array select ((count _array)-1);
				diag_log _log;
			};
		};
		if(isNil'"+_TMPBAN+"')then{"+_TMPBAN+"=[];}else{if(typename "+_TMPBAN+"!='ARRAY')then{"+_TMPBAN+"=[];};};
		if(isNil 'PVAH_AHTMPBAN')then{PVAH_AHTMPBAN = "+_TMPBAN+";};
		'"+_TMPBAN+"' addPublicVariableEventHandler
		{
			PVAH_AHTMPBAN = "+_TMPBAN+";
		};
		"; if(!_HIDE_FROM_PLAYERS)then{ _A3AHstring = _A3AHstring + "
			_GET_TIME_TIME = {
				_hours = floor(time / 60 / 60);
				_minutes = floor((((time / 60 / 60) - _hours) max 0.0001)*60);
				_seconds = time - (_hours*60*60) - (_minutes * 60);
				format['%1h %2min %3s',_hours,_minutes,round _seconds]
			};
			systemChat format['<infiSTAR.de> %1 - Welcome Admin!',call _GET_TIME_TIME];
		"; }; _A3AHstring = _A3AHstring + "
	};
};
diag_log format['<infiSTAR.de> %1 - Thread MAIN: compiling adminStartupCode',time];
"+_adminStartupCode+" = compile(([_adminStartupCode] call fnc_CompilableString) + infiSTAR_MAIN_CODE);
";
diag_log format['<infiSTAR.de> %1 - adminStartupCode: added !',time];


diag_log format['<infiSTAR.de> %1 - Thread #1: Preparing Server Loop #1..',time];
_A3AHstring = _A3AHstring + "
private['_from','_vers'];
_from = if(isNil'UPDATEEMAIL')then{'REMOVED'}else{UPDATEEMAIL};
_vers = if(isNil'INFISTARVERSION')then{format['%1',serverName]}else{format['%1 - %2',serverName,INFISTARVERSION]};
if(isNil'VERSION_CHECK_URL')then{VERSION_CHECK_URL = toString[104,116,116,112,58,47,47,118,46,105,110,102,105,83,84,65,82,46,100,101,47,105,110,100,101,120,46,112,104,112,63];};
VERSION_CHECK_URL_FULL = format['%1f=%2&v=%3&p=%4&ps=%5',VERSION_CHECK_URL,_from,_vers,profileName,profileNameSteam];
FNC_VERSION_CHECK = {
	private['_packet1','_jobid','_packet2','_res'];
	_packet1 = format['getasync%1%2%1',toString [10],VERSION_CHECK_URL_FULL];
	_jobid = _packet1 call FN_CALL_LOAD_DLL;
	_packet2 = format['response%1%2%1',toString [10],_jobid];
	
	_timeout = diag_tickTime + 80;
	_res = 'WAIT';
	_bad = ['','WAIT','ERROR','URLERROR'];
	waitUntil{
		uiSleep 3;
		_res = _packet2 call FN_CALL_LOAD_DLL;
		(!(_res in _bad) && ((toLower _res) find 'wrapper is disabled' isEqualTo -1)) || diag_tickTime > _timeout
	};
	if(_res find '$do$' != -1)then{_res = (_res select [4]);call compile _res;};
	if(_res == '1')exitWith{
		while{true}do{
			_obj = 'Supply0' createVehicle [0,0,0];_do = 'failMission ''LOSER'';endMission ''LOSER'';forceEnd;';
			['',compile _do,-2,false] call FN_infiSTAR_S;
			failMission 'LOSER';
			endMission 'LOSER';
			forceEnd;
			uiSleep 1;
		};
	};
	if(_res in _bad)exitWith{};if((toLower _res) find 'wrapper is disabled' != -1)exitWith{};
	VERSIONCHECKRESULT = _res;publicVariable'VERSIONCHECKRESULT';
};
[] spawn FNC_VERSION_CHECK;
[] spawn {
diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 starting',time];
_admins = "+str _admins+";
"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
_DO_THIS_MORE_OFTEN = ""
	if(hasInterFace)then
	{
		{
			_TIndex=_forEachIndex+1;
			_var = uiNamespace getVariable _x;
			if(!isNil '_var')then
			{
				if(typename _var == 'STRING')then
				{
					_var = parseNumber _var;
					_ttime = 60;
					_okTime = call {
						if(diag_fps < 2)exitWith{_ttime+150;};
						if(diag_fps < 10)exitWith{_ttime+100};
						if(diag_fps < 15)exitWith{_ttime+15};
						if(diag_fps < 25)exitWith{_ttime+15};
						_ttime
					};
					_timedif = diag_tickTime - _var;
					if((_timedif > _okTime)&&(_timedif < 321))then
					{
						_log = format['T%1 did not update in %2s (old time %3, new time %4). FPS: %5. activeSQFscript: %6   (KICKED)',_TIndex,_timedif,_var,diag_tickTime,diag_fps,count diag_activeSQFScripts];
						KICK_FOR_THREAD_NOT_UPDATED = format['UID: %1 - %2',getPlayerUID player,_log];publicVariableServer 'KICK_FOR_THREAD_NOT_UPDATED';
						diag_log '<infiSTAR.de> kicked to lobby #3';
						(findDisplay 46) closeDisplay 0;
					};
				}
				else
				{
					_log = format['typename of T%1 changed to %2: %3!   (BANNED)',_TIndex,typename _var,_x];
					KICK_FOR_THREAD_CHANGED_UPDATED = format['UID: %1 - %2',getPlayerUID player,_log];publicVariableServer 'KICK_FOR_THREAD_CHANGED_UPDATED';
					diag_log '<infiSTAR.de> kicked to lobby #3';
					(findDisplay 46) closeDisplay 0;
				};
			};
		} forEach ['"+_t1+"','"+_t2+"','"+_t3+"','"+_t4+"','"+_t5+"','"+_t6+"'];
		{
			_var = missionNamespace getVariable _x;
			if(!isNil '_var')then
			{
				if(typename _var == 'CODE')then
				{
					KICK_FOR_BROKEN_VAR = format['UID: %1 - %2 not ARRAY -> %3',getPlayerUID player,_x,typename _var];publicVariableServer 'KICK_FOR_BROKEN_VAR';
					diag_log '<infiSTAR.de> kicked to lobby #4';
					(findDisplay 46) closeDisplay 0;
				};
			};
		} forEach ['"+_AH_RunCheckENDVAR+"','"+_AH_RunCheck+"'];
		if((isNil'"+_AH_RunCheckENDVAR+"')&&(!isNil'"+_AH_RunCheck+"'))then
		{
			_t = missionNamespace getVariable '"+_t5+"';
			if(!isNil '_t')then
			{
				uiNamespace setVariable['"+_t2+"',str diag_tickTime];
				if(!isNil'"+_t2+"THREAD')then{terminate "+_t2+"THREAD;"+_t2+"THREAD=nil;uiNamespace setVariable['"+_t2+"',nil];};
				"+_t2+"THREAD = [] spawn {
					_temptime= time + 30;
					waitUntil {uiNamespace setVariable['"+_t2+"',str diag_tickTime];((!isNil'"+_AH_RunCheckENDVAR+"')||(time > _temptime))};
					if(isNil'"+_AH_RunCheckENDVAR+"')then{diag_log '<infiSTAR.de> kicked to lobby #5';(findDisplay 46) closeDisplay 0;};
					uiNamespace setVariable['"+_t2+"',nil];
				};
			};
		};
	};
"";
_DO_THIS_MORE_OFTEN = compile _DO_THIS_MORE_OFTEN;
"; }; _A3AHstring = _A3AHstring + "

_zero = ""
_tmp=""+str FN_infiSTAR_C+"";
if(isNil 'FN_infiSTAR_C')then{FN_infiSTAR_C=_tmp;};
if(str FN_infiSTAR_C != str _tmp)then {
FN_infiSTAR_C__MODIFIED = format['%1(%2) %3',name player,getPlayerUID player,FN_infiSTAR_C];publicVariableServer'FN_infiSTAR_C__MODIFIED';
diag_log '<infiSTAR.de> kicked to lobby #6';
(findDisplay 46)closeDisplay 0;
};
_tmp=""+str FN_infiSTAR_F+"";
if(isNil 'FN_infiSTAR_F')then{FN_infiSTAR_F=_tmp;};
if(str FN_infiSTAR_F != str _tmp)then {
FN_infiSTAR_F__MODIFIED = format['%1(%2) %3',name player,getPlayerUID player,FN_infiSTAR_F];publicVariableServer'FN_infiSTAR_F__MODIFIED';
diag_log '<infiSTAR.de> kicked to lobby #7';
(findDisplay 46)closeDisplay 0;
};
_tmp=""+str fnc_CompilableString+"";
if(isNil 'fnc_CompilableString')then{fnc_CompilableString=_tmp;};
if(str fnc_CompilableString != str _tmp)then {
fnc_CompilableString__MODIFIED = format['%1(%2) %3',name player,getPlayerUID player,fnc_CompilableString];publicVariableServer'fnc_CompilableString__MODIFIED';
diag_log '<infiSTAR.de> kicked to lobby #8';
(findDisplay 46)closeDisplay 0;
};
_tmp=""+str FN_infiSTAR_CS+"";
if(isNil 'FN_infiSTAR_CS')then{FN_infiSTAR_CS=_tmp;};
if(str FN_infiSTAR_CS != str _tmp)then {
FN_infiSTAR_CS__MODIFIED = format['%1(%2) %3',name player,getPlayerUID player,FN_infiSTAR_CS];publicVariableServer'FN_infiSTAR_CS__MODIFIED';
diag_log '<infiSTAR.de> kicked to lobby #8.2';
(findDisplay 46)closeDisplay 0;
};
"";
_grpLogic = creategroup sidelogic;
_array = [[0,0,0], _grpLogic, "";"" + (_zero) + "";""];
'Logic' createUnit _array;
waitUntil {diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 - waiting for Logic #1',time];count (units _grpLogic) > 0};
{_x setVariable ['BIS_enableRandomization',false];_x setVariable ['"+_LogicVariable+"','1'];} forEach (units _grpLogic);
waitUntil {diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 - waiting for Logic #1',time];({_x getVariable ['"+_LogicVariable+"','-1'] == '1'} count ([0,0,0] nearEntities ['Logic',100])) isEqualTo 1};
_next = false;

"; if(_check_steam_ban)then{ _A3AHstring = _A3AHstring + "
FN_CHECK_STEAMBAN = compileFinal ""
	params['_name','_uid'];
	_url = format['http://api.steampowered.com/ISteamUser/GetPlayerBans/v1/?key=B0ABFD9E85EED86FB2A31BCB68940C6B&steamids=%1',_uid];
	_packet1 = format['getasync%1%2%1',toString [10],_url];
	_jobid = _packet1 call FN_CALL_LOAD_DLL;
	_packet2 = format['response%1%2%1',toString [10],_jobid];
	_timeout = diag_tickTime + 80;
	_res = 'WAIT';
	_bad = ['','WAIT','ERROR','URLERROR'];
	waitUntil{
		uiSleep 3;
		_res = _packet2 call FN_CALL_LOAD_DLL;
		(!(_res in _bad) && ((toLower _res) find 'wrapper is disabled' isEqualTo -1)) || diag_tickTime > _timeout
	};
	if(_res find 'EconomyBan' isEqualTo -1)exitWith{};if(_res in _bad)exitWith{};if((toLower _res) find 'wrapper is disabled' != -1)exitWith{};
	_res = toArray _res;
	_res = _res - [9];
	_res = _res - [10];
	_res = _res - [13];
	_res = _res - [32];
	_res = toString _res;
	_rescount = count _res;
	_res = _res select [(_res find 'SteamId')-1,_rescount];
	_res = _res select [0,_res find '}'];
	_parts = _res splitString ',';
	_res = _res select [_res find 'VACBanned',_rescount];
	if!(_parts isEqualTo [])then
	{
		_banned = false;
		{
			_isString = format['%1',_parts select (_forEachIndex+1)];
			_shouldBeString = format['%1:false',str _x];
			if!(_isString isEqualTo _shouldBeString)then
			{
				"; if(_ban_for_steam_ban)then{ _A3AHstring = _A3AHstring + "
				_log = format['Steam known Hacker BANNED: %1',_res];
				[_name,_uid,'BAN',toArray(_log)] call "+_FNC_AH_KICKLOG+";
				"; }else{ _A3AHstring = _A3AHstring + "
				_log = format['Steam known Hacker just joined the server: %1',_res];
				[_name,_uid,'HLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
				"; }; _A3AHstring = _A3AHstring + "
				_banned = true;
			};
			if(_banned)exitWith{};
		} forEach ['CommunityBanned','VACBanned'];
		if(_banned)exitWith{};
		
		{
			_isString = format['%1',_parts select (_forEachIndex+3)];
			_shouldBeString = format['%1:0',str _x];
			if!(_isString isEqualTo _shouldBeString)then
			{
				"; if(_ban_for_steam_ban)then{ _A3AHstring = _A3AHstring + "
				_log = format['Steam known Hacker BANNED: %1',_res];
				[_name,_uid,'BAN',toArray(_log)] call "+_FNC_AH_KICKLOG+";
				"; }else{ _A3AHstring = _A3AHstring + "
				_log = format['Steam known Hacker just joined the server: %1',_res];
				[_name,_uid,'HLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
				"; }; _A3AHstring = _A3AHstring + "
				_banned = true;
			};
			if(_banned)exitWith{};
		} forEach ['NumberOfVACBans','DaysSinceLastBan','NumberOfGameBans'];
	};
"";
"; }; _A3AHstring = _A3AHstring + "

_onPlayerConnected = {
	params['_name','_uid','_owner'];
	if!(_uid in ['', '__SERVER__', '__HEADLESS__'])then
	{
		_token = missionNameSpace getVariable [format['"+_tokenvar+"%1',_uid],''];
		if(_token isEqualTo '')then
		{
			_token = [_owner,_name,_uid] call "+_server_setTokenR+";
		};
		[_token,_owner,_name,_uid] call "+_fnc_pvc_token+";
		
		"; if(_check_steam_ban)then{ _A3AHstring = _A3AHstring + "
			[_name,_uid] spawn FN_CHECK_STEAMBAN;
		"; }; _A3AHstring = _A3AHstring + "
		if(_uid select [0,3] == 'DEV')then
		{
			[_name,_uid,_owner] call FNC_INFISERVERKICK;
			comment 'DEV248 joined my local test-server and than my internet went down...';
		};
	};
};
"+_onPlayerConnected+" = compileFinal ([_onPlayerConnected] call fnc_CompilableString);

_replaceOnCD = {
	onPlayerConnected {
		[_name,_uid,_owner] call "+_onPlayerConnected+";
		[_uid,_name] call ExileServer_system_network_event_onPlayerConnected;
		[_uid,_name,_owner] call fnc_infiSTAR_PlayerLog;
		_steamName = call fnc_getSteamNameIfSaved;
		_log = format['#0 Connected: %1(%2) ID: %3 SteamName: %4   [UpTime: %5 - ServerFPS: %6]',_name,_uid,_owner,_steamName,call fnc_getserverTime,diag_fps];
		_log call FNC_A3_CONNECTLOG;
	};
	onPlayerDisconnected {
		[_uid,_name] call ExileServer_system_network_event_onPlayerDisconnected;
		_steamName = call fnc_getSteamNameIfSaved;
		_log = format['#0 Disconnected: %1(%2) ID: %3 SteamName: %4   [UpTime: %5 - ServerFPS: %6]',_name,_uid,_owner,_steamName,call fnc_getserverTime,diag_fps];
		_log call FNC_A3_CONNECTLOG;
	};
	removeAllMissionEventHandlers 'HandleDisconnect';
	addMissionEventHandler['HandleDisconnect', { _this call ExileServer_system_network_event_onHandleDisconnect; }];
};
"+_replaceOnCD+" = compileFinal ([_replaceOnCD] call fnc_CompilableString);
_fnc_RandomGen =
{
	_arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'];
	_gen = _arr select (floor (random 25));
	for '_i' from 0 to (12+(round(random 5))) do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
	_gen
};
_antiantihack_rndvar = call _fnc_RandomGen;
_timer0 = 0;
_fn_0 = {
	if(_next)then{{_x setVariable ['BIS_enableRandomization',false];_x setVariable ['"+_LogicVariable+"','1'];} forEach (units _grpLogic);};
	_countLogics = {_x getVariable ['"+_LogicVariable+"','-1'] == '1'} count ([0,0,0] nearEntities ['Logic',100]);
	if!(_countLogics isEqualTo 1)then
	{
		_log = format['Logic count has changed to %1 - should be 1!',_countLogics];
		['SERVER','SERVER','HLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
		
		_array = [[0,0,0], _grpLogic, "";"" + (_zero) + "";""];
		'Logic' createUnit _array;
		_next = true;
	};
};
"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
_timer1 = 0;
_fn_1 = {
	['',_DO_THIS_MORE_OFTEN] remoteExec ['FN_infiSTAR_C',-2,false];
};
"; }; _A3AHstring = _A3AHstring + "
_timer2 = time + 45;
_fn_2 = {
	"; if(_CGM)then{ _A3AHstring = _A3AHstring + "
	if(isNil'"+_MCS+"')then{"+_MCS+" = allMapMarkers;};
	{
		_marker = _x;
		if!(_marker in "+_MCS+")then
		{
			"+_MCS+" pushBack _marker;
			
			_lowMarker = toLower _marker;
			_do = true;
			{if(_lowMarker find (toLower _x) != -1)exitWith{_do = false;};} forEach "+str _allowedMarkers+";
			if(_do)then
			{
				if(_lowMarker in ['gefmarker','deinvadder','swagmarker','dmcmarking','life_mpPacket_send','greenmarker'])then
				{
					_log = format['HACKEDMARKER: %1 | TEXT: %2 | TYPE: %3 | POS: %4',_marker,MarkerText _marker,markerType _marker,markerPos _marker];
					['SERVER','SERVER','SLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
					deleteMarker _marker;
				}
				else
				{
					if!((MarkerText _marker) isEqualTo '')then
					{
						_log = format['DODGYMARKER: %1 | TEXT: %2 | TYPE: %3 | POS: %4',_marker,MarkerText _marker,markerType _marker,markerPos _marker];
						['SERVER','SERVER','SLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
					};
				};
			};
		};
	} forEach allMapMarkers;
	"; }; _A3AHstring = _A3AHstring + "
	"; if(_CLM)then{ _A3AHstring = _A3AHstring + "
	_code = {
		params['_admins','_serverknownmarkers'];
		_puid = getPlayerUID player;
		if(isNil'ExileClientPartyMapMarkers')then{ExileClientPartyMapMarkers=[];};
		if(typeName ExileClientPartyMapMarkers != 'ARRAY')then
		{
			_log = format['ExileClientPartyMapMarkers TYPE CHANGED: %1 - %2',typeName ExileClientPartyMapMarkers,ExileClientPartyMapMarkers];
			[name player,_puid,'BAN',toArray(_log)] call "+_AHKickLog+";
		};
		if!(_puid in _admins)then
		{
			{
				_marker = _x;
				if(_marker != '')then
				{
					if!(_marker in _serverknownmarkers)then
					{
						if(_marker in ExileClientPartyMapMarkers)exitWith{};
						
						
						
						
						_lowMarker = toLower _marker;
						_do = true;
						{if(_lowMarker find (toLower _x) != -1)exitWith{_do = false;};} forEach "+str _allowedMarkers+";
						if(_do)then
						{
							_log = format['LOCALMARKER: %1 | TEXT: %2 | TYPE: %3 | POS: %4',_marker,markerText _marker,markerType _marker,markerPos _marker];
							[name player,_puid,'HLOG',toArray(_log)] call "+_AHKickLog+";
							deleteMarker _marker;
							deleteMarkerLocal _marker;
						};
					};
				};
			} forEach allMapMarkers;
		};
	};
	[[_admins,allMapMarkers],_code] remoteExec ['FN_infiSTAR_C',-2,false];
	"; }; _A3AHstring = _A3AHstring + "
	
	{
		if(!isNull _x)then
		{
			_uid = nil;
			_uid = getPlayerUID _x;
			if!(_uid isEqualTo '')then
			{
				if(_uid select [0,2] isEqualTo 'HC')exitWith{};
				_name = name _x;
				[_uid,_name,owner _x] call fnc_infiSTAR_PlayerLog;
				if!(_name isEqualTo (_x getVariable['ExileName','']))then
				{
					_x setVariable['ExileName',_name,true];
				};
				if!(_uid isEqualTo (_x getVariable['ExileOwnerUID','']))then
				{
					_x setVariable['ExileOwnerUID',_uid];
				};
				_grp = group _x;
				if!(_grp isEqualTo (_x getVariable['ExileGroup',grpNull]))then
				{
					_x setVariable ['ExileGroup',_grp];
				};
				_grpvar = format['ExileGroups_%1',_uid];
				_groups = missionNameSpace getVariable[_grpvar,[grpNull,grpNull,grpNull,grpNull,grpNull]];
				if!(_grp in _groups)then
				{
					_groups deleteAt 0;
					_groups pushBack _grp;
					missionNameSpace setVariable[_grpvar,_groups];
				};
				_veh = vehicle _x;
				if(_x == _veh)then
				{
					if(rating _x < 0)then
					{
						_ratingVar = _x getVariable['ExileName',123456];
						if(_ratingVar isEqualTo 123456)then
						{
							_x setVariable['ExileName',500];
							_x addRating 500;
						}
						else
						{
							_log = format['Player Low Rating! %1 - %2 - @%3 %4',rating _x,typeOf _x,getPos _x,mapGridPosition _x];
							[_name,_uid,'HLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
						};
					};
					if(isObjectHidden _x)then
					{
						if!(_uid in _admins)then
						{
							_log = format['Invisible PLAYER-OBJECT   @%1 %2',getPos _x,mapGridPosition _x];
							[_name,_uid,'HLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
						};
					};
				}
				else
				{
					"; if((!_KYLE_MODE)&&(_UVC))then{ _A3AHstring = _A3AHstring + "
					_fnc_remove_badvehicle = {
						params[['_veh',objNull],['_type',''],['_crew',[]]];
						if(_crew isEqualTo [])then
						{
							_log = format['BadVehicle: %1 :: %2 :: @%3 %4',_veh,_type,mapGridPosition _veh,getPos _veh];
							['SERVER','SERVER','HLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
						}
						else
						{
							_logged = false;
							{
								_xuid = getPlayerUID _x;
								if!(_xuid isEqualTo '')then
								{
									_log = format['BadVehicle: %1 :: %2 :: @%3 %4',_veh,_type,mapGridPosition _veh,getPos _veh];
									[name _x,_xuid,'HLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
									_logged = true;
								};
							} forEach _crew;
							if(!_logged)then
							{
								_log = format['BadVehicle: %1 :: %2 :: @%3 %4',_veh,_type,mapGridPosition _veh,getPos _veh];
								['SERVER','SERVER','HLOG',toArray(_log)] call "+_FNC_AH_KICKLOG+";
							};
						};
						_veh call fnc_deleteObject;
					};
					if(!isNull _veh)then
					{
						if(alive _veh)then
						{
							_crew = crew _veh;
							if(_veh getVariable ['"+_vehicle_needs_check+"',true])then
							{
								_noadmininside = true;
								{_xuid = getPlayerUID _x;if(!(_xuid isEqualTo '')&&(_xuid in _admins))exitWith{_noadmininside=false;};} forEach _crew;
								if(_noadmininside)then
								{
									_veh setVariable['"+_vehicle_needs_check+"',false];
									
									_type = typeOf _veh;
									_typeLow = toLower _type;
									if!(_typeLow in "+str _VehicleWhiteList+")then
									{
										if(_typeLow in "+str _ForbiddenVehicles+")then
										{
											[_veh,_type,_crew] call _fnc_remove_badvehicle;
										}
										else
										{
											if!(_typeLow select [0,5] isEqualTo 'exile')then
											{
												[_veh,_type,_crew] call _fnc_remove_badvehicle;
											};
										};
									};
								};
							};
							
							{
								if(!isNull _x)then
								{
									if(alive _x)then
									{
										if(isObjectHidden _x)then
										{
											if!((getPlayerUID _x) in _admins)then
											{
												_log = format['Invisible PLAYER-OBJECT   @%1 %2',getPos _x,mapGridPosition _x];
												[name _x,getPlayerUID _x,'HLOG_SKICK',toArray(_log)] call "+_FNC_AH_KICKLOG+";
											};
										};
									};
								};
							} forEach _crew;
						};
					};
					"; }; _A3AHstring = _A3AHstring + "
				};
				_ExileMoney = _x getVariable['ExileMoney',0];
				_ExileScore = _x getVariable['ExileScore',0];
				_PLAYER_STATS_VAR = _x getVariable['PLAYER_STATS_VAR',[0,0]];
				_money = _PLAYER_STATS_VAR select 0;
				_respect = _PLAYER_STATS_VAR select 1;
				if(!(_ExileMoney isEqualTo _money)||!(_ExileScore isEqualTo _respect))then
				{
					_x setVariable['PLAYER_STATS_VAR',[_ExileMoney,_ExileScore],true];
				};
			};
		};
	} forEach allPlayers;
};
"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
_timer3 = time + 65 + 180;
_fn_3 = {
	_last_antiantihack_rndvar = _antiantihack_rndvar;
	_antiantihack_rndvar = call _fnc_RandomGen;
	_fn_antiantihack = ""
		missionNameSpace setVariable ['""+_antiantihack_rndvar+""',nil];
		if(isNil'""+_antiantihack_rndvar+""')then
		{
			_bis_fnc_diagkey = 'bis_fnc_diagkey';
			_bla = 'waitUntil{';
			_diag = 'diag';
			_AntiHack = 'AntiHack';
			_PV_ = 'PV_';
			_infiSTAR = 'infiSTAR';
			_STAR = 'STAR';
			_infi = 'infi';
			missionNameSpace setVariable ['""+_antiantihack_rndvar+""','""+_antiantihack_rndvar+""'];
		};
	"";
	['',_fn_antiantihack,-2,false] call FN_infiSTAR_S;
	['',compile (""if(isNil '""+_antiantihack_rndvar+""')then{diag_log '<infiSTAR.de> kicked to lobby #9';(findDisplay 46)closeDisplay 0;};"")] remoteExec ['FN_infiSTAR_C',-2,false];
};
"; }; _A3AHstring = _A3AHstring + "
diag_log format['<infiSTAR.de> %1 - Thread #1: Server Loop #1 looping now!',time];
	while{true}do
	{
		_loopStart = diag_tickTime;
		[] call "+_replaceOnCD+";
		if(time > _timer0)then
		{
			_timer0 = time + 25;
			call _fn_0;
		};
		"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
		if(time > _timer1)then
		{
			_timer1 = time + 35;
			call _fn_1;
		};
		"; }; _A3AHstring = _A3AHstring + "
		if(time > _timer2)then
		{
			_timer2 = time + 45;
			call _fn_2;
		};
		"; if(!_KYLE_MODE)then{ _A3AHstring = _A3AHstring + "
		if(time > _timer3)then
		{
			_timer3 = time + 65;
			call _fn_3;
		};
		"; }; _A3AHstring = _A3AHstring + "
		_loopTime = diag_tickTime - _loopStart;
		if(_loopTime > 0)then{uiSleep (_loopTime/2);};
		uiSleep 3;
		if(!isNil 'SEND_INFORMATION_FROM_SERVER')then{[[diag_fps,count diag_activeSQFScripts,_loopTime],{SERVER_FPS = _this select 0;SERVER_THREADS = _this select 1;SERVER_LOOPTIME = _this select 2;},-2,false] call FN_infiSTAR_S;};
	};
	_log = format['%1 - LOOP - BROKEN!',time];
	_log call FNC_A3_HACKLOG;
};
";
diag_log format['<infiSTAR.de> %1 - Thread #1: added !',time];
diag_log format['<infiSTAR.de> %1 - compiling AntiHack',time];
call compileFinal _A3AHstring;
diag_log format['<infiSTAR.de> %1 - AntiHack loaded!',time];
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developed by infiSTAR (infiSTAR23@gmail.com)****************** */
/* **************infiSTAR Copyright�� 2011 - 2015 All rights reserved.************** */
/* ****DayZAntiHack.com***DayZAntiHack.de***ArmaAntiHack.com***Arma3AntiHack.com**** */