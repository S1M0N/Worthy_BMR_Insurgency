
//Function Preprocessor
//Place each function in section marked by the storage folder
//WP_fnc_FunctionName = compile preprocessFile "Functions\FolderName\WP_fnc_FunctionName.sqf"

//Marker Generation
missionNamespace setVariable ["funcsProcessed", false];

WP_fnc_FindHouses = compile preprocessFile "Functions\MarkerGenerator\WP_fnc_FindHouses.sqf";
WP_fnc_GetGridPos = compile preprocessFile "Functions\MarkerGenerator\WP_fnc_GetGridPos.sqf";
SR_fnc_nearestPlayers = compile preprocessFile "Functions\SR_fnc_nearestPlayers.sqf";
SR_fnc_nearestEastMen = compile preprocessFile "Functions\SR_fnc_nearestEastMen.sqf";
SR_fnc_countPositions = compile preprocessFile "Functions\SR_fnc_countPositions.sqf";
SR_fnc_clearHouses = compile preprocessFile "Functions\SR_fnc_clearHouses.sqf";
SR_fnc_canSee = compile preprocessFile "Functions\SR_fnc_canSee.sqf";
SR_fnc_arrCanSee = compile preprocessFile "Functions\SR_fnc_arrCanSee.sqf";
//SR_fnc_spawnAIVehicle = compile preprocessFile "Functions\SR_fnc_spawnAIVehicle.sqf";
//SR_fnc_getGroup = compile preprocessFile "Functions\SR_fnc_getGroup.sqf";
SR_fnc_aiMonitor = compile preprocessFile "Functions\SR_fnc_aiMonitor.sqf";
SR_fnc_findHousesFront = compile preprocessFile "Functions\SR_fnc_findHousesFront.sqf";
SR_fnc_findSquadAIName = compile preprocessFile "Functions\SR_fnc_findSquadAIName.sqf";
SR_fnc_fillHouseEast = compile preprocessFile "Functions\SR_fnc_fillHouseEast.sqf";
SR_fnc_aiSpawn = compile preprocessFile "Functions\SR_fnc_aiSpawn.sqf";
SR_fnc_aiDespawn = compile preprocessFile "Functions\SR_fnc_aiDespawn.sqf";
SR_fnc_setGrpNull = compile preprocessFile "Functions\SR_fnc_setGrpNull.sqf";



missionNamespace setVariable ["funcsProcessed", true];