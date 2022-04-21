#define FILTERSCRIPT

/* Includes */
#include <a_samp>
#include <foreach>
#include <zcmd>

/* Text Variables */
new Text:speedometer[12];
new PlayerText:speedometers[MAX_PLAYERS][6];

/* Vehice Fuel */
#define MAX_FUEL 100.0
#define MAX_COST 1
new Float:Gas[MAX_VEHICLES + 1] = {MAX_FUEL, ...};
new Filling[MAX_PLAYERS];

/* Vehicle Names */
new vehName[][] =
{
	"Landstalker",
	"Bravura",
	"Buffalo",
	"Linerunner",
	"Perennial",
	"Sentinel",
	"Dumper",
	"Firetruck",
	"Trashmaster",
	"Stretch",
	"Manana",
	"Infernus",
	"Voodoo",
	"Pony",
	"Mule",
	"Cheetah",
	"Ambulance",
	"Leviathan",
	"Moonbeam",
	"Esperanto",
	"Taxi",
	"Washington",
	"Bobcat",
	"Whoopee",
	"BF Injection",
	"Hunter",
	"Premier",
	"Enforcer",
	"Securicar",
	"Banshee",
	"Predator",
	"Bus",
	"Rhino",
	"Barracks",
	"Hotknife",
	"Trailer",
	"Previon",
	"Coach",
	"Cabbie",
	"Stallion",
	"Rumpo",
	"RC Bandit",
	"Romero",
	"Packer",
	"Monster",
	"Admiral",
	"Squalo",
	"Seasparrow",
	"Pizzaboy",
	"Tram",
	"Trailer",
	"Turismo",
	"Speeder",
	"Reefer",
	"Tropic",
	"Flatbed",
	"Yankee",
	"Caddy",
	"Solair",
	"Berkley's RC Van",
	"Skimmer",
	"PCJ-600",
	"Faggio",
	"Freeway",
	"RC Baron",
	"RC Raider",
	"Glendale",
	"Oceanic",
	"Sanchez",
	"Sparrow",
	"Patriot",
	"Quad",
	"Coastguard",
	"Dinghy",
	"Hermes",
	"Sabre",
	"Rustler",
	"ZR-350",
	"Walton",
	"Regina",
	"Comet",
	"BMX",
	"Burrito",
	"Camper",
	"Marquis",
	"Baggage",
	"Dozer",
	"Maverick",
	"News Chopper",
	"Rancher",
	"FBI Rancher",
	"Virgo",
	"Greenwood",
	"Jetmax",
	"Hotring",
	"Sandking",
	"Blista Compact",
	"Police Maverick",
	"Boxville",
	"Benson",
	"Mesa",
	"RC Goblin",
	"Hotring Racer A",
	"Hotring Racer B",
	"Bloodring Banger",
	"Rancher",
	"Super GT",
	"Elegant",
	"Journey",
	"Bike",
	"Mountain Bike",
	"Beagle",
	"Cropduster",
	"Stunt",
	"Tanker",
	"Roadtrain",
	"Nebula",
	"Majestic",
	"Buccaneer",
	"Shamal",
	"Hydra",
	"FCR-900",
	"NRG-500",
	"HPV1000",
	"Cement Truck",
	"Tow Truck",
	"Fortune",
	"Cadrona",
	"FBI Truck",
	"Willard",
	"Forklift",
	"Tractor",
	"Combine",
	"Feltzer",
	"Remington",
	"Slamvan",
	"Blade",
	"Freight",
	"Streak",
	"Vortex",
	"Vincent",
	"Bullet",
	"Clover",
	"Sadler",
	"Firetruck",
	"Hustler",
	"Intruder",
	"Primo",
	"Cargobob",
	"Tampa",
	"Sunrise",
	"Merit",
	"Utility",
	"Nevada",
	"Yosemite",
	"Windsor",
	"Monster",
	"Monster",
	"Uranus",
	"Jester",
	"Sultan",
	"Stratium",
	"Elegy",
	"Raindance",
	"RC Tiger",
	"Flash",
	"Tahoma",
	"Savanna",
	"Bandito",
	"Freight Flat",
	"Streak Carriage",
	"Kart",
	"Mower",
	"Dune",
	"Sweeper",
	"Broadway",
	"Tornado",
	"AT-400",
	"DFT-30",
	"Huntley",
	"Stafford",
	"BF-400",
	"News Van",
	"Tug",
	"Trailer",
	"Emperor",
	"Wayfarer",
	"Euros",
	"Hotdog",
	"Club",
	"Freight Box",
	"Trailer",
	"Andromada",
	"Dodo",
	"RC Cam",
	"Launch",
	"Police",
	"Police",
	"Police",
	"Ranger",
	"Picador",
	"S.W.A.T",
	"Alpha",
	"Phoenix",
	"Glendale Shit",
	"Sadler Shit",
	"Luggage",
	"Luggage",
	"Stairs",
	"Boxville",
	"Tiller",
	"Utility Trailer"
};

Float:GetPlayerSpeed(playerid)
{
    new Float:px, Float:py, Float:pz;
    GetVehicleVelocity(GetPlayerVehicleID(playerid), px, py, pz);
    return floatsqroot(floatpower(floatabs(px), 2.0) + floatpower(floatabs(py), 2.0) + floatpower(floatabs(pz), 2.0)) * 100;
}

new bool:False = false, txdstring[1000];
/* TextDrawSetString With String */
/* PlayerTextDrawSetString With String */
#define PlayerTextDrawSetStrings(%1,%2,%3,%4)\
do{\
	format(txdstring, sizeof (txdstring), (%3), %4);\
	PlayerTextDrawSetString((%1), (%2), txdstring);\
}\
while (False)

IsVehicleDrivingBackwards(vehicleid)
{
    new Float:Float[3];
    if(GetVehicleVelocity(vehicleid, Float[1], Float[2], Float[0]))
    {
        GetVehicleZAngle(vehicleid, Float[0]);
        if(Float[0] < 90)
        {
            if(Float[1] > 0 && Float[2] < 0) return true;
        }
        else if(Float[0] < 180)
        {
            if(Float[1] > 0 && Float[2] > 0) return true;
        }
        else if(Float[0] < 270)
        {
            if(Float[1] < 0 && Float[2] > 0) return true;
        }
        else if(Float[1] < 0 && Float[2] < 0) return true;
    }
    return false;
}

forward FuelUpdate();
public FuelUpdate()
{
	new vehicleid, Float:temp1;
	foreach(new i: Player)
	{
		if (IsPlayerConnected(i))
		{
			if (GetPlayerState(i) == PLAYER_STATE_DRIVER)
			{
				vehicleid = GetPlayerVehicleID(i);
				temp1 = GetPlayerSpeed(i);
				if (Filling[i] == 1) 
				{
					if (Gas[vehicleid] < MAX_FUEL)
					{
	                    if (GetPlayerMoney(i) >= MAX_COST) 
						{
							GivePlayerMoney(i, -MAX_COST);
							if (Gas[vehicleid] <= MAX_FUEL-1.0)
							{
								Gas[vehicleid] += 1.0;
							}
							else
							{
								Gas[vehicleid] = MAX_FUEL;
							}
						}
						else 
						{
							Filling[i] = 0;
							SendClientMessage(i, 0xFFFF0000, "Ban khong co du tien de tiep tuc do xang.");
						}
						if (Gas[vehicleid] == MAX_FUEL) 
						{
							Filling[i] = 0;
							SendClientMessage(i, 0xFFFFFF00, "Xe cua ban da duoc trang bi day du.");
						}
					}
				}
				else if (VehicleTakesFuel(vehicleid))
				{
					if (floatround(Gas[vehicleid]) > 0)
					{
						Gas[vehicleid] -= temp1 / 6000.0;
						if (floatround(Gas[vehicleid]) <= 0)
						{
							new engine, lights, alarm, doors, bonnet, boot, objective;
							GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
							SetVehicleParamsEx(vehicleid, 0, lights, alarm, doors, bonnet, boot, objective);
							SendClientMessage(i, 0xFFFFFFF, "Xe ban cua ban da het xang!");
						}
					}
				}
				else if (Filling[i] == 1) Filling[i] = 0;
			}
		}
	}
}
VehicleTakesFuel(vehicleid)
{
	switch (GetVehicleModel(vehicleid))
	{
		case 430, 446, 449, 452, 453, 454, 460, 472, 473, 481, 484, 493, 509, 510, 537, 538, 539, 595: return false;
	}
	return true;
}
UpdatePlayerSpeedo(playerid)
{
    new Float:health;
	GetVehicleHealth(GetPlayerVehicleID(playerid), health);
	PlayerTextDrawSetPreviewModel(playerid, speedometers[playerid][5], GetVehicleModel(GetPlayerVehicleID(playerid)));
	PlayerTextDrawSetStrings(playerid, speedometers[playerid][2], "%d%", floatround(health));
	PlayerTextDrawSetStrings(playerid, speedometers[playerid][4], "%d KM/H", floatround(GetPlayerSpeed(playerid)));
	PlayerTextDrawSetStrings(playerid, speedometers[playerid][0], "%s", vehName[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
	if(Gas[GetPlayerVehicleID(playerid)] <= 10) 
	{
		PlayerTextDrawSetStrings(playerid, speedometers[playerid][3], "~r~%d%", floatround(Gas[GetPlayerVehicleID(playerid)]));
	}
	else 
	{
		PlayerTextDrawSetStrings(playerid, speedometers[playerid][3], "~w~%d%", floatround(Gas[GetPlayerVehicleID(playerid)]));
	}
	if(GetPlayerSpeed(playerid) == 0) 
	{
		PlayerTextDrawSetString(playerid, speedometers[playerid][1], "~g~P");
	}
	else if(IsVehicleDrivingBackwards(GetPlayerVehicleID(playerid)))
	{
		PlayerTextDrawSetString(playerid, speedometers[playerid][1],  "~p~R");
	}
	if(GetPlayerSpeed(playerid) > 20)
	{
	 PlayerTextDrawSetString(playerid, speedometers[playerid][1], "1");
	}
	if(GetPlayerSpeed(playerid) > 40)
	{
	 PlayerTextDrawSetString(playerid, speedometers[playerid][1], "2");
	}
	if(GetPlayerSpeed(playerid) > 60)
	{
	 PlayerTextDrawSetString(playerid, speedometers[playerid][1], "3");
	}
	if(GetPlayerSpeed(playerid) > 100)
	{
	 PlayerTextDrawSetString(playerid, speedometers[playerid][1], "4");
	}
	if(GetPlayerSpeed(playerid) > 120)
	{
	 PlayerTextDrawSetString(playerid, speedometers[playerid][1], "5");
	}
}

CreateTextdrawMeter(playerid)
{
	speedometer[0] = TextDrawCreate(641.531494, 385.916687, "usebox");
	TextDrawLetterSize(speedometer[0], 0.000000, 6.683333);
	TextDrawTextSize(speedometer[0], 499.786224, 0.000000);
	TextDrawAlignment(speedometer[0], 1);
	TextDrawColor(speedometer[0], 0);
	TextDrawUseBox(speedometer[0], true);
	TextDrawBoxColor(speedometer[0], 102);
	TextDrawSetShadow(speedometer[0], 0);
	TextDrawSetOutline(speedometer[0], 0);
	TextDrawFont(speedometer[0], 0);

	speedometer[1] = TextDrawCreate(641.531494, 385.916687, "usebox");
	TextDrawLetterSize(speedometer[1], 0.000000, -0.251854);
	TextDrawTextSize(speedometer[1], 500.254760, 0.000000);
	TextDrawAlignment(speedometer[1], 1);
	TextDrawColor(speedometer[1], 0);
	TextDrawUseBox(speedometer[1], true);
	TextDrawBoxColor(speedometer[1], 255);
	TextDrawSetShadow(speedometer[1], 0);
	TextDrawSetOutline(speedometer[1], 0);
	TextDrawFont(speedometer[1], 0);

	speedometer[2] = TextDrawCreate(642.531494, 447.583374, "usebox");
	TextDrawLetterSize(speedometer[2], 0.000000, -0.251854);
	TextDrawTextSize(speedometer[2], 500.254791, 0.000000);
	TextDrawAlignment(speedometer[2], 1);
	TextDrawColor(speedometer[2], 0);
	TextDrawUseBox(speedometer[2], true);
	TextDrawBoxColor(speedometer[2], 255);
	TextDrawSetShadow(speedometer[2], 0);
	TextDrawSetOutline(speedometer[2], 0);
	TextDrawFont(speedometer[2], 0);

	speedometer[3] = TextDrawCreate(638.720336, 391.750000, "usebox");
	TextDrawLetterSize(speedometer[3], 0.000000, 5.451854);
	TextDrawTextSize(speedometer[3], 596.770141, 0.000000);
	TextDrawAlignment(speedometer[3], 1);
	TextDrawColor(speedometer[3], 0);
	TextDrawUseBox(speedometer[3], true);
	TextDrawBoxColor(speedometer[3], 255);
	TextDrawSetShadow(speedometer[3], 0);
	TextDrawSetOutline(speedometer[3], 0);
	TextDrawFont(speedometer[3], 0);

	speedometer[4] = TextDrawCreate(638.251831, 442.500000, "usebox");
	TextDrawLetterSize(speedometer[4], 0.000000, -0.187034);
	TextDrawTextSize(speedometer[4], 596.770141, 0.000000);
	TextDrawAlignment(speedometer[4], 1);
	TextDrawColor(speedometer[4], 0);
	TextDrawUseBox(speedometer[4], true);
	TextDrawBoxColor(speedometer[4], -1378294017);
	TextDrawSetShadow(speedometer[4], 0);
	TextDrawSetOutline(speedometer[4], 0);
	TextDrawFont(speedometer[4], 0);

	speedometer[5] = TextDrawCreate(639.251831, 391.583312, "usebox");
	TextDrawLetterSize(speedometer[5], 0.000000, -0.187034);
	TextDrawTextSize(speedometer[5], 596.770141, 0.000000);
	TextDrawAlignment(speedometer[5], 1);
	TextDrawColor(speedometer[5], 0);
	TextDrawUseBox(speedometer[5], true);
	TextDrawBoxColor(speedometer[5], -1378294017);
	TextDrawSetShadow(speedometer[5], 0);
	TextDrawSetOutline(speedometer[5], 0);
	TextDrawFont(speedometer[5], 0);

	speedometer[6] = TextDrawCreate(562.225524, 402.500030, "ld_pool:ball");
	TextDrawLetterSize(speedometer[6], 0.000000, 0.000000);
	TextDrawTextSize(speedometer[6], 29.985385, 34.416698);
	TextDrawAlignment(speedometer[6], 1);
	TextDrawColor(speedometer[6], 255);
	TextDrawSetShadow(speedometer[6], 0);
	TextDrawSetOutline(speedometer[6], 0);
	TextDrawFont(speedometer[6], 4);

	speedometer[7] = TextDrawCreate(565.568176, 406.416687, "ld_pool:ball");
	TextDrawLetterSize(speedometer[7], 0.000000, 0.000000);
	TextDrawTextSize(speedometer[7], 22.957569, 25.666696);
	TextDrawAlignment(speedometer[7], 1);
	TextDrawColor(speedometer[7], -1378294017);
	TextDrawSetShadow(speedometer[7], 0);
	TextDrawSetOutline(speedometer[7], 0);
	TextDrawFont(speedometer[7], 4);

	speedometer[8] = TextDrawCreate(635.440734, 422.083312, "usebox");
	TextDrawLetterSize(speedometer[8], 0.000000, 1.393517);
	TextDrawTextSize(speedometer[8], 600.049804, 0.000000);
	TextDrawAlignment(speedometer[8], 1);
	TextDrawColor(speedometer[8], 0);
	TextDrawUseBox(speedometer[8], true);
	TextDrawBoxColor(speedometer[8], -1061109505);
	TextDrawSetShadow(speedometer[8], 0);
	TextDrawSetOutline(speedometer[8], 0);
	TextDrawFont(speedometer[8], 0);

	speedometer[9] = TextDrawCreate(562.351440, 401.666687, "usebox");
	TextDrawLetterSize(speedometer[9], 0.000000, -0.187041);
	TextDrawTextSize(speedometer[9], 503.534393, 0.000000);
	TextDrawAlignment(speedometer[9], 1);
	TextDrawColor(speedometer[9], 0);
	TextDrawUseBox(speedometer[9], true);
	TextDrawBoxColor(speedometer[9], -5963521);
	TextDrawSetShadow(speedometer[9], 0);
	TextDrawSetOutline(speedometer[9], 0);
	TextDrawFont(speedometer[9], 0);

	speedometer[10] = TextDrawCreate(563.288452, 401.666687, "usebox");
	TextDrawLetterSize(speedometer[10], 0.000000, 4.220367);
	TextDrawTextSize(speedometer[10], 502.597351, 0.000000);
	TextDrawAlignment(speedometer[10], 1);
	TextDrawColor(speedometer[10], 0);
	TextDrawUseBox(speedometer[10], true);
	TextDrawBoxColor(speedometer[10], 102);
	TextDrawSetShadow(speedometer[10], 0);
	TextDrawSetOutline(speedometer[10], 0);
	TextDrawFont(speedometer[10], 0);

	speedometer[11] = TextDrawCreate(563.351379, 438.833435, "usebox");
	TextDrawLetterSize(speedometer[11], 0.000000, -0.187041);
	TextDrawTextSize(speedometer[11], 503.534423, 0.000000);
	TextDrawAlignment(speedometer[11], 1);
	TextDrawColor(speedometer[11], 0);
	TextDrawUseBox(speedometer[11], true);
	TextDrawBoxColor(speedometer[11], -5963521);
	TextDrawSetShadow(speedometer[11], 0);
	TextDrawSetOutline(speedometer[11], 0);
	TextDrawFont(speedometer[11], 0);
	
	speedometers[playerid][0] = CreatePlayerTextDraw(playerid, 503.660400, 386.166717, "Manh Me nho gon");
	PlayerTextDrawLetterSize(playerid, speedometers[playerid][0], 0.216676, 1.349166);
	PlayerTextDrawAlignment(playerid, speedometers[playerid][0], 1);
	PlayerTextDrawColor(playerid, speedometers[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, speedometers[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, speedometers[playerid][0], 1);
	PlayerTextDrawBackgroundColor(playerid, speedometers[playerid][0], 51);
	PlayerTextDrawFont(playerid, speedometers[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, speedometers[playerid][0], 1);

	speedometers[playerid][1] = CreatePlayerTextDraw(playerid, 573.469909, 413.000000, "1");
	PlayerTextDrawLetterSize(playerid, speedometers[playerid][1], 0.415797, 1.279166);
	PlayerTextDrawAlignment(playerid, speedometers[playerid][1], 1);
	PlayerTextDrawColor(playerid, speedometers[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, speedometers[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, speedometers[playerid][1], 1);
	PlayerTextDrawBackgroundColor(playerid, speedometers[playerid][1], 51);
	PlayerTextDrawFont(playerid, speedometers[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, speedometers[playerid][1], 1);

	speedometers[playerid][2] = CreatePlayerTextDraw(playerid, 600.707336, 394.749877, "1000%");
	PlayerTextDrawLetterSize(playerid, speedometers[playerid][2], 0.213396, 0.946666);
	PlayerTextDrawAlignment(playerid, speedometers[playerid][2], 1);
	PlayerTextDrawColor(playerid, speedometers[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, speedometers[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, speedometers[playerid][2], 1);
	PlayerTextDrawBackgroundColor(playerid, speedometers[playerid][2], 51);
	PlayerTextDrawFont(playerid, speedometers[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, speedometers[playerid][2], 1);

	speedometers[playerid][3] = CreatePlayerTextDraw(playerid, 600.770324, 405.666595, "100%");
	PlayerTextDrawLetterSize(playerid, speedometers[playerid][3], 0.213396, 0.946666);
	PlayerTextDrawAlignment(playerid, speedometers[playerid][3], 1);
	PlayerTextDrawColor(playerid, speedometers[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, speedometers[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, speedometers[playerid][3], 1);
	PlayerTextDrawBackgroundColor(playerid, speedometers[playerid][3], 51);
	PlayerTextDrawFont(playerid, speedometers[playerid][3], 2);
	PlayerTextDrawSetProportional(playerid, speedometers[playerid][3], 1);

	speedometers[playerid][4] = CreatePlayerTextDraw(playerid, 604.112854, 423.583282, "200 KM/H");
	PlayerTextDrawLetterSize(playerid, speedometers[playerid][4], 0.146866, 0.981666);
	PlayerTextDrawAlignment(playerid, speedometers[playerid][4], 1);
	PlayerTextDrawColor(playerid, speedometers[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, speedometers[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, speedometers[playerid][4], 1);
	PlayerTextDrawBackgroundColor(playerid, speedometers[playerid][4], 51);
	PlayerTextDrawFont(playerid, speedometers[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, speedometers[playerid][4], 1);

	speedometers[playerid][5] = CreatePlayerTextDraw(playerid, 500.849029, 390.249908, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, speedometers[playerid][5], 0.001874, 3.179740);
	PlayerTextDrawTextSize(playerid, speedometers[playerid][5], 56.691085, 57.166656);
	PlayerTextDrawAlignment(playerid, speedometers[playerid][5], 1);
	PlayerTextDrawColor(playerid, speedometers[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, speedometers[playerid][5], true);
	PlayerTextDrawBoxColor(playerid, speedometers[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, speedometers[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, speedometers[playerid][5], 0);
	PlayerTextDrawFont(playerid, speedometers[playerid][5], 5);
	PlayerTextDrawBackgroundColor(playerid, speedometers[playerid][5], 0x00000000);
	PlayerTextDrawSetPreviewModel(playerid, speedometers[playerid][5], 411);
	PlayerTextDrawSetPreviewRot(playerid, speedometers[playerid][5], 0.000000, 0.000000, 25.000000, 1.000000);
}

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Realistic SpeedoMeter By CaptainBoi");
	print("--------------------------------------\n");
	SetTimer("FuelUpdate", 300, 1);
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
    CreateTextdrawMeter(playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{ 
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) 
	{
	    for(new i;i<12;i++) {TextDrawShowForPlayer(playerid, speedometer[i]);}
		for(new ii;ii<6;ii++) {PlayerTextDrawShow(playerid, speedometers[playerid][ii]);}
		UpdatePlayerSpeedo(playerid);
	}
	else
	{
	    for(new i;i<12;i++) {TextDrawHideForPlayer(playerid, speedometer[i]);}
		for(new ii;ii<6;ii++) {PlayerTextDrawHide(playerid, speedometers[playerid][ii]);}
	}
	return 1;
}

public OnPlayerUpdate(playerid)
{
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) 
	{
		UpdatePlayerSpeedo(playerid);
	}
	return 1;
}

CMD:doxang(playerid, params[])
{
	new moneys1;
	if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, 0xFFFF0000, "Ban phai la nguoi dieu khien mot chiec xe!");
	moneys1 = GetPlayerVehicleID(playerid);
	if (!VehicleTakesFuel(moneys1)) return SendClientMessage(playerid, 0xFFFF0000, "Loi: Xe nay khong chay bang nhien lieu. No khong chua dong co!");
	if (Gas[moneys1] == MAX_FUEL) return SendClientMessage(playerid, 0xFFFFFFFF, "Loi: Xe cua ban khong can them xang day du ngay bay gio.");
	if (GetPlayerMoney(playerid) < MAX_COST)
	{
       return SendClientMessage(playerid, 0xFFFF0000, "Loi: Ban khong du tien!");
	}
	if (Filling[playerid] == 1) return SendClientMessage(playerid, 0xFFFFFFFF, "Loi: Ban da tiep nhien lieu cho xe cua ban.");
	Filling[playerid] = 1;
	SendClientMessage(playerid, 0xFF00FF00, "Nap nhien lieu cho xe cua ban.");
	return 1;
}
