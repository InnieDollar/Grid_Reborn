#Include SendCHP.ahk
#NoTrayIcon
;global PrAy_Txt
Thread_Label=Dmg
SendCHP(True, "ReceiveData1")
AlphaArray := Array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z") ;,1,2,3,4,5,6,7,8,9,0)
UIDhits := " hits "
UIDtakes := " takes "
UIDYou := " You take "
CFle = %A_AppData%\Advanced Combat Tracker\FFXIVLogs\Network_%A_Year%%A_Mon%%A_DD%.log
LineRead = 8
PrAy := array("Restart","Player 2","Player 3","Player 4","Player 5","Player 6","Player 7","Player 8")
PrAy_Txt := "Restart|Player 2|Player 3|Player 4|Player 5|Player 6|Player 7|Player 8"
GoSub, EndLs_DmgGrab
return

EndLs_DmgGrab:
SendCHP("Grid_Reborn", "GrabHP," Nothing)
Forever = 1
While Forever = 1
{
	Dmg_FLe =
	FileReadLine, Dmg_FLe, %CFle%, %LineRead%
	If Dmg_FLe <>
	{
		stringleft,HdrCheckD, Dmg_FLe, 2
		If HdrCheckD = 24
		{
			IsDot = 0
			TpDotHot_Array := array()
			Loop,Parse, Dmg_FLe, |
			{
				TpDotHot_Array.insert(A_Loopfield)
				If A_Index = 5										;The actual word "DoT"
				{
					If A_LoopField = DoT
					{
						;LastDmg := A_TickCount					; actually the game doesnt count this as combat 7/26/2015
						IsDot = 1
					}
					else
					{
						break
					}
				}
			}
			If IsDot = 1
			{
				GoSub, Dot_Dmg					;array has alaready been made
			}
			
		}
		else
		{
			If HdrCheckD = 00
			{
				Ifinstring, Dmg_FLe, damage
				{
					GoSub, Dmg_Check
				}
			}
		}
			LineRead += 1
	}
	Sleep, 2
}

;settimer, EndLs_DmgGrab, 0
return

ReceiveData1:
PrAy := array()
Loop, Parse, PrAy_Txt, |
{
	PrAy.insert(A_Loopfield)
}
;msgbox updated damage
Return


Dmg_Check:
TpBS := Dmg_FLe
TpL2 := Dmg_FLe
CTL := Strlen(TpBS)
CTp := CTL - 6
CTText := Substr(TpBS,CTp,6)
TpBS1 := TpBS
FNTp = NoWay
LNTp =JoseCanseco
FullName = NPC
Ifinstring TpBS, %UIDhits%
{
	Loop % CTL - 2
	{
		TpBS1 := Substr(TpBS1,2)
		TpBS2 := SubStr(TpBS1,1,6)
		;msgbox TpBS2:%TpBS2%`n`n|%UIDhits%|
		If TpBS2 = %UIDhits%
		{
			TpBS1 := SubStr(TpBS1,5)
			TpBS1Len := Strlen(TpBS1)
			FoundAlpha = 0
			Loop % StrLen(TpBS1)
			{
				If FoundAlpha = 0
				{
					;msgbox This Far HITS
					TpBS1 := SubStr(TpBS1,2)
					HeaderCheck := SubStr(TpBS1, 1,1)
					for index, AlphaChar in AlphaArray																		;Shared
					{
						;msgbox Alpha:%AlphaChar%`n`nHeaderCheck:%HeaderCheck%
						if HeaderCheck = %AlphaChar%
						{
							FoundAlpha = 1
						}
					}
				}
			}

			Loop,parse,TpBS1,%A_Space%
			{
				FNTp = %A_LoopField%
				FNLen := StrLen(FNTp)
				FNL2 := FNLen + 2
				break
			}
			TpBS1 := Substr(TpBS1,FNL2)
			TpBS3 := Substr(TpBS1,1)
			FoundAlpha = 1
			Loop % StrLen(TpBS1)
			{
				If FoundAlpha = 1
				{
					HeaderCheck := SubStr(TpBS3,1,1)
					FoundAlphaX = 0
					for index, AlphaChar in AlphaArray																		;Shared
					{
						if HeaderCheck = %AlphaChar%
						{
							FoundAlphaX = 1
						}
					}
					If FoundAlphaX = 0
					{
						FoundAlpha = 0
					}
					else
					{
						TpBS3 := SubStr(TpBS3,2)
					}
				}
			}
			TpBS3Len := strlen(TpBS3)
			TpBS1Len := strlen(TpBS1)
			FinalPos := TpBS1Len - TpBS3Len
			LNTp := substr(TpBS1,1,FinalPos)
			FullName = %FNTp% %LNTp%
			;msgbox Hits:%FullName%
			If FNTp = You
			{
				FullName = You
			}
		}
	}
}
else
{
	Ifinstring TpBS, %UIDtakes%
	{

		;PrAy:=DllCall(A_AhkPath "\ahkgetvar","Obj","PrAy") ;,"UInt",0,"Obj")
		;msgbox % PrAy.maxindex()
		For index2, PlayName in PrAy																		;Shared
		{
			;msgbox PlayNAme:%PlayName%
			Ifinstring, TpBS, %PlayName%
			{
				Stringgetpos, StPs, TpBS, %PlayName%
				TpBSLen := StrLen(TpBS)
				StPs := TpBSLen - StPs
				StringRight, TpBS1, TpBS, %StPs% 
				Loop, Parse, TpBS1, %A_Space%
				{
					FNTp = %A_LoopField%
					break
				}
				FNLen := strlen(FNTp)
				FNL2 := FNLen + 2
				TpBS1 := Substr(TpBS1,FNL2)
				TpBS3 := Substr(TpBS1,1)
				FoundAlpha = 1
				Loop % StrLen(TpBS1)
				{
					If FoundAlpha = 1
					{
						HeaderCheck := SubStr(TpBS3,1,1)
						FoundAlphaX = 0
						for index, AlphaChar in AlphaArray																		;Shared
						{
							if HeaderCheck = %AlphaChar%
							{
								FoundAlphaX = 1
							}
						}
						If FoundAlphaX = 0
						{
							FoundAlpha = 0
						}
						else
						{
							TpBS3 := SubStr(TpBS3,2)
						}
					}
				}
				TpBS3Len := strlen(TpBS3)
				TpBS1Len := strlen(TpBS1)
				FinalPos := TpBS1Len - TpBS3Len
				LNTp := substr(TpBS1,1,FinalPos)
				;msgbox Takes:%FNTp% %LNTp%
				break
			}
		}
			FullName = %FNTp% %LNTp%
	}
}
IfinString,TpL2,%UIDYou%
{
	FullName = You
	;msgbox Found You`n`nTPL2:%TPL2%
}
else
{
	;msgbox Didnt Found You`n`nTPL2:%TPL2%
}

CTLen := Strlen(TpL2)
StPs := CTLen - 8
TpBS := SubStr(TpL2, 1, StPs)
OpenParan = (
Comma = ,
CloseParan = )
PosPrev := StPs
DmgTotal =
StrTp := substr(TpL2,StPs,1)
FoundSpace = 0
If StrTp != %CloseParan%
{
	Loop 7
	{
		If FoundSpace = 0
		{
			StringRight ,FtrCheck, TpBS, 1
			if FtrCheck != %A_Space%
			{
				DmgTotal = %FtrCheck%%DmgTotal%
			}
			else
			{
				FoundSpace = 1
			}
				PosPrev -= 1
				StringLeft , TpBS, TpBS, PosPrev
		}
	}
}
else
{
	OpLoc =
	StringGetPos, OPLoc, TpBS, %OpenParan%
	OPLocNew := OPLoc - 2
	TpBS := substr(TpBS,1,OPLocNew)
	Loop 15
	{
		Loop 7
		{
			If FoundSpace = 0
			{
				StringRight ,FtrCheck, TpBS, 1
				if FtrCheck != %A_Space%
				{
					DmgTotal = %FtrCheck%%DmgTotal%
				}
				else
				{
					FoundSpace = 1
				}
					PosPrev -= 1
					StringLeft , TpBS, TpBS, PosPrev
			}
		}
	}
	DTLen := StrLen(DmgTotal)
	DTNew := DTLen - 10
	DmgTotal := Substr(DmgTotal,1,DTNew)
}
;msgbox FullName:%FullName%
If DmgTotal =
{
	DmgTotal = 0
}
If FullName = 
{
	FullName = NPC
}
If FullName = You
{
	;msgbox Headed to You Damage
	GoSub, DmgP1
}
else
{
	For Index, PName in PrAy																		;Shared
	{
		;msgbox Name:%A_Loopfield%`n`nPName:%PName%
		If Pname = %FullName%
		{
			;msgbox Headed to Team Damage
			GoSub, DmgGo
			break
		}
	}
}


return

DmgGO:
;CHP%Index%:=DllCall(A_AhkPath "\ahkgetvar","Str","CHP"Index,"UInt",0,"Str")												; Update this
;SendCHP("Grid_Reborn", "GrabHP," Nothing)
;sleep, 10
CHPX := CHP%index%																		
CHP%index% := CHPX - DmgTotal																		
CHPX := CHP%index%	

If CHP%index% < 1
{
	CHPX = 1
	TCHPX = TCHP%index%`,
	SendCHP("Grid_Reborn", TCHPX CHPX)
}
else
{
	TCHPX = TCHP%index%`,
	SendCHP("Grid_Reborn", TCHPX CHPX)
}
return

DmgP1:
;CHP1:=DllCall(A_AhkPath "\ahkgetvar","Str","CHP1","UInt",0,"Str")												; Update this
;SendCHP("Grid_Reborn", "GrabHP," Nothing)
;sleep, 10
CHP1 := CHP1 - DmgTotal
If CHP1 < 1
{
	CHP1 = 1
	SendCHP("Grid_Reborn", "TCHP1," CHP1)
}
else
{
	SendCHP("Grid_Reborn", "TCHP1," CHP1)
}
return

Dot_Dmg:
DotHotTemp:=Dmg_FLe
TempDotHot_Array := array()									; can change this later to reflect already created array - TpDotHot_Array
Loop,Parse, DotHotTemp, |
{
	TempDotHot_Array.insert(A_Loopfield)
}
HotDot_Check := TempDotHot_Array[5]
NameChck := TempDotHot_Array[4]
HealthAmountHT := TempDotHot_Array[7]
HealthAmountHT = 0x%HealthAmountHT%
HealthAmountHT := HealthAmountHT + 0
If HotDot_Check = DoT
{
	For DDIndex, DDPlayer in PrAy
	{
		If DDPlayer = %NameChck%
		{
			If HealthAmountHT =
			{
				HealthAmountHT = 0
			}
			;CHP%DDIndex%:=DllCall(A_AhkPath "\ahkgetvar","Str","CHP"DDIndex,"UInt",0,"Str")														; Update this
			;SendCHP("Grid_Reborn", "GrabHP," Nothing)
			sleep, 10
			CHPXDD := CHP%DDIndex% - HealthAmountHT
			If CHPXDD < 1
			{
				CHPXDD := 1
			}
			TCHPX = TCHP%DDindex%`,
			SendCHP("Grid_Reborn", TCHPX CHPXDD)
			;Mainthread.ahkassign.("TCHP"DDindex):=%CHPXDD%
			;msgbox,4096,, Dot Subtracted,1
			break
		}
	}
}
return
