



private ["_i","_house","_hPos"];
_house = _this select 0;
_i 	 = _this select 1;

_hPos	 = format["%1", _house buildingPos _i];
if (_hPos == "[0,0,0]") exitWith { _i; };
[_house, _i+1] call SR_fnc_countPositions;
