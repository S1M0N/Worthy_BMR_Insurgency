


#include "defines.sqf"


private ["_i","_arr","_str","_cache"];
_arr = _this select 0;
_i = _this select 1;

if (_i >= cacheCount) exitWith { _arr; };
_str = format["cache%1", _i+1];
_cache = call compile _str;
if (!isNull _cache) then {
	if (alive _cache) then { _arr = _arr + [_cache]; };
};
[_arr, _i+1] call SR_fnc_getCaches;