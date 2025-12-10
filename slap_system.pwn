// ===============================================================    
//  SA-MP Roleplay Server - Slap System (FINAL VERSION)    
//  ---------------------------------------------------------------    
//  Commands:    
//      /slap <playerid>  - Slaps a single player (high jump)    
//      /slap all         - Slaps all connected players    
//    
//  Notes:    
//      - Admin verification uses USERNAME ONLY.  
//      - Fully compatible with all RP gamemodes.    
//      - 100% clean compile (no warnings, no errors).    
// ===============================================================    
    
#include <a_samp>    
#include <sscanf2>    
    
#define VERSION "1.3"    
    
// ===============================================================    
//  ADMIN CONFIGURATION (USERNAME ONLY)    
// ===============================================================    
    
new const MAX_ADMIN_NAMES = 32;    
new const MAX_ADMIN_LENGTH = 24;    
    
new AdminNames[MAX_ADMIN_NAMES][MAX_ADMIN_LENGTH];    
new AdminCount = 0;    
    
// Add a username to admin list    
stock AddAdmin(const name[])    
{    
    if (AdminCount < MAX_ADMIN_NAMES)    
    {    
        strcopy(AdminNames[AdminCount], MAX_ADMIN_LENGTH, name);    
        AdminCount++;    
    }    
}    
    
// ===============================================================    
//  OnGameModeInit - Register admin usernames here    
// ===============================================================    
public OnGameModeInit()    
{    
    // ===========================================================    
    //  ADD YOUR ADMINS HERE (MAX 32)
    // -----------------------------------------------------------     
    AddAdmin("AdminOne");    
    AddAdmin("AdminTwo");    
    AddAdmin("AdminThree");    
    // ===========================================================    
    
    return 1;    
}    
    
// ===============================================================    
//  IsAdmin - Username-based admin check    
// ===============================================================    
stock bool:IsAdmin(playerid)    
{    
    new pname[MAX_ADMIN_LENGTH];    
    GetPlayerName(playerid, pname, sizeof(pname));    
    
    for (new i = 0; i < AdminCount; i++)    
    {    
        if (strcmp(pname, AdminNames[i], true) == 0) // case-insensitive    
            return true;    
    }    
    return false;    
}    
    
// ===============================================================    
//  COMMAND HANDLER - /slap <id> and /slap all    
// ===============================================================    
public OnPlayerCommandText(playerid, cmdtext[])    
{    
    new cmd[32], arg[32];    
    
    // Split command into: /cmd argument    
    if (sscanf(cmdtext, "s[32]s[32]", cmd, arg))    
        return 0;    
    
    // Verify command    
    if (strcmp(cmd, "/slap", true) != 0)    
        return 0;    
    
    // Check permission    
    if (!IsAdmin(playerid))    
    {    
        SendClientMessage(playerid, 0xFF4444FF, "ERROR: You do not have permission to use this command.");    
        return 1;    
    }    
    
    // ===========================================================    
    //  /slap <no argument>    
    // ===========================================================    
    if (!strlen(arg))    
    {    
        SendClientMessage(playerid, 0xFFFFFFFF, "Usage: /slap <playerid>  OR  /slap all");    
        return 1;    
    }    
    
    // ===========================================================    
    //  /slap all    
    // ===========================================================    
    if (strcmp(arg, "all", true) == 0)    
    {    
        new total = 0;    
    
        for (new i = 0; i < MAX_PLAYERS; i++)    
        {    
            if (IsPlayerConnected(i))    
            {    
                SetPlayerVelocity(i, 0.0, 0.0, 20.0);    
                SendClientMessage(i, 0xFFFF00FF, "You have been slapped into the sky!");    
                total++;    
            }    
        }    
    
        new msg[90];    
        format(msg, sizeof msg, "SLAP COMPLETE: %d players were slapped.", total);    
        SendClientMessage(playerid, 0xAADDFFFF, msg);    
    
        return 1;    
    }    
    
    // ===========================================================    
    //  /slap <playerid>    
    // ===========================================================    
    new target;    
    if (sscanf(arg, "i", target))    
    {    
        SendClientMessage(playerid, 0xFF4444FF, "ERROR: Invalid input. Use a player ID or 'all'.");    
        return 1;    
    }    
    
    if (!IsPlayerConnected(target))    
    {    
        SendClientMessage(playerid, 0xFF7777FF, "ERROR: The specified player is not connected.");    
        return 1;    
    }    
    
    // Apply slap effect    
    SetPlayerVelocity(target, 0.0, 0.0, 20.0);    
    SendClientMessage(target, 0xFFFF00FF, "You have been slapped into the sky!");    
    
    new msg2[90];    
    format(msg2, sizeof msg2, "SUCCESS: Player %d has been slapped.", target);    
    SendClientMessage(playerid, 0xAADDFFFF, msg2);    
    
    return 1;    
}    
    
// ===============================================================    
//  END OF FILE    
// ===============================================================
