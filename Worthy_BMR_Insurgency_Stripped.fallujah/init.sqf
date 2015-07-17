//if ([] call BIS_fnc_didJIP) then {isJIP=true;} else {isJIP=false;};
if (!isServer && isNull player) then {isJIP=true;} else {isJIP=false;};
publicVariable "isJIP";

// Set friendly/enemy sides
_EastHQ = createCenter EAST;
_WestHQ = createCenter WEST;
_IndHQ = createCenter RESISTANCE;
EAST setFriend [WEST, 0];
WEST setFriend [EAST, 0];
RESISTANCE setFriend [WEST, 0];
RESISTANCE setFriend [EAST, 1];
EAST setFriend [RESISTANCE, 1];
WEST setFriend [RESISTANCE, 0];

enableSaving [false, false];

// Common Functions
call compile preprocessFile "INS_definitions.sqf";
call compile preProcessFileLineNumbers "INSfncs\commom_fncs.sqf";
call compile preprocessFileLineNumbers "supplydrop\svr_fncs.sqf";
[] spawn {call compile preprocessFileLineNumbers "EPD\Ied_Init.sqf";};


// EOS
switch (INS_op_faction) do
{
	case 1 : // CSAT (no mods)
	{
		[EAST,0,0]execVM "eos\OpenMe.sqf";
	};
	case 2 : // AAF (no mods)
	{
		[RESISTANCE,2,2]execVM "eos\OpenMe.sqf";
	};
	case 3 : // African Conflict with NATO SF and Russian Spetsnaz Weapons (@african_conflict;@nato_russian_sf_weapons)
	{
		if ((isClass(configFile >> "cfgPatches" >> "mas_afr_rebl_o")) &&
		{isClass(configFile >> "cfgPatches" >> "mas_weapons")}) then
		{
			activateAddons ["mas_afr_rebl_o","mas_weapons"];
			[EAST,3,4]execVM "eos\OpenMe.sqf";
		};
	};
	case 4 : // CAF Aggressors (@CAF_AG1.5).
	{
		if (isClass(configFile >> "cfgPatches" >> "caf_ag_faction_me_t")) then
		{
			activateAddons ["caf_ag_faction_me_t","caf_ag_faction_afr_p","caf_ag_faction_eeur_r","caf_ag_faction_me_civ","caf_ag_faction_afr_civ"];
			[EAST,11,13]execVM "eos\OpenMe.sqf";
		};
	};
	case 5 : // Syrian Army and QUD forces with CUP Weapons (@mec;@cup;@asdg_jr;@rds;@rds_tank;@cha_mi24)
	{
		if ((isClass(configFile >> "cfgPatches" >> "mec_core")) &&
		{(isClass(configFile >> "cfgPatches" >> "cup_weapons_weaponscore")) &&
		(isClass(configFile >> "cfgPatches" >> "asdg_jointrails")) &&
		(isClass(configFile >> "cfgPatches" >> "rds_staticweapons_core")) &&
		(isClass(configFile >> "cfgPatches" >> "rds_tanks")) &&
		(isClass(configFile >> "cfgPatches" >> "cha_mi24"))}) then
		{
			activateAddons ["mec_saa","mec_saa_tanks","mec_saa_staticweapons","mec_qudsforce","mec_irregulars","mec_irr_tanks","mec_irr_staticweapons_o","mec_irr_staticweapons","mec_civilians","cup_creatures_peaople_military_dummyset","mec_gme_tanks"];
			[EAST,5,6]execVM "eos\OpenMe.sqf";
		};
	};
	case 6 : // Syrian Army and Middle Eastern Irregulars (Al Qaida) with CUP Weapons (@mec;@cup;@asdg_jr;@rds;@rds_tank;@cha_mi24)
	{
		if ((isClass(configFile >> "cfgPatches" >> "mec_core")) &&
		{(isClass(configFile >> "cfgPatches" >> "cup_weapons_weaponscore")) &&
		(isClass(configFile >> "cfgPatches" >> "asdg_jointrails")) &&
		(isClass(configFile >> "cfgPatches" >> "rds_staticweapons_core")) &&
		(isClass(configFile >> "cfgPatches" >> "rds_tanks")) &&
		(isClass(configFile >> "cfgPatches" >> "cha_mi24"))}) then
		{
			activateAddons ["mec_saa","mec_saa_tanks","mec_saa_staticweapons","mec_qudsforce","mec_irregulars","mec_irr_tanks","mec_irr_staticweapons_o","mec_irr_staticweapons","mec_civilians","cup_creatures_peaople_military_dummyset","mec_gme_tanks"];
			[EAST,5,7]execVM "eos\OpenMe.sqf";
		};
	};
	case 7 : // Taliban and Islamic State with CUP Weapons (@mec;@cup;@asdg_jr;@rds;@rds_tank;@cha_mi24)
	{
		if ((isClass(configFile >> "cfgPatches" >> "mec_core")) &&
		{(isClass(configFile >> "cfgPatches" >> "cup_weapons_weaponscore")) &&
		(isClass(configFile >> "cfgPatches" >> "asdg_jointrails")) &&
		(isClass(configFile >> "cfgPatches" >> "rds_staticweapons_core")) &&
		(isClass(configFile >> "cfgPatches" >> "rds_tanks")) &&
		(isClass(configFile >> "cfgPatches" >> "cha_mi24"))}) then
		{
			activateAddons ["mec_saa","mec_saa_tanks","mec_saa_staticweapons","mec_taliban","mec_tal_tanks","mec_taliban_staticweapons","mec_is","mec_is_tanks","mec_is_staticweapons","mec_qudsforce","mec_irregulars","mec_civilians","cup_creatures_peaople_military_dummyset","asdg_jointrails"];
			[RESISTANCE,8,9]execVM "eos\OpenMe.sqf";
		};
	};
	case 8 : // Sud Russians East Vs. West (@evw;@rds).
	{
		if ((isClass(configFile >> "cfgPatches" >> "sud_gw_v")) &&
		{(isClass(configFile >> "cfgPatches" >> "rds_staticweapons_core"))}) then
		{
			activateAddons ["sud_gw_v","sud_gw_u","sud_a10","sud_mi24","rds_staticweapons_core"];
			[EAST,10,10]execVM "eos\OpenMe.sqf";
		};
	};
	case 9 : // RHS - Armed Forces of the Russian Federation (@rhs_afrf3)
	{
		if (isClass(configFile >> "cfgPatches" >> "rhs_c_troops")) then
		{
			activateAddons ["rhs_c_troops","rhs_c_btr","rhs_c_bmp","rhs_c_tanks","rhs_c_a2port_armor","RHS_A2_CarsImport","RHS_A2_AirImport"];
			[EAST,14,14]execVM "eos\OpenMe.sqf";

			// (optional/not required) United States Armed Forces (@rhs_usf3)
			// Due to RHS's vehicle sorting systems, they don't show up in vehicle rewards.
			if (isClass(configFile >> "cfgPatches" >> "rhsusf_main")) then
			{
				activateAddons ["rhsusf_main","rhsusf_c_troops","RHS_US_A2Port_Armor","rhsusf_vehicles","rhs_c_a2port_car","RHS_US_A2_AirImport","rhsusf_c_hmmwv","rhsusf_c_m113","rhsusf_c_m109"];
			};
		};
	};
};
if (CiviFoot isEqualTo 1) then {[]execVM "eos_civ\OpenMeCiv.sqf";};// Civilians


// Common Scripts
execVM "Objectives\shk_taskmaster.sqf";
if (JigHeliExtraction isEqualTo 1) then {null = [] execVM "JIG_EX\extraction_init.sqf";};
if (CiviMobiles isEqualTo 1) then {[2, 400, 500] execVM "scripts\MAD_traffic.sqf";};
if (max_ai_recruits > 1) then {[] execVM "bon_recruit_units\init.sqf";};
//execVM "scripts\zlt_fastrope.sqf";
execVM "JWC_CASFS\initCAS.sqf";
nul = ["mission"] execVM "hcam_init.sqf";

sr_SDRunning = false;
publicVariable "sr_SDRunning";
sr_sdActionAdded = false;
publicVariable "sr_sdActionAdded";

if ((DebugEnabled isEqualTo 1) && (tky_perfmon > 0)) then {
	if (AI_SpawnDis > 1000) then {
		[AI_SpawnDis,9,true,1800]execvm "zbe_cache\main.sqf";
	}else{
		[1000,9,true,1500]execvm "zbe_cache\main.sqf";
	};
}else{
	if (AI_SpawnDis < 1000) then {
		[1000,10,false,1500]execvm "zbe_cache\main.sqf";
	}else{
		[AI_SpawnDis,10,false,1500]execvm "zbe_cache\main.sqf";
	};
};

// Init Join in Progress
if (isJIP) then {[] spawn {[] execVM "scripts\JIPactions.sqf";};};

// Init Server
if (isServer) then
{
	call compile preprocessFile "init_server.sqf";
	call compile preprocessFileLineNumbers "INSfncs\AirPatrole_Fncs.sqf";
	rej_fnc_bezier = compile preProcessFileLineNumbers "INSfncs\rej_fnc_bezier.sqf";
};

// Init Player
if (!isDedicated && hasInterface) then
{
	[] spawn {
		#include "add_diary.sqf"
		waitUntil {!isNull player && player == player};
		//if (DebugEnabled isEqualTo 0) then {["BIS_ScreenSetup", false] call BIS_fnc_blackOut;};
		call compile preprocessFile "INSfncs\client_fncs.sqf";
		player sideChat "Loading...";
		player sideChat "Press U key for Graphic Settings, Digital Heading and HUD";
		player sideChat "Initialization Complete";

		if (!isServer) then

		{
			["BIS_introPreload", "onPreloadFinished", {
				// Remove event handler
				["BIS_introPreload", "onPreloadFinished"] call BIS_fnc_removeStackedEventHandler;

				// Flag
				missionNamespace setVariable ["BIS_readyForIntro", true];
			}] call BIS_fnc_addStackedEventHandler;

			waitUntil {
				!isNil { missionNamespace getVariable "BIS_readyForIntro" };
			};
		};

		call compile preprocessFile "init_player.sqf";
		[] call compile preprocessFile "UI\HUD.sqf";
		//0 = [] execVM 'scripts\group_manager.sqf';
		//0 = [] execVM 'scripts\player_markers.sqf';
		[] spawn { player execVM "PlrMkrs\mkrInit.sqf"; };
	};
};