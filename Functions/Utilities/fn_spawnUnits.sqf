params ["_unitsSide", "_unitsCount", "_weaponBase", "_uniformType", "_vestRandomize", "_loadoutRichness"];
// Side = west/east/independent/civilian
// WeaponBase = AK/M/?/Mixed AK-M
// LoadoutRichness = small/medium/big
// UniformType = ?
// Vests Randomisation = true/false

private _soldierBases = ["", "", "", ""]; // east, west, independent, civilian
private _unitBase = _soldierBases # (_unitsSide call BIS_fnc_sideID);

private _weaponBaseAK = [];
private _weaponBaseM = [];

// add weapon with some magazines via: BIS_fnc_addWeapon 

private _uniformBaseOne = [["Uniforms"], ["Vests"]];
private _uniformBaseTwo = [["Uniforms"], ["Vests"]];

private _randomItems = ["ACE_fieldDressing", "ACE_quikclot", "ACE_Cellphone", "ACE_tourniquet", "ACE_epinephrine", "ACE_morphine", "ACE_packingBandage"];
private _cashPiles = ["Money_bunch", "Money_roll", "Money_stack", "Money"]; // (20$) 0-65, (50$) 66-85, (100$) 86-98, (1000$) 99-100

// Loadout nulifying
// [_unit, configfile >> "CfgVehicles" >> "B_Soldier_SL_F"] call BIS_fnc_loadInventory; // Gives loadout of BLUFOR Squad Leader to player unit.