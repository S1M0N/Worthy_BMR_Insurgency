
#include "defines.sqf"

private ["_inc","_hPos","_eCount","_wUnits","_wCount","_house","_clear","_gMkr","_houses","_hCount","_pos"];

//if (findSquadAIName(player) == "") exitWith {};
if (!alive player) exitWith {};
//_houses = [player, SPAWNRANGE, 3] call SR_fnc_findHousesFront; // find available houses for spawn posits
[player, SPAWNRANGE, 3] call SR_fnc_findHousesFront;
_houses = enterableHouses; // find available houses for spawn posits
_hCount = count _houses;
if (_hCount == 0) exitWith {};
_inc = 6;
if (_hCount < 10) then { _inc = 3; };
{
	//_gMkr = str(missionNamespace getVariable "MarkerArray");
	//_gMkr = str([getpos _x] call WP_fnc_GetGridPos);
 	_pos = [position _x] call WP_fnc_GetGridPos;
	_gMkr = str _pos;
	if (markerColor _gMkr == "ColorRed") then   // make sure it's a red square
	{
		_hPos   = getPosATL _x;
		_eCount = count nearestObjects[_pos, ["Man"], 15];
		_wUnits =  [_hPos,SPAWNRANGE-200,true,"array"] call SR_fnc_nearestPlayers;
		//_wUnits = nearestPlayers(_hPos,SPAWNRANGE-200,true,"array");
		_wCount = count _wUnits;
		// players need not to be within SPAWNRANGE-200 from a house or they need not to see the spawn position for its AI to spawn
		//if (_eCount == 0 && (_wCount == 0 || !arrCanSee(_wUnits,_hPos,30,50))) then { [_x, _wCount, _inc] call SR_fnc_fillHouseEast; };
		if (_eCount == 0 && !(_gMkr in ActiveZones)) then
		{
			_grp = [_x, _wCount, _inc, _pos] call SR_fnc_fillHouseEast;
			if (DEBUG) then { systemChat format ["Zone Activated: %1", _pos];};
				if (!isNull _grp) then
				{
					ActiveGroups pushBack [_pos,_grp];
					publicVariable "ActiveGroups";
				};
			ActiveZones pushBack _pos;
			publicVariable "ActiveZones";
		};
	};
	//if (findSquadAIName(player) == "") exitWith {};
	if (!alive player) exitWith {};
} forEach _houses;

