#include <a_samp>
#include <physics>


main() { }

public OnGameModeInit()
{
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);

	/*PHY_CreateWall(1961.4270, 1339.6151, 1961.4269, 1346.3175);
	PHY_CreateWall(1961.4269, 1346.3175, 1951.4360, 1345.8835);
	PHY_CreateWall(1951.4360, 1345.8835, 1951.5145, 1340.2163);
	PHY_CreateWall(1951.5145, 1340.2163, 1961.4270, 1339.6151);*/
	PHY_CreateArea(1951.43, 1339.61, 1961.43, 1345.88);

	CreateObject(1352, 1957.0, 1344.1, 15.3746 - 1.2, 0, 0, 0); // Traffic light
	PHY_CreateCylinder(1957.0, 1344.1 + 0.13, 0.3);

	return 1;
}


public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/3d", cmdtext, true, 10) == 0)
	{
		new a = CreateObject(1598, 1960.3783, 1344.0, 15.3746-0.69, 0, 0, 0);
		new b = CreateObject(2114, 1954.3783, 1344.0, 15.3746-0.69, 0, 0, 0);
		PHY_InitObject(a, 1598, 1.4);
		PHY_InitObject(b, 2114, 1.0);
		PHY_SetObjectVelocity(a, -4.0, 0.0, 5.5);
		PHY_SetObjectVelocity(b, 4.0, 0.0, 5.5);
		PHY_RollObject(a);
		PHY_RollObject(b);
		PHY_SetObjectFriction(a, 0.25);
		PHY_SetObjectFriction(b, 0.25);
		PHY_SetObjectAirResistance(a, 0.1);
		PHY_SetObjectAirResistance(b, 0.1);
		PHY_SetObjectGravity(a, 7.1);
		PHY_SetObjectGravity(b, 7.1);
		PHY_SetObjectZBound(a, _, _, 0.5);
		PHY_SetObjectZBound(b, _, _, 0.5);
		return 1;
	}
	if (strcmp("/2d", cmdtext, true, 10) == 0)
	{
		new a = CreateObject(1598, 1960.3783, 1344.0, 15.3746-0.69, 0, 0, 0);
		new b = CreateObject(2114, 1954.3783, 1344.0, 15.3746-0.69, 0, 0, 0);
		PHY_InitObject(a, 1598, 1.0, _, PHY_MODE_2D);
		PHY_InitObject(b, 2114, 1.0, _, PHY_MODE_2D);
		PHY_SetObjectVelocity(a, 4.0, 0.0);
		PHY_SetObjectVelocity(b, 0.0, 4.0);
		PHY_RollObject(a);
		PHY_RollObject(b);
		PHY_SetObjectFriction(a, 0.25);
		PHY_SetObjectFriction(b, 0.25);
		PHY_SetObjectAirResistance(a, 0.1);
		PHY_SetObjectAirResistance(b, 0.1);
		return 1;
	}
	return 0;
}

command(launch, playerid, params[])
{
	#define SPEED (10.0)
	#define Z_SPEED (4.0)
	#define GRAVITY (13.0)
        new modelid = 348; // Deagle Model ID
	new Float:x, Float:y, Float:z, Float:ang;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, ang);
	new obj = CreateObject(modelid, x, y - 0.5 * floatcos(-(ang + 90.0), degrees), z, 93.7, 120.0, ang + 60.0);
 	PHY_InitObject(obj);
	PHY_MoveObject(obj, SPEED * floatsin(-ang, degrees), SPEED * floatcos(-ang, degrees), Z_SPEED);
	PHY_SetObjectFriction(obj, 100); // This will stop the object when it touchs the ground.
	PHY_SetObjectGravity(obj, GRAVITY);
	PHY_SetObjectZBound(obj, z - 1.0, _, 0.0);
	ApplyAnimation(playerid,"GRENADE","WEAPON_throwu",3.0,0,0,0,0,0);
	return 1;
}