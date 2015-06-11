//Player and vehicle marker Init
// called in init.sqf by local player only. this ensures that the markers are synced to all players, regardless of JIP

#include "mkrDef.sqf";
#include "mkrFncs.sqf";
#include "mkrCreate.sqf";


while { isWest } do {
	call SR_fnc_plrMkrs;
	call SR_fnc_vehMkrs;
	sleep 2;
};
