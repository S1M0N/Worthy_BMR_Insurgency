/*
Created by Simon Roth.

Simon's Supply Drop Package Script - sdInit.sqf
I took inspiration from[EVO] Dan & [EVO] Curry's script, however this script has been written from scratch.
This system utilizes several functions and supports JIP and respawning on persistant servers.

Please see the ReadMe.sqf file for more detials.


*/

if (!isServer && isNull player) then {isJIP=true;} else {isJIP=false;};
publicVariable "isJIP";

call compile preprocessFileLineNumbers "supplydrop\defines.sqf";
call compile preprocessFileLineNumbers "supplydrop\svr_fncs.sqf";

sr_SDRunning = false;
publicVariable "sr_SDRunning";
sr_sdActionAdded = false;
publicVariable "sr_sdActionAdded";

[] spawn fnc_SR_SD_plrAddAction;
player addEventHandler ["Respawn", {[] spawn fnc_SR_SD_plrAddAction;}];