
#include "defines.sqf"

private ["_index","_sign","_sign2","_radius","_cache","_pos","_mkr","_range"];

_cache = _this;
_index = 0;
while{ (getMarkerPos format["%1intel%2", _cache, _index] select 0) != 0}do{ _index = _index + 1; };
_sign = 1;
if (random 100 > 50) then { _sign = -1; };
_sign2 = 1;
if (random 100 > 50) then { _sign2 = -1; };
_radius = intelRadius - _index*50;
if (_radius < 50) then { _radius = 50; };
_pos = [(getPosATL _cache select 0) + _sign *(random _radius),(getPosATL _cache select 1) + _sign2*(random _radius)];
_mkr = createMarker[format["%1intel%2", _cache, _index], _pos];
_mkr setMarkerType intelMarkerType;
_range  = round sqrt(_radius^2*2);
_range  = _range - (_range % 50);
_mkr setMarkerText format["%1m", _range];
_mkr setMarkerColor "ColorRed";
_mkr setMarkerSize [0.5,0.5];