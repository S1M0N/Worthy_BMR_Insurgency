
Simon's Supply Drop Package Script - ReadMe.txt
I took inspiration from[EVO] Dan & [EVO] Curry's script, however this script has been written from scratch.
This system utilizes several functions and supports JIP and respawning on persistant servers.
There are specific locations that you will need to have files placed in order for theis script package to function properly.
Failing to place the appropriate files/folders and commands in the appropriate locations will cause failure of this system.


Place the following in your init.sqf:

if (!isDedicated && hasInterface) then {execVM "supplyDrop\sdInit.sqf";};


