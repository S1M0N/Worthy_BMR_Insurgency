
#include "initUPS.sqf";
#include "defines.sqf"


getGroup = {
    private ["_side","_prefix","_name","_suffix"];
    _prefix = _this select 0;
    _name   = _this select 1;
    _suffix = _this select 2;
	_side   = _this select 3;

	call compile format["
		if isNil ""%1%2%3"" exitWith { %1%2%3 = createGroup %4; %1%2%3 };
		if isNull %1%2%3 exitWith { %1%2%3 = createGroup %4; %1%2%3 };
		%1%2%3
	", _prefix, _name, _suffix, _side];
};


private ["_num","_track","_speed","_grp","_type","_obj","_mkr","_pos","_vcl","_ai","_unum"];
_unum = _this;

_num	= _unum % 3;
if (_num == 0) then { _num = 6; };
_grp	= ["","vclGrp",_unum+1,"resistance"] call getGroup;
_type = eastVehiclesFreq select round(random (count eastVehiclesFreq - 1));
//_obj 	= call compile ("vclSpawn" + str(_num));
_obj 	= [vclSpawn1,vclSpawn2,vclSpawn3,vclSpawn4,vclSpawn5,vclSpawn6] call bis_fnc_selectRandom;
_mkr 	= str _unum;
_pos 	= getPosATL _obj;
_vcl 	= createVehicle [_type, _pos, [], 10, "None"];
if (DEBUG) then { server globalChat format["AI VEHICLE %1 of TYPE %2 CREATED! POSITION: %3", _unum, str _vcl, str _pos]; };
_vcl setDir getDir _obj;
_ai	  = _grp createUnit [vclCrewClass, _pos, [], 0, "None"];
_ai setRank (eastRanks select 2);
_ai moveInDriver _vcl;
_ai	  = _grp createUnit [vclCrewClass, _pos, [], 0, "None"];
_ai setRank (eastRanks select 3);
_ai moveInGunner _vcl;
if !(typeOf _vcl in eastLightVehicles) then {
	_vcl lockDriver true;
	_vcl lockTurret [[0], true];
};
_speed = "slow";
_track = "";
if (DEBUG) then { _track = "track"; };
if (typeOf _vcl in eastLightVehicles) then { _speed = "noslow"; };
[leader _grp, _mkr, _speed, "nowait", _track, "delete:", 1000] execVM "AI\UPS.sqf";
