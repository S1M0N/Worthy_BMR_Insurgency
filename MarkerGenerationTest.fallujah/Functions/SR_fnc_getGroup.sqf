
private ["_prefix","_grpName","_suffix","_side" , "_newSuffix"];
_prefix = _this select 0;	// player
_grpName = _this select 1;	// "EastAIgrp"
_suffix = _this select 2; 	// ZoneID
_side   = _this select 3;	// "East"

_newSuffix = format ["Zone%1%2%3",_suffix select 0,_suffix select 1,_suffix select 2];

call compile format["if isNil ""%1%2%3"" exitWith { %1%2%3 = createGroup %4; %1%2%3 }; if isNull %1%2%3 exitWith { %1%2%3 = createGroup %4; %1%2%3 }; %1%2%3", _prefix, _grpName, _newSuffix, _side];
