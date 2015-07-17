/***************SETTINGS***********************/
if (DebugEnabled > 0) then
{
	EPD_IED_debug = true;
}
else
{
	EPD_IED_debug = false;
};
//EPD_IED_debug = true;

hideIedMarker = true;  //sets the alpha to 0 after spawning IEDs there

itemsRequiredToDisarm = ["ToolKit"];   //"MineDetector" or "ToolKit" for example
betterDisarmers = ["B_soldier_exp_F", "B_engineer_F", "B_diver_exp_F", "B_recon_exp_F"]; // people who are better at disarming

baseDisarmChance = 75; //how well everybody can disarm
bonusDisarmChance = 20; //increase that the "betterDisarmers" get

secondaryChance = 50; //Chance that a secondary IED will spawn.

smallChance = 40; //Chance that a small IED will be chosen.
mediumChance = 40; //Chance that a medium IED will be chosen.
largeChance = 20; //Chance that a medium IED will be chosen.

iedSecondaryItems = ["Land_CanisterOil_F","Land_FMradio_F","Land_Canteen_F","Land_CerealsBox_F","Land_BottlePlastic_V1_F","Land_HandyCam_F","Land_PowderedMilk_F","Land_RiceBox_F","Land_TacticalBacon_F","Land_VitaminBottle_F","Land_BottlePlastic_V2_F"];

iedSmallItems = ["RoadCone_F","Land_Pallets_F","Land_WheelCart_F","Land_Tyre_F","Land_ButaneCanister_F","Land_GasCanister_F","Land_Pillow_F"];

iedMediumItems = ["Land_Portable_generator_F","Land_WoodenBox_F","Land_MetalBarrel_F","Land_BarrelTrash_grey_F","Land_Sacks_heap_F","Land_WoodenLog_F","Land_WoodPile_F","C_Kart_01_F","C_Quadbike_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F"];

iedLargeItems = ["Land_Bricks_V2_F","Land_GarbageBags_F","Land_GarbagePallet_F","Land_JunkPile_F","Land_Tyres_F","RHS_UAZ_chdkz","rhs_uaz_open_chdkz","C_SUV_01_F","Land_Wreck_Offroad_F","Land_Wreck_Offroad2_F","C_Van_01_transport_F","B_G_Offroad_01_armed_F","C_Hatchback_01_F","C_Hatchback_01_sport_F"];

//If you want to use locations without making markers on the map, define them here. Altis has been provided as an example. ***THESE ARE NOT WHERE THE ACTUAL IEDS ARE SPAWNED***
//["Name",[LocationX,LocationY,LocationZ],size]
predefinedLocations = [];

/***************EXPERIMENTAL***********************/
// This is still being worked on and may contain bugs, please report them on the forums.
allowExplosiveToTriggerIEDs = true;

/***************END EXPERIMENTAL*******************/


//These are the actual IEDs that will spawn. Add them using one of the following formats.
//mapLocations must have their type defined as one of "NameCityCapital","NameCity","NameVillage", "NameLocal"
//["All", side]
//["AllCities", side]
//["AllVillages", side]
//["AllLocals", side]
//["mapLocation", side]
//["mapLocation", amountToPlace, side];
//["mapLocation", iedsToPlace, fakesToPlace, side]
//["predefinedLocation", side]
//["predefinedLocation", amountToPlace, side];
//["predefinedLocation", iedsToPlace, fakesToPlace, side]
/*********Marker size > 1**********************/
//["marker", iedsToPlace, fakesToPlace, side]
//["marker", amountToPlace, side]
//["marker", side]
/*********Marker size = 1**********************/
//["marker", side]
//["marker", chanceToBeReal, side]

//The side can be a single side, or an array of sides
//Ex. "West"   or ["West,"East"]
//http://community.bistudio.com/wiki/side

iedArray = [
	["Marker_GameZone", 50,100, "WEST"]
	];

//Place the mapLocations, predefinedLocations, and markerNames of places you don't want any IEDs spawning
safeZones = ["SafeZone"];