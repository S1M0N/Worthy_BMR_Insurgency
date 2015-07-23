
#define findSquadAIName(X) ([X,1] call SR_fnc_findSquadAIName)
//#define exitCondition ((findSquadAIName(player) == grpNull) || (!alive player))
#define arrCanSee(W,X,Y,Z) ([W,X,Y,Z] call SR_fnc_arrCanSee)
#define nearestPlayers(W,X,Y,Z)	([W,X,Y,Z] call SR_fnc_nearestPlayers)
#define SPAWNRANGE 500

SR_fnc_aiSpawn = {
    private ["_inc","_hPos","_eCount","_wUnits","_wCount","_house","_clear","_gMkr","_houses","_hCount"];

    //if (findSquadAIName(player) == "") exitWith {};
	if (!alive player) exitWith {};
	//_houses = [player, SPAWNRANGE, 3] call SR_fnc_findHousesFront; // find available houses for spawn posits
	[player, SPAWNRANGE, 3] call SR_fnc_findHousesFront;
	_houses = [missionNamespace getVariable "enterableHouses"]; // find available houses for spawn posits
	_hCount = count _houses;
	if (_hCount == 0) exitWith {};
	_inc = 6;
	if (_hCount < 10) then { _inc = 3; };
	for "_j" from 0 to (_hCount - 1) do {
		_house = _houses select _j;
		_clear = _house getVariable "cleared";
		_gMkr = str(_house call WP_fnc_GetGridPos);
		if (markerColor _gMkr == "ColorRed" && isNil "_clear") then {  // make sure it's a red square
			_hPos   = getPosATL _house;
			_eCount = count nearestObjects[_hPos, ["Man"], 15];
			_wUnits = nearestPlayers(_hPos,SPAWNRANGE-200,true,"array");
			_wCount = count _wUnits;
			// players need not to be within SPAWNRANGE-200 from a house or they need not to see the spawn position for its AI to spawn
			if (_eCount == 0 && (_wCount == 0 || !arrCanSee(_wUnits,_hPos,30,50))) then { [_house, _wCount, _inc] call SR_fnc_fillHouseEast; };
		};
		//if (findSquadAIName(player) == "") exitWith {};
		if (!alive player) exitWith {};
	};
};