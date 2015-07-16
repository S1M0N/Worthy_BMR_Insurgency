// ACRE Radio Crate for Arma 3


_marker = "acrecrate";
_boxType = "Land_PlasticCase_01_large_F";

_items = [];

// Lets set some variables -

private ["_radio1","_radio2","_radio3","_radio4"];

_unit = player;


//ACRE Radios
_radio1 = "ACRE_PRC343";
_radio2 = "ACRE_PRC148";
_radio3 = "ACRE_PRC152";
_radio4 = "ACRE_PRC117F";



//Item Counts
_startitems =
[
    ["ACRE_PRC343", 10],
    ["ACRE_PRC148", 10],
    ["ACRE_PRC152", 10],
    ["ACRE_PRC117F", 10]

];



_box = _boxType createVehicleLocal (getMarkerPos _marker);
_box allowDamage false;
//_box enablesimulation false;
_box setPos (getMarkerPos _marker);
_box setDir 315;

while {true} do {
    waitUntil {alive player};

    clearItemCargo _box;
    clearWeaponCargo _box;
    clearMagazineCargo _box;
    clearBackpackCargo _box;

    {_box addItemCargo [(_x select 0),(_x select 1)]} foreach _startitems;

    waitUntil {!alive player};
};