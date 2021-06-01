//scriptName.sqf
disableSerialization;

//Get the passed ctrl
_ctrl = _this select 0;

//Get passed selected index
_index = _this select 1;

if ((ctrlIDC _ctrl) isEqualTo 2100) then {
	player setVariable ["SAA_newPrimaryClass", [_ctrl lbText _index, "EN"] call Shadec_fnc_classSwitcher, true];
};

if ((ctrlIDC _ctrl) isEqualTo 2101) then {
	player setVariable ["SAA_newSecondaryClass", [_ctrl lbText _index, "EN"] call Shadec_fnc_classSwitcher, true];
};

//test message with info
//hint format ["You select index: %1\n of ctrl: %2\n which contains %3",_index, ctrlIDC _ctrl, _ctrl lbText _index];
