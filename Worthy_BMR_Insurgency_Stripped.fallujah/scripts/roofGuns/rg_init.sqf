
#include "functions\rg_defines.sqf";


SR_fnc_createDebugMarker = compileFinal preprocessFile "scripts\roofGuns\functions\SR_fnc_createDebugMarker.sqf";
SR_fnc_createRoofGuns = compileFinal preprocessFile "scripts\roofGuns\functions\SR_fnc_createRoofGuns.sqf";
SR_fnc_spawnAIGuns = compileFinal preprocessFile "scripts\roofGuns\functions\SR_fnc_spawnAIGuns.sqf";


call SR_fnc_spawnAIGuns;