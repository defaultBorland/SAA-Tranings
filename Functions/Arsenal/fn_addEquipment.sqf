params ["_box", "_unit"];

if !(_box getVariable ["SAA_isArsenal", false]) exitWith {diag_log format ["fnc_addUniform | Error: _box is not an arsenal"]};

private _unitPrimClass = _unit getVariable ["SAA_primaryClass", "Rifleman"];
private _unitSecondClass = _unit getVariable ["SAA_secondaryClass", "None"];

private _arrayP = ["Primary"] call call compile format ["Shadec_fnc_%1", _unitPrimClass];
	
private _arrayS = [];
if !(_unitSecondClass isEqualTo "None") then {
	_arrayS = ["Secondary"] call call compile format ["Shadec_fnc_%1", _unitSecondClass];
};

private _weapons = [];
_weapons append _arrayP;
_weapons append _arrayS;
_weapons = _weapons arrayIntersect _weapons;

[_box, _weapons, false] call ace_arsenal_fnc_addVirtualItems;