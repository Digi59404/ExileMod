/*
	KILL MESSAGES
	BY GR8
	v0.9
*/


/* CONFIG */
ShowPlayerKills = true; // Show Player to Player Kills
ShowAIKills = true; // Show AI to player Kills
ShowDynamicText = true; // Show Kills Top Left of the Screen with all the custom colors and styles.
halvStyle = true; // This will use the awesome style made by halv, If false then you will see a style made by me.

ShowTitleText = false; // show Kill Message on the Bottom Mid Of the Screen. Will not show custom Color added Below.

// The color codes you see here are called Hex Codes - If you wish to pick another color see here :
//  http://www.color-hex.com/
// Then Copy the color code including '#' and must be 6 characters.

KillerNameColor	 = "#5882FA" // Text Color of the Killer's Name.
VictimNameColor	 = "#C70000" // Text Color of the Victim's Name.
WeaponNameColor	 = "#FFCC00" // Text Color of the Weapon's Name. Only Works in Halv's Style
DistanceColor	 = "#FFCC00" // Text Color of the kill Distance number.

if (!isDedicated) then {
	if (ShowDynamicText) then {
		if (halvStyle) then {
			"Gr8s_kill_msg"		addPublicVariableEventHandler {
				_id = (_this select 1);
				_killerName = _id select 0;
				_pic		= _id select 1;
				_victimName = _id select 2;
				_distance 	= _id select 3;
				_weapon 	= _id select 4;
				_dyntxt = format["
				<t size='0.75'align='left'shadow='1'color='%6'>%1</t>
				<t size='0.5'align='left'shadow='1'>  Killed  </t>
				<t size='0.75'align='left'shadow='1'color='%7'>%2</t><br/>
				<t size='0.45'align='left'shadow='1'> With: </t>
				<t size='0.5'align='left'shadow='1'color='%8'>%3</t>
				<t size='0.45'align='left'shadow='1'> - Distance: </t>
				<t size='0.5'align='left'shadow='1'color='%9'>%4m</t><br/>
				<img size='2.5'align='left'shadow='1'image='%5'/>
				",
				_killerName,
				_victimName,
				_weapon,
				_distance,
				_pic,
				KillerNameColor,
				VictimNameColor,
				WeaponNameColor,
				DistanceColor
				];
				[_dyntxt,[safezoneX + 0.01 * safezoneW,2.0],[safezoneY + 0.01 * safezoneH,0.3],30,0.5] spawn BIS_fnc_dynamicText;
			};
		} else {
			"Gr8s_kill_msg"		addPublicVariableEventHandler {
				_id = (_this select 1);
				_killerName = _id select 0;
				_pic		= _id select 1;
				_victimName = _id select 2;
				_distance 	= _id select 3;
				_dyntxt = format["
				<t align='left'size='0.9'color='%6'>%1 </t>
				<img size='1.0'align='left' image='%2'/>
				<t align='left'size='0.9'> %3 </t>
				<t align='left'size='0.9'>[%4m]</t>
				",
				_killerName,
				_pic,
				_victimName,
				_distance,
				KillerNameColor,
				VictimNameColor,
				DistanceColor
				];
				[_dyntxt,[safezoneX + 0.01 * safezoneW,2.0],[safezoneY + 0.01 * safezoneH,0.3],30,0.5] spawn BIS_fnc_dynamicText;
			};
		};
	};
	if (ShowTitleText) then {
		"Gr8s_kill_msg"		addPublicVariableEventHandler {
			_id = (_this select 1);
			_killerName = _id select 0;
			_pic		= _id select 1;
			_victimName = _id select 2;
			_distance 	= _id select 3;
			_weapon 	= _id select 4;
			_message = format["%1 was killed by a %2 with %3 from %4m",_victimName,_killerName,_weapon,_distance];
			titleText [_message, "PLAIN"];
		};
	};
};
// Made by GR8