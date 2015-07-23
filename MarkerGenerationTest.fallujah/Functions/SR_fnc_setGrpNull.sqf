

// returns East AI to the gravedigger position
SR_fnc_setGrpNull = {
	private "_unit";
	_unit 	= _this;

    if DEBUG then { server globalChat format["sending %1 to gravedigger", format["%1ai%2", player, _unit]]; };
	if alive _unit then { _unit setDamage 1; };
	[_unit] join group graveDigger;
	_unit setPosATL getPosATL graveDigger;
};
