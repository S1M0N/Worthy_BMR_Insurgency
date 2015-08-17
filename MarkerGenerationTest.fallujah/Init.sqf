
//Mark New Launch In report file
diag_log "============================================================ Mission Restarted ============================================================";

enableSaving [false,false];
DEBUG = true;
publicVariable "DEBUG";
GlobalCacheArray = [];


//Enable Function Libary
execVM "Functions\FunctionPreProcessor.sqf";

waitUntil {missionNamespace getVariable "funcsProcessed";};

execVM "Scripts\MarkerGenerator.sqf";

if (!isDedicated) then
{
	waitUntil {!(isNull player)};
	[] execVM "initclient.sqf";
};

if (isServer || isDedicated) then
{

	if (isNil "ActiveZones") then
	{
		ActiveZones = [];	// ZoneID
		ActiveGroups = []; 	// [ZoneID, Group]
	};
	publicVariable "ActiveZones";
	publicVariable "ActiveGroups";

	execVM "setupCaches.sqf";
	execVM "spawnVeh.sqf";
	execVM "ServerMainLoop.sqf";
};
