/*
Created by Simon Roth.

Simon's Supply Drop Package Script - addAction.sqf
I took inspiration from[EVO] Dan & [EVO] Curry's script, however this script has been written from scratch.
This system utilizes several functions and supports JIP and respawning on persistant servers.

Please see the ReadMe.sqf file for more detials.


*/


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
