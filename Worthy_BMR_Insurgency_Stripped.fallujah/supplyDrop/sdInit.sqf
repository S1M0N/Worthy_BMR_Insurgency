/*
Created by Simon Roth.

Simon's Supply Drop Package Script - sdInit.sqf
I took inspiration from[EVO] Dan & [EVO] Curry's script, however this script has been written from scratch.
This system utilizes several functions and supports JIP and respawning on persistant servers.
There are specific locations that you will need to have files placed in order for theis script package to function properly.
Failing to place the appropriate files/folders and commands in the appropriate locations will cause failure of this system.


*/


#include "defines.sqf";
call compile preprocessFileLineNumbers "supplydrop\svr_fncs.sqf";
//player call fnc_SR_SD_plrAddAction;
