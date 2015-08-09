
//Mark New Launch In report file
diag_log "============================================================ Mission Restarted ============================================================";

enableSaving [false,false];
DEBUG = true;

//Enable Function Libary
execVM "Functions\FunctionPreProcessor.sqf";

waitUntil {missionNamespace getVariable "funcsProcessed";};

execVM "Scripts\MarkerGenerator.sqf";

if (local player) then
{
	[] execVM "initclient.sqf";
};

if (isServer) then
{
	//[] execVM "AI\spawnAI.sqf";
	//call setupCaches;

	if (isNil "ActiveZones") then
	{
		ActiveZones = [];	// ZoneID
		ActiveGroups = []; 	// [ZoneID, Group]
	};
	publicVariable "ActiveZones";
	publicVariable "ActiveGroups";

	execVM "ServerMainLoop.sqf";

};
