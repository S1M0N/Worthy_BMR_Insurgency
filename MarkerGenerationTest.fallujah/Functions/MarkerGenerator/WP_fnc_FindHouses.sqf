
private ["_Return","_functionTitle","_buildings","_midPos","_enterables","_illegalHouses"];
_functionTitle= "WP_fnc_FunctionTemplate";
_Return = [];

try
{
	_buildings = nearestObjects [_this select 0, ["House"], _this select 1];
    _minPositions = (_this select 2) - 1;
    _illegalHouses = ["Land_Mil_hangar_EP1", "Land_Mil_ControlTower_EP1", "Land_Mil_Guardhouse_EP1", "Land_Mil_Repair_center_EP1","Land_Mil_Barracks_i_EP1","Land_A_Minaret_EP1","Land_Ind_Coltan_Main_EP1","Dum08"];
    _enterables = [];
    {
        if (format["%1", _x buildingPos _minPositions] != "[0,0,0]" && !(typeOf _x in _illegalHouses) && (alive _x) && (_x distance (getmarkerPos "exclude_location") > 1000 )) then
    	{
            _enterables set [count _enterables, _x];
    	};
    } forEach _buildings;
    _Return = _enterables;
}
catch
{
	//Error reporting and variable cleanup

	//Report Error
	diag_log format["Error in %1: - %2", _functionTitle , _exception];

	//Destroy Variables
	_functionTitle = nil;

	//Set Return to null
	_Return = objNull;
};
_Return