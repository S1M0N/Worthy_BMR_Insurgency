


#define canSee(X,Y,Z) ([X,Y,Z] call SR_fnc_canSee)


private ["_arc","_pos","_arr","_rng","_unit","_canSee"];
_arr = _this select 0;
_pos = _this select 1;
_arc = _this select 2;
_rng = _this select 3;

_canSee = false;
for "_i" from 0 to (count _arr - 1) do {
	_unit = _arr select _i;
	if (alive _unit && (canSee(_unit,_pos,_arc) || _unit distance _pos <= _rng)) exitWith { _canSee = true; };
};
_canSee;
