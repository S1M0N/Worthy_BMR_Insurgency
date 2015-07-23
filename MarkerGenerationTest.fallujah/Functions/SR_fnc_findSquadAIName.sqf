

#define maxAIPerPlayer 4
#define SPAWNRANGE 			500
#define eastPlayerStrings   ["east1","east2","east3","east4"]
#define arrCanSee(W,X,Y,Z) ([W,X,Y,Z] call SR_fnc_arrCanSee)

// makes up the AI name based on player squad name plus a incrementing number and returns it
// each player has its "own" AI spawned, defined by the count defined in the mission params
// from 25% == 1 AI up to 100% == 4 AIs per player
SR_fnc_findSquadAIName = {
	private ["_i","_squad","_str","_unit","_plrs","_pos","_arr"];
    _squad = _this select 0;
    _i = _this select 1;
	if (_i > maxAIPerPlayer) exitWith {};
    _str = format["%1ai%2", _squad, _i];
	if isNil _str exitWith { _str };
    _unit = call compile _str;
	if isNull _unit exitWith { _str };
	_pos = getPosATL _unit;
	_plrs = [_pos,SPAWNRANGE,true,"array"] call SR_fnc_nearestPlayers;
	if (alive _unit) exitWith { _str };
	if !(str leader _unit in eastPlayerStrings) exitWith { _str };
	if ((count _plrs == 0) || !(arrCanSee(_plrs,_unit,90,100))) exitWith { _str };
	if !(player in _plrs) exitWith { _str };
	if !(arrCanSee(_plrs,_unit,35,50)) exitWith { _str };
	[_squad, _i+1] call SR_fnc_findSquadAIName;
};