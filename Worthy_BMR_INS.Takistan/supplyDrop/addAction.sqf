

//_str = format["<t color='#FF9000'>Call Supply Drop</t>"];



if (isJip) then {
	sdAction = _this addAction ["<t color='#FF9000'>Call Supply Drop</t>", "supplyDrop\supplyDrop.sqf"];
	sr_sdActionAdded = true;
	publicVariable "sr_sdActionAdded";
} else {
	if (sr_sdActionAdded) exitWith {};
	sdAction = _this addAction ["<t color='#FF9000'>Call Supply Drop</t>", "supplyDrop\supplyDrop.sqf"];
	sr_sdActionAdded = true;
	publicVariable "sr_sdActionAdded";
};
