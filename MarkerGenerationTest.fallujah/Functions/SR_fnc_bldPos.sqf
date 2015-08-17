
#include "defines.sqf"

private ["_building", "_positions", "_index","_next"];

_building = _this;
_positions = [(position _building)];

// search more positions
_index = 1;
while {_index > 0} do {
   _next = _building buildingPos _index;
   if (((_next select 0) == 0) && ((_next select 1) == 0) && ((_next select 2) == 0)) then {
      _index = 0;
   } else {
      _positions set [(count _positions), _next];
      _index = _index + 1;
   };
};

// return positions
_positions


