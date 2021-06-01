//
disableSerialization;

//Define idc's for controls for easy access
_comboA = 2100;
_comboB = 2101;
_checkBox = 2105;
_applyButton = 2106;

//store display, passed from onLoad
_display = _this select 0;

//Add to lb and combo lists
{
	_index = lbAdd [_comboA, localize _x];
} forEach (missionNamespace getVariable "primaryClasses");
{
	_index = lbAdd [_comboB, localize _x];
} forEach (missionNamespace getVariable "secondaryClasses");
//
private _index2100  = ((missionNamespace getVariable "primaryClasses") apply {[localize _x, "EN"] call Shadec_fnc_ClassSwitcher}) find ([player getVariable ["SAA_primaryClass", "Rifleman"], "EN"] call Shadec_fnc_ClassSwitcher);
private _index2101 = ((missionNamespace getVariable "secondaryClasses") apply {[localize _x, "EN"] call Shadec_fnc_ClassSwitcher}) find ([player getVariable ["SAA_secondaryClass", "N/A"], "EN"] call Shadec_fnc_ClassSwitcher);
if (_index2100 isEqualTo -1) then {_index2100 = 0};
if (_index2101 isEqualTo -1) then {_index2101 = 0};
//
(_display displayCtrl _comboA) lbSetCurSel _index2100;
(_display displayCtrl _comboB) lbSetCurSel _index2101;

//
(_display displayCtrl _applyButton) ctrlCommit 0;
(_display displayCtrl _applyButton) buttonSetAction "closeDialog 0; [player] call Shadec_fnc_ArsenalGen";

//set an event to fire when a selection is made in listBoxA
(_display displayCtrl _comboA) ctrlAddEventHandler ["LBSelChanged","_this execVM 'Arsenal\GUI_EH.sqf'"];
//set an event to fire when a selection is made in comboA
(_display displayCtrl _comboB) ctrlAddEventHandler ["LBSelChanged","_this execVM 'Arsenal\GUI_EH.sqf'"];

ctrlSetText [2104, localize "SAA_ARSENALGEN_DESCRIPTION"];
ctrlSetText [2106, localize "SAA_ARSENALGEN_BUTTON"];
ctrlSetText [2099, localize "SAA_ARSENALGEN_MAINHEADER"];
ctrlSetText [2102, localize "SAA_ARSENALGEN_PRIMARYCLASS"];
ctrlSetText [2103, localize "SAA_ARSENALGEN_SECONDARYCLASS"];