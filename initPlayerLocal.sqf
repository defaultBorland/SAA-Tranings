//Player init
waitUntil {!isNull player};
[] call BIS_fnc_VRFadeOut;

private _uid = getPlayerUID player;

player setVariable ["SAA_isZeus", _uid in (missionNamespace getVariable "ZeusArray"), true];
player setVariable ["SAA_isArsenalUnrestricted", player getVariable ["SAA_isZeus", false], true];
player setVariable ["SAA_storageRestricted", player getVariable ["SAA_isZeus", false], true];

// Welcome message while loadout is loading
titleText [format["<t color='#ff0000' size='2' align='center' valign='middle' font='PuristaBold'>%1</t><br/><br/><t size='1.5' align='center' valign='middle' font='EtelkaMonospacePro'>%2</t>", name player, "Welcome to Duty | Shadec Asgardian Alliance"], "BLACK FADED", 2, false, true];
playMusic ["EventTrack02a_F_EPA", 3]; //playMusic "EventTrack03a_F_EPB";
sleep 3;

// Assign Zeus
if (player getVariable ["SAA_isZeus", false]) exitWith {
	[] call Shadec_fnc_addZeusModules;
    [[player, "assign"], Shadec_fnc_manageCurators] remoteExec ["call", 2];
    player addAction [ localize "SAA_SAA_ASSIGN_ZEUS_ACTION", {
        [[player, "assign"], Shadec_fnc_manageCurators] remoteExec ["call", 2];
    }];
};

// Some mid-session saving
if (!isNil {missionNamespace getVariable format["%1_INVENTORY", _uid]}) then {
	[[player, getPlayerUID player], Shadec_fnc_reLoadoutUnit] remoteExec ["call", 2];
};


// Add Actions
[] execVM "Mechanics\Root\RootActions_init.sqf";
[] execVM "Mechanics\Reloadout\LoadoutFix_init.sqf";

[] execVM "Mechanics\LowGear\LowGear_Init.sqf";
[] execVM "Mechanics\TeamManagement\PlayersList_Init.sqf";
[] execVM "Mechanics\TeamManagement\SquadList_Init.sqf";
[] execVM "Mechanics\TeamManagement\GroupNaming_Init.sqf";
[] execVM "Mechanics\TeamManagement\ForceJoinToSquad_Init.sqf";
[] execVM "Mechanics\TeamManagement\ForceRemoveFromSquad_Init.sqf";
[] execVM "Mechanics\ShowTickets\ShowTickets_Init.sqf";

// Execute EHs
[] execVM "EH\player\serverFps.sqf";
script_handler = [] execVM "EH\player\playerKilled.sqf";
[] execVM "EH\player\playerRespawn.sqf";
if (player getVariable ["SAA_isZeus", false]) then {
	[] execVM "EH\player\zeus.sqf";
};

//
_arsenals = missionNamespace getVariable ["ArsenalList", []];
if !(_arsenals isEqualTo []) then {
	{
		[_x] call Shadec_fnc_addActionArsenalGen;
	} forEach _arsenals;
};

//
waitUntil {scriptDone script_handler};
script_handler = [] spawn {sleep 6; [] call BIS_fnc_VRFadeIn;};
[{scriptDone script_handler}, {[player] call Shadec_fnc_showUserInfo}, _uid, 15, {"somethingWentWrong" call BIS_fnc_endMission}] call CBA_fnc_waitUntilAndExecute;

// Recieve variables from server
["Check"] spawn Shadec_fnc_objectJamming; 
player setVariable ["tf_receivingDistanceMultiplicator", missionNamespace getVariable "tf_reciveVar"];
player setVariable ["tf_sendingDistanceMultiplicator", missionNamespace getVariable "tf_sendVar"];

// Delete Existing Respawn Markers if they were placed in Editor
{deleteMarker _x} forEach (allMapMarkers select {"respawn" in _x});

// Reset player group
[player] joinSilent grpNull;