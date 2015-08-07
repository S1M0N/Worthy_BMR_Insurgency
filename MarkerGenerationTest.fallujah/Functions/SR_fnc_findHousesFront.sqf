
#include "defines.sqf"



private ["_buildings","_enterables","_arg1","_arg2","_arg3"];
//hint "HouseFront Running";

// find houses within a certain radius based on a position
_buildings = nearestObjects [player, ["house"], _this select 1];
// house should have _minPositions spawn points, 0 based
_enterables = [];
{
	//checking if enough spawn positions are found in the house ([0,0,0] returned means illegal position),
	//if it's a house from OA (optional through mapping defines), is not listed in 'ILLEGALHOUSES', is not damaged and player can see it
	_arg1 = format["%1", _x buildingPos 2] != "[0,0,0]";
	_arg2 = typeOf _x in ILLEGALHOUSES;
	_arg3 = damage _x == 0;
	//_arg4 = [player,_x,60] call SR_fnc_canSee;
	if ((_arg1) && !(_arg2) && (_arg3)) then {
		_enterables set [count _enterables, _x];
	};
} forEach _buildings;
enterableHouses = _enterables;
publicVariable "enterableHouses";
//systemChat str _enterables;
_enterables;


