SECRET_FUNCTIONS__CODE = {

    // Draw Lines on the map
    drawToMap = {
        private ["_alpha", "_center", "_color", "_direction", "_length", "_marker", "_markerArray", "_posArray", "_width"];
        _posArray = _this select 0;
        _width = _this select 1;
        _color = _this select 2 select 0;
        _alpha = _this select 2 select 1;
        _markerArray = [];
        for "_x" from 0 to count _posArray - 2 do {
            _center = [((_posArray select _x select 0) + (_posArray select _x + 1 select 0)) / 2, ((_posArray select _x select 1) + (_posArray select _x + 1 select 1)) / 2];
            _direction = ((_posArray select _x + 1 select 0) - (_posArray select _x select 0)) atan2 ((_posArray select _x + 1 select 1) - (_posArray select _x select 1));
            _length = sqrt (((_posArray select _x select 0) - (_posArray select _x + 1 select 0)) ^ 2 + ((_posArray select _x select 1) - (_posArray select _x + 1 select 1)) ^ 2);
            for "_y" from 1 to 9001 do {
                _marker = "GG_drawToMap_" + str(_y);
                if (markerShape _marker == "") exitWith {};
            };
            createMarker [_marker, _center];
            _marker setMarkerShape "RECTANGLE";
            _marker setMarkerBrush "SolidFull";
            _marker setMarkerSize [_width / 2, _length / 2];
            _marker setMarkerDir _direction;
            _marker setMarkerAlpha _alpha;
            _marker setMarkerColor _color;
            _markerArray set [count _markerArray, _marker];
        };
        {
            for "_y" from 1 to 9001 do {
                _marker = "GG_drawToMap_" + str(_y);
                if (markerShape _marker == "") exitWith {};
            };
            createMarker [_marker, _x];
            _marker setMarkerShape "ELLIPSE";
            _marker setMarkerBrush "SolidFull";
            _marker setMarkerSize [_width / 2, _width / 2];
            _marker setMarkerAlpha _alpha;
            _marker setMarkerColor _color;
            _markerArray set [count _markerArray, _marker];
        } forEach _posArray;
        _markerArray
    };

};
publicVariable 'SECRET_FUNCTIONS__CODE';

[] spawn {
	waitUntil{!isNil'FN_infiSTAR_S'};
	['',{
		if(!isNil'SECRET_FUNCTIONS_JIP_T')then{terminate SECRET_FUNCTIONS_JIP_T;SECRET_FUNCTIONS_JIP_T=nil;};
		SECRET_FUNCTIONS_JIP_T = [] spawn {
			waitUntil {!isNil 'SECRET_FUNCTIONS__CODE'};
			[] call SECRET_FUNCTIONS__CODE;
		};
	},-2,'SECRET_FUNCTIONS_JIP'] call FN_infiSTAR_S;
};
true