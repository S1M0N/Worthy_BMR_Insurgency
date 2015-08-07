
#include "defines.sqf"

private ["_unit","_obj","_dirTo","_uDir","_vcl","_arc"];
_unit  = _this select 0;
_obj   = _this select 1;
_arc   = _this select 2;
_dirTo = getDirTo(_unit,_obj); // vector from _unit to _obj
_uDir  = getDir (vehicle _unit); // heading of _unit
if (vehicle _unit != _unit) then {
	// if it's a vehicle and _unit is in a turret we take the heading of that turret
	_vcl = vehicle _unit;
	if (_vcl turretUnit [0] == _unit) then {
		_uDir = _vcl weaponDirection (_vcl weaponsTurret [0] select 0);
		_uDir = (_uDir select 0) atan2 (_uDir select 1);
	};
};
if (abs(_dirTo - _uDir) > 180) then { _uDir = -1*(360 - _uDir); };
abs(_dirTo - _uDir) <= _arc;