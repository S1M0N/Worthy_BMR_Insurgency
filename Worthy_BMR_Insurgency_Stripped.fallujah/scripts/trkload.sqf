// Multi Load-out script for Vehicles.
// Made for the 15th MEU(SOC) by Oliver.
// Activate from trigger provided in example mission.

//  _truk addMagazineCargoGlobal["ACE_TOW_CSWDM",5]; // Used for adding Tow magazine, if needed by unit in the future.

private ["_loader","_loadouttype","_truk","_truk_type"];

_loader = _this select 0;

if (vehicle _loader == player) exitWith{hint "Your not in a Vehicle!";};

_loadouttype = _this select 3;

_truk = vehicle _loader;

_truk_type = typeof _truk;


// Fire Team Loadout
If (_loadouttype == 1) then
{
    _truk vehicleChat format ["Loading Gear %1... Please Wait...", _truk_type];
    sleep 3;
    clearWeaponCargoGlobal _truk;
    clearMagazineCargoGlobal _truk;
    clearItemCargoGlobal _truk;
    clearBackpackCargoGlobal _truk;

    sleep 3;

    _truk addWeaponCargoGlobal["rhs_weap_m4a1_carryhandle_pmag",5];
    _truk addWeaponCargoGlobal["rhs_weap_M136",5];
    _truk addWeaponCargoGlobal["rhs_weap_M136_hedp",5];

    _truk addMagazineCargoGlobal["HandGrenade",10];
    _truk addMagazineCargoGlobal["smokeshell",10];
    _truk addMagazineCargoGlobal["smokeshellgreen",10];

    _truk addMagazineCargoGlobal["ACE_30Rnd_556x45_Stanag_M995_AP_mag",20];
    _truk addMagazineCargoGlobal["ACE_30Rnd_556x45_Stanag_Mk262_mag",20];
    _truk addMagazineCargoGlobal["ACE_30Rnd_556x45_Stanag_Mk318_mag",20];
    _truk addMagazineCargoGlobal["ACE_30Rnd_556x45_Stanag_Tracer_Dim",20];

    _truk addMagazineCargoGlobal["rhs_mag_30Rnd_556x45_M855A1_Stanag",20];
    _truk addMagazineCargoGlobal["rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer",20];
    _truk addMagazineCargoGlobal["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",20];
    _truk addMagazineCargoGlobal["rhs_mag_30Rnd_556x45_Mk318_Stanag",20];

    _truk addMagazineCargoGlobal["rhs_mag_M441_HE",10];
    _truk addMagazineCargoGlobal["rhs_mag_M433_HEDP",10];
    _truk addMagazineCargoGlobal["3Rnd_HE_Grenade_shell",10];
    _truk addMagazineCargoGlobal["1Rnd_HE_Grenade_shell",10];
    _truk addMagazineCargoGlobal["1Rnd_Smoke_Grenade_shell",10];
    _truk addMagazineCargoGlobal["3Rnd_Smoke_Grenade_shell",10];

    _truk addItemCargoGlobal["ACE_Morphine",20];
    _truk addItemCargoGlobal["ACE_Epinephrine",20];
    _truk addItemCargoGlobal["ACE_fieldDressing",40];
    _truk addItemCargoGlobal["ACE_bloodIV",10];
    _truk addItemCargoGlobal["MineDetector",2];
    _truk addItemCargoGlobal["ACE_wirecutter",2];
    _truk addItemCargoGlobal["Binocular",2];
    _truk addItemCargoGlobal["NVGoggles",2];
    _truk addItemCargoGlobal["ToolKit",5];

    _truk addBackpackCargoGlobal["rhsusf_assault_eagleaiii_ucp",5];
    _truk addBackpackCargoGlobal["rhsusf_assault_eagleaiii_ocp",5];

    _truk vehicleChat format ["Loading Complete %1..", _truk_type];

    hint "Gear Loaded";
};

// Mortar Team
If (_loadouttype == 2) then
{
    _truk vehicleChat format ["Loading Gear %1... Please Wait...", _truk_type];
    sleep 3;
    _truk addWeaponCargoGlobal["laserdesignator",1];
    _truk addMagazineCargoGlobal["30rnd_556x45_stanag",30];
    _truk addMagazineCargoGlobal["ACE_M224HE_CSWDM",100];
    _truk addMagazineCargoGlobal["ACE_M224WP_CSWDM",100];
    _truk addMagazineCargoGlobal["ACE_M224IL_CSWDM",100];
    _truk addMagazineCargoGlobal["smokeshell",6];
    _truk addMagazineCargoGlobal["smokeshellgreen",6];
    _truk addMagazineCargoGlobal["smokeshellred",6];
    _truk addMagazineCargoGlobal["ACE_Claymore_M",4];
    _truk addMagazineCargoGlobal["laserbatteries",1];
    _truk addMagazineCargoGlobal["ACE_Battery_Rangefinder",12];
    _truk addWeaponCargoGlobal["binocular",1];
    _truk addWeaponCargoGlobal["ACE_DAGR",1];
    _truk addWeaponCargoGlobal["ACE_Rangefinder_OD",1];
    _truk addWeaponCargoGlobal["ACE_WireCutter",1];
    _truk addMagazineCargoGlobal["ACE_Bandage",10];
    _truk addMagazineCargoGlobal["ACE_Morphine",5];
    _truk addMagazineCargoGlobal["ACE_Epinephrine",5];
    _truk addMagazineCargoGlobal["ACE_Medkit",5];
    _truk addWeaponCargoGlobal["ACE_MX2A",1];
    _truk addWeaponCargoGlobal["Laserdesignator",1];
    _truk addMagazineCargoGlobal["Laserbatteries",1];
    _truk addWeaponCargoGlobal["ace_arty_rangeTable_m224_legacy",2];
    _truk addWeaponCargoGlobal["ACE_M224TripodProxy",1];
    _truk addWeaponCargoGlobal["ACE_M224Proxy",1];
    _truk addWeaponCargoGlobal["ACE_Earplugs",5];

    _truk vehicleChat format ["Loading Complete %1..", _truk_type];

    hint "Mortar Team Gear Loaded";
};

// MG Team
If (_loadouttype == 3) then
{
    _truk vehicleChat format ["Loading Gear %1... Please Wait...", _truk_type];
    sleep 3;
    _truk addMagazineCargoGlobal["100Rnd_762x51_M240",10];
    _truk addMagazineCargoGlobal["smokeshell",5];
    _truk addMagazineCargoGlobal["smokeshellgreen",5];
    _truk addWeaponCargoGlobal["Mk_48",2];
    _truk addWeaponCargoGlobal["ACE_SpareBarrel",2];
    _truk addWeaponCargoGlobal["ACE_MX2A",1];
    _truk addMagazineCargoGlobal["Laserbatteries",1];
    _truk addWeaponCargoGlobal["ACE_Earplugs",5];

    _truk vehicleChat format ["Loading Complete %1..", _truk_type];

    hint "MG Team Gear Loaded";
};

// AntiArmor Team
If (_loadouttype == 4) then
{
    _truk vehicleChat format ["Loading Gear %1... Please Wait...", _truk_type];
    sleep 3;
    _truk addWeaponCargoGlobal["smaw",2];
    _truk addWeaponCargoGlobal["ACE_Javelin_CLU",2];
    _truk addWeaponCargoGlobal["ACE_Javelin_Direct",4];
    _truk addWeaponCargoGlobal["ACE_M136_CSRS",8];
    _truk addMagazineCargoGlobal["smaw_heaa",5];
    _truk addMagazineCargoGlobal["smaw_hedp",5];
    _truk addMagazineCargoGlobal["ACE_SMAW_NE",5];
    _truk addMagazineCargoGlobal["ACE_SMAW_Spotting",20];
    _truk addWeaponCargoGlobal["ACE_MX2A",1];
    _truk addWeaponCargoGlobal["Laserdesignator",1];
    _truk addMagazineCargoGlobal["Laserbatteries",1];
    _truk addWeaponCargoGlobal["ACE_Earplugs",5];

    _truk vehicleChat format ["Loading Complete %1..", _truk_type];

    hint "AntiArmor Team Gear Loaded";
};

// Medical Team
If (_loadouttype == 5) then
{
    _truk vehicleChat format ["Loading Gear %1... Please Wait...", _truk_type];
    sleep 3;
    _truk addMagazineCargoGlobal["smokeshell",10];
    _truk addMagazineCargoGlobal["smokeshellgreen",10];
    _truk addMagazineCargoGlobal["ACE_Morphine",20];
    _truk addMagazineCargoGlobal["ACE_Epinephrine",20];
    _truk addMagazineCargoGlobal["ACE_Medkit",25];
    _truk addMagazineCargoGlobal["ACE_LargeBandage",25];
    _truk addWeaponCargoGlobal["ACE_Earplugs",5];

    _truk vehicleChat format ["Loading Complete %1..", _truk_type];

    hint "Medical Team Gear Loaded";
};


// Radio Team
If (_loadouttype == 6) then
{
    _truk vehicleChat format ["Loading Gear %1... Please Wait...", _truk_type];
    sleep 3;
    _truk addWeaponCargoGlobal["ACRE_PRC117F",2];
    _truk addWeaponCargoGlobal["ACRE_PRC148",8];

    _truk vehicleChat format ["Loading Complete %1..", _truk_type];

    hint "Radio Team Gear Loaded";
};
_truk removeaction truckzid1;
//_truk removeaction truckzid2;
_truk removeaction truckzid3;
_truk removeaction truckzid4;
_truk removeaction truckzid5;
_truk removeaction truckzid6;
