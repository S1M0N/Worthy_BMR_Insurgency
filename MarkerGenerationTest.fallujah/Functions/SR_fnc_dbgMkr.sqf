


#include "defines.sqf"


private ["_txt","_dir","_unit","_mkr"];
_unit = _this select 0;

if (isNil "_unit") exitWith { };
_mkr = createMarker["DEBUG" + str _unit, getPosATL _unit];
_mkr setMarkerShape "ICON";
_mkr setMarkerType "mil_triangle";
_mkr setMarkerSize [0.5,0.7];
_txt = str _unit;
//if (typeName _txt == "OBJECT") then {_txt = getText (configFile >> "CfgVehicles" >> typeOf vehicle(_this select 1) >> "displayName"); };
if (str _unit in eastPlayerStrings) then { _txt = name _unit; };
_mkr setMarkerText _txt;
_mkr setMarkerColor "ColorRed";
_dir = getDir _unit;
if (vehicle _unit != _unit) then { _dir = formationDirection _unit; };
_mkr setMarkerDir _dir;
if (!alive _unit) then { _mkr setMarkerColor "ColorBlack"; };
[_mkr, _unit] spawn {
    private ["_mkr","_unit"];
    _mkr    = _this select 0;
    _unit   = _this select 1;

	while{!isNull _unit && DEBUG}do{
		_mkr setMarkerPos getPosATL _unit;
		_mkr setMarkerDir getDir _unit;
		if !alive _unit then { _mkr setMarkerColor "ColorBlack";	};
		sleep 0.1;
	};
	if !DEBUG then { sleep 5; };
	deleteMarker _mkr;
};
