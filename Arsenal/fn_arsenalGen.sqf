//
params ["_unit"];

_box = _unit getVariable ["activeArsenal", objNull];

if (_box isEqualTo objNull) exitWith {diag_log format ["fnc_arsenalGen | Error: _box isEqualTo objNull"]};

_unit setUnitLoadout [[],[],[],["U_B_CombatUniform_mcam",[]],[],[],"","",[],["","","","","",""]];

[_box, true, false] call ace_arsenal_fnc_removeVirtualItems;

[[_unit, "Unassign"], Shadec_fnc_rolesAssign] remoteExec ["call", 2];

_unit setVariable ["SAA_primaryClass", _unit getVariable ["SAA_newPrimaryClass", "Rifleman"], true];
_unit setVariable ["SAA_secondaryClass", _unit getVariable ["SAA_newSecondaryClass", "None"], true];

[[_unit, "Unassign"], Shadec_fnc_rolesAssign] remoteExec ["call", 2];

[_box, false, false] call ace_arsenal_fnc_initBox;

[_box, _unit] call Shadec_fnc_addUniform;
[_box, _unit] call Shadec_fnc_addEquipment;

// Some msg ?