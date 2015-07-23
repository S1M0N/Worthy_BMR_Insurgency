



SR_fnc_getGroup = {
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