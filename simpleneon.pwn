//*********************************************************//
//        This is simple neon system by : wizzi            //
//              Please dont remove credits                 //
//               _________________________                 //
//               | http://www.xdragons.tk|                 //
//               __________xdragons_______                 //
//*********************************************************//
//**Include****//
#include <a_samp>

#pragma tabsize 0
#define neondialog 8131

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print("Simple Neon System by : wizzi");
	print("--------------------------------------\n");
	return 1;
	//*********Color****************//
		#define COLOR_YELLOW 0xFFFF00AA
		#define COLOR_ORANGE 0xFFA500FF
}

public OnFilterScriptExit()
{
	return 1;
}

//**************Commands*********************//
public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp(cmdtext, "/neon", true)==0)
	{
	if(IsPlayerInAnyVehicle(playerid))
	{
    ShowPlayerDialog(playerid, neondialog, DIALOG_STYLE_LIST, "Neon Color", "Blue\nRed\nGreen\nWhite\nPink\nYellow\nDelete Neon", "Select", "Cancel");
	}
	return 1;
	}
	return 0;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{

    if(dialogid == neondialog)
	{
		if(response)
		{
			if(listitem == 0)
			{
			    SetPVarInt(playerid, "Status", 1);
                SetPVarInt(playerid, "neon", CreateObject(18648,0,0,0,0,0,0));
                SetPVarInt(playerid, "neon1", CreateObject(18648,0,0,0,0,0,0));
                AttachObjectToVehicle(GetPVarInt(playerid, "neon"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                AttachObjectToVehicle(GetPVarInt(playerid, "neon1"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
                SetPlayerTime(playerid,0,0); //midnight
                SendClientMessage(playerid, 0xFFFFFFAA, "Neon installed");
   			}
			if(listitem == 1)
			{
				SetPVarInt(playerid, "Status", 1);
	            SetPVarInt(playerid, "neon2", CreateObject(18647,0,0,0,0,0,0));
	            SetPVarInt(playerid, "neon3", CreateObject(18647,0,0,0,0,0,0));
	            AttachObjectToVehicle(GetPVarInt(playerid, "neon2"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	            AttachObjectToVehicle(GetPVarInt(playerid, "neon3"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	            SetPlayerTime(playerid,0,0); //midnight
	            SendClientMessage(playerid, 0xFFFFFFAA, "Neon installed");

            }
			if(listitem == 2)
			{
		   	    SetPVarInt(playerid, "Status", 1);
	            SetPVarInt(playerid, "neon4", CreateObject(18649,0,0,0,0,0,0));
	            SetPVarInt(playerid, "neon5", CreateObject(18649,0,0,0,0,0,0));
	            AttachObjectToVehicle(GetPVarInt(playerid, "neon4"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	            AttachObjectToVehicle(GetPVarInt(playerid, "neon5"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	            SetPlayerTime(playerid,0,0); //midnight
	            SendClientMessage(playerid, 0xFFFFFFAA, "Neon installed");

	            }
			if(listitem == 3)
			{
		   	    SetPVarInt(playerid, "Status", 1);
	            SetPVarInt(playerid, "neon6", CreateObject(18652,0,0,0,0,0,0));
	            SetPVarInt(playerid, "neon7", CreateObject(18652,0,0,0,0,0,0));
	            AttachObjectToVehicle(GetPVarInt(playerid, "neon6"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	            AttachObjectToVehicle(GetPVarInt(playerid, "neon7"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	            SetPlayerTime(playerid,0,0); //midnight
	            SendClientMessage(playerid, 0xFFFFFFAA, "Neon installed");

            }
			if(listitem == 4)
			{
		   	    SetPVarInt(playerid, "Status", 1);
	            SetPVarInt(playerid, "neon8", CreateObject(18651,0,0,0,0,0,0));
	            SetPVarInt(playerid, "neon9", CreateObject(18651,0,0,0,0,0,0));
	            AttachObjectToVehicle(GetPVarInt(playerid, "neon8"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	            AttachObjectToVehicle(GetPVarInt(playerid, "neon9"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	            SetPlayerTime(playerid,0,0); //midnight
	            SendClientMessage(playerid, 0xFFFFFFAA, "Neon installed");

            }
			if(listitem == 5)
			{
  				SetPVarInt(playerid, "Status", 1);
	            SetPVarInt(playerid, "neon10", CreateObject(18650,0,0,0,0,0,0));
	            SetPVarInt(playerid, "neon11", CreateObject(18650,0,0,0,0,0,0));
	            AttachObjectToVehicle(GetPVarInt(playerid, "neon10"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	            AttachObjectToVehicle(GetPVarInt(playerid, "neon11"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	            SetPlayerTime(playerid,0,0); //midnight
	            SendClientMessage(playerid, 0xFFFFFFAA, "Neon installed");

            }
			if(listitem == 6){DestroyObject(GetPVarInt(playerid, "neon")); DeletePVar(playerid, "Status"); DestroyObject(GetPVarInt(playerid, "neon1")); DeletePVar(playerid, "Status"); DestroyObject(GetPVarInt(playerid, "neon2")); DeletePVar(playerid, "Status"); DestroyObject(GetPVarInt(playerid, "neon3"));
            DeletePVar(playerid, "Status"); DestroyObject(GetPVarInt(playerid, "neon4")); DeletePVar(playerid, "Status"); DestroyObject(GetPVarInt(playerid, "neon5")); DeletePVar(playerid, "Status"); DestroyObject(GetPVarInt(playerid, "neon6")); DeletePVar(playerid, "Status"); DestroyObject(GetPVarInt(playerid, "neon7"));
			DeletePVar(playerid, "Status"); DestroyObject(GetPVarInt(playerid, "neon8")); DeletePVar(playerid, "Status"); DestroyObject(GetPVarInt(playerid, "neon9")); DeletePVar(playerid, "Status"); DestroyObject(GetPVarInt(playerid, "neon10")); DeletePVar(playerid, "Status"); DestroyObject(GetPVarInt(playerid, "neon13"));
            DeletePVar(playerid, "Status");
            SetPlayerTime(playerid,12,0); //midnight
	 	    }
		}
	}
    return 0;
}
	public OnPlayerSpawn()
		{
		new playerid;
		SendClientMessage(playerid, COLOR_ORANGE,"News: You Can Use /TUNE for Your Car!!!");
		return 1;
		}
		//do not remove credits please...