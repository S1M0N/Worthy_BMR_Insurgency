


#include "defines.sqf"

// aiDespawn, removes dead AI

private ["_unit","_str","_var","_plrs"];

for "_i" from 1 to 4 do {
	_str  = format["%1ai%2", player, _i];
	if !isNil _str then
	{
		_unit = call compile _str;
		if isNull _unit exitWith {};
		if !alive _unit then
		{
			_str  = _str + "var";
			if (_unit distance graveDigger < 10) exitWith
			{
				if DEBUG then { server globalChat format["deleting %1 at gravedigger...", format["%1ai%2", player, _i]]; };
				deleteVehicle _unit;
				missionNamespace setVariable [_str, nil];
			};
			_plrs = nearestPlayers(getPosATL _unit,200,true,"array");
			if (count _plrs == 0 || !arrCanSee(_plrs,_unit,35,30)) then
			{
				_var = missionNamespace getVariable _str;
				if isNil "_var" exitWith { missionNamespace setVariable [_str, time]; };
				if (time - _var < infDeleteTime) exitWith
				{
					if DEBUG then { server globalChat format["waiting to delete %1: %2s left", format["%1ai%2", player, _i], nfDeleteTime - (time - _var)]; };
				};
				if (_unit distance graveDigger >= 10 && isPlayer _unit && !isNull group _unit) exitWith { _unit call setGrpNull; };
				if DEBUG then { server globalChat format["deleting %1...", format["%1ai%2", player, _i]]; };
				deleteVehicle _unit;
				missionNamespace setVariable [_str, nil];
			};
		};
	};
};