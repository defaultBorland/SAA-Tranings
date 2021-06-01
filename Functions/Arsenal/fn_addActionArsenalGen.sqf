//
params ["_box"];

_action = [
	"openStorage", localize "SAA_ARSENALGEN_ACTION_NAME", "", {
		params ["_target", "_player", "_params"];
		_params params ["_box"];

		createDialog "arsenalGenUI";
		_player setVariable ["activeArsenal", _box];

	}, {true}, {}, [_box]
] call ace_interact_menu_fnc_createAction;

[_box, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;