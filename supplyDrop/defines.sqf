/*
Created by Simon Roth.

Simon's Supply Drop Package Script - defines.sqf
I took inspiration from[EVO] Dan & [EVO] Curry's script, however this script has been written from scratch.
This system utilizes several functions and supports JIP and respawning on persistant servers.

Please see the ReadMe.sqf file for more detials.


*/

jtacClasses = ["B_recon_TL_F","B_recon_JTAC_F","B_Soldier_SL_F","B_Soldier_TL_F","B_support_Mort_F","B_mas_mar_Soldier_JTAC_F_d","B_mas_mar_Soldier_JTAC_F_v","B_mas_mar_Soldier_TL_F_rec_d","B_mas_mar_Soldier_TL_F_rec_v","B_mas_mar_Soldier_F_rec_v","B_officer_F"];// can call in SupplyDrop

isJTAC = (typeOf player in jtacClasses);
publicVariable "isJTAC";