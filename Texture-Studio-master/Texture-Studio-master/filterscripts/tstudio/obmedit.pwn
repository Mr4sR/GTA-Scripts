#include <YSI\y_hooks>

#define         OBM_NONE        0
#define         OBM_CIRCLE      1
#define         OBM_SPIRAL      2
#define         OBM_CLYINDER    3
#define         OBM_WHIRL       4
#define         OBM_CIRCLEIN    5
#define         OBM_CIRCLEOUT   6

#define         OBME_ORIGIN     0
#define         OMBE_ORIENT     1

static const OBMTypes[][] = {
	"None",
	"Objectmetry Circle",
	"Objectmetry Spiral",
	"Objectmetry Cylinder",
	"Objectmetry Whirl",
	"Objectmetry Circle In",
	"Objectmetry Circle Out"
};

static const FaceCenterOnOff[][] = { "True", "False" };

static OBMObject[MAX_PLAYERS];

enum pOBMINFO
{
	pOBMType,
	pOBMModel,
	pOBMParts,
	pOBMDegrees,
	Float:pOBMOriginX,
	Float:pOBMOriginY,
	Float:pOBMOriginZ,
	Float:pOBMOriginRX,
	Float:pOBMOriginRY,
	Float:pOBMOriginRZ,
	Float:pOBMOrientationRX,
	Float:pOBMOrientationRY,
	Float:pOBMOrientationRZ,
	Float:pOBMRadius,
	Float:pOBMhsep,
	Float:pOBMvsep,
	bool:pOBMfacecenter,
	bool:OriginSet,
}

static OBMData[MAX_PLAYERS][pOBMINFO];
static Float:OBMOriginSave[MAX_PLAYERS][6];
static Float:OBMOrientationSave[MAX_PLAYERS][3];
static OBMEditMode[MAX_PLAYERS];

hook OnFilterScriptInit()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    OBMData[i][pOBMParts] = 10;
	    OBMData[i][pOBMDegrees] = 360;
	}
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    ResetOBMValues(playerid);
	return 1;
}

YCMD:obmedit(playerid, arg[], help)
{
	if(help)
	{
		SendClientMessage(playerid, STEALTH_ORANGE, "______________________________________________");
		SendClientMessage(playerid, STEALTH_GREEN, "Create an \"objectmetry\" masterpiece.");
		return 1;
	}

   	NoEditingMode(playerid);

    MapOpenCheck();

    EditingMode[playerid] = true;
    
    SetEditMode(playerid, EDIT_MODE_OBM);
    
	UpdateOBM(playerid);
    OBMEditor(playerid);

	return 1;
}

static ResetOBMValues(playerid)
{
    OBMData[playerid][pOBMType] = 0;
    OBMData[playerid][pOBMModel] = 0;
    OBMData[playerid][pOBMParts] = 10;
    OBMData[playerid][pOBMDegrees] = 360;
    OBMData[playerid][pOBMOriginX] = 0.0;
    OBMData[playerid][pOBMOriginY] = 0.0;
    OBMData[playerid][pOBMOriginZ] = 0.0;
    OBMData[playerid][pOBMOriginRX] = 0.0;
    OBMData[playerid][pOBMOriginRY] = 0.0;
    OBMData[playerid][pOBMOriginRZ] = 0.0;
    OBMData[playerid][pOBMOrientationRX] = 0.0;
    OBMData[playerid][pOBMOrientationRY] = 0.0;
    OBMData[playerid][pOBMOrientationRZ] = 0.0;
    OBMData[playerid][pOBMRadius] = 0.0;
    OBMData[playerid][pOBMhsep] = 0.0;
    OBMData[playerid][pOBMvsep] = 0.0;
    OBMData[playerid][pOBMfacecenter] = false;
    OBMData[playerid][OriginSet] = false;
	return 1;
}

static OBMEditor(playerid)
{
	new line[1024];
	inline OBMEdit(opid, odialogid, oresponse, olistitem, string:otext[])
	{
		#pragma unused olistitem, odialogid, opid, otext

	    if(oresponse)
		{
			switch(olistitem)
			{
				// Set type
			    case 0:
			    {
					inline OBMType(tpid, tdialogid, tresponse, tlistitem, string:ttext[])
					{
						#pragma unused tlistitem, tdialogid, tpid, ttext
						if(tresponse) OBMData[playerid][pOBMType] = tlistitem;
						OBMEditor(playerid);
						UpdateOBM(playerid);
					}
					line[0] = '\0';
					for(new i = 0; i < sizeof(OBMTypes); i++) format(line, sizeof(line), "%s%s\n", line, OBMTypes[i]);
					Dialog_ShowCallback(playerid, using inline OBMType, DIALOG_STYLE_LIST, "Texture Studio", line, "Ok", "Cancel");
			    }
			    
				// Model
			    case 1:
			    {
					inline OBMModel(mpid, mdialogid, mresponse, mlistitem, string:mtext[])
					{
						#pragma unused mlistitem, mdialogid, mpid, mtext
						if(mresponse)
						{
							new model = strval(mtext);
							OBMData[playerid][pOBMModel] = model;
							UpdateOBM(playerid);
						}
      					OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMModel, DIALOG_STYLE_INPUT, "Texture Studio", "Select a model", "Ok", "Cancel");
			    }
			    
			    // Parts
			    case 2:
			    {
					inline OBMParts(ppid, pdialogid, presponse, plistitem, string:ptext[])
					{
						#pragma unused plistitem, pdialogid, ppid, ptext
						if(presponse)
						{
							new parts = strval(ptext);
							if(parts < 1) SendClientMessage(playerid, STEALTH_GREEN, "You must have at least 1 part");
							else if(parts > 1000) SendClientMessage(playerid, STEALTH_GREEN, "Too many parts");
							else
							{
							    OBMData[playerid][pOBMParts] = parts;
							    UpdateOBM(playerid);
							}
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMParts, DIALOG_STYLE_INPUT, "Texture Studio", "Number of parts", "Ok", "Cancel");
			    }
			    
			    // Degrees
			    case 3:
			    {
					inline OBMDegrees(degpid, degdialogid, degresponse, deglistitem, string:degtext[])
					{
						#pragma unused deglistitem, degdialogid, degpid, degtext
						if(degresponse)
						{
							new deg = strval(degtext);
							if(deg < 1) SendClientMessage(playerid, STEALTH_GREEN, "You must have at least 1 degree");
							else if(deg > 3600) SendClientMessage(playerid, STEALTH_GREEN, "Excessive degrees");
							else
							{
							    OBMData[playerid][pOBMDegrees] = deg;
							    UpdateOBM(playerid);
							}
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMDegrees, DIALOG_STYLE_INPUT, "Texture Studio", "Degrees (Integer)", "Ok", "Cancel");
			    }


			    
				// Horizontal seperation
			    case 4:
			    {
					inline OBMHS(hpid, hdialogid, hresponse, hlistitem, string:htext[])
					{
						#pragma unused hlistitem, hdialogid, hpid, htext
						if(hresponse)
						{
						    OBMData[playerid][pOBMhsep] = floatstr(htext);
						    UpdateOBM(playerid);
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMHS, DIALOG_STYLE_INPUT, "Texture Studio", "Horizontal Seperation or Seperation", "Ok", "Cancel");
			    }
			
				// Vertical Seperation
			    case 5:
			    {
					inline OBMVS(vpid, vdialogid, vresponse, vlistitem, string:vtext[])
					{
						#pragma unused vlistitem, vdialogid, vpid, vtext
						if(vresponse)
						{
						    OBMData[playerid][pOBMvsep] = floatstr(vtext);
						    UpdateOBM(playerid);
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMVS, DIALOG_STYLE_INPUT, "Texture Studio", "Veritcal Seperation", "Ok", "Cancel");
			    }
			    
			    // Face Center
				case 6:
				{
					inline OBMFaceCenter(fpid, fdialogid, fresponse, flistitem, string:ftext[])
					{
						#pragma unused flistitem, fdialogid, fpid, ftext
						if(fresponse) OBMData[playerid][pOBMfacecenter] = true;
						else OBMData[playerid][pOBMfacecenter] = false;
						UpdateOBM(playerid);
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMFaceCenter, DIALOG_STYLE_MSGBOX, "Texture Studio", "Face Center", "On", "Off");
				}
				
				// OriginX
				case 7:
				{
					inline OBMOX(oxpid, oxdialogid, oxresponse, oxlistitem, string:oxtext[])
					{
						#pragma unused oxlistitem, oxdialogid, oxpid, oxtext
						if(oxresponse)
						{
						    OBMData[playerid][pOBMOriginX] = floatstr(oxtext);
						    UpdateOBM(playerid);
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMOX, DIALOG_STYLE_INPUT, "Texture Studio", "Origin X", "Ok", "Cancel");
				}
				
                // OriginY
				case 8:
				{
					inline OBMOY(oypid, oydialogid, oyresponse, oylistitem, string:oytext[])
					{
						#pragma unused oylistitem, oydialogid, oypid, oytext
						if(oyresponse)
						{
						    OBMData[playerid][pOBMOriginY] = floatstr(oytext);
						    UpdateOBM(playerid);
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMOY, DIALOG_STYLE_INPUT, "Texture Studio", "Origin Y", "Ok", "Cancel");
				}

                // OriginZ
				case 9:
				{
					inline OBMOZ(ozpid, ozdialogid, ozresponse, ozlistitem, string:oztext[])
					{
						#pragma unused ozlistitem, ozdialogid, ozpid, oztext
						if(ozresponse)
						{
						    OBMData[playerid][pOBMOriginZ] = floatstr(oztext);
						    UpdateOBM(playerid);
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMOZ, DIALOG_STYLE_INPUT, "Texture Studio", "Origin Z", "Ok", "Cancel");
				}

				// OriginRX
				case 10:
				{
					inline OBMORX(orxpid, orxdialogid, orxresponse, orxlistitem, string:orxtext[])
					{
						#pragma unused orxlistitem, orxdialogid, orxpid, orxtext
						if(orxresponse)
						{
						    OBMData[playerid][pOBMOriginRX] = floatstr(orxtext);
						    UpdateOBM(playerid);
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMORX, DIALOG_STYLE_INPUT, "Texture Studio", "Origin RX", "Ok", "Cancel");


				}

                // OriginRY
				case 11:
				{
					inline OBMORY(orypid, orydialogid, oryresponse, orylistitem, string:orytext[])
					{
						#pragma unused orylistitem, orydialogid, orypid, orytext
						if(oryresponse)
						{
						    OBMData[playerid][pOBMOriginRY] = floatstr(orytext);
						    UpdateOBM(playerid);
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMORY, DIALOG_STYLE_INPUT, "Texture Studio", "Origin RY", "Ok", "Cancel");
				}

                // OriginRZ
				case 12:
				{
					inline OBMORZ(orzpid, orzdialogid, orzresponse, orzlistitem, string:orztext[])
					{
						#pragma unused orzlistitem, orzdialogid, orzpid, orztext
						if(orzresponse)
						{
						    OBMData[playerid][pOBMOriginRZ] = floatstr(orztext);
						    UpdateOBM(playerid);
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMORZ, DIALOG_STYLE_INPUT, "Texture Studio", "Origin RZ", "Ok", "Cancel");

				}

                // OrientationRX
				case 13:
				{
					inline OBMORTRX(ortrxpid, ortrxdialogid, ortrxresponse, ortrxlistitem, string:ortrxtext[])
					{
						#pragma unused ortrxlistitem, ortrxdialogid, ortrxpid, ortrxtext
						if(ortrxresponse)
						{
						    OBMData[playerid][pOBMOrientationRX] = floatstr(ortrxtext);
						    UpdateOBM(playerid);
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMORTRX, DIALOG_STYLE_INPUT, "Texture Studio", "Orientation RX", "Ok", "Cancel");
				}

                // OrientationRY
				case 14:
				{
					inline OBMORTRY(ortrypid, ortrydialogid, ortryresponse, ortrylistitem, string:ortrytext[])
					{
						#pragma unused ortrylistitem, ortrydialogid, ortrypid, ortrytext
						if(ortryresponse)
						{
						    OBMData[playerid][pOBMOrientationRY] = floatstr(ortrytext);
						    UpdateOBM(playerid);
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMORTRY, DIALOG_STYLE_INPUT, "Texture Studio", "Orientation RY", "Ok", "Cancel");
				}

                // OrientationRZ
				case 15:
				{
					inline OBMORTRZ(ortrzpid, ortrzdialogid, ortrzresponse, ortrzlistitem, string:ortrztext[])
					{
						#pragma unused ortrzlistitem, ortrzdialogid, ortrzpid, ortrztext
						if(ortrzresponse)
						{
						    OBMData[playerid][pOBMOrientationRZ] = floatstr(ortrztext);
						    UpdateOBM(playerid);
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMORTRZ, DIALOG_STYLE_INPUT, "Texture Studio", "Orientation RZ", "Ok", "Cancel");
				}

                // Radius
				case 16:
				{
					inline OBMRadius(rpid, rdialogid, rresponse, rlistitem, string:rtext[])
					{
						#pragma unused rlistitem, rdialogid, rpid, rtext
						if(rresponse)
						{
						    OBMData[playerid][pOBMRadius] = floatstr(rtext);
						    UpdateOBM(playerid);
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMRadius, DIALOG_STYLE_INPUT, "Texture Studio", "Radius", "Ok", "Cancel");
				}


                // Set origin
				case 17:
				{
					if(!OBMData[playerid][OriginSet])
					{
						new Float:x, Float:y, Float:z, Float:fa;
						GetPosFaInFrontOfPlayer(playerid, 2.0, x, y, z, fa);
						OBMObject[playerid] = CreateDynamicObject(1974, x, y, z, 0.0, 0.0, 0.0, -1, -1, playerid);
					}
					else OBMObject[playerid] = CreateDynamicObject(1974, OBMData[playerid][pOBMOriginX], OBMData[playerid][pOBMOriginY], OBMData[playerid][pOBMOriginZ], OBMData[playerid][pOBMOriginRX], OBMData[playerid][pOBMOriginRY], OBMData[playerid][pOBMOriginRZ], -1, -1, playerid);

                    OBMOriginSave[playerid][0] = OBMData[playerid][pOBMOriginX];
                    OBMOriginSave[playerid][1] = OBMData[playerid][pOBMOriginY];
                    OBMOriginSave[playerid][2] = OBMData[playerid][pOBMOriginZ];
                    OBMOriginSave[playerid][3] = OBMData[playerid][pOBMOriginRX];
                    OBMOriginSave[playerid][4] = OBMData[playerid][pOBMOriginRY];
                    OBMOriginSave[playerid][5] = OBMData[playerid][pOBMOriginRZ];

					Streamer_SetFloatData(STREAMER_TYPE_OBJECT, OBMObject[playerid], E_STREAMER_DRAW_DISTANCE, 300.0);

					SetDynamicObjectMaterial(OBMObject[playerid], 0, 10765, "airportgnd_sfse", "white", -256);

					Streamer_Update(playerid);

					EditDynamicObject(playerid, OBMObject[playerid]);

                    OBMEditMode[playerid] = OBME_ORIGIN;

					SendClientMessage(playerid, STEALTH_ORANGE, "______________________________________________");
				    SendClientMessage(playerid, STEALTH_GREEN, "Editing your objectmetry origin");
				}
				
				// Set rotation orientation
				case 18:
				{
					if(!OBMData[playerid][OriginSet]) 
					{
					    SendClientMessage(playerid, STEALTH_YELLOW, "Please set your origin first");
					    OBMEditor(playerid);
					}
					else
					{
						OBMObject[playerid] = CreateDynamicObject(1974, OBMData[playerid][pOBMOriginX], OBMData[playerid][pOBMOriginY], OBMData[playerid][pOBMOriginZ], OBMData[playerid][pOBMOrientationRX], OBMData[playerid][pOBMOrientationRY], OBMData[playerid][pOBMOrientationRZ], -1, -1, playerid);

	                    OBMOrientationSave[playerid][0] = OBMData[playerid][pOBMOrientationRX];
	                    OBMOrientationSave[playerid][1] = OBMData[playerid][pOBMOrientationRY];
	                    OBMOrientationSave[playerid][2] = OBMData[playerid][pOBMOrientationRZ];

						Streamer_SetFloatData(STREAMER_TYPE_OBJECT, OBMObject[playerid], E_STREAMER_DRAW_DISTANCE, 300.0);

						SetDynamicObjectMaterial(OBMObject[playerid], 0, 10765, "airportgnd_sfse", "white", -256);

						Streamer_Update(playerid);

						EditDynamicObject(playerid, OBMObject[playerid]);

						OBMEditMode[playerid] = OMBE_ORIENT;

						SendClientMessage(playerid, STEALTH_ORANGE, "______________________________________________");
					    SendClientMessage(playerid, STEALTH_GREEN, "Editing your rotation orientation");
					}
				}

				// Apply objects to map
				case 19:
				{
					inline OBMApply(apid, adialogid, aresponse, alistitem, string:atext[])
					{
						#pragma unused alistitem, adialogid, apid, atext
						if(aresponse)
						{
		   				    ApplyOBM(playerid);
							SendClientMessage(playerid, STEALTH_ORANGE, "______________________________________________");
						    SendClientMessage(playerid, STEALTH_GREEN, "Current objectmetry applied to your map");
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMApply, DIALOG_STYLE_MSGBOX, "Texture Studio", "Apply this objectmetry to your map?", "On", "Off");
				}

				// Reset values
				case 20:
				{
					inline OBMReset(epid, edialogid, eresponse, elistitem, string:etext[])
					{
						#pragma unused elistitem, edialogid, epid, etext
						if(eresponse)
						{
							ResetOBMValues(playerid);
							ClearOBMStack(playerid);
						}
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMReset, DIALOG_STYLE_MSGBOX, "Texture Studio", "Reset all values?", "Ok", "Cancel");
				}
				
				// Hide object stack
				case 21:
				{
					inline OBMHideStack(hpid, hdialogid, hresponse, hlistitem, string:htext[])
					{
						#pragma unused hlistitem, hdialogid, hpid, htext
						if(hresponse) ClearOBMStack(playerid);
						OBMEditor(playerid);
					}
					Dialog_ShowCallback(playerid, using inline OBMHideStack, DIALOG_STYLE_MSGBOX, "Texture Studio", "Hide objectmetry?", "Ok", "Cancel");
				}
			}
		}
		else
		{
		    EditingMode[playerid] = false;
		    SetEditMode(playerid, EDIT_MODE_NONE);
		}
	}
	
	format(line, sizeof(line), "Set Type: %s\nModel: %i\nParts: %i\nDegrees: %i\nHorizontal Seperation: %f\nVertical Seperation: %f\nFace Center: %s\nOriginX: %f\nOriginY: %f\nOriginZ: %f\nOriginRX: %f\nOriginRY: %f\nOriginRZ: %f\nOrientationRX: %f\nOrientationRY: %f\nOrientationRZ: %f\nRadius: %f\nSet Origin\nSet Rotation Orientation\nApply Objects to map\nReset Values\nHide Objects",
	    OBMTypes[OBMData[playerid][pOBMType]],
	    OBMData[playerid][pOBMModel],
	    OBMData[playerid][pOBMParts],
	    OBMData[playerid][pOBMDegrees],
	    OBMData[playerid][pOBMhsep],
	    OBMData[playerid][pOBMvsep],
   	    OBMData[playerid][pOBMfacecenter] ? FaceCenterOnOff[0] : FaceCenterOnOff[1],
   	    OBMData[playerid][pOBMOriginX],
 		OBMData[playerid][pOBMOriginY],
 		OBMData[playerid][pOBMOriginZ],
   	    OBMData[playerid][pOBMOriginRX],
 		OBMData[playerid][pOBMOriginRY],
 		OBMData[playerid][pOBMOriginRZ],
 		OBMData[playerid][pOBMOrientationRX],
 		OBMData[playerid][pOBMOrientationRY],
 		OBMData[playerid][pOBMOrientationRZ],
        OBMData[playerid][pOBMRadius]
	);
	    
	
	Dialog_ShowCallback(playerid, using inline OBMEdit, DIALOG_STYLE_LIST, "Texture Studio", line, "Ok", "Cancel");

	return 1;
}

static UpdateOBM(playerid)
{
	// Clear the stack
    ClearOBMStack(playerid);

	// Apply OBM settings
	if(OBMData[playerid][pOBMModel] > 0)
	{
		switch(OBMData[playerid][pOBMType])
		{
	 		case OBM_NONE: { }
		    case OBM_CIRCLE: { CreateDynamicObjectCircle(playerid,
				OBMData[playerid][pOBMModel],
				OBMData[playerid][pOBMDegrees],
				OBMData[playerid][pOBMOriginX], OBMData[playerid][pOBMOriginY], OBMData[playerid][pOBMOriginZ],
				OBMData[playerid][pOBMOriginRX], OBMData[playerid][pOBMOriginRY], OBMData[playerid][pOBMOriginRZ],
				OBMData[playerid][pOBMOrientationRX], OBMData[playerid][pOBMOrientationRY], OBMData[playerid][pOBMOrientationRZ],
				OBMData[playerid][pOBMRadius],
				OBMData[playerid][pOBMhsep],
				OBMData[playerid][pOBMfacecenter]
			);	}


		    case OBM_SPIRAL: { CreateDynamicObjectSpiral(playerid,
				OBMData[playerid][pOBMModel],
				OBMData[playerid][pOBMDegrees],
				OBMData[playerid][pOBMOriginX], OBMData[playerid][pOBMOriginY], OBMData[playerid][pOBMOriginZ],
				OBMData[playerid][pOBMOriginRX], OBMData[playerid][pOBMOriginRY], OBMData[playerid][pOBMOriginRZ],
				OBMData[playerid][pOBMOrientationRX], OBMData[playerid][pOBMOrientationRY], OBMData[playerid][pOBMOrientationRZ],
				OBMData[playerid][pOBMRadius],
				OBMData[playerid][pOBMhsep],
				OBMData[playerid][pOBMvsep],
				OBMData[playerid][pOBMfacecenter]
			);	}


		    case OBM_CLYINDER: { CreateDynamicObjectCylinder(playerid,
				OBMData[playerid][pOBMModel],
				OBMData[playerid][pOBMDegrees],
				OBMData[playerid][pOBMOriginX], OBMData[playerid][pOBMOriginY], OBMData[playerid][pOBMOriginZ],
				OBMData[playerid][pOBMOriginRX], OBMData[playerid][pOBMOriginRY], OBMData[playerid][pOBMOriginRZ],
				OBMData[playerid][pOBMOrientationRX], OBMData[playerid][pOBMOrientationRY], OBMData[playerid][pOBMOrientationRZ],
				OBMData[playerid][pOBMRadius],
				OBMData[playerid][pOBMhsep],
				OBMData[playerid][pOBMvsep],
				OBMData[playerid][pOBMParts],
				OBMData[playerid][pOBMfacecenter]
			);	}

		    case OBM_WHIRL: { CreateDynamicObjectWhirl(playerid,
				OBMData[playerid][pOBMModel],
				OBMData[playerid][pOBMDegrees],
				OBMData[playerid][pOBMOriginX], OBMData[playerid][pOBMOriginY], OBMData[playerid][pOBMOriginZ],
				OBMData[playerid][pOBMOriginRX], OBMData[playerid][pOBMOriginRY], OBMData[playerid][pOBMOriginRZ],
				OBMData[playerid][pOBMOrientationRX], OBMData[playerid][pOBMOrientationRY], OBMData[playerid][pOBMOrientationRZ],
				OBMData[playerid][pOBMRadius],
				OBMData[playerid][pOBMhsep],
				OBMData[playerid][pOBMfacecenter]
			);	}


		    case OBM_CIRCLEIN: { CreateDynamicCircleIn(playerid,
				OBMData[playerid][pOBMModel],
				OBMData[playerid][pOBMDegrees],
				OBMData[playerid][pOBMOriginX], OBMData[playerid][pOBMOriginY], OBMData[playerid][pOBMOriginZ],
				OBMData[playerid][pOBMOriginRX], OBMData[playerid][pOBMOriginRY], OBMData[playerid][pOBMOriginRZ],
				OBMData[playerid][pOBMOrientationRX], OBMData[playerid][pOBMOrientationRY], OBMData[playerid][pOBMOrientationRZ],
				OBMData[playerid][pOBMRadius],
				OBMData[playerid][pOBMhsep],
				OBMData[playerid][pOBMParts],
				OBMData[playerid][pOBMfacecenter]
			);	}
			
		    case OBM_CIRCLEOUT: { CreateDynamicCircleOut(playerid,
				OBMData[playerid][pOBMModel],
				OBMData[playerid][pOBMDegrees],
				OBMData[playerid][pOBMOriginX], OBMData[playerid][pOBMOriginY], OBMData[playerid][pOBMOriginZ],
				OBMData[playerid][pOBMOriginRX], OBMData[playerid][pOBMOriginRY], OBMData[playerid][pOBMOriginRZ],
				OBMData[playerid][pOBMOrientationRX], OBMData[playerid][pOBMOrientationRY], OBMData[playerid][pOBMOrientationRZ],
				OBMData[playerid][pOBMRadius],
				OBMData[playerid][pOBMhsep],
				OBMData[playerid][pOBMParts],
				OBMData[playerid][pOBMfacecenter]
			);	}

		}
	}
	return 1;
}




OnPlayerEditDOOBM(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	#pragma unused objectid
	
	// Edit origin
	if(OBMEditMode[playerid] == OBME_ORIGIN)
	{
		if(response == EDIT_RESPONSE_FINAL)
		{
	   	    OBMData[playerid][pOBMOriginX] = x;
	 		OBMData[playerid][pOBMOriginY] = y;
	 		OBMData[playerid][pOBMOriginZ] = z;
	   	    OBMData[playerid][pOBMOriginRX] = rx;
	 		OBMData[playerid][pOBMOriginRY] = ry;
	 		OBMData[playerid][pOBMOriginRZ] = rz;
			SendClientMessage(playerid, STEALTH_ORANGE, "______________________________________________");
		    SendClientMessage(playerid, STEALTH_GREEN, "Objectmetry origin set");
			DestroyDynamicObject(OBMObject[playerid]);
	        OBMData[playerid][OriginSet] = true;
			UpdateOBM(playerid);
	        OBMEditor(playerid);
		}
		else if(response == EDIT_RESPONSE_UPDATE)
		{
	   	    OBMData[playerid][pOBMOriginX] = x;
	 		OBMData[playerid][pOBMOriginY] = y;
	 		OBMData[playerid][pOBMOriginZ] = z;
	   	    OBMData[playerid][pOBMOriginRX] = rx;
	 		OBMData[playerid][pOBMOriginRY] = ry;
	 		OBMData[playerid][pOBMOriginRZ] = rz;
	 		UpdateOBM(playerid);

		}
		else if(response == EDIT_RESPONSE_CANCEL)
		{
			OBMData[playerid][pOBMOriginX] = OBMOriginSave[playerid][0];
			OBMData[playerid][pOBMOriginY] = OBMOriginSave[playerid][1];
			OBMData[playerid][pOBMOriginZ] = OBMOriginSave[playerid][2];
			OBMData[playerid][pOBMOriginRX] = OBMOriginSave[playerid][3];
			OBMData[playerid][pOBMOriginRY] = OBMOriginSave[playerid][4];
			OBMData[playerid][pOBMOriginRZ] = OBMOriginSave[playerid][5];

			DestroyDynamicObject(OBMObject[playerid]);
			UpdateOBM(playerid);
			OBMEditor(playerid);
		}
	}
	
	// Edit orientation
	else if(OBMEditMode[playerid] == OMBE_ORIENT)
	{
		if(response == EDIT_RESPONSE_FINAL)
		{
	   	    OBMData[playerid][pOBMOrientationRX] = rx;
	 		OBMData[playerid][pOBMOrientationRY] = ry;
	 		OBMData[playerid][pOBMOrientationRZ] = rz;
			SendClientMessage(playerid, STEALTH_ORANGE, "______________________________________________");
		    SendClientMessage(playerid, STEALTH_GREEN, "Objectmetry orientation set");
			DestroyDynamicObject(OBMObject[playerid]);
			UpdateOBM(playerid);
	        OBMEditor(playerid);
		}
		else if(response == EDIT_RESPONSE_UPDATE)
		{
	   	    OBMData[playerid][pOBMOrientationRX] = rx;
	 		OBMData[playerid][pOBMOrientationRY] = ry;
	 		OBMData[playerid][pOBMOrientationRZ] = rz;
	 		UpdateOBM(playerid);
		}
		else if(response == EDIT_RESPONSE_CANCEL)
		{
			OBMData[playerid][pOBMOrientationRX] = OBMOrientationSave[playerid][0];
			OBMData[playerid][pOBMOrientationRY] = OBMOrientationSave[playerid][1];
			OBMData[playerid][pOBMOrientationRZ] = OBMOrientationSave[playerid][2];

			DestroyDynamicObject(OBMObject[playerid]);
			UpdateOBM(playerid);
			OBMEditor(playerid);
		}
	}
	return 1;
}
