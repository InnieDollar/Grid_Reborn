#Include SendCHP.ahk
#NoTrayIcon
Thread_Label=Heals
SendCHP(True, "ReceiveData1")
UIDRR := " Recover "
UIDRRs := " Recovers "
UIDMercy := "s Mercy Stroke restores"
UIDMercyYou := "Your Mercy Stroke restores"
UIDAbsorb := " absorbs "
UIDYouAbs := " You absorb "
;msgbox Healing Starts`n`nThread_Label:%Thread_Label%
AlphaArray := Array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z") ;,1,2,3,4,5,6,7,8,9,0)
CFle = %A_AppData%\Advanced Combat Tracker\FFXIVLogs\Network_%A_Year%%A_Mon%%A_DD%.log
LineRead = 8
PrAy := array("Restart","Player 2","Player 3","Player 4","Player 5","Player 6","Player 7","Player 8")
PrAy_Txt := "Restart|Player 2|Player 3|Player 4|Player 5|Player 6|Player 7|Player 8"
;MSGBOX hELLO wORLD
GoSub, EndLs_HealGrab
return

EndLs_HealGrab:
SendCHP("Grid_Reborn", "GrabHP," Nothing)
Forever = 1
While Forever = 1
{
Heal_FLe =
FileReadLine, Heal_FLe, %Cfle%, %LineRead%
;MSGBOX HF:%Heal_FLe%`n`nLineRead:%LineRead%
If Heal_FLe <>
{
	;msgbox this far
	stringleft,HdrCheckH, Heal_FLe, 2
	If HdrCheckH = 24
	{
		IsHot = 0
		TpDotHot_Array := array()
		Loop,Parse, Heal_FLe, |
		{
			TpDotHot_Array.insert(A_Loopfield)
			If A_Index = 5										;The actual word "HoT"
			{
				If A_LoopField = HoT
				{
					IsHot = 1
				}
				else
				{
					break
				}
			}
		}
		If IsHot = 1
		{
			GoSub, Hot_Heal					;array has alaready been made
		}
		
	}
	else
	{
		If HdrCheckH = 00
		{
			Ifinstring, Heal_FLe, %UIDRRs%
			{
				;msgbox RRs
				GoSub, RcrsCheck
			}
			else
			{
				Ifinstring, Heal_FLe, %UIDRR%
				{
					;Msgbox RR
					GoSub, Rcr_P1
				}
			}
		}
	}
		LineRead += 1
		;msgbox %LineRead%
}
;msgbox Test1
	Sleep, 2
}
;settimer, EndLs_HealGrab, 0
return

ReceiveData1:
PrAy := array()
Loop, Parse, PrAy_Txt, |
{
	PrAy.insert(A_Loopfield)
}
;msgbox Updated Heals
return

RcrsCheck:
Rcrs_TpL:=Heal_FLe
stringgetpos, StPsR, Rcrs_TpL, %UIDRRs%,
CLLenR := strlen(Rcrs_TpL)
CLNewR := (CLLenR - StPsR) - 10
Stringright, TpBSR, Rcrs_TpL, CLNewR
HGnR =
Loop,Parse,TpBSR, %A_Space%
{
	HGnR = %A_LoopField%
	break
}	
For index, PlayNameR in PrAy
{
	Ifinstring,Rcrs_TpL, %PlayNameR%
	{
		;CHP%Index%:=DllCall(A_AhkPath "\ahkgetvar","Str","CHP"Index,"UInt",0,"Str")
		;MxH%Index%:=DllCall(A_AhkPath "\ahkgetvar","Str","MxH"Index,"UInt",0,"Str")
		SendCHP("Grid_Reborn", "GrabHP," Nothing)
		;sleep, 10
		CHPXR := CHP%index%
		CHPXR += %HGnR%
		CHP%index% := CHPXR
		MxHX := MxH%index%
		If CHP%index% > %MxHX%
		{
			CHPXR := MxH%index%
		}
		TCHP%index%:=CHPXR
		TCHPX = TCHP%index%`,
		SendCHP("Grid_Reborn", TCHPX CHPXR)
		break
	}
}
return

Rcr_P1:
	RcrRP1_TpL:=Heal_FLe
	stringgetpos, StPsRP1, RcrRP1_TpL, %UIDRR%,
	CLLenRP1 := strlen(RcrRP1_TpL) 
	CLNewRP1 := (CLLenRP1 - StPsRP1) - 9
	Stringright, TpBSRP1, RcrRP1_TpL, CLNewRP1
	HGnRP1 =
	Loop,Parse,TpBSRP1, %A_Space%
	{
		HGnRP1 = %A_LoopField%
		break
	}
	;CHP1:=DllCall(A_AhkPath "\ahkgetvar","Str","CHP1","UInt",0,"Str")
	;MxH1:=DllCall(A_AhkPath "\ahkgetvar","Str","MxH1","UInt",0,"Str")
	SendCHP("Grid_Reborn", "GrabHP," Nothing)
	;sleep, 10
	;msgbox ,4096,,CHP1:%CHP1%,1
	CHP1 += %HGnRP1%
	If CHP1 > %MxH1%
	{
		CHP1 := MxH1
	}
	TCHP1:=CHP1
	TCHPX = TCHP1`,
	SendCHP("Grid_Reborn", TCHPX CHP1)
	;msgbox,4096,, Gui Change You`n`nAmount:%HGnRP1%`n`nNew CHP:%CHP1%,2
return

Hot_Heal:
	;msgbox This Far Hot Heal
	DotHotTemp:=Heal_FLe
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
	If HotDot_Check = HoT
	{
		;msgbox Hot Found
		For HHIndex, HHPlayer in PrAy
		{
			If HHPlayer = %NameChck%
			{
				If HealthAmountHT =
				{
					HealthAmountHT = 0
				}
				;CHP%HHIndex%:=DllCall(A_AhkPath "\ahkgetvar","Str","CHP"HHIndex,"UInt",0,"Str")
				;MxH%HHindex%:=DllCall(A_AhkPath "\ahkgetvar","Str","MxH"HHIndex,"UInt",0,"Str")
				SendCHP("Grid_Reborn", "GrabHP," Nothing)
				;sleep, 10
				MxHX:=MxH%HHindex%
				CHPXHH := CHP%HHIndex% + HealthAmountHT
				If CHPXHH > %MxHX%
				{
					CHPXHH := MxHX
				}
				;Mainthread.ahkassign.("TCHP"DDindex):=%CHPXDD%
				TCHP%HHindex%:=CHPXHH
				TCHPX = TCHP%HHindex%`,
				SendCHP("Grid_Reborn", TCHPX CHPX)
				;msgbox,4096,, Dot Subtracted,1
				break
			}
		}
	}
return
