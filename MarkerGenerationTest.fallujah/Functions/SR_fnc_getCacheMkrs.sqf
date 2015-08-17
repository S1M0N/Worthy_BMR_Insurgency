

#include "defines.sqf"


private ["_index","_cache","_arr","_mkr"];
_cache = _this select 0;
_arr = _this select 1;
_index = _this select 2;

_mkr = format["%1intel%2", _cache, _index];
if ((getMarkerPos _mkr select 0) == 0) exitWith { _arr; };
_arr set [_index, _mkr];
[_cache, _arr, _index+1] call SR_fnc_getCacheMkrs;

//#define cacheMarkers(X) ([X,[],0] call getCacheMarkers)