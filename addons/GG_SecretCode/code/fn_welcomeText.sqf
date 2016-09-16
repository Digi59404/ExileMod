WELCOME_TEXT__CODE = {
    // Welcome messages
    private ["_NewLoginCount","_Logins","_LoginCount","_playerUID","_announcepay","_buildRights","_flag","_dueDate","_nextDueDate","_msg","_name","_missingModList"];
    playSound "intro";
    sleep 2;
    // Login Count
    _LoginCount = profileNamespace getVariable "var_GG_Logins";
    if (isNil "_LoginCount") then {
        profileNamespace setVariable ["var_GG_Logins",1];
        saveProfileNamespace;
        _LoginCount = profileNamespace getVariable "var_GG_Logins";
    };
    _Logins = profileNamespace getVariable "var_GG_Logins";

    [
        [
            ["[GG] GHOSTZ GAMERZ EXILE TANOA ALPHA","<t align = 'center' shadow = '0' size = '0.8' font='PuristaBold' color='#38AAE0'>%1</t>"],
            [profileNameSteam,"<br/><t align = 'center' shadow = '1' size = '0.7' font='PuristaLight'>%1</t>"],
            [" ",""],
            [" ",""]
        ]
    ] spawn BIS_fnc_typeText;

    sleep 9;

    switch (_Logins) do {
        case 0, case 1, case 2, case 3, case 4, case 5:
        {
            [["Visit Us At:","www.GHOSTZGAMERZ.com","For Rules","Forums","Free Builders Box","Leaderboards","Kill Feed","and Changelogs","","","","","","",""], .5, .85] call BIS_fnc_typeText;
            [["Join Our Teamspeak:","ts.GhostzGamerz.com","New Players recieve 10,000 Free Pop Tabs","Free Private Channels Available","Fast Admin support Channels","People waiting to Team Up","","","","","",""], -.5, .85] call BIS_fnc_typeText;

        };
        case 10:
        {
            [["WOW! This is your 10th time logging in...","We hope you are liking it here","Don't play alone, Bring your friends too","Don't forget to leave your feedback on our forums.","","","","",""], -.5, .85] call BIS_fnc_typeText;  
        };
        case 50:
        {
            [["WOHO! you reach 50 logins on our server.","We appreciate your loyalty","Help this community by Donating","A Small $5 Donation would help us out alot on the server costs.","","","",""], -.5, .85] call BIS_fnc_typeText;  
        };
        case 100:
        {
            [["You Just achieved a milestone","You are now logging in for the 100th time","Thank you so much for beign an active member of this community","","","","",""], -.5, .85] call BIS_fnc_typeText;  
        };
        default {};
    };


    _NewLoginCount = _Logins + 1;
    profileNamespace setVariable ["var_GG_Logins",_NewLoginCount];
    saveProfileNamespace;
    
    // Territory Information
    _playerUID = getPlayerUID player;
    _announcepay = [];
    {
        _flag = _x;
        _buildRights = _flag getVariable ["ExileTerritoryBuildRights", []];
        if (_playerUID in _buildRights) then
        {
            _nextDueDate = _flag getVariable ["ExileTerritoryMaintenanceDue", [0, 0, 0, 0, 0]];
            _name = _flag getVariable ["ExileTerritoryName", ""];
            _dueDate = format 
            [
                    "%2/%3/%1",
                    _nextDueDate select 0,
                    _nextDueDate select 1,
                    _nextDueDate select 2
            ];
            _msg = format["Your territory payment for '%2' due: %1",_dueDate,_name];
            _announcepay pushBack _msg;
            
        };
    }
    forEach (allMissionObjects "Exile_Construction_Flag_Static");
    sleep 2;
    _announcepay append ["","",""];
    if !(count _announcepay == 0) then{
            [_announcepay, -.5, .85] call BIS_fnc_typeText;
    };

    // Missing Mod Information
    _missingModList = [];
    _missingMods = false;

    if !(isClass (configFile >> "CfgPatches" >> "asdg_jointrails")) then {
        _msg = "We detected that your game is not running ASDG Joint Rails Mod.";
        _missingMods = true;
        _missingModList pushBack _msg;
    };
    if !(isClass (configFile >> "CfgPatches" >> "hlcweapons_core")) then {
        _msg = "We detected that your game is not running NiArms Pack Mod.";
        _missingMods = true;
        _missingModList pushBack _msg;
    };
    if !(isClass (configFile >> "CfgPatches" >> "TRYK_Uniform")) then {
        _msg = "We detected that your game is not running TRYK Multiplay Uniforms Mod.";
        _missingMods = true;
        _missingModList pushBack _msg;
    };

    if (_missingMods) then {
        _missingModList append ["","",""];

        sleep 2;

        if !(count _missingModList == 0) then{
                [_missingModList, .5, .85] call BIS_fnc_typeText;
        };
    };
};
publicVariable 'WELCOME_TEXT__CODE';

[] spawn {
	waitUntil{!isNil'FN_infiSTAR_S'};
	['',{
		if(!isNil'WELCOME_TEXT_JIP_T')then{terminate WELCOME_TEXT_JIP_T;WELCOME_TEXT_JIP_T=nil;};
		WELCOME_TEXT_JIP_T = [] spawn {
			waitUntil {!isNil 'WELCOME_TEXT__CODE'};
			waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};
			[] spawn WELCOME_TEXT__CODE;
		};
	},-2,'WELCOME_TEXT_JIP'] call FN_infiSTAR_S;
};
true