// On Player Disconnected Handler

//Player disconnected handler with _unit passed
_EH_PlayerDisconnected = addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];

	missionNamespace setVariable [format["%1_INVENTORY", _uid], getUnitLoadout _unit, true];

}];

//Player disconnected handler with _owner passed
_EH_PlayerDisconnected = addMissionEventHandler ["PlayerDisconnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

	// Unlock server if all players left
	if (count allPlayers - 1 < 1) then {"f5znFms2" serverCommand "#unlock"};
}];