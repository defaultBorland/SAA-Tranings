// ONLY LOCAL EXECUTE
params ["_unit"];

if (_unit getVariable ["SAA_isZeus", false]) then {
	[
		[
			[localize "SAA_ROLES_ROLE", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaBold'>%1: </t>"],
			[localize "SAA_GENERAL_ZEUS", "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 10],

			[format["%1 | %2 | %3:%4", toUpper worldName, mapGridPosition _unit, [daytime, "HH:MM"] call BIS_fnc_timeToString], "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 40]
		], 1, 1
	] spawn BIS_fnc_typeText;
} else {
	[
		[
			[localize "SAA_ROLES_ROLE", "<t align = 'left' shadow = '1' size = '0.7' font='PuristaBold'>%1: </t>"],
			[localize "SAA_GENERAL_CONTRACTOR", "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 10],

			[format["%1 | %2 | %3:%4", toUpper worldName, mapGridPosition _unit, [daytime, "HH:MM"] call BIS_fnc_timeToString], "<t align = 'left' shadow = '1' size = '0.7'>%1</t><br/>", 40]
		], 1, 1
	] spawn BIS_fnc_typeText;
};

// Return
true