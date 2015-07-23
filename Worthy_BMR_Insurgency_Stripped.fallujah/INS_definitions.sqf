// INS_definitions.sqf by Jigsor

// Params //////////////////////////////////////////////////////////
//Header No. 0
BTC_p_time      =		(paramsArray select 1);
JIPweather		=		(paramsArray select 2);
ambRadioChatter =		(paramsArray select 3);
ambCombSound	=		(paramsArray select 4);
Remove_grass_opt=		(paramsArray select 5);
INS_environment	=		(paramsArray select 6);
//Header No. 7
INS_op_faction	=		(paramsArray select 8);		// To be removed
//Header No. 9
InfPb			=		(paramsArray select 10);
MecArmPb		=		(paramsArray select 11);
AI_SpawnDis		=		(paramsArray select 12);
EnableEnemyAir	=		(paramsArray select 13);
AirRespawnDelay =		(paramsArray select 14);
PatroleWPmode	=		(paramsArray select 15);
//Header No. 16
BTC_p_skill     =		(paramsArray select 17);	// To be removed (ASR overrides this)
BTC_AI_skill    =		(paramsArray select 18)/10;	// To be removed (SAR overrides this)
//Header No. 19
CiviMobiles		=		(paramsArray select 20);
CiviFoot		=		(paramsArray select 21);
CivProbability	= 		(paramsArray select 22);
SuicideBombers	=		(paramsArray select 23);
//Header No. 24
Fatigue_ability =		(paramsArray select 25);
EOS_DAMAGE_MULTIPLIER =	(paramsArray select 26);
JigHeliExtraction =		(paramsArray select 27);	//To be removed
limitPOV		=		(paramsArray select 28);
max_ai_recruits	=		(paramsArray select 29);	//To be removed
//Header No. 30
EnemyAmmoCache	=		(paramsArray select 31);
Intel_Loc_Alpha =		(paramsArray select 32);
Intel_Count		=		(paramsArray select 33);
//Header No. 34
DebugEnabled	=		paramsArray select 35;	if (!isMultiplayer) then {DebugEnabled = 1;};
tky_perfmon		=		(paramsArray select 36);

if (JIPweather isEqualTo 1) then {[] execVM "scripts\real_weather.sqf"; skiptime ((BTC_p_time - (daytime) +24) % 24);};
if (JIPweather isEqualTo 2) then {[] execVM "scripts\randomWeather2.sqf"; skipTime (BTC_p_time -0.84);};

// Global Variables /////////////////////////////////////////////////
WestScore = 0;
EastScore = 0;
jig_tvt_globalsleep = 0.1;// Global sleep used after spawning a unit.
if (isNil "lck_markercnt") then {lck_markercnt=0;};// bardosy's HuntIR
if (isNil "timesup") then {timesup = false;};
Op4_mkrs = ["Respawn_East"];
Blu4_mkrs = ["Respawn_West","Helicopters","Mechanized","VehicleMaintenance","HelicopterRepair","HelicopterRepair2","AircraftMaintenance","Halo","Dock"];
INS_Op4_wepCrates = [INS_weps_Cbox,INS_ammo_Cbox,INS_nade_Cbox,INS_launchers_Cbox,INS_demo_Cbox,INS_sup_Cbox,INS_E_tent];
ghst_Build_objs = [];// all ammo cache objects array

// Client Variables /////////////////////////////////////////////////
if (!isServer) then
{
	if (isNil "PVEH_netSay3D") then {PVEH_NetSay3D = [objNull,0];};
	ebox = ObjNull;
	epad = ObjNull;
};

// Server Variables /////////////////////////////////////////////////
if (isServer) then {
	//server GetVariable "eosMarkers";
	//server GetVariable "eosMarkersCiv";
	switch (true) do {

		case (toLower (worldName) isEqualTo "fallujah"):
		{
			Airfield_opt = true;publicVariable "Airfield_opt";
			Rand_AirCntr_OFstMax = 2000;publicVariable "Rand_AirCntr_OfstMax";
			Del_box_Pos = [5705.8,9883.6,0.00143862];publicVariable "Del_box_Pos";
			all_eos_mkrs = [(missionNamespace getVariable "MarkerArray")];publicVariable "all_eos_mkrs";
		};
	};
	//intel_objCount = (round((count all_eos_mkrs)/Intel_Count));publicVariable "intel_objCount";//total max suitcases per ammo cache
	side_mission_mkrs = ["sidemiss1","sidemiss2","sidemiss3","sidemiss4","sidemiss5","sidemiss6","sidemiss7","sidemiss8","sidemiss9","sidemiss10","sidemiss11","sidemiss12","sidemiss13","sidemiss14","sidemiss15"];publicVariable "side_mission_mkrs";// all objective markers
	objective_objs = ["Land_TTowerBig_1_F","Land_BagBunker_Tower_F","Land_UWreck_MV22_F","Land_HighVoltageTower_F","APERSBoundingMine","O_APC_Tracked_02_AA_F","RoadCone_F","RoadCone_F","Land_Sign_WarningUnexplodedAmmo_F","Land_Cargo_HQ_V3_F"];publicVariable "objective_objs";// objective/mission objects (do not change array index order!)
	objective_list = ["comms_tower","kill_leader","rescue_pilot","cut_power","mine_field","destroy_convoy","destroy_armed_convoy","destroy_mortar_squad","c_n_h"];publicVariable "objective_list";// all objectives (do not change array index order!)
	objective_ruins = ["Land_TTowerBig_1_ruins_F","Land_TTowerBig_2_ruins_F","Land_Cargo40_color_V3_ruins_F","Land_HighVoltageTower_dam_F","Land_Cargo_HQ_V3_ruins_F"];publicVariable "objective_ruins";// Objective/mission ruins models
	all_intel_mkrs = [];publicVariable "all_intel_mkrs";
	intel_objArray = [];publicVariable "intel_objArray";
	PVEH_NetSay3D = [objNull,0];publicVariable "PVEH_NetSay3D";
	BTC_to_server = [];publicVariable "BTC_to_server";
	suicide_bmbr_weps = ["ModuleExplosive_SatchelCharge_F"];
	cache_types = ["Box_East_Ammo_F","Box_IND_Ammo_F","Box_FIA_Ammo_F","Land_Pallet_MilBoxes_F"];
	INS_log_blacklist = [INS_Wep_box,INS_flag,INS_nade_Nbox,INS_ammo_Nbox,INS_weps_Nbox,INS_launchers_Nbox,INS_sup_Nbox,INS_weps_Cbox,INS_ammo_Cbox,INS_nade_Cbox,INS_launchers_Cbox,INS_demo_Cbox,INS_sup_Cbox];//Logistics object names blacklist //Delivery_Box,
};

// Class Arrays /////////////////////////////////////////////////////
// Csat
if (INS_op_faction isEqualTo 1) then
{
	INS_Op4_side = EAST;
	INS_men_list = ["O_SoldierU_SL_F","O_soldierU_repair_F","O_soldierU_medic_F","O_sniper_F","O_Soldier_A_F","O_Soldier_AA_F","O_Soldier_AAA_F","O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_AR_F","O_Soldier_AT_F","O_soldier_exp_F","O_Soldier_F","O_engineer_F","O_engineer_U_F","O_medic_F","O_recon_exp_F","O_recon_F","O_recon_JTAC_F","O_recon_LAT_F","O_recon_M_F","O_recon_medic_F","O_recon_TL_F"];
	INS_Op4_medic = "O_soldierU_medic_F";
	INS_Op4_Eng = "O_soldierU_repair_F";
	INS_Op4_pilot = ["O_helipilot_F"];
	INS_Op4_Veh_Light = ["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_APC_Wheeled_02_rcws_F"];
	INS_Op4_Veh_Tracked = ["O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F"];
	INS_Op4_Veh_Support = ["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_box_F","O_Truck_02_medical_F"];
	INS_Op4_Veh_AA = ["O_APC_Tracked_02_AA_F"];
	INS_Op4_stat_weps = ["O_GMG_01_high_F","O_HMG_01_high_F","O_static_AT_F","O_static_AA_F","O_HMG_01_A_F","O_GMG_01_F","O_G_Mortar_01_F"];//A3 East static weapons
	INS_civlist = ["C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F"];// A3 Civilians
	//INS_civClothes = ["U_Competitor","U_C_HunterBody_grn","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poor_1","U_C_Poor_2","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2","U_NikosBody","U_Rangemaster"];// A3 Civilian Clothes
};

// AAF
if (INS_op_faction isEqualTo 2) then
{
	INS_Op4_side = RESISTANCE;
	INS_men_list = ["I_soldier_F","I_Soldier_lite_F","I_soldier_AT_F","I_soldier_GL_F","I_soldier_LAT_F","I_soldier_exp_F","I_soldier_F","I_soldier_AR_F","I_soldier_repair_F","I_soldier_LAT_F","I_soldier_AR_F","I_soldier_M_F","I_soldier_AT_F","I_soldier_AA_F","I_soldier_F","I_soldier_TL_F","I_medic_F","I_soldier_GL_F","I_soldier_F"];
	INS_Op4_medic = "I_medic_F";
	INS_Op4_Eng = "I_soldier_repair_F";
	INS_Op4_pilot = ["I_pilot_F"];
	INS_Op4_Veh_Light = ["I_G_Offroad_01_armed_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_APC_Wheeled_03_cannon_F"];
	INS_Op4_Veh_Tracked = ["I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F"];
	INS_Op4_Veh_Support = ["I_Truck_02_ammo_F","I_Truck_02_fuel_F","I_Truck_02_box_F","I_Truck_02_medical_F"];
	INS_Op4_Veh_AA = ["O_APC_Tracked_02_AA_F"];
	INS_Op4_stat_weps = ["O_GMG_01_high_F","O_HMG_01_high_F","O_static_AT_F","O_static_AA_F","O_HMG_01_A_F","O_GMG_01_F","O_G_Mortar_01_F"];//A3 East static weapons
	INS_civlist = ["C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F"];// A3 Civilians
	//INS_civClothes = ["U_Competitor","U_C_HunterBody_grn","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poor_1","U_C_Poor_2","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2","U_NikosBody","U_Rangemaster"];// A3 Civilian Clothes
};

// REBEL ARMY UNITS and RUSSIAN SPETSNAZ ADVISORS (masi EAST)
if (INS_op_faction isEqualTo 3) then
{
	INS_Op4_side = EAST;
	INS_men_list = ["O_mas_afr_Soldier_F","O_mas_afr_Soldier_GL_F","O_mas_afr_soldier_AR_F","O_mas_afr_soldier_MG_F","O_mas_afr_Soldier_lite_F","O_mas_afr_Soldier_off_F","O_mas_afr_Soldier_SL_F","O_mas_afr_soldier_M_F","O_mas_afr_soldier_LAT_F","O_mas_afr_soldier_LAA_F","O_mas_afr_medic_F","O_mas_afr_soldier_repair_F","O_mas_afr_soldier_exp_F","O_mas_afr_rusadv1_F","O_mas_afr_rusadv2_F","O_mas_afr_rusadv3_F"];
	INS_Op4_medic = "O_mas_afr_medic_F";
	INS_Op4_Eng = "O_mas_afr_soldier_repair_F";
	INS_Op4_pilot = ["O_helipilot_F"];
	INS_Op4_Veh_Light = ["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_APC_Wheeled_02_rcws_F"];
	INS_Op4_Veh_Tracked = ["O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F"];
	INS_Op4_Veh_AA = ["O_APC_Tracked_02_AA_F"];
	INS_Op4_Veh_Support = ["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_box_F","O_Truck_02_medical_F"];
	INS_Op4_stat_weps = ["O_GMG_01_high_F","O_HMG_01_high_F","O_static_AT_F","O_static_AA_F","O_HMG_01_A_F","O_GMG_01_F","O_G_Mortar_01_F"];//A3 East static weapons
	INS_civlist = ["C_mas_afr_1","C_mas_afr_2","C_mas_afr_3","C_mas_afr_4","C_mas_afr_5","C_mas_afr_6","C_mas_afr_7","C_mas_afr_8","C_mas_afr_9","C_mas_afr_10"];// Masi African Civilians
	//INS_civClothes = ["U_mas_afr_C_Civil1","U_mas_afr_C_Civil2","U_mas_afr_C_Civil3","U_mas_afr_C_Civil4","U_mas_afr_C_Civil5","U_mas_afr_C_Civil6","U_mas_afr_C_Civil7","U_mas_afr_C_Civil8","U_mas_afr_C_Civil9", "U_mas_afr_C_Civil10"];// Masi African Civilian Clothes
};

// CAF Aggressors Middle Eastern
if (INS_op_faction isEqualTo 4) then
{
	INS_Op4_side = EAST;
	INS_men_list = ["CAF_AG_ME_T_AK47","CAF_AG_ME_T_AK74","CAF_AG_ME_T_GL","CAF_AG_ME_T_PKM","CAF_AG_ME_T_RPG","CAF_AG_ME_T_RPK74","CAF_AG_ME_T_SVD"];
	INS_Op4_medic = "CAF_AG_ME_T_AK47";//placeholder
	INS_Op4_Eng = "CAF_AG_ME_T_AK47";//placeholder
	INS_Op4_pilot = ["O_helipilot_F"];
	INS_Op4_Veh_Light = ["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_APC_Wheeled_02_rcws_F"];
	INS_Op4_Veh_Tracked = ["O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F"];
	INS_Op4_Veh_Support = ["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_box_F","O_Truck_02_medical_F"];
	INS_Op4_Veh_AA = ["O_APC_Tracked_02_AA_F"];
	INS_Op4_stat_weps = ["O_GMG_01_high_F","O_HMG_01_high_F","O_static_AT_F","O_static_AA_F","O_HMG_01_A_F","O_GMG_01_F","O_G_Mortar_01_F"];//A3 East static weapons
	INS_civlist = ["CAF_AG_ME_CIV","CAF_AG_ME_CIV_02","CAF_AG_ME_CIV_03","CAF_AG_ME_CIV_04"];// CAF ME Civilians
	INS_civClothes = ["U_CAF_AG_ME_ROBES_01","U_CAF_AG_ME_ROBES_01a","U_CAF_AG_ME_ROBES_01b","U_CAF_AG_ME_ROBES_01c","U_CAF_AG_ME_ROBES_01d","U_CAF_AG_ME_ROBES_02","U_CAF_AG_ME_ROBES_02a","U_CAF_AG_ME_ROBES_02b","U_CAF_AG_ME_ROBES_02c","U_CAF_AG_ME_ROBES_02d","U_CAF_AG_ME_ROBES_03","U_CAF_AG_ME_ROBES_03a","U_CAF_AG_ME_ROBES_03b","U_CAF_AG_ME_ROBES_03c","U_CAF_AG_ME_ROBES_03d","U_CAF_AG_ME_ROBES_04","U_CAF_AG_ME_ROBES_04a","U_CAF_AG_ME_ROBES_04b","U_CAF_AG_ME_ROBES_04c","U_CAF_AG_ME_ROBES_04d","U_CAF_AG_ME_ROBES_mil_01","U_CAF_AG_ME_ROBES_mil_01a"];// CAF ME Civilian Clothes
	INS_civHeadgear = ["H_CAF_AG_TURBAN","H_CAF_AG_PAKTOL","H_CAF_AG_PAKTOL_01","H_CAF_AG_PAKTOL_02","H_CAF_AG_PAKTOL_03","H_CAF_AG_WRAP"];// CAF ME Civilian HeadGear
};

// Middle Eastern Conflict - SYRIAN ARAB ARMY
if ((INS_op_faction isEqualTo 5) || (INS_op_faction isEqualTo 6)) then
{
	INS_Op4_side = EAST;
	INS_men_list = ["MEC_SAA_Rifleman","MEC_SAA_SquadLeader","MEC_SAA_MachineGunner","MEC_SAA_AutomaticRifleman","MEC_SAA_Grenadier","MEC_SAA_ATSoldier","MEC_SAA_RPG7Soldier","MEC_SAA_AASoldier","MEC_SAA_Medic","MEC_SAA_Marksman","MEC_SAA_Crewman","MEC_SAA_RPG7Grenadier","MEC_SAA_Repair","MEC_SAA_Engineer","MEC_SAA_Explosives","MEC_SAA_Officer"];
	INS_Op4_medic = "MEC_SAA_Medic";
	INS_Op4_Eng = "MEC_SAA_Engineer";
	INS_Op4_pilot = ["MEC_SAA_Crewman"];
	INS_Op4_Veh_Light = ["MEC_SAA_Offroad_01","MEC_SAA_Offroad_01_armed","MEC_IRR_Offroad_01_armed_FO","MEC_IRR_Offroad_01s_armed_FO"];
	INS_Op4_Veh_Tracked = ["MEC_SAA_T72","MEC_SAA_BMP1","MEC_SAA_BMP2","MEC_SAA_T55"];
	INS_Op4_Veh_Support = ["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_box_F","O_Truck_02_medical_F"];
	INS_Op4_Veh_AA = ["MEC_SAA_ZSU23"];
	INS_Op4_stat_weps = ["MEC_SAA_ZU23","MEC_SAA_AGS","MEC_SAA_SPG9","MEC_SAA_DSHKM","MEC_SAA_DSHkM_Mini_TriPod","MEC_SAA_KORD","MEC_SAA_KORD_high","MEC_SAA_Metis","MEC_SAA_Igla_AA_pod","MEC_SAA_2b14_82mm","MEC_SAA_D30","MEC_SAA_D30_AT"];
	INS_civlist = ["MEC_CIV_Man"];
	//INS_civClothes = [];
};

// Middle Eastern Conflict - Taliban
if (INS_op_faction isEqualTo 7) then
{
	INS_Op4_side = RESISTANCE;
	INS_men_list = ["MEC_TAL_AASoldier","MEC_TAL_ATSoldier","MEC_TAL_AutomaticRifleman","MEC_TAL_Crewman","MEC_TAL_Engineer","MEC_TAL_Explosives","MEC_TAL_Grenadier","MEC_TAL_MachineGunner","MEC_TAL_Marksman","MEC_TAL_Medic","MEC_TAL_Repair","MEC_TAL_Rifleman","MEC_TAL_RPG7Grenadier","MEC_TAL_RPG7Soldier","MEC_TAL_SquadLeader"];
	INS_Op4_medic = "MEC_TAL_Medic";
	INS_Op4_Eng = "MEC_TAL_Engineer";
	INS_Op4_pilot = ["MEC_SAA_Pilot"];
	INS_Op4_Veh_Light = ["MEC_TAL_Offroad_01_armed_F","MEC_TAL_Offroad_01_F","MEC_TAL_Offroad_01s_armed_F","MEC_TAL_Offroad_01s_F"];
	INS_Op4_Veh_Tracked = ["MEC_SAA_T72","MEC_SAA_BMP1","MEC_SAA_BMP2","MEC_SAA_T55"];
	INS_Op4_Veh_Support = ["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_box_F","O_Truck_02_medical_F"];
	INS_Op4_Veh_AA = ["MEC_SAA_ZSU23"];
	INS_Op4_stat_weps = ["MEC_SAA_ZU23","MEC_SAA_AGS","MEC_SAA_SPG9","MEC_SAA_DSHKM","MEC_SAA_DSHkM_Mini_TriPod","MEC_SAA_KORD","MEC_SAA_KORD_high","MEC_SAA_Metis","MEC_SAA_Igla_AA_pod","MEC_SAA_2b14_82mm","MEC_SAA_D30","MEC_SAA_D30_AT"];
	INS_civlist = ["C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F"];// A3 Civilians
	//INS_civClothes = [];
};

// East vs West mod - SUD Russians
if (INS_op_faction isEqualTo 8) then
{
	INS_Op4_side = EAST;
	INS_men_list = ["SUD_USSR_Soldier_TL","SUD_USSR_Soldier_AR","SUD_USSR_Soldier_GL","SUD_USSR_Soldier_AT","SUD_USSR_Soldier_HAT","SUD_USSR_Soldier","SUD_USSR_Soldier_Medic","SUD_USSR_Soldier_Crew","SUD_USSR_Soldier_Specop","SUD_USSR_Soldier_AA","SUD_USSR_Soldier_Repair","SUD_USSR_Soldier_Sapper"];
	INS_Op4_medic = "SUD_USSR_Soldier_Medic";
	INS_Op4_Eng = "SUD_USSR_Soldier_Repair";
	INS_Op4_pilot = ["SUD_USSR_Soldier_Pilot"];
	INS_Op4_Veh_Light = ["SUD_UAZ","SUD_BRDM2","SUD_URAL","SUD_BTR60"];
	INS_Op4_Veh_Tracked = ["SUD_BMP2","SUD_T72B","SUD_ZSU"];
	INS_Op4_Veh_Support = ["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_box_F","O_Truck_02_medical_F"];
	INS_Op4_Veh_AA = ["SUD_ZSU"];
	INS_Op4_stat_weps = ["RDS_ZU23_CSAT","RDS_AGS_CSAT","RDS_SPG9_CSAT","RDS_DSHKM_CSAT","RDS_DSHkM_Mini_TriPod_CSAT","RDS_KORD_CSAT","RDS_KORD_high_CSAT","RDS_Metis_CSAT","RDS_Igla_AA_pod_CSAT","RDS_2b14_82mm_CSAT","RDS_D30_CSAT","RDS_D30_AT_CSAT"];
	INS_civlist = ["C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F"];// A3 Civilians
	//INS_civClothes = [];
};

// RHS - Armed Forces of the Russian Federation MSV
if (INS_op_faction isEqualTo 9) then
{
	INS_Op4_side = EAST;
	INS_men_list = ["rhs_msv_crew","rhs_msv_crew_commander","rhs_msv_armoredcrew","rhs_msv_combatcrew","rhs_msv_rifleman","rhs_msv_efreitor","rhs_msv_grenadier","rhs_msv_machinegunner","rhs_msv_machinegunner_assistant","rhs_msv_at","rhs_msv_strelok_rpg_assist","rhs_msv_marksman","rhs_msv_officer_armored","rhs_msv_officer","rhs_msv_junior_sergeant","rhs_msv_sergeant","rhs_msv_engineer","rhs_msv_driver_armored","rhs_msv_driver","rhs_msv_aa","rhs_msv_medic","rhs_msv_LAT"];
	INS_Op4_medic = "rhs_msv_medic";
	INS_Op4_Eng = "rhs_msv_engineer";
	INS_Op4_pilot = ["rhs_pilot"];
	INS_Op4_Veh_Light = ["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv"];
	INS_Op4_Veh_Tracked = ["rhs_sprut_vdv","rhs_bmp1p_msv","rhs_brm1k_msv","rhs_bmp2_msv","rhs_bmp2e_msv","rhs_bmp2d_msv","rhs_bmp2k_msv","rhs_prp3_msv","rhs_bmd4_vdv","rhs_bmd4ma_vdv","rhs_t80u","rhs_t80bv","rhs_t80a","rhs_t72bc_tv","rhs_t72bb_tv","rhs_zsu234_aa"];
	INS_Op4_Veh_Support = ["RHS_Ural_MSV_01","RHS_Ural_Fuel_MSV_01","RHS_Ural_VDV_01","rhs_typhoon_vdv","rhs_gaz66_repair_vdv","RHS_Ural_Open_MSV_01"];
	INS_Op4_Veh_AA = ["rhs_zsu234_aa"];
	INS_Op4_stat_weps = ["O_GMG_01_high_F","O_HMG_01_high_F","O_static_AT_F","O_static_AA_F","O_HMG_01_A_F","O_GMG_01_F","O_G_Mortar_01_F"];//A3 East static weapons
	INS_civlist = ["C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F"];// A3 Civilians
	//INS_civClothes = [];
};

// Air classes used by AirPatrolEast.sqf
INS_Op4_A3_fixedWing = ["RHS_Su25SM_KH29_vvsc"];
INS_Op4_A3_helis = 	["RHS_Mi24V_vvsc","RHS_Mi8AMTSh_UPK23_vvsc"];
INS_OP4_mod_fixedWing = ["JS_JC_SU35","IVORY_MIG29K_1","RHS_Su25SM_vvsc"];
INS_OP4_mod_helis = ["RHS_Mi24P_vvsc","RHS_Mi24V_vvsc"];

INS_lights = ["Lamps_Base_F","PowerLines_base_F","Land_PowerPoleWooden_F","Land_LampHarbour_F","Land_LampShabby_F","Land_PowerPoleWooden_L_F","Land_PowerPoleWooden_small_F","Land_LampDecor_F","Land_LampHalogen_F","Land_LampSolar_F","Land_LampStreet_small_F","Land_LampStreet_F","Land_LampAirport_F","Land_PowerPoleWooden_L_F"];

// Civilian Vehicles
MAD_civCarList = ["C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F","C_SUV_01_F"];
MAD_comCarList = ["C_Van_01_box_F","C_Van_01_transport_F","C_Van_01_fuel_F"];

// Blufor Side
INS_Blu_side = WEST;

// Player class types
INS_W_PlayerEng = ["B_engineer_F","B_soldier_repair_F","B_mas_mar_soldier_repair_F_v","B_mas_mar_soldier_repair_F_d","B_recon_exp_F"];// can build FARP
INS_W_PlayerJTAC = ["B_recon_TL_F","B_recon_JTAC_F","B_Soldier_SL_F","B_Soldier_TL_F","B_support_Mort_F","B_mas_mar_Soldier_JTAC_F_d","B_mas_mar_Soldier_JTAC_F_v","B_mas_mar_Soldier_TL_F_rec_d","B_mas_mar_Soldier_TL_F_rec_v","B_mas_mar_Soldier_F_rec_v","B_officer_F"];// can call in CAS
INS_W_PlayerMedic = ["B_medic_F","B_recon_medic_F","B_mas_mar_medic_F_v","B_mas_mar_medic_F_d","B_mas_mar_medic_F_rec_d","B_mas_mar_medic_F_rec_v","B_mas_mar_medic_F_rec_vn"];// can build sandbag
INS_W_PlayerEOD = ["B_engineer_F","B_soldier_repair_F","B_soldier_exp_F","B_mas_mar_soldier_exp_F_rec_d","B_mas_mar_soldier_exp_F_rec_dn","B_mas_mar_soldier_exp_F_d","B_mas_mar_soldier_repair_F_d","B_mas_mar_soldier_exp_F_rec_v","B_mas_mar_soldier_exp_F_v","B_recon_exp_F"];//can deactivate mines/IEDs and use mine detector script
INS_W_PlayerUAVop = ["B_soldier_UAV_F","B_mas_mar_Soldier_UAV_F_v","B_mas_mar_Soldier_UAV_F_d"];// can call in UGV air drop and use huntIR
INS_W_PlayerSniper = ["B_recon_M_F","B_spotter_F","B_sniper_F","B_soldier_M_F","B_mas_mar_soldier_Sg_F_v","B_mas_mar_soldier_Mhg_F_v","B_mas_mar_soldier_M_F_v","B_mas_mar_soldier_M_F_d","B_mas_mar_soldier_Mhg_F_d","B_mas_mar_soldier_Sg_F_d","B_mas_mar_soldier_M_F_rec_d","B_mas_mar_soldier_M_F_rec_v","B_Recon_Sharpshooter_F"];// can use bullet cam
INS_op4_players = "O_medic_F";// Opfor players "O_Soldier_F","O_medic_F","o_soldier_universal_f"
INS_all_medics = ["O_medic_F","B_medic_F","B_recon_medic_F","B_mas_mar_medic_F_v","B_mas_mar_medic_F_d","B_mas_mar_medic_F_rec_d","B_mas_mar_medic_F_rec_v","B_mas_mar_medic_F_rec_vn"];

// Blufor Repair Trucks/Tanks
INS_W_repairTruck = ["B_Truck_01_Repair_F","B_APC_Tracked_01_CRV_F"];

// Liftable object
BTC_fob_materials = ["Land_Cargo20_military_green_F"];// "Box_NATO_AmmoVeh_F" "Land_CargoBox_V1_F"