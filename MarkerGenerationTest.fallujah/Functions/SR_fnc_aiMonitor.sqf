
#include "defines.sqf"


private ["_ai","_gun","_ais","_guns"];

_ais  = [getPosATL player,100,true,"array"] call SR_fnc_nearestEastMen;
_guns = nearestObjects[getPosATL player, eastStationaryGuns, 500];
_ai   = objNull;
_gun  = objNull;
if (count _ais > 0) then { if (vehicle (_ais select 0) == (_ais select 0)) then { _ai = _ais select 0; }; };
if (count _guns > 0) then { _gun = gunner (_guns select 0); };
if (isNull _gun && isNull _ai) exitWith {};
[nil,server,"loc",rSPAWN,[_ai,player,_gun],{
	_ai  = _this select 0;
	_plr = _this select 1;
	_gun = _this select 2;
	if !isNull _ai then {
		_ai reveal _plr;
		_ai setUnitPos "UP";
		_ai doWatch _plr;
		_ai doMove getPosATL _plr;
	};
	if !isNull _gun then {
		_gun reveal _plr;
		_dir = ((getPosATL _plr select 0) - (getPosATL _gun select 0)) atan2 ((getPosATL _plr select 1) - (getPosATL _gun select 1));
		group _gun setFormDir _dir;
		_gun doTarget _plr;
		curTime = time;
		while { time - curTime < 5 } do {
			vehicle _gun fireAtTarget [_plr,currentWeapon vehicle _gun];
		};
	};
}] call RE;