



#include "defines.sqf"




private "_index";

for "_index" from 1 to eastVehicleNum do {
	_index spawn SR_fnc_spawnAIVehicle;
	if (DEBUG) then { server globalChat format ["SPAWNING AI VEHICLE %1", _index]; };
};