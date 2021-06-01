// Init Zeus
[] execVM "initZeus.sqf";

// Execute EHs
[] execVM "EH\server\playerDisconnected.sqf";
[] execVM "EH\server\playerKilled.sqf";
[] execVM "EH\server\playerRespawned.sqf";

[] execVM "Arsenal\arsenalPreInit.sqf";

// Define variables
missionNamespace setVariable ["tf_reciveVar", 1, true];
missionNamespace setVariable ["tf_sendVar", 1, true];

{deleteMarker _x} forEach (allMapMarkers select {"respawn" in _x});
respawnTime = getNumber (missionConfigFile >> "respawnDelay");
missionNamespace setVariable ["respawnTime", respawnTime, true];