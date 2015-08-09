
#include "defines.sqf"

private ["_result","_pos","_range","_type","_alive","_arr"];
_pos   = _this select 0;
_range = _this select 1;
_alive = _this select 2;
_type  = _this select 3;
_result = false;

if (_type == "count") then { _result = 0; } else { _result = []; };

{
	if (!isNil _x) then
	{
		_plr = call compile _x;
		if (!isNull _plr) then
		{
			if (_plr distance _pos <= _range && (alive _plr || !_alive)) then
			{
				if (_type == "count") then
				{
					_result = _result + 1;
				}
				else
				{
					_result pushBack _plr;
				};
			};
		};
	};
} forEach westPlrStr;
_result