// On Player Disconnected Handler

//Player disconnected handler with _unit passed
_EH_PlayerDisconnected = addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

	missionNamespace setVariable [format["%1_INVENTORY", _uid], getUnitLoadout _unit, true];

}];