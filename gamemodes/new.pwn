/*
*
*				GAMEMODE CYPHER ROLEPLAY
*				DEVOLOPMENT: CYPHER TEAM
*
*
*
*
*/


//------------INCLUDES-----------
#include <a_samp>
#include <a_mysql> //MySQL plugin R39-3
#include <streamer>
#include <sscanf2>
#include <foreach>
#include <zcmd>
// -- YSI
#include <YSI\y_timers>
#include <YSI\y_utils>
#include <YSI\y_ini>
#include <YSI\y_inline>
// --
#include <dini>
#include <SKY>
#include <YSF>

//------------DEFINE SOURCE-----------

#include "./includes/mysql.pwn"

#include "./includes/core/define.pwn"

#include "./includes/player/player.pwn"

#include "./includes/core/callbacks.pwn"

#include "./includes/core/dialogs.pwn"

#include "./includes/core/stock.pwn"

#include "./includes/admin/admin.pwn"

#include "./includes/command/cmd.pwn"


//------------OTHER-----------
#define PRESSED(%0) \
(((newkeys&(%0))==(%0)) && ((oldkeys & (%0)) != (%0)))
#define HOLDING(%0)														((newkeys & (%0)) == (%0))
#define RELEASED(%0)													(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))




main()
{
	print("Base Roleplay - Cypher Team 2022");
}


public OnGameModeInit()
{
	SetGameModeText("Cypher");
	MySQL = mysql_connect(SQL_HOST,SQL_USER,SQL_DB,SQL_PASS);
	print("Dang ket noi...");
	if(mysql_errno() != 0)
	{
		print("[MYSQL] Ket noi that ban.");
	}
	else
	{
		print("[MYSQL] Da ket noi thanh cong.");
	}

	SetTimer("OnPlayerUpdateEx", 1000, true);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}


