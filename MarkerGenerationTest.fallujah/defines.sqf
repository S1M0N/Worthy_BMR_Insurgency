/*
Master Defines file - Check each commented block for function that the Defines are for
*/

#define spawnPos [-2565.0364,6336.0854,14.531151]

//initclient.sqf
#define WestPlrCls ["B_Soldier_F"]
#define isWest (typeOf player in WestPlrCls)

//SR_fnc_aiDespawn & SR_fnc_aiSpawn & SR_fnc_findSquadAIName
#define arrCanSee(W,X,Y,Z) ([W,X,Y,Z] call SR_fnc_arrCanSee)
#define nearestPlayers(W,X,Y,Z)	([W,X,Y,Z] call SR_fnc_nearestPlayers)

//SR_fnc_aiMonitor
#define eastStationaryGuns ["RDS_ZU23_CSAT","O_HMG_01_high_F","O_static_AT_F","O_GMG_01_high_F"]

//SR_fnc_aiSpawn & SR_fnc_findSquadAIName
#define findSquadAIName(X) ([X,1] call SR_fnc_findSquadAIName)
#define SPAWNRANGE 500

//SR_fnc_arrCanSee & SR_fnc_findHousesFront
#define canSee(X,Y,Z) ([X,Y,Z] call SR_fnc_canSee)

//SR_fnc_canSee
#define getDirTo(X,Y) (((if(typeName Y == "OBJECT")then{getPosATL Y}else{Y} select 0) - (getPosATL X select 0)) atan2 ((if(typeName Y == "OBJECT")then{getPosATL Y}else{Y} select 1) - (getPosATL X select 1)))

//SR_fnc_fillHouseEast & SR_fnc_nearestEastMen
#define eastInfClasses ["O_medic_F","O_officer_F","O_Soldier_AA_F","O_Soldier_AR_F","O_Soldier_AT_F","O_soldier_exp_F","O_Soldier_F","O_Soldier_GL_F","O_Soldier_LAT_F","O_soldier_M_F","O_soldier_repair_F","O_Soldier_SL_F","O_Soldier_TL_F","O_Soldier_A_F"]
#define findSquadAIName(X) ([X,1] call SR_fnc_findSquadAIName)
#define exitCondition (findSquadAIName(player) == "" || !alive player)
#define nPos(X) ([X,0] call SR_fnc_countPositions)

//SR_fnc_findHousesFront
#define ILLEGALHOUSES		["land_nav_pier_c2_end", "Land_dum_olez_istan1", "Land_water_", "land_nav_pier_c", "Land_Nav_Boathouse_PierL", "Land_Nav_Boathouse_PierT", "Land_Nav_Boathouse_PierR", "Land_dum_olez_istan2", "Land_Shed_M03", "Land_dum_olez_istan2_maly", "Land_Shed_M01", "Land_hut06", "Land_Ind_SawMillPen", "land_nav_pier_c2", "Land_A_Crane_02a", "Land_vez", "Land_Ind_Expedice_1", "Land_Misc_Cargo1G", "Land_Ind_Stack_Big", "land_nav_pier_c_t15", "land_nav_pier_c_big", "Land_IndPipe2_big_18", "Land_Ind_Expedice_1", "Land_Ind_Expedice_3", "Land_IndPipe2_big_9","land_nav_pier_m_end", "land_nav_pier_m", "Land_Mil_hangar_EP1", "Land_Mil_ControlTower_EP1", "Land_Mil_Guardhouse_EP1", "Land_Mil_Repair_center_EP1","Land_Mil_Barracks_i_EP1","Land_A_Minaret_EP1","Land_Ind_Coltan_Main_EP1"]

#define EP1HOUSES true

//SR_fnc_findSquadAIName
#define maxAIPerPlayer 4
#define eastPlayerStrings   ["east1","east2","east3","east4"]

//SR_fnc_nearestPlayers
#define westPlrStr ["tester", "theOtherTester"]

//SR_fnc_spawnAIVehicle & AI\spawnAI.sqf
#define eastVehiclesFreq	["rhs_sprut_vdv","rhs_bmp1p_msv","rhs_brm1k_msv","rhs_bmp2_msv","rhs_bmp2e_msv","rhs_bmp2d_msv","rhs_bmp2k_msv","rhs_prp3_msv","rhs_bmd4_vdv","rhs_bmd4ma_vdv","rhs_t80u","rhs_t80bv","rhs_t80a","rhs_t72bc_tv","rhs_t72bb_tv","rhs_zsu234_aa"]
#define eastLightVehicles	["O_MRAP_02_gmg_F","O_MRAP_02_hmg_F"]
#define vclCrewClass		"rhs_msv_crew"
#define eastRanks			["CAPTAIN","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE"]


#define CACHEHOUSEPOSITIONS ["Land_House_K_1_EP1",[1,2,3,4],"Land_House_L_4_EP1",[6],"Land_House_C_5_V3_EP1",[0,2,6],"Land_House_C_12_EP1",[5,6],"Land_House_K_3_EP1",[9,1,2,3,5],"Land_House_C_5_V2_EP1",[4,0,1,5],"Land_House_L_8_EP1",[7,8],"Land_House_C_4_EP1",[7,12,13,15],"Land_House_C_2_EP1",[1,2,5,6,7,8,9],"Land_House_L_7_EP1",[0,1,2,3,4,5],"Land_House_C_10_EP1",[7,8,9,10,11,12,13,14],"Land_House_K_6_EP1",[6,7,8,9,10],"Land_House_C_11_EP1",[7,8,9,10],"Land_House_C_9_EP1",[2,3,4,5],"Land_House_C_3_EP1",[7,8,9,10,11,12,13,28,29,30,31,32],"Land_A_Office01_EP1",[5,6],"Land_A_Mosque_small_1_EP1",[3,4,5],"Land_A_Stationhouse_ep1",[6,9,13],"Land_House_C_5_EP1",[3,4,5],"Land_House_K_7_EP1",[4,5,6,11],"Land_Mil_ControlTower_EP1",[2,3,4,6],"Land_House_C_5_V1_EP1",[6,7],"Land_House_K_8_EP1",[4,0,1,2,3],"Land_A_BuildingWIP_EP1",[18,20,24,25,26,27,28,29,30,31],"Land_A_Villa_EP1",[4,6,7,8,9],"Land_House_L_6_EP1",[4,0,3],"Land_House_L_3_EP1",[0,1,2],"Land_House_K_5_EP1",[1,2],"Land_House_C_1_v2_EP1",[0,1,2,3],"Land_Farm_Cowshed_a",[0,1,2,3,4,5,6,7,8,9],"Land_dum_istan3_hromada2",[1,0],"Land_Ind_SawMillPen",[1,3],"Land_Misc_deerstand",[1,2,3],"land_army_hut_int",[0,1,2,4,5],"Land_army_hut_storrage",[0,1,2],"Land_Tovarna2",[22,23,25,28,29,33,34,36],"Land_Hlidac_budka",[1,2,3,4],"Land_House_L_1_EP1",[1,2],"Land_dum_istan3_pumpa",[1],"Land_MBG_Police_Station",[3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31],"Land_sara_Domek_sedy",[0,1,2,3,4,5,6,7,8,9],"Land_Ind_Workshop01_L",[1,2],"Land_dum_mesto_in",[0,1,2,3,4,5,6,7,8],"Land_Shed_Ind02",[3,4,5,6,7,8,9,10,11,12,13,14,15,16,17],"Land_majak2",[1],"Land_stodola_old_open",[5,8,9,10,11,15,20,21,22],"land_hut02",[1,2],"land_hut01",[1,2],"land_hut04",[3,5,6],"Land_Mil_Barracks_i",[1,2,3,4,5,6,7,8],"Land_Panelak2",[0,4],"Land_afbarabizna",[1,17],"Land_tovarna1",[11,23],"Land_Hangar_2",[0,1,2,3,4,5,6,7],"Land_Ind_Workshop01_04",[0,1,2],"Land_A_Crane_02a",[0,1],"Land_A_Crane_02b",[2],"Land_A_GeneralStore_01a",[0,1,2,3,4,5,6,7,9,10,12],"Land_Panelak",[1,3,4,5,7,8,10,11,12,13,14,15,16,17],"Land_A_BuildingWIP",[18,20,24,25,26,27,28,29,30,31],"Land_fortified_nest_small",[1,2],"Land_Mil_ControlTower",[2,3,4,6],"Land_Ind_Vysypka",[1,2,3,4,6,10],"Land_fortified_nest_big",[1,2,3,4,5,6,7,8,9,10,11,12],"Land_vez",[0]]
