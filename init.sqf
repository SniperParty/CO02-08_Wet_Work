//Runs on both server and clients after initServer.sqf is finished
waitUntil {!isNil "serverInit"};
waitUntil {serverInit};

#include "logic\activeMods.sqf"

//initialise mods if active
if ( "task_force_radio" call caran_checkMod ) then {
	_load = [] execVM "mods\tfar.sqf";
};

if ( "asr_ai3_main" call caran_checkMod ) then {
	_load = [] execVM "mods\asr.sqf";
};

//Player init: this will only run on players. Use it to add the briefing and any player-specific stuff like action-menu items.
if (!isServer || (isServer && !isDedicated) ) then {
	//put in briefings
	briefing = [] execVM "briefing\briefing.sqf";
	
	//give player a respawn ticket to use at start
	[player, 1] call BIS_fnc_respawnTickets;
};

execVM "logic\hcHandle.sqf";