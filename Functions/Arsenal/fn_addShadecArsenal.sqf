params ["_box", "_uniformType", "_clearInventory","_showInfo"];

//
[_box, true] call ace_arsenal_fnc_removeBox;

//
[_box, true] call ace_dragging_fnc_setDraggable;
[_box, true] call ace_dragging_fnc_setCarryable;

//
if (_clearInventory) then {
	clearWeaponCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearBackpackCargoGlobal _box;
};

//
_box setVariable ["SAA_uniformType", _uniformType, true];
_box setVariable ["SAA_isArsenal", true, true];

//
_arsenals = missionNamespace getVariable ["ArsenalList", []];
_arsenals pushBack _box;
missionNamespace setVariable ["ArsenalList", _arsenals, true];

//
private _items = ["tf_anprc152"];
[_box, _items, true] call ace_arsenal_fnc_initBox;

//
_playersIDs = ["All", "ID"] call Shadec_fnc_usersIDs;
{
	[[_box], {
		[_this # 0] call Shadec_fnc_addActionArsenalGen;
	}] remoteExec ["spawn", _x];
} forEach _playersIDs;

//
if (_showInfo) then {
	[[_box, _uniformType], {
		_this params ["_box", "_uniformType"];
		hint parseText format ["<t align='center'>%1</t><br/><t align='center' shadow='1' shadowColor='#000000'>%2</t><br/><t align='center'><t align='center' shadow='1' shadowColor='#000000'>Uniform Type: %3</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Direction from you: %4</t><br/><t align='center' color='#ffffff' shadow='1' shadowColor='#000000'>Distance: %5</t>", localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_ZEUSMESSAGE_SUCCESS", getText (configFile >> "CfgVehicles" >> typeOf _box >> "displayName"), _uniformType, floor ([player, _box] call BIS_fnc_dirTo), round (player distance _box)]
	}] remoteExec ["call", -2];

	{format ["> Server: %1", localize "SAA_ZEUS_MODULES_MAIN_ADDARSENAL_ZEUSMESSAGE_SUCCESS"]} remoteExec ["call", -2];
};

//