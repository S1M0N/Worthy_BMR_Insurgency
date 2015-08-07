
#include "defines.sqf"

private ["_ranSpawnPos","_process","_arr","_inc","_pID","_pos","_bool","_unit","_Ainame","_class","_ai","_nPos","_house","_cCount","_hID","_wCount","_i","_grp"];
scopeName "fillHouseEastMain";

DEBUG = true;

_house	 = _this select 0;
_wCount  = _this select 1;
_inc	 = _this select 2;

_bool = false;
_npos = [_house, 0] call SR_fnc_countPositions;								// Number of spawn positions in a house
_cCount			= count eastInfClasses - 1; 					// 0 based count of OPFOR infantry class members
_ranSpawnPos	= round random (_nPos-1); 						// Random spawn position
_hID			= CACHEHOUSEPOSITIONS find (typeOf _house); 	// Test if the house is a valid house for AI spawns (if not it's -1)
_arr			= [];
if (_hID != -1 && _wCount > 0) then
{
	_arr = CACHEHOUSEPOSITIONS select (_hID + 1);
};

for [{ _i=_ranSpawnPos},{ _i<((_nPos-1)+_ranSpawnPos)},{ _i=_i+_inc}] do
{
	if (count _arr == 0 && _wCount > 0 && _hID != -1) exitWith {};
	_pos   = _house buildingPos (_i % _nPos);
	if (count _arr > 0) then
	{
		_pID = (_arr select 0);
		_pos = _house buildingPos _pID;
		_arr = _arr - [(_arr select 1)] - [_pID];
	};

	// create an AI at _pos if no other "Man" in radus of 3 meters of _pos
	if (count nearestObjects[_pos, ["Man"], 3] == 0) then
	{
		_AiName = [player, 1] call SR_fnc_findSquadAIName;
		if (_AiName == "") exitWith
		{
			breakTo "fillHouseEastMain";
		};
		_bool  = !isNil "_AiName";
		if _bool then
		{
			_bool = alive (call compile _AiName);
		};
		// When the AI unit (found by name) is alive, make sure it's healthy and, make it "look-alive" by issuing a move command
		if _bool exitWith
		{
			_unit = (call compile _AiName);
			_unit setPosATL _pos;
			_unit setDamage 0;
			doStop _unit;

			if DEBUG then
			{
				server globalChat format["moving %1", _AiName];
			};
		};
		// If there are no appropriate AI units around,  prepare for spawning them
		if DEBUG then
		{
			server globalChat format["spawning %1", _AiName];
		};
		_class = (eastInfClasses select (random _cCount));
		_grp  = [player, "EastAIGrp", "", "east"] call SR_fnc_getGroup; // create an AI group
		_ai = _grp createUnit [_class, spawnPos, [], 0, "NONE"];
		_ai setPosATL _pos;

		if (floor random 10 < 1) then			// %10 Chance of Intel Spawn
    	{
			_ai addEventHandler
	    	[
	        	'killed',
	         	{
	                _IntelDrop = createVehicle [
	                	(["Land_Suitcase_F","Land_Laptop_F"] call bis_fnc_selectRandom), 	// Intel Types
	                	(getpos _ai), 														// Spawn Position
	                	[], 																// Marker Array
	                	1, 																	// Placement Radius
	                	'NONE'																// Special Spawn Type 'NONE', 'FLY', 'CAN_COLLIDE', 'FORM'
                	];
	         	}
	     	];
	     };
	};
};