///	Input: [arguments] call WP_fnc_FunctionTemplate;
///	Output:  Variable, Array, Object or objNull
/// Last Updated: 25/06/15 by Razor

///	Guide
///	This layout is built to protect all client from potential script errors.
///	Debugging should be built into each function using the provided debugging framework.
///	More information on debugging can be found inside the debugging folder.
///
///	All code should be inserted within the try statement below and all variable should be stored as private.
///	If any none private variables are required and are not global to the mission must be destroyed within the catch block.


private ["_Return","_functionTitle"];
_functionTitle= "WP_fnc_FunctionTemplate";
_Return = objNull;

try
{
	//Put Code Here
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