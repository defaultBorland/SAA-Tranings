//
params ["_unit"];

_zeuses = missionNamespace getVariable ["ZeusArray", []];
_zeuses pushBackUnique (getPlayerUID _unit);
missionNamespace setVariable ["ZeusArray", _zeuses, true];

{["promotedToZeus", true, 2] call BIS_fnc_endMission} remoteExec ["call", _unit];

// return
true
