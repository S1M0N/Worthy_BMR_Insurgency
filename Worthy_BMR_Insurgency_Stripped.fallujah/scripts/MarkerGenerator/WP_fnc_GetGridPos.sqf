
private ["_Return","_functionTitle","_pos","_posX","_posY"];
_functionTitle= "WP_fnc_FunctionTemplate";
_Return = objNull;

try
{
	_pos = _this select 0;
	_posX = _pos select 0;
	_posY = _pos select 1;
	_posX = (_posX - (_posX % 100));
	_posY = (_posY - (_posY % 100));
	_Return = [_posX + 50,_posY + 90,0];
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