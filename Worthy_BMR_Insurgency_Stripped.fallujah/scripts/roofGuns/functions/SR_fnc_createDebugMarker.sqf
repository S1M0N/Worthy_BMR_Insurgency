

#include "rg_defines.sqf";

SR_fnc_createDebugMarker = {
    private ["_txt","_dir","_unit","_mkr"];
    _unit = _this select 0;

	if (isNil "_unit") exitWith { };
	_mkr = createMarkerLocal["rg_DEBUG" + str _unit, getPosATL _unit];
	_mkr setMarkerShapeLocal "ICON";
	_mkr setMarkerTypeLocal "mil_triangle";
	_mkr setMarkerSizeLocal [0.5,0.7];
	_txt = str _unit;
	//if (typeName _txt == "OBJECT") then {_txt = getText (configFile >> "CfgVehicles" >> typeOf vehicle(_this select 1) >> "displayName"); };
	//if (str _unit in eastPlayerStrings) then { _txt = name _unit; };
	_mkr setMarkerTextLocal _txt;
	_mkr setMarkerColorLocal "ColorRed";
	_dir = getDir _unit;
	if (vehicle _unit != _unit) then { _dir = formationDirection _unit; };
	_mkr setMarkerDirLocal _dir;
	if (!alive _unit) then { _mkr setMarkerColorLocal "ColorBlack"; };
	[_mkr, _unit] spawn {
        private ["_mkr","_unit"];
        _mkr    = _this select 0;
        _unit   = _this select 1;

		while{!isNull _unit && (DebugEnabled isEqualTo 1)}do{
			_mkr setMarkerPosLocal getPosATL _unit;
			_mkr setMarkerDirLocal getDir _unit;
			if !alive _unit then { _mkr setMarkerColorLocal "ColorBlack";	};
			sleep 0.1;
		};
		if !(DebugEnabled isEqualTo 1) then { sleep 5; };
		deleteMarkerLocal _mkr;
	};
};