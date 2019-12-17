#include <YSI\y_hooks>
#include "tstudio\allobjects.pwn"

#define         MIN_GTAOBJECT_LABEL_DIST            5.0

static bool:ObjectsShown;
static Text3D:GTAObjectText[SEARCH_DATA_SIZE];
static bool:GTAObjectDeleted[SEARCH_DATA_SIZE];
static bool:GTAObjectSwapped[SEARCH_DATA_SIZE];
static HighLightObject[MAX_PLAYERS] = -1;

hook OnPlayerDisconnect(playerid, reason)
{
	if(HighLightObject[playerid] > -1)
	{
		DestroyDynamicObject(HighLightObject[playerid]);
        HighLightObject[playerid] = -1;
	}
	return 1;
}


ResetGTADeletedObjects()
{
	for(new i = 0; i < SEARCH_DATA_SIZE; i++) GTAObjectDeleted[i] = false;
	for(new i = 0; i < SEARCH_DATA_SIZE; i++) GTAObjectSwapped[i] = false;
	return 1;
}

YCMD:gtaobjects(playerid, arg[], help)
{
	if(help)
	{
		SendClientMessage(playerid, STEALTH_ORANGE, "______________________________________________");
		SendClientMessage(playerid, STEALTH_GREEN, "Display information on all San Andreas buildings.");
		return 1;
	}

	new Float:colradius;
	sscanf(arg, "F(0)", colradius);
	
	if(ObjectsShown && !colradius)
	{
		for(new i = 0; i < SEARCH_DATA_SIZE; i++) DestroyDynamic3DTextLabel(GTAObjectText[i]);
        ObjectsShown = false;
		SendClientMessage(playerid, STEALTH_GREEN, "Hiding GTA Objects");
	}
	else
	{
		if(ObjectsShown)
			for(new i = 0; i < SEARCH_DATA_SIZE; i++) DestroyDynamic3DTextLabel(GTAObjectText[i]);

	    for(new i = 0; i < SEARCH_DATA_SIZE; i++)
		{
 			if(!colradius)
			{
				colradius = GetColSphereRadius(SearchData[i][Search_Model]);
				if(colradius < MIN_GTAOBJECT_LABEL_DIST) colradius = MIN_GTAOBJECT_LABEL_DIST;
				colradius *= 2;
			}
		
            GTAObjectText[i] = CreateDynamic3DTextLabel(
				sprintf("Index: %i\nName: %s\nModelID: %i", i, SearchData[i][Search_Model_Name], SearchData[i][Search_Model]), 
				(GTAObjectDeleted[i] ? (GTAObjectSwapped[i] ? 0x5A34FFFF : 0xFF345AFF) : 0xFF69B4FF), 
				SearchData[i][SearchX], SearchData[i][SearchY], SearchData[i][SearchZ]+SearchData[i][SearchOffset], colradius*2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, colradius
			);
		}
	    ObjectsShown = true;
	    SendClientMessage(playerid, STEALTH_GREEN, "Showing GTA Objects");
	}

	return 1;
}

/*YCMD:gtaobjects(playerid, arg[], help)
{
	if(help)
	{
		SendClientMessage(playerid, STEALTH_ORANGE, "______________________________________________");
		SendClientMessage(playerid, STEALTH_GREEN, "Display information on all San Andreas buildings.");
		return 1;
	}

	if(ObjectsShown)
	{
		for(new i = 0; i < SEARCH_DATA_SIZE; i++) DestroyDynamic3DTextLabel(GTAObjectText[i]);
        ObjectsShown = false;
		SendClientMessage(playerid, STEALTH_GREEN, "Hiding GTA Objects");
	}
	else
	{
		new text[64], Float:colradius;
		
	    for(new i = 0; i < SEARCH_DATA_SIZE; i++)
		{
 			colradius = GetColSphereRadius(SearchData[i][Search_Model]);
 			if(colradius < MIN_GTAOBJECT_LABEL_DIST) colradius = MIN_GTAOBJECT_LABEL_DIST;
		    format(text, sizeof(text), "Index: %i\nName: %s\nModelID: %i", i, SearchData[i][Search_Model_Name], SearchData[i][Search_Model]);
            GTAObjectText[i] = CreateDynamic3DTextLabel(text, 0xFF69B4FF, SearchData[i][SearchX], SearchData[i][SearchY], SearchData[i][SearchZ]+SearchData[i][SearchOffset], colradius*2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, colradius*2.0);
		}
	    ObjectsShown = true;
	    SendClientMessage(playerid, STEALTH_GREEN, "Showing GTA Objects");
	}

	return 1;
}*/

YCMD:gtashow(playerid, arg[], help)
{
	if(help)
	{
		SendClientMessage(playerid, STEALTH_ORANGE, "______________________________________________");
		SendClientMessage(playerid, STEALTH_GREEN, "\"Highlight\" a San Andreas building.");
		return 1;
	}

	if(isnull(arg)) return SendClientMessage(playerid, STEALTH_YELLOW, "You must provide an index to highlight!");
	new line[128], index = strval(arg);

	if(index < 0 || index >= SEARCH_DATA_SIZE)
	{
		format(line, sizeof(line), "Index must be between 0 and %i", SEARCH_DATA_SIZE-1);
	    return SendClientMessage(playerid, STEALTH_YELLOW, line);
	}

	if(HighLightObject[playerid] > -1) DestroyDynamicObject(HighLightObject[playerid]);

    HighLightObject[playerid] = CreateDynamicObject(SearchData[index][Search_Model],
		SearchData[index][SearchX], SearchData[index][SearchY], SearchData[index][SearchZ]+1.0,
		SearchData[index][SearchRX], SearchData[index][SearchRY], SearchData[index][SearchRZ],
		-1, -1, playerid
	);
	
	for(new i = 0; i < 16; i++) SetDynamicObjectMaterial(HighLightObject[playerid], i, -1, "none", "none", 0xFFFF0000);

	return 1;
}

YCMD:gtahide(playerid, arg[], help)
{
	if(help)
	{
		SendClientMessage(playerid, STEALTH_ORANGE, "______________________________________________");
		SendClientMessage(playerid, STEALTH_GREEN, "Hide a \"highlighted\" San Andreas building.");
		return 1;
	}

	if(HighLightObject[playerid] > -1)
	{
		DestroyDynamicObject(HighLightObject[playerid]);
        HighLightObject[playerid] = -1;
	}

	return 1;
}

YCMD:remobject(playerid, arg[], help)
{
	if(help)
	{
		SendClientMessage(playerid, STEALTH_ORANGE, "______________________________________________");
		SendClientMessage(playerid, STEALTH_GREEN, "Destroy a San Andreas building. (CAUTION: Permanent!)");
		return 1;
	}

    MapOpenCheck();

	if(isnull(arg)) return SendClientMessage(playerid, STEALTH_YELLOW, "You must provide an index to delete!");
	new line[128], index = strval(arg);

	if(index < 0 || index >= SEARCH_DATA_SIZE)
	{
		format(line, sizeof(line), "Index must be between 0 and %i", SEARCH_DATA_SIZE-1);
	    return SendClientMessage(playerid, STEALTH_YELLOW, line);
	}

	if(GTAObjectDeleted[index] == true) return SendClientMessage(playerid, STEALTH_YELLOW, "That object is already deleted!");

    GTAObjectDeleted[index] = true;
    
	AddRemoveBuilding(SearchData[index][Search_Model], SearchData[index][SearchX], SearchData[index][SearchY], SearchData[index][SearchZ], 0.25, true);
	if(SearchData[index][Search_LODModel] != INVALID_OBJECT_ID) AddRemoveBuilding(SearchData[index][Search_LODModel], SearchData[index][SearchX], SearchData[index][SearchY], SearchData[index][SearchZ], 0.25, true);

	UpdateDynamic3DTextLabelText(GTAObjectText[index],
		(GTAObjectDeleted[index] ? (GTAObjectSwapped[index] ? 0x5A34FFFF : 0xF51414FF) : 0xFF69B4FF),
		sprintf("Index: %i\nName: %s\nModelID: %i", index, SearchData[index][Search_Model_Name], SearchData[index][Search_Model]));

	SendClientMessage(playerid, STEALTH_YELLOW, "Object has been removed!");
	
	return 1;
}

YCMD:swapbuilding(playerid, arg[], help)
{
	if(help)
	{
		SendClientMessage(playerid, STEALTH_ORANGE, "______________________________________________");
		SendClientMessage(playerid, STEALTH_GREEN, "Destroys a San Andreas building and creates a map object in it's place.");
		return 1;
	}

    MapOpenCheck();


	if(isnull(arg)) return SendClientMessage(playerid, STEALTH_YELLOW, "You must provide an index to swap!");
	new line[128], index = strval(arg);

	if(index < 0 || index >= SEARCH_DATA_SIZE)
	{
		format(line, sizeof(line), "Index must be between 0 and %i", SEARCH_DATA_SIZE-1);
	    return SendClientMessage(playerid, STEALTH_YELLOW, line);
	}

	if(GTAObjectSwapped[index] == true) return SendClientMessage(playerid, STEALTH_YELLOW, "That object is already swapped!");

	if(GTAObjectDeleted[index] == false)
	{
		AddRemoveBuilding(SearchData[index][Search_Model], SearchData[index][SearchX], SearchData[index][SearchY], SearchData[index][SearchZ], 0.25, true);
		if(SearchData[index][Search_LODModel] != INVALID_OBJECT_ID) AddRemoveBuilding(SearchData[index][Search_LODModel], SearchData[index][SearchX], SearchData[index][SearchY], SearchData[index][SearchZ], 0.25, true);
	    GTAObjectDeleted[index] = true;
	}

	// Swap object
	UpdateObject3DText(AddDynamicObject(SearchData[index][Search_Model], SearchData[index][SearchX], SearchData[index][SearchY], SearchData[index][SearchZ], SearchData[index][SearchRX], SearchData[index][SearchRY], SearchData[index][SearchRZ]), true);
    GTAObjectSwapped[index] = true;

	UpdateDynamic3DTextLabelText(GTAObjectText[index],
		(GTAObjectDeleted[index] ? (GTAObjectSwapped[index] ? 0x5A34FFFF : 0xFF345AFF) : 0xFF69B4FF),
		sprintf("Index: %i\nName: %s\nModelID: %i", index, SearchData[index][Search_Model_Name], SearchData[index][Search_Model]));
	
	SendClientMessage(playerid, STEALTH_YELLOW, "Object has been swapped!");
	return 1;
}

