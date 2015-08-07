
#include "defines.sqf"

private ["_result","_arr1","_arr2","_alive","_type"];
_arr1  = nearestObjects[_this select 0, ["LandVehicle"], _this select 1];
_arr2  = nearestObjects[_this select 0, ["Man"], _this select 1];
_alive = _this select 2;
_type  = _this select 3;

if (_type == "count") then { _result = 0; } else { _result = []; };
{
	if (typeOf _x in eastInfClasses && ( (alive _x && primaryWeapon _x != "") || !_alive ) ) then {
		if (_type == "count") then { _result = _result + 1; } else { _result set [count _result, _x]; };
	};
} forEach _arr2;
for "_i" from 0 to (count _arr1 - 1) do {
	{
		if (typeOf _x in eastInfClasses && (alive _x || !_alive) ) then {
			if (_type == "count") then { _result = _result + 1; } else { _result set [count _result, _x]; };
		};
	} forEach (crew (_arr1 select _i));
};
_result;