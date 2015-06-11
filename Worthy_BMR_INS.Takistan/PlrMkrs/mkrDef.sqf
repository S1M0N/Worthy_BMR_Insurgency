//Marker defines - Required for markers to display properly.

mkrSpawnPos = [0,0,0];


#define westPlrCls	["B_officer_F","B_Soldier_TL_F","B_recon_JTAC_F","B_recon_medic_F","B_Soldier_SL_F","B_soldier_AR_F","B_Soldier_A_F","B_Soldier_F","B_soldier_LAT_F","B_Soldier_GL_F","B_Soldier_GL_F","B_engineer_F","B_medic_F","B_recon_TL_F","B_recon_F","B_recon_LAT_F","B_recon_M_F","B_Recon_Sharpshooter_F"]

#define isWest	(typeOf player in westPlrCls)


#define westVehCls ["B_Quadbike_01_F","rhsusf_m1025_d_s_m2","rhsusf_m1025_d_s_Mk19","rhsusf_m998_d_s_4dr","rhsusf_m113d_usarmy","B_APC_Wheeled_01_cannon_F","B_G_Offroad_01_armed_F","rhsusf_M1083A1P2_B_M2_d_open_fmtv_usarmy","rhsusf_M1083A1P2_B_M2_d_fmtv_usarmy","B_APC_Tracked_01_CRV_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_Repair_F","B_Truck_01_medical_F","RHS_M6","B_APC_Tracked_01_AA_F","RHS_M2A2_BUSKI","RHS_M2A3_BUSKIII","B_Heli_Light_01_F","RHS_CH_47F","B_Heli_Transport_03_F","RHS_UH60M","RHS_UH1Y_UNARMED_d","RHS_AH64D_wd_AA","RHS_UH1Y_d","B_Heli_Light_01_armed_F"]

#define plrMedics ["medic1","medic2","medic3","medic4"]
#define pltGrp ["PL","PLS","PLJTAC"]
#define sqdOne ["SL1","worthy112","worthy113","worthy114","worthy115","worthy116","worthy117","worthy118"]
#define sqdTwo ["SL2","worthy122","worthy123","worthy124","worthy125","worthy126","worthy127","worthy128"]
#define sqdThree ["SL3","worthy132","worthy133","worthy134","worthy135","worthy136","worthy137","worthy138"]

#define westCars ["atv1","atv2","atv3","atv4","atv5","atv6","atv7","hmv1","hmv2","hmv3","hmv4","hmv5","hmv6","hmv7","hmv8","tech1","tech2","tech3","tech4","tech5"]
#define westTrk ["MHQ_1","MHQ_2","medTRK","rep1","rep2","fuel1","ammo1"]
#define westArmor ["apc1","apc2","apc3","apc4","apc5","apc6","apc7","amv1","amv2"]
#define westAAA ["aaa1","aaa2","aaa3","aaa4"]
#define westAir ["MHQ_3","heavyCH","mh61","mh62","mh63","mh64","bh1","bh2","uh1","uh2","uh3","ah1","ah61","ah62"]
#define westUAV ["dart1","dart2","dart3"]

#define westVehCls


#define westAirVeh (westAir + westUAV)
#define westMechVeh (westArmor + westAAA)
#define westGrndVeh (westCars + westTrk)
#define westVeh (westCars + westTrk + westArmor + westAAA + westAir + westUAV)
#define westPlrs (plrMedics + pltGrp + sqdOne + sqdTwo + sqdThree)




