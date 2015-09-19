;---------------------Please edit this script as you wish ------------------------
;--------- and reference InnieDollar anytime you use this code elsewhere ---------
;------- At this time, i do not plan on updating it due to time constraints ------
;-------------------Version 1.0 First Release - Sept 9, 2015----------------------
#Include SendCHP.ahk
#NoEnv
DetectHiddenWindows On
;#KeyHistory 0
;#MaxThreads 255
;#MaxMem 16384
;#MaxThreadsBuffer On
;#MaxHotkeysPerInterval 99000000
;#HotkeyInterval 99000000
ListLines Off
;Process, Priority, , R
;SetTitleMatchMode 2
;SetTitleMatchMode fast
SetBatchLines, -1
;SetKeyDelay, -1, -1, -1
;SetMouseDelay, -1
;SetWinDelay, -1
;SetControlDelay, -1
;SetDefaultMouseSpeed, 0
;Loader_Path = %A_ScriptDir%\Crash Protection.ahk
;Run, %Loader_Path%
;Menu, Tray, %A_ScriptDir%\Grid.ico,,, 1
;icon, %A_ScriptDir%\Grid.ico
Menu, Tray, Icon, %A_ScriptDir%\Grid.ico
IfWinExist, %A_ScriptDir%\Damage.ahk
{
	WinClose
}
IfWinExist, %A_ScriptDir%\Heals.ahk
{
	WinClose
}
IfWinExist, %A_ScriptDir%\Debuff.ahk
{
	WinClose
}
IfWinExist, %A_ScriptDir%\Misc.ahk
{
	WinClose
}
Loader_Path1 = %A_ScriptDir%\Damage.ahk
Loader_Path2 = %A_ScriptDir%\Heals.ahk
Loader_Path3 = %A_ScriptDir%\Debuff.ahk
Loader_Path4 = %A_ScriptDir%\Misc.ahk
Run, %Loader_Path1%
Run, %Loader_Path2%
Run, %Loader_Path3%
Run, %Loader_Path4%

OutOfCombat = 20000
Setformat Float, 0.1
OOC := OutOfCombat / 1000
SendCHP(True, "CurrHP_Send")
ACT_Dir =

SaveFile = %A_ScriptDir%\Grid_Settings.txt
Ifnotexist, %SaveFile%
{
msgbox ,4096,Requirements,Please make sure to have Final Fantasy running`nand a fresh instance of ACT with FFXIV plugin`nenabled and syncing.`n`nthen press OK`n`nNotes:`n-Full Screen Mode is not currently supported.`n-Have Your F-Keys bound to target each player in the party.`n-A fresh instance of ACT is needed to change with the date,`n as ACT creates logs based on the current day, but cannot`n change logs on a new day until ACT is restarted.`n-Set Autohotkey Executable to Run as Administrator for Click casting.`n-This is a log based addon, and updates on triggers, and not a direct memory read.`n-If your name says RESTART, then you are not synced properly, please try reloading the script.`n-Out of Combat time is: %OOC% seconds.`n-This does keep your ACT log small for speed concerns.
}

Loop HKEY_CURRENT_USER, Software\Advanced Combat Tracker, 1, 1
{
	RegRead Value
    Ifinstring, Value, \Advanced Combat Tracker
    {
       ACT_Dir:=Value
	   break
    }
}
If ACT_Dir =
{
	FileSelectFolder,ACT_Dir,,,Select ACT Directory
}

CFle = %A_AppData%\Advanced Combat Tracker\FFXIVLogs\Network_%A_Year%%A_Mon%%A_DD%.log

AlphaArray := Array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z") ;,1,2,3,4,5,6,7,8,9,0)
AlphaA2 := Array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","."," ") ;"'")
thread_Label=Main
PrAy := array("Restart","Player 2","Player 3","Player 4","Player 5","Player 6","Player 7","Player 8")
PrAy_Txt := "Restart|Player 2|Player 3|Player 4|Player 5|Player 6|Player 7|Player 8"
TCHP1 = 
TCHP2 = 
TCHP3 = 
TCHP4 = 
TCHP5 = 
TCHP6 = 
TCHP7 = 
TCHP8 = 
DP1 =
DP2 =
DP3 =
DP4 =
DP5 =
DP6 =
DP7 =
DP8 =
NDP1 =
NDP2 =
NDP3 =
NDP4 =
NDP5 =
NDP6 =
NDP7 =
NDP8 =
;;;;;;;;;;;;;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------

SomePArtySetupBS = 0
ElsBuffer = 0
BfrAmnt = 30									; Lines skipped to catch you up
;--------------------------- Defining Main Variables ---------------------------------

global PyV1
global PyV2
global PyV3
global PyV4
global PyV5
global PyV6
global PyV7
global PyV8
global PT1
global PT2
global PT3
global PT4
global PT5
global PT6
global PT7
global PT8
global MxH1
global MxH2
global MxH3
global MxH4
global MxH5
global MxH6
global MxH7
global MxH8
global CHP1
global CHP2
global CHP3
global CHP4
global CHP5
global CHP6
global CHP7
global CHP8
global PrAy
global EleA
global CFle
global LineRead
global Chatline
global UStart
global UNameVar
global UHPList
global BeginParse
global NumberArray
global LMC
global LMCtrl
global LMShift
global LMAlt
global LMCS
global LMCA
global LMSA
global RMC
global RMCtrl
global RMShift
global RMAlt
global RMCS
global RMCA
global RMSA
global BPd
;-------------------Add the player array after making it
;-------------------Add the Left and Right Mouse arrays from key binds

;------------------------------------------------------------------------------------

CWWebsite = http://www.w3schools.com/tags/ref_colorpicker.asp

GridFontSize = 9
Is_Surr = 0
Is_Full = 1
StatusTL_Color = Orange
StatusTR_Color = Red
StatusBL_Color = Green
StatusBR_Color = Green
Status_SizeX = 10
Status_SizeY = 10
NumberArray := Array(1,2,3,4,5,6,7,8,9,0)
ID_Array := Array(111)
FFWindow = FINAL FANTASY
BeginParse = 0								; Starts the HP Checking
UStart = 0									;For starting U name parse
TransValue = 200

LastDmg = 1
CHP_Counter = 0
InCombat = 0
WM1 = 1
WM2 = 0
WM3 = 0
LastCH1 = 1
LastCH2 = 2
LastCH3 = 3
LastCH4 = 4
LastCH5 = 5
LastCH6 = 6
LastCH7 = 7
LastCH8 = 8
IsSaved = 0
OptVarV = 1
OptVarH = 0
OptVar14 = 0
OptVar41 = 0
OptVar42 = 0
OptVar24 = 0
OptVar18 = 0
OptVar81 = 0
ChangeMxH = 0
MaxCounter = 0
LastHPTick = 1
LastHPTick2 = 1
UNameVar = 
BufferArray := array()
UPsnArray := array()
UPsnIDArray := array()
UPsnMxHArray := array()
UGridS := "-GridSetup "
UIDRR := " Recover "
UIDRRs := " Recovers "
UIDMercy := "s Mercy Stroke restores"
UIDMercyYou := "Your Mercy Stroke restores"
UIDAbsorb := " absorbs "
UIDYouAbs := " You absorb "
UIDRaise := " gains the effect of Raise"
UIDRaiseYou := "You gain the effect of Raise"
UIDDefiance := " gains the effect of Defiance"
UIDDefYou := "You gain the effect of Defiance"
UIDhits := " hits "
UIDtakes := " takes "
UIDYou := " You take "
NoBorderX = 3
NoBorderY = 24
OptVar14 = 1
BH = 50
BW = 50
FirstX = 2
FirstY = 2
PixelGap = 2
PixelMove = 1
WMode = 1
ShowX = 100
ShowY = 100
PAmount = 4
;PyV1 := %CharName%
;-------------------- Orientation of progress bar-------------------
Ori = Vertical
;-------------------- Player Names Text -----------------------------
PyV1 = You
PyV2 = Player 2
PyV3 = Player 3
PyV4 = Player 4
PyV5 = Player 5
PyV6 = Player 6
PyV7 = Player 7
PyV8 = Player 8
;----------------- Player Health Text ------------------------------
PT1 = 1
PT2 = 1
PT3 = 1
PT4 = 1
PT5 = 1
PT6 = 1
PT7 = 1
PT8 = 1
;---------------------- Player Name and Health Text Color ----------
CT1 = White
CT2 = White
CT3 = White
CT4 = White
CT5 = White
CT6 = White
CT7 = White
CT8 = White
;------------------- Player Progress Bar Max HP ---------------------
MxH1 = 1
MxH2 = 1
MxH3 = 1
MxH4 = 1
MxH5 = 1
MxH6 = 1
MxH7 = 1
MxH8 = 1
;----------------- Player Current HP ------------------------------
CHP1 = 1
CHP2 = 1
CHP3 = 1
CHP4 = 1
CHP5 = 1
CHP6 = 1
CHP7 = 1
CHP8 = 1
;------------------ Progress Bar Color and Background -------------
C1 = 003399
BG1 = 7E98CB
C2 = 199A19
BG2 = 66FF66
C3 = 472400
BG3 = 9C7B59
C4 = 472400
BG4 = 9C7B59
C5 = 472400
BG5 = 9C7B59
C6 = 472400
BG6 = 9C7B59
C7 = 472400
BG7 = 9C7B59
C8 = 472400
BG8 = 9C7B59

;------------------------ Line Read --------------------------------
Loop, Read, %CFle%
{
	LineRead += 1
	ChatLineTp := A_Loopreadline
	StringLeft,HeaderCheck2, ChatLineTp, 2
	StringLeft,HeaderCheck3, ChatLineTp, 3
	TpArray := Array()
	Loop, Parse, ChatLineTp, |
	{
		TpArray.insert(A_LoopField)
	}

	If HeaderCheck2 = 02
	{
		If TpArray[3] != 0
		{
			ID_Array[1] := TpArray[3]
			PrAy[1] := TpArray[4]
			PyV1 := PrAy[1]
		}
	}
	If HeaderCheck2 = 21
	{
		AddID := TpArray[3]
		AddName := TpArray[4]
		AddMxH := TpArray[35]
		AddID2 := TpArray[7]
		AddName2 := TpArray[8]
		AddMxH2 := TpArray[26]
		OptionAdd = 21
		GoSub, UAdd
		If AddName = %PyV1%
		{
			MxH1 = %AddMxH%
			CHP1 = %AddMxH%
			PT1 := CHP1
		}
		If AddName2 = %PyV1%
		{
			MxH1 = %AddMxH2%
			CHP1 = %AddMxH2%
			PT1 := CHP1
		}
	}
}
PrAy_Txt := PrAy[1]
PrAy_Txt = %PrAy_Txt%|Player 2|Player 3|Player 4|Player 5|Player 6|Player 7|Player 8
GoSub, ACT_Rst
sleep, 2000
TpA1 := UPsnArray.Maxindex()
If TpA1 !=
{
	;msgbox,4096,,Log Synced`n`n%TpA1% Unique Names Found.,2
}
GoSub, Load_Check

Gui, Grid_Layout:New
;--------------
Gui,+AlwaysOnTop
Gui,Add,Tab,x7 y6 w800 h375,Main|Notes|Party Setup|Config
Gui,Tab,1
Gui,Add,GroupBox,x23 y40 w400 h280,Click Casting - Mouse Binds:
Gui,Add,Text,x57 y276 w364 h13,Add S for Shift, and C for Control, and A for ALT, or ANY 2 Combination
Gui,Add,Text,x57 y290 w361 h13,Example: S5 would send Shift+5, and CS3 would send Control+Shift+3
Gui,Add,GroupBox,x239 y60 w150 h210,Right Mouse
Gui,Add,Text,x303 y137 w24 h13,Shift:
Gui,Add,Text,x291 y110 w38 h13,Control:
Gui,Add,Text,x311 y162 w17 h13,Alt:
Gui,Add,Text,x259 y188 w70 h13,Control + Shift:
Gui,Add,Text,x268 y214 w60 h13,Control + Alt:
Gui,Add,Text,x279 y239 w49 h13,Shift + Alt:
Gui,Add,Edit,x332 y106 w34 h21 vRMCtrl,
Gui,Add,Edit,x332 y158 w34 h21 vRMAlt,
Gui,Add,Edit,x332 y183 w34 h21 vRMCS,
Gui,Add,Edit,x332 y132 w34 h21 vRMShift,
Gui,Add,Edit,x332 y235 w34 h21 vRMSA,
Gui,Add,Edit,x332 y209 w34 h21 vRMCA,
Gui,Add,Edit,x332 y81 w34 h21 vRMC,
Gui,Add,Text,x299 y85 w28 h13,Click:
Gui,Add,GroupBox,x57 y61 w150 h210,Left Mouse
Gui,Add,Edit,x143 y133 w34 h21 vLMShift,
Gui,Add,Edit,x143 y159 w34 h21 vLMAlt,
Gui,Add,Edit,x143 y184 w34 h21 vLMCS,
Gui,Add,Edit,x143 y210 w34 h21 vLMCA,
Gui,Add,Edit,x143 y236 w34 h21 vLMSA,
Gui,Add,Text,x104 y111 w38 h13,Control:
Gui,Add,Text,x116 y136 w24 h13,Shift:
Gui,Add,Text,x123 y163 w17 h13,Alt:
Gui,Add,Text,x72 y188 w70 h13,Control + Shift:
Gui,Add,Text,x79 y215 w60 h13,Control + Alt:
Gui,Add,Edit,x143 y107 w34 h21 vLMCtrl,
Gui,Add,Text,x91 y240 w49 h13,Shift + Alt:
Gui,Add,Text,x111 y85 w28 h13,Click:
Gui,Add,Edit,x142 y82 w34 h21 vLMC,
Gui,Add,Text,x91 y303 w300 h13,Note: Dont use a modifier to send the same modifier
Gui,Add,GroupBox,x427 y40 w210 h280,Player Colors:
Gui,Add,Text,x455 y64 w21 h13,BG
Gui,Add,Edit,x440 y85 w45 h21 vBG1,
Gui,Add,Edit,x440 y110 w45 h21 vBG2,
Gui,Add,Edit,x440 y136 w45 h21 vBG3,
Gui,Add,Edit,x440 y163 w45 h21 vBG4,
Gui,Add,Edit,x440 y190 w45 h21 vBG5,
Gui,Add,Edit,x440 y217 w45 h21 vBG6,
Gui,Add,Edit,x440 y243 w45 h21 vBG7,
Gui,Add,Edit,x440 y270 w45 h21 vBG8,
Gui,Add,Text,x593 y65 w21 h13,FG
Gui,Add,Edit,x576 y84 w45 h21 vC1,
Gui,Add,Edit,x576 y110 w45 h21 vC2,
Gui,Add,Edit,x576 y136 w45 h21 vC3,
Gui,Add,Edit,x576 y163 w45 h21 vC4,
Gui,Add,Edit,x576 y190 w45 h21 vC5,
Gui,Add,Edit,x576 y217 w45 h21 vC6,
Gui,Add,Edit,x576 y243 w45 h21 vC7,
Gui,Add,Edit,x576 y269 w45 h21 vC8,
Gui,Add,GroupBox,x495 y67 w74 h240,Update:
Gui,Font,Normal ,Tahoma
Gui,Add,Button,x502 y83 w25 h23 vBU1B gColorUpdate,1
Gui,Font
Gui,Add,Button,x502 y109 w25 h23 vBU2B gColorUpdate,2
Gui,Add,Button,x502 y135 w25 h23 vBU3B gColorUpdate,3
Gui,Add,Button,x502 y162 w25 h23 vBU4B gColorUpdate,4
Gui,Add,Button,x502 y189 w25 h23 vBU5B gColorUpdate,5
Gui,Add,Button,x502 y216 w25 h23 vBU6B gColorUpdate,6
Gui,Add,Button,x502 y242 w25 h23 vBU7B gColorUpdate,7
Gui,Add,Button,x502 y268 w25 h23 vBU8B gColorUpdate,8
Gui,Add,Button,x536 y83 w25 h23 vBU1F gColorUpdate,1
Gui,Add,Button,x536 y109 w25 h23 vBU2F gColorUpdate,2
Gui,Add,Button,x536 y135 w25 h23 vBU3F gColorUpdate,3
Gui,Add,Button,x536 y162 w25 h23 vBU4F gColorUpdate,4
Gui,Add,Button,x536 y189 w25 h23 vBU5F gColorUpdate,5
Gui,Add,Button,x536 y216 w25 h23 vBU6F gColorUpdate,6
Gui,Add,Button,x536 y242 w25 h23 vBU7F gColorUpdate,7
Gui,Add,Button,x536 y268 w25 h23 vBU8F gColorUpdate,8
Gui,Add,Button,x461 y329 w150 h23 gColorWheelGo,Color Wheel Website
Gui,Add,Button,x168 y329 w100 h23 gKeyBind_Save,Key Bind Save
Gui,Tab,3
Gui,Add,GroupBox,x644 y40 w140 h280,Layout
Gui,Add,Text,x661 y63 w35 h13,4 Man:
Gui,Add,Text,x654 y125 w35 h13,8 Man:
Gui,Add,Radio,x691 y81 w55 h13 vOptVar14 gOpt14,1 x 4
Gui,Add,Radio,x691 y169 w50 h13 vOptVar24 gOpt24,2 x 4
Gui,Add,Radio,x691 y144 w50 h13 vOptVar42 gOpt42,4 x 2
Gui,Font,Normal ,Tahoma
Gui,Add,Radio,x691 y106 w50 h13 vOptVar41 gOpt41,4 x 1
Gui,Font
Gui,Add,Radio,x691 y218 w50 h13 vOptVar81 gOpt81,8 x 1
Gui,Add,Radio,x691 y194 w50 h13 vOptVar18 gOpt18,1 x 8
Gui,Add,GroupBox,x652 y239 w120 h69,Health Bars
Gui,Add,Radio,x684 y259 w55 h13 vOptVarV gOptV,Vertical
Gui,Add,Radio,x684 y284 w70 h13 vOptVarH gOptH,Horizontal
Gui,Add,GroupBox,x18 y35 w163 h280,Player Dimensions:
Gui,Add,Text,x56 y215 w96 h13,Player Gap (Pixels):
Gui,Add,Button,x83 y232 w25 h23 gGapPlus,+
Gui,Add,Button,x83 y262 w25 h23 gGapMinus,-
Gui,Add,Button,x89 y55 w25 h30 -Wrap gPDU,Up
Gui,Add,Button,x36 y91 w30 h25 gPDL,L
Gui,Add,Text,x70 y95 w32 h13,Pixels:
Gui,Add,Edit,x105 y92 w27 h21 vPixelMove,5
Gui,Add,Button,x138 y91 w30 h25 gPDR,R
Gui,Add,Button,x89 y119 w25 h30 -Wrap gPDD,Dn
Gui,Add,GroupBox,x192 y36 w250 h50,Window Mode
Gui,Add,Radio,x390 y59 w50 h13 vWM3 gWModeUpdate,3
Gui,Add,Radio,x305 y59 w50 h13 vWM2 gWModeUpdate,2
Gui,Add,Radio,x216 y59 w50 h13 vWM1 gWModeUpdate,1
Gui,Add,GroupBox,x193 y86 w250 h69,Player Names:
Gui,Add,Radio,x252 y122 w50 h13 vIS_Full gName_Update,Full
Gui,Add,Radio,x342 y122 w50 h13 vIS_Surr gName_Update,First
Gui,Add,Button,x246 y251 w125 h35 gPartyMacro,Party Setup Macro
Gui,Add,GroupBox,x196 y164 w250 h69,Font
Gui,Add,Button,x249 y193 w43 h23 gFontMinus,-
Gui,Add,Button,x342 y193 w43 h23 gFontPlus,+
Gui,Tab,4
Gui,Add,Button,x343 y258 w100 h45 gGoSave,Save Settings

;-------------------
OnMessage(0x204, "WM_RBUTTONDOWN")
If IsSaved = 0
{
	Gui,Show,x482 y258 w816 h391 ,Grid_Layout
}
else
{
	Gui,Show,minimize x482 y258 w816 h391 ,Grid_Layout
	IsSaved = 0
}
GuiControl,,OptVar14, 1
GuiControl,,WM1, %WM1%
GuiControl,,WM2, %WM2%
GuiControl,,WM3, %WM3%
GuiControl,,OptVarV, 1
GuiControl,,BG1,%BG1%
GuiControl,,BG2,%BG2%
GuiControl,,BG3,%BG3%
GuiControl,,BG4,%BG4%
GuiControl,,BG5,%BG5%
GuiControl,,BG6,%BG6%
GuiControl,,BG7,%BG7%
GuiControl,,BG8,%BG8%
GuiControl,,C1,%C1%
GuiControl,,C2,%C2%
GuiControl,,C3,%C3%
GuiControl,,C4,%C4%
GuiControl,,C5,%C5%
GuiControl,,C6,%C6%
GuiControl,,C7,%C7%
GuiControl,,C8,%C8%
GuiControl,,ShowX,%ShowX%
GuiControl,,ShowY,%ShowY%
GuiControl,,ShowW,%ShowW%
GuiControl,,ShowH,%ShowH%
GuiControl,,BH,%BH%
GuiControl,,BW,%BW%
GuiControl,,TransValue,%TransValue%
GuiControl,,PixelGap,%PixelGap%
GuiControl,,PAmount,%PAmount%
GuiControl,,LMC,%LMC%
GuiControl,,LMCtrl,%LMCtrl%
GuiControl,,LMShift,%LMShift%
GuiControl,,LMAlt,%LMAlt%
GuiControl,,LMCS,%LMCS%
GuiControl,,LMCA,%LMCA%
GuiControl,,LMSA,%LMSA%
GuiControl,,RMC,%RMC%
GuiControl,,RMCtrl,%RMCtrl%
GuiControl,,RMShift,%RMShift%
GuiControl,,RMAlt,%RMAlt%
GuiControl,,RMCS,%RMCS%
GuiControl,,RMCA,%RMCA%
GuiControl,,RMSA,%RMSA%
GuiControl,,OptVar14,%OptVar14%
GuiControl,,OptVar41,%OptVar41%
GuiControl,,OptVar42,%OptVar42%
GuiControl,,OptVar24,%OptVar24%
GuiControl,,OptVar18,%OptVar18%
GuiControl,,OptVar81,%OptVar81%
GuiControl,,OptVarV,%OptVarV%
GuiControl,,OptVarH,%OptVarH%
GuiControl,,IS_Surr,%IS_Surr%
GuiControl,,IS_Full,%IS_Full%


GoSub, LayoutUpdate
;GoSub, Els_ChatGrab
Settimer, Els_ChatGrab,0
GoSub, Els_Regen
;GoSub, Gui_Update
Settimer, Gui_Update,0
GoSub, Name_Update
;Settimer, Name_Update, 0
Return

Grid_LayoutGuiClose:
IfWinExist, %A_ScriptDir%\Damage.ahk
{
	WinClose
}
IfWinExist, %A_ScriptDir%\Heals.ahk
{
	WinClose
}
IfWinExist, %A_ScriptDir%\Debuff.ahk
{
	WinClose
}
IfWinExist, %A_ScriptDir%\Misc.ahk
{
	WinClose
}
ExitApp
Return

FontPlus:
	GridFontSize += 1
	GoSub, Font_Change
return

FontMinus:
	GridFontSize -= 1
	GoSub, Font_Change
return

Font_Change:
	Gui, GridR:Default
	loop 8
	{
		PyVX := PyV%A_Index%
		PTX := PT%A_Index%
		Gui, Font, s%GridFontSize% cWhite
		Guicontrol, font, PyV%A_Index%
		Guicontrol, font, PT%A_Index%
		GuiControl, GridR:, PyV%A_Index%, %PyVX%
		GuiControl, GridR:, PT%A_Index%, %PTX%
	}
return

PartyMacro:
	ClipBoard = `/l1 -GridSetup <1>.<2>.<3>.<4>.<5>.<6>.<7>.<8>
	msgbox,4096,, Copied to Clipboard -`n`nPaste into a User Macro in game to update the party
return

CurrHP_Send:
	SendCHP("Damage", "CHP1," CHP1)
	SendCHP("Damage", "CHP2," CHP2)
	SendCHP("Damage", "CHP3," CHP3)
	SendCHP("Damage", "CHP4," CHP4)
	SendCHP("Damage", "CHP5," CHP5)
	SendCHP("Damage", "CHP6," CHP6)
	SendCHP("Damage", "CHP7," CHP7)
	SendCHP("Damage", "CHP8," CHP8)
	SendCHP("Heals", "CHP1," CHP1)
	SendCHP("Heals", "CHP2," CHP2)
	SendCHP("Heals", "CHP3," CHP3)
	SendCHP("Heals", "CHP4," CHP4)
	SendCHP("Heals", "CHP5," CHP5)
	SendCHP("Heals", "CHP6," CHP6)
	SendCHP("Heals", "CHP7," CHP7)
	SendCHP("Heals", "CHP8," CHP8)
	SendCHP("Heals", "MxH1," MxH1)
	SendCHP("Heals", "MxH2," MxH2)
	SendCHP("Heals", "MxH3," MxH3)
	SendCHP("Heals", "MxH4," MxH4)
	SendCHP("Heals", "MxH5," MxH5)
	SendCHP("Heals", "MxH6," MxH6)
	SendCHP("Heals", "MxH7," MxH7)
	SendCHP("Heals", "MxH8," MxH8)
return

Name_Update:
Gui, Grid_Layout:Default
GuiControlGet, IS_Surr
GuiControlGet, IS_Full
If Is_Surr = 1
{
	For INme, NmePr in PrAy
	{
		Loop, Parse, NmePr, %A_Space%
		{
			PyV%INme%:=A_LoopField
			break
		}
	}
}
else
{
	If Is_Full = 1	
	{
		For INme, NmePr in PrAy
		{
			PyV%INme%:=NmePr
		}
	}
}
Gui, GridR:Default
Loop 8
{
	PyVXX:= PyV%A_Index%
	GuiControl, GridR:, PyV%A_Index%, %PyVXX%
}
return

GuiUp_DBf:				;Current Setup - Static(1,4,7,10,13,16,19,22)
Gui, GridR:Default
TCtr = 1
;msgbox hmmm
Loop 8
{
	CX := C%A_index%
	BGX := BG%A_Index%
	PyVX := PyV%A_Index%
	CHPX := CHP%A_Index%
	;msgbox ,4096,,1111,1
	If DP%A_index% = 0
	{
		;msgbox , 4096,,Turn Player not purple and back to normal,1
		Guicontrol, +c%CX% Background%BGX%, P%A_Index%
		GuiControl, GridR:, PyV%A_Index%, %PyVX%
		GuiControl, GridR:, PT%A_Index%, %CHPX%
		DP%A_Index% =
	}
	else
	{
		If DP%A_index% = 1
		{
			Guicontrol, +cPurple Background, P%A_Index%
			GuiControl, GridR:, PyV%A_Index%, %PyVX%
			GuiControl, GridR:, PT%A_Index%, %CHPX%
			;msgbox ,4096,,Turn Player Purple,1
			DP%A_Index% =
		}
	}

	If NDP%A_Index% = 0
	{
		;hide the box
		Guicontrol, Hide, Static%TCtr%
		NDP%A_Index% =
	}
	else
	{
		If NDP%A_Index% = 1
		{
			Guicontrol, Show, Static%TCtr%
			;Show the box
			NDP%A_Index% =
		}
	}
	TCtr += 3
}
return



Gui_Update:

	Gui, GridR:Default
	GoSub, CurrHP_Send
	GoSub, GuiUp_DBf
	If TCHP1 != 
	{
		CHP1:=TCHP1
		;msgbox,4096,, Changed CHP1`n`nCHP1:%CHP1%`n`nPT1:%PT1%,1
		GuiControl,, P1,%TCHP1%
		GuiControl, GridR:, PyV1, %PyV1%
		GuiControl, GridR:, PT1, %TCHP1%
		TCHP1 =
	}
	If TCHP2 != 
	{
		CHP2:=TCHP2
		;msgbox,4096,, Changed CHP2`n`nCHP2:%CHP2%`n`nPT2:%PT2%,1
		GuiControl,, P2,%TCHP2%
		GuiControl, GridR:, PyV2, %PyV2%
		GuiControl, GridR:, PT2, %TCHP2%
		TCHP2 =
	}
	If TCHP3 != 
	{
		CHP3:=TCHP3
		GuiControl,, P3,%TCHP3%
		GuiControl, GridR:, PyV3, %PyV3%
		GuiControl, GridR:, PT3, %TCHP3%
		TCHP3 =
	}
	If TCHP4 != 
	{
		CHP4:=TCHP4
		GuiControl,, P4,%TCHP4%
		GuiControl, GridR:, PyV4, %PyV4%
		GuiControl, GridR:, PT4, %TCHP4%
		TCHP4 =
	}
	If TCHP5 != 
	{
		CHP5:=TCHP5
		GuiControl,, P5,%TCHP5%
		GuiControl, GridR:, PyV5, %PyV5%
		GuiControl, GridR:, PT5, %TCHP5%
		TCHP5 =
	}
	If TCHP6 != 
	{
		CHP6:=TCHP6
		GuiControl,, P6,%TCHP6%
		GuiControl, GridR:, PyV6, %PyV6%
		GuiControl, GridR:, PT6, %TCHP6%
		TCHP6 =
	}
	If TCHP7 != 
	{
		CHP7:=TCHP7
		GuiControl,, P7,%TCHP7%
		GuiControl, GridR:, PyV7, %PyV7%
		GuiControl, GridR:, PT7, %TCHP7%
		TCHP7 =
	}
	If TCHP8 != 
	{
		CHP8:=TCHP8
		GuiControl,, P8,%TCHP8%
		GuiControl, GridR:, PyV8, %PyV8%
		GuiControl, GridR:, PT8, %TCHP8%
		TCHP8 =
	}
	Settimer, Gui_Update, 50

return

Buffer_Check:
LineRead_Check := LineRead
Loop %BfrAmnt%
{
	TempFileBC =
	LineRead_Check += %BfrAmnt%
	FileReadLine, TempFileBC, %CFle%, %LineRead_Check%
	If TempFileBC !=
	{
		;this statement should never happen
		ChatLine := TempFileBC
		LineRead := LineRead_Check
		SendCHP("Damage", "LineRead," LineRead)
		SendCHP("Heals", "LineRead," LineRead)
	}
	else
	{
		break
	}
}

return

PtyNameGet(Var)
{
	Stringgetpos,SH, Var, 
	SH += 2
	Stringgetpos,EH, Var, ,L2
	LenX := 1 + (EH - SH)
	FName := substr(Var, SH, LenX)
	return % FName
}

PtyStp:
TpL1 := ChatLine
StringGetPos, StPsPy, TpL1, %UGridS%
StPsPy += 11
StringTrimLeft, TpPyLn, TpL1, %StPsPy%
;msgbox TpPyLn:%TpPyLn%
Pty_A:= array()
Loop,Parse,TpPyLn, .
{
	If A_Index = 1
	{
		MeTmp := A_LoopField
	}
	;msgbox Temp
	Pty_A.insert(A_LoopField)
}
If MeTmp := PrAy[1]				;Its my unique -Gridsetup
{
	;msgbox MeTmp:%MeTmp%
	PrAy := array()
	PrAy.insert(MeTmp)
	
	For PIDX, PMem in Pty_A		;For each person in found party string array
	{
		If PIDX > 1				;Skip Player 1
		{
			TpIni:= PtyNameGet(PMem)
			;MSGBOX TpIni:%TpIni%|`n`nlOOPFIELD:%A_LoopField%
			If TpIni !=
			{
				PrAy.Insert(TpIni)
			}
		}
	}
}
PrAy_Txt =
For PXIdx, PNX1 in PrAy
{
	If PNX1 != 
	{
		CHPTGXX := CHP%PXIdx%
		PyV%PXIdx% := PNX1
		Gui, GridR:Default
		GuiControl, GridR:, PyV%PXIdx%, %PNX1%
		GuiControl, GridR:, PT%PXIdx%, %CHPTGXX%
	}
	PrAy_Txt = %PrAy_Txt%%PNX1%|
}
stringtrimright, PrAy_Txt, PrAy_Txt, 1
SendCHP("Damage", "PrAy_Txt," PrAy_Txt)				; Sending to the damage script the new Player array
SendCHP("Heals", "PrAy_Txt," PrAy_Txt)				; Sending to the heals script the new Player array
SendCHP("Debuff", "PrAy_Txt," PrAy_Txt)				; Sending to the debuff script the new Player array
SendCHP("Misc", "PrAy_Txt," PrAy_Txt)				; Sending to the Misc script the new Player array
;msgbox ,4096,,Pray_Txt:%Pray_Txt%,3
GoSub, Name_Update
return

Els_ChatGrab:
;msgbox Hello Wrold ELS CHATGRAB
;Forever = 1
;While Forever = 1
;{
	GoSub, Buffer_Check
	ChatLine =
	FileReadLine, ChatLine, %CFle%, %LineRead%
	If ChatLine <>
	{
		;msgbox %chatline%
		Ifinstring, ChatLine, damage
		{
			LastDmg := A_TickCount
			InCombat = 1
		}
		else
		{
			Ifinstring, ChatLine, %UGridS%
			{
				GoSub, PtyStp
			}
		}
		StringLeft,HdrCheck2, ChatLine, 2
		If HdrCheck2 = 21
		{
			GoSub, 21_Chk
		}
		else
		{
			If HdrCheck2 = 24
			{
				GoSub, 24_Chk
			}
		}
			LineRead += 1
	}
	Sleep, 2
;}
settimer, Els_ChatGrab, 0
return

24_Chk:
	24Tp := ChatLine
	24Tp_Array := array()
	Loop,Parse, 24Tp, |
	{
		24Tp_Array.insert(A_Loopfield)
	}
	24TpID := 24Tp_Array[3]
	24TpName := 24Tp_Array[4]
	24TpMxH := 24Tp_Array[9]
	24TpCHP := 24Tp_Array[8]
	For PlyIndx, PlyMbr in PrAy
	{
		If PlyMbr = %24TpName%
		{
			If PlyMbr != 
			{
				Gui, GridR:Default
				ID_Array[%PlyIndx%] := 24TpID
				MxHTX := MxH%PlyIndx%
				CHTPX := CHP%PlyIndx%
				If InCombat = 1
				{
					CHTPX := 24TpCHP
					CHP%PlyIndx% := 24TpCHP
				}
				else
				{
					If InCombat = 0
					{
						If 24TpCHP > %CHTPX%
						{
							CHTPX := 24TpCHP
							CHP%PlyIndx% := 24TpCHP
						}
					}
				}
				If 24TpMxH != %MxHtX%
				{
					MxH%PlyIndx% := 24TpMxH
					GuiControl, +Range0-%24TpMxH%, P%PlyIndx%
				}
				PlyXX:=PyV%PlyIndx%
				GuiControl,, P%PlyIndx%,%CHTpX%
				GuiControl, GridR:, PyV%PlyIndx%, %PlyXX%
				GuiControl, GridR:, PT%PlyIndx%, %CHTpX%
				break
			}
		}
	}
return

21_Chk:
	21Tp := ChatLine
	21Tp_Array := array()
	Loop,Parse, 21Tp, |
	{
		21Tp_Array.insert(A_Loopfield)
	}
	21TpID := 21Tp_Array[3]
	21TpName := 21Tp_Array[4]
	21TpMxH := 21Tp_Array[35]
	21TpCHP := 21Tp_Array[34]
	21TpID2 := 21Tp_Array[7]
	21TpName2 := 21Tp_Array[8]
	21TpMxH2 := 21Tp_Array[26]
	21TpCHP2 := 21Tp_Array[25]
	For PlyIndx, PlyMbr in PrAy
	{
		If PlyMbr = %21TpName%
		{
			If PlyMbr != 
			{
				Gui, GridR:Default
				;msgbox ,4096,,Combat1:%InCombat%,1
				ID_Array[%PlyIndx%] := 21TpID
				MxHTX := MxH%PlyIndx%
				CHTPX := CHP%PlyIndx%
				If InCombat = 1
				{
					CHTPX := 21TpCHP
					CHP%PlyIndx% := 21TpCHP
				}
				else
				{
					If InCombat = 0
					{
						If 21TpCHP > %CHTPX%
						{
							CHTPX := 21TpCHP
							CHP%PlyIndx% := 21TpCHP
						}
					}
				}
				If 21TpMxH != %MxHtX%
				{
					MxH%PlyIndx% := 21TpMxH
					GuiControl, +Range0-%21TpMxH%, P%PlyIndx%
				}
				PlyXX:=PyV%PlyIndx%
				GuiControl,, P%PlyIndx%,%CHTpX%
				GuiControl, GridR:, PyV%PlyIndx%, %PlyXX%
				GuiControl, GridR:, PT%PlyIndx%, %CHTpX%
				break
			}
		}
	}
	For PlyIndx, PlyMbr in PrAy
	{
		If PlyMbr = %21TpName2%
		{
			If PlyMbr != 
			{
				;msgbox ,4096,,Combat2:%InCombat%,1
				Gui, GridR:Default
				ID_Array[%PlyIndx%] := 21TpID2
				MxHTX := MxH%PlyIndx%
				CHTPX := CHP%PlyIndx%
				If InCombat = 1
				{
					CHTPX := 21TpCHP2
					CHP%PlyIndx% := 21TpCHP2
				}
				If 21TpMxH2 != %MxHtX%
				{
					MxH%PlyIndx% := 21TpMxH2
					GuiControl, +Range0-%21TpMxH2%, P%PlyIndx%
				}
				PlyXX:=PyV%PlyIndx%
				GuiControl,, P%PlyIndx%,%CHTpX%
				GuiControl, GridR:, PyV%PlyIndx%, %PlyXX%
				GuiControl, GridR:, PT%PlyIndx%, %CHTpX%
				break
			}
		}
	}
return
	

UAdd:
If OptionAdd = 21
{
	FoundMatch = 0
	For index, PlayNameX in UPsnArray
	{
		If AddName = %PlayNameX%
		{
			FoundMatch = 1
		}
	}
	If FoundMatch = 0
	{
		StringLeft, TpB1, AddID, 1
		If TpB1 = 1
		{
			If AddName !=
			{
				UPsnIDArray.Insert(AddID)
				UPsnArray.Insert(AddName)
				If AddMxH =
				{
					AddMxH = 10
				}
				UPsnMxHArray.Insert(AddMxH)
			}
		}
	}
	FoundMatch = 0
	For index, PlayNameX in UPsnArray
	{
		If AddName2 = %PlayNameX%
		{
			FoundMatch = 1
		}
	}
	If FoundMatch = 0
	{
		StringLeft, TpB1, AddID2, 1
		If TpB1 = 1
		{
			If AddName !=
			{
				UPsnIDArray.Insert(AddID2)
				UPsnArray.Insert(AddName2)
				If AddMxH2 =
				{
					AddMxH2 = 10
				}
				UPsnMxHArray.Insert(AddMxH2)
			}
		}
	}
}
return

$End::														;Restart ACT
	LineRead = 30001
return

ACT_Rst:
	Process, Exist, Advanced Combat Tracker.exe
	If ErrorLevel <> 0
	{
		Process, Close, Advanced Combat Tracker.exe
		Sleep, 500
	}
	TrayTip,ACT Restarting, This Shouldn't take long.
	File := FileOpen(CFle, "w")
	File.Close()
	Sleep, 100
	run, *RunAs %ACT_Dir%\Advanced Combat Tracker,,min
	LineRead:=5
	SendCHP("Damage", "LineRead," LineRead)
	SendCHP("Heals", "LineRead," LineRead)
	SendCHP("Debuff", "LineRead," LineRead)
	SendCHP("Misc", "LineRead," LineRead)
return

ACT_Check:

If LineRead > 25000
{
	Process, Exist, Advanced Combat Tracker.exe
	If ErrorLevel <> 0
	{
		Process, Close, Advanced Combat Tracker.exe
		Sleep, 500
	}
	TrayTip,ACT Restarting, This Shouldn't take long.
	File := FileOpen(CFle, "w")
	File.Close()
	Sleep, 100
	run, *RunAs %ACT_Dir%\Advanced Combat Tracker,,min
	LineRead:=5
	SendCHP("Damage", "LineRead," LineRead)
	SendCHP("Heals", "LineRead," LineRead)
	SendCHP("Debuff", "LineRead," LineRead)
	SendCHP("Misc", "LineRead," LineRead)
}
return

Rmv_Dbf:
	DP1 = 0
	DP2 = 0
	DP3 = 0
	DP4 = 0
	DP5 = 0
	DP6 = 0
	DP7 = 0
	DP8 = 0
	NDP1 = 0
	NDP2 = 0
	NDP3 = 0
	NDP4 = 0
	NDP5 = 0
	NDP6 = 0
	NDP7 = 0
	NDP8 = 0
return

Els_Regen:
If ElsBuffer > 2000
{
	ElsBuffer = 2000
}
TimeCheck1 := A_TickCount + ElsBuffer
ElsBuffer = 0
TimeSinceDmg := TimeCheck1 - LastDmg
SendCHP("Damage", "PrAy_Txt," PrAy_Txt)				; Sending to the damage script the new Player array
SendCHP("Heals", "PrAy_Txt," PrAy_Txt)				; Sending to the heals script the new Player array
SendCHP("Debuff", "PrAy_Txt," PrAy_Txt)				; Sending to the debuff script the new Player array
SendCHP("Misc", "PrAy_Txt," PrAy_Txt)				; Sending to the misc script the new Player array
Setformat, Float, 0.0
If TimeSinceDmg > %OutOfCombat%
{
	GoSub, ACT_Check
	GoSub, Rmv_DBf
	CHP_Counter += 1
	If CHP_Counter = 1
	{
		InCombat = 0
		MxH1X := MxH1 ;/ 2
		MxH2X := MxH2 ;/ 2
		MxH3X := MxH3 ;/ 2
		MxH4X := MxH4 ;/ 2
		MxH5X := MxH5 ;/ 2
		MxH6X := MxH6 ;/ 2
		MxH7X := MxH7 ;/ 2
		MxH8X := MxH8 ;/ 2
	}
	else
	{
		MxH1X := MxH1 / 10
		MxH2X := MxH2 / 10
		MxH3X := MxH3 / 10
		MxH4X := MxH4 / 10
		MxH5X := MxH5 / 10
		MxH6X := MxH6 / 10
		MxH7X := MxH7 / 10
		MxH8X := MxH8 / 10
	}
}
else
{
	Setformat, Float, 0.1
	CHP_Counter = 0
	MxH1X := MxH1 / 100
	MxH1X := Floor(MxH1X)
	MxH2X := MxH2 / 100
	MxH2X := Floor(MxH2X)
	MxH3X := MxH3 / 100
	MxH3X := Floor(MxH3X)
	MxH4X := MxH4 / 100
	MxH4X := Floor(MxH4X)
	MxH5X := MxH5 / 100
	MxH5X := Floor(MxH5X)
	MxH6X := MxH6 / 100
	MxH6X := Floor(MxH6X)
	MxH7X := MxH7 / 100
	MxH7X := Floor(MxH7X)
	MxH8X := MxH8 / 100
	MxH8X := Floor(MxH8X)
	Setformat, Float, 0.0
}
Gui, GridR:Default
If CHP1 != 0
{
	If CHP1 != 
	{
		CHP1 := CHP1 + MxH1X
		If CHP1 > %MxH1%
		{
			CHP1 = %MxH1%
		}
			GuiControl,, P1,%CHP1%
			GuiControl, GridR:, PyV1, %PyV1%
			GuiControl, GridR:, PT1, %CHP1%
	}
}
else
{
	If CHP1 = 0
	{
		DP1 = 0
		NDP1 = 0
	}
}
If CHP2 != 0
{
	If CHP2 != 
	{
		CHP2 := CHP2 + MxH2X
		If CHP2 > %MxH2%
		{
			CHP2 = %MxH2%
		}
			GuiControl,, P2,%CHP2%
			GuiControl, GridR:, PyV2, %PyV2%
			GuiControl, GridR:, PT2, %CHP2%
	}
}
else
{
	If CHP2 = 0
	{
		DP2 = 0
		NDP2 = 0
	}
}
If CHP3 != 0
{
	If CHP3 != 
	{
		CHP3 := CHP3 + MxH3X
		If CHP3 > %MxH3%
		{
			CHP3 = %MxH3%
		}
			GuiControl,, P3,%CHP3%
			GuiControl, GridR:, PyV3, %PyV3%
			GuiControl, GridR:, PT3, %CHP3%
	}
}
else
{
	If CHP3 = 0
	{
		DP3 = 0
		NDP3 = 0
	}
}
If CHP4 != 0
{
	If CHP4 != 
	{
		CHP4 := CHP4 + MxH4X
		If CHP4 > %MxH4%
		{
			CHP4 = %MxH4%
		}
			GuiControl,, P4,%CHP4%
			GuiControl, GridR:, PyV4, %PyV4%
			GuiControl, GridR:, PT4, %CHP4%
	}
}
else
{
	If CHP4 = 0
	{
		DP4 = 0
		NDP4 = 0
	}
}
If CHP5 != 0
{
	If CHP5 != 
	{
		CHP5 := CHP5 + MxH5X
		If CHP5 > %MxH5%
		{
			CHP5 = %MxH5%
		}
			GuiControl,, P5,%CHP5%
			GuiControl, GridR:, PyV5, %PyV5%
			GuiControl, GridR:, PT5, %CHP5%
	}
}
else
{
	If CHP5 = 0
	{
		DP5 = 0
		NDP5 = 0
	}
}
If CHP6 != 0
{
	If CHP6 != 
	{
		CHP6 := CHP6 + MxH6X
		If CHP6 > %MxH6%
		{
			CHP6 = %MxH6%
		}
			GuiControl,, P6,%CHP6%
			GuiControl, GridR:, PyV6, %PyV6%
			GuiControl, GridR:, PT6, %CHP6%
	}
}
else
{
	If CHP6 = 0
	{
		DP6 = 0
		NDP6 = 0
	}
}
If CHP7 != 0
{
	If CHP7 != 
	{
		CHP7 := CHP7 + MxH7X
		If CHP7 > %MxH7%
		{
			CHP7 = %MxH7%
		}
			GuiControl,, P7,%CHP7%
			GuiControl, GridR:, PyV7, %PyV7%
			GuiControl, GridR:, PT7, %CHP7%
	}
}
else
{
	If CHP7 = 0
	{
		DP7 = 0
		NDP7 = 0
	}
}
If CHP8 != 0
{
	If CHP8 != 
	{
		CHP8 := CHP8 + MxH8X
		If CHP8 > %MxH8%
		{
			CHP8 = %MxH8%
		}
			GuiControl,, P8,%CHP8%
			GuiControl, GridR:, PyV8, %PyV8%
			GuiControl, GridR:, PT8, %CHP8%
	}
}
else
{
	If CHP8 = 0
	{
		DP8 = 0
		NDP8 = 0
	}
}
EndRegenTime := 3000 - (A_Tickcount - TimeCheck1)

Settimer,Els_Regen,%EndRegenTime%
return

ColorUpdate:
GuiControlGet, BG1
GuiControlGet, C1
GuiControlGet, BG2
GuiControlGet, C2
GuiControlGet, BG3
GuiControlGet, C3
GuiControlGet, BG4
GuiControlGet, C4
GuiControlGet, BG5
GuiControlGet, C5
GuiControlGet, BG6
GuiControlGet, C6
GuiControlGet, BG7
GuiControlGet, C7
GuiControlGet, BG8
GuiControlGet, C8
GoSub, LayoutUpdate
Return

LayoutUpdate:
IfWinExist, GridR
{
	WinGetPos , ShowX, ShowY, ShowW, ShowH, GridR,
}
GuiControlGet, OptVar14
GuiControlGet, OptVar41
GuiControlGet, OptVar42
GuiControlGet, OptVar24
GuiControlGet, OptVar18
GuiControlGet, OptVar81
If OptVar14 = 1
{
	GoSub, GridCreate_Vert1
}
If OptVar41 = 1
{
	GoSub, GridCreate_Hor1
}
If OptVar18 = 1
{
	GoSub, GridCreate_Vert1
}
If OptVar81 = 1
{
	GoSub, GridCreate_Hor1
}
If OptVar24 = 1
{
	GoSub, GridCreate_Vert2
}
If OptVar42 = 1
{
	GoSub, GridCreate_Hor2
}
return

GuiDotHide:
Gui, GridR:Default
GuiControl, Hide, Static1
GuiControl, Hide, Static4
GuiControl, Hide, Static7
GuiControl, Hide, Static10
GuiControl, Hide, Static13
GuiControl, Hide, Static16
GuiControl, Hide, Static19
GuiControl, Hide, Static22
return

GridCreate_Vert1:
If WMode = 1
{
	Gui,GridR:New 
	Gui,+AlwaysOnTop +E0x08000000
}
else
{
	If WMode = 2
	{
		Gui,GridR:New 
		Gui,+AlwaysOnTop -Caption +E0x08000000 +0x40000 -Sysmenu
	}
	else
	{
		If WMode = 3
		{
			Gui,GridR:New 
			Gui,+AlwaysOnTop +E0x08000000 +0x40000
		}
	}
}
XTp := FirstX
YTp := FirstY
XPrev := FirstX
YPrev := FirstY
Loop %PAmount%
{
	YPrev := YTp
	CTTp := CT%A_Index%
	PyVX := PyV%A_Index%
	BGX := BG%A_Index%
	MaxX := MxH%A_Index%
	CX := C%A_Index%
	Gui,Add,Progress, x%XTp% y%YTp% w%BW% h%BH% C%CX% Range0-%MaxX% Background%BGX% %Ori% vP%A_Index%
	XTP_TR:= XTp + (BW - Status_SizeX)
	Gui,Add,Picture,x%XTP_TR% y%YTp% w%Status_SizeX% h%Status_SizeY%,%A_ScriptDir%\Images\%Status_SizeX%x%Status_SizeY%_%StatusTR_Color%.png
	Gui,Add,Text,x%XTp% y%YTp% w%BW% h%BH% c%CTTp% +BackgroundTrans +center +0x200 vPyV%A_Index%,%PyVX%
	YTp2 := Round(YTp + (BH/ 2))
	BH2 := Round(BH / 2)
	Gui,Add,Text,x%XTp% y%YTp2% w%BW% h%BH2% c%CTTp% +BackgroundTrans +center +0x200 vPT%A_Index%,
	YTp := YPrev + BH + PixelGap
}
ShowH := (YTp - PixelGap) + 2
ShowW := BW + 4
OnMessage(0x202, "WM_LBUTTONUP")
OnMessage(0x205, "WM_RBUTTONUP")
GuiControl,, P1,%CHP1%
GuiControl,, P2,%CHP2%
GuiControl,, P3,%CHP3%
GuiControl,, P4,%CHP4%
GuiControl,, P5,%CHP5%
GuiControl,, P6,%CHP6%
GuiControl,, P7,%CHP7%
GuiControl,, P8,%CHP8%
GuiControl, GridR:, PyV1, %PyV1%
GuiControl, GridR:, PT1, %CHP1%
GuiControl, GridR:, PyV2, %PyV2%
GuiControl, GridR:, PT2, %CHP2%
GuiControl, GridR:, PyV3, %PyV3%
GuiControl, GridR:, PT3, %CHP3%
GuiControl, GridR:, PyV4, %PyV4%
GuiControl, GridR:, PT4, %CHP4%
GuiControl, GridR:, PyV5, %PyV5%
GuiControl, GridR:, PT5, %CHP5%
GuiControl, GridR:, PyV6, %PyV6%
GuiControl, GridR:, PT6, %CHP6%
GuiControl, GridR:, PyV7, %PyV7%
GuiControl, GridR:, PT7, %CHP7%
GuiControl, GridR:, PyV8, %PyV8%
GuiControl, GridR:, PT8, %CHP8%
GoSub, GuiDotHide
GoSub, Font_Change
Gui,Show,x%ShowX% y%ShowY% w%ShowW% h%ShowH%, GridR
;WinSet, Transparent, %TransValue%, GridR
Gui, GridR:Default
return

GridCreate_Vert2:
If WMode = 1
{
	Gui,GridR:New 
	Gui,+AlwaysOnTop +E0x08000000
}
else
{
	If WMode = 2
	{
		Gui,GridR:New 
		Gui,+AlwaysOnTop -Caption +E0x08000000 +0x40000 -Sysmenu
	}
	else
	{
		If WMode = 3
		{
			Gui,GridR:New 
			Gui,+AlwaysOnTop +E0x08000000 +0x40000
		}
	}
}
XTp := FirstX
YTp := FirstY
XPrev := FirstX
YPrev := FirstY
Loop 4
{
	YPrev := YTp
	CTTp := CT%A_Index%
	PyVX := PyV%A_Index%
	BGX := BG%A_Index%
	MaxX := MxH%A_Index%
	CX := C%A_Index%
	Gui,Add,Progress, x%XTp% y%YTp% w%BW% h%BH% C%CX% Range0-%MaxX% Background%BGX% %Ori% vP%A_Index%
	XTP_TR:= XTp + (BW - Status_SizeX)
	Gui,Add,Picture,x%XTP_TR% y%YTp% w%Status_SizeX% h%Status_SizeY%,%A_ScriptDir%\Images\%Status_SizeX%x%Status_SizeY%_%StatusTR_Color%.png
	Gui,Add,Text,x%XTp% y%YTp% w%BW% h%BH% c%CTTp% +BackgroundTrans +center +0x200 vPyV%A_Index%,%PyVX%
	YTp2 := Round(YTp + (BH/ 2))
	BH2 := Round(BH / 2)
	Gui,Add,Text,x%XTp% y%YTp2% w%BW% h%BH2% c%CTTp% +BackgroundTrans +center +0x200 vPT%A_Index%,
	YTp := YPrev + BH + PixelGap
}
XTp := FirstX
YTp := FirstY
XPrev := FirstX
YPrev := FirstY
XTp := XTp + BW + PixelGap
XPrev := XTp
ICounter = 4
Loop 4
{
	New_Index := A_Index + ICounter
	YPrev := YTp
	CTTp := CT%New_Index%
	PyVX := PyV%New_Index%
	BGX := BG%New_Index%
	MaxX := MxH%New_Index%
	CX := C%New_Index%
	Gui,Add,Progress, x%XTp% y%YTp% w%BW% h%BH% C%CX% Range0-%MaxX% Background%BGX% %Ori% vP%New_Index%
	XTP_TR:= XTp + (BW - Status_SizeX)
	Gui,Add,Picture,x%XTP_TR% y%YTp% w%Status_SizeX% h%Status_SizeY%,%A_ScriptDir%\Images\%Status_SizeX%x%Status_SizeY%_%StatusTR_Color%.png
	Gui,Add,Text,x%XTp% y%YTp% w%BW% h%BH% c%CTTp% +BackgroundTrans +center +0x200 vPyV%New_Index%,%PyVX%
	YTp2 := Round(YTp + (BH/ 2))
	BH2 := Round(BH / 2)
	Gui,Add,Text,x%XTp% y%YTp2% w%BW% h%BH2% c%CTTp% +BackgroundTrans +center +0x200 vPT%New_Index%,
	YTp := YPrev + BH + PixelGap
}
ShowH := (YTp - PixelGap) + 2
ShowW := (BW  * 2) + pixelgap + 4
OnMessage(0x202, "WM_LBUTTONUP")
OnMessage(0x205, "WM_RBUTTONUP")
GuiControl,, P1,%CHP1%
GuiControl,, P2,%CHP2%
GuiControl,, P3,%CHP3%
GuiControl,, P4,%CHP4%
GuiControl,, P5,%CHP5%
GuiControl,, P6,%CHP6%
GuiControl,, P7,%CHP7%
GuiControl,, P8,%CHP8%
GuiControl, GridR:, PyV1, %PyV1%
GuiControl, GridR:, PT1, %CHP1%
GuiControl, GridR:, PyV2, %PyV2%
GuiControl, GridR:, PT2, %CHP2%
GuiControl, GridR:, PyV3, %PyV3%
GuiControl, GridR:, PT3, %CHP3%
GuiControl, GridR:, PyV4, %PyV4%
GuiControl, GridR:, PT4, %CHP4%
GuiControl, GridR:, PyV5, %PyV5%
GuiControl, GridR:, PT5, %CHP5%
GuiControl, GridR:, PyV6, %PyV6%
GuiControl, GridR:, PT6, %CHP6%
GuiControl, GridR:, PyV7, %PyV7%
GuiControl, GridR:, PT7, %CHP7%
GuiControl, GridR:, PyV8, %PyV8%
GuiControl, GridR:, PT8, %CHP8%
GoSub, GuiDotHide
GoSub, Font_Change
Gui,Show,x%ShowX% y%ShowY% w%ShowW% h%ShowH%, GridR
;WinSet, Transparent, %TransValue%, GridR
Gui, GridR:Default
return

GridCreate_Hor1:
If WMode = 1
{
	Gui,GridR:New 
	Gui,+AlwaysOnTop +E0x08000000
}
else
{
	If WMode = 2
	{
		Gui,GridR:New 
		Gui,+AlwaysOnTop -Caption +E0x08000000 +0x40000 -Sysmenu
	}
	else
	{
		If WMode = 3
		{
			Gui,GridR:New 
			Gui,+AlwaysOnTop +E0x08000000 +0x40000
		}
	}
}
XTp := FirstX
YTp := FirstY
XPrev := FirstX
YPrev := FirstY
CounterX = 0
Loop %PAmount%
{
	YPrev := YTp
	CTTp := CT%A_Index%
	PyVX := PyV%A_Index%
	BGX := BG%A_Index%
	MaxX := MxH%A_Index%
	CX := C%A_Index%
	Gui,Add,Progress, x%XTp% y%YTp% w%BW% h%BH% C%CX% Range0-%MaxX% Background%BGX% %Ori% vP%A_Index%
	XTP_TR:= XTp + (BW - Status_SizeX)
	Gui,Add,Picture,x%XTP_TR% y%YTp% w%Status_SizeX% h%Status_SizeY%,%A_ScriptDir%\Images\%Status_SizeX%x%Status_SizeY%_%StatusTR_Color%.png
	Gui,Add,Text,x%XTp% y%YTp% w%BW% h%BH% c%CTTp% +BackgroundTrans +center +0x200 vPyV%A_Index%,%PyVX%
	YTp2 := Round(YTp + (BH/ 2))
	BH2 := Round(BH / 2)
	Gui,Add,Text,x%XTp% y%YTp2% w%BW% h%BH2% c%CTTp% +BackgroundTrans +center +0x200 vPT%A_Index%,
	YTp := YPrev + BH + PixelGap
	XTp := FirstX
	YTp := FirstY
	XPrev := FirstX
	YPrev := FirstY
	XTp := XTp + BW + PixelGap + CounterX
	XPrev := XTp
	CounterX := CounterX + BW + PixelGap
}
ShowW := (XTp - PixelGap) + 2
ShowH := BH + 4
OnMessage(0x202, "WM_LBUTTONUP")
OnMessage(0x205, "WM_RBUTTONUP")
GuiControl,, P1,%CHP1%
GuiControl,, P2,%CHP2%
GuiControl,, P3,%CHP3%
GuiControl,, P4,%CHP4%
GuiControl,, P5,%CHP5%
GuiControl,, P6,%CHP6%
GuiControl,, P7,%CHP7%
GuiControl,, P8,%CHP8%
GuiControl, GridR:, PyV1, %PyV1%
GuiControl, GridR:, PT1, %CHP1%
GuiControl, GridR:, PyV2, %PyV2%
GuiControl, GridR:, PT2, %CHP2%
GuiControl, GridR:, PyV3, %PyV3%
GuiControl, GridR:, PT3, %CHP3%
GuiControl, GridR:, PyV4, %PyV4%
GuiControl, GridR:, PT4, %CHP4%
GuiControl, GridR:, PyV5, %PyV5%
GuiControl, GridR:, PT5, %CHP5%
GuiControl, GridR:, PyV6, %PyV6%
GuiControl, GridR:, PT6, %CHP6%
GuiControl, GridR:, PyV7, %PyV7%
GuiControl, GridR:, PT7, %CHP7%
GuiControl, GridR:, PyV8, %PyV8%
GuiControl, GridR:, PT8, %CHP8%
GoSub, GuiDotHide
GoSub, Font_Change
Gui,Show,x%ShowX% y%ShowY% w%ShowW% h%ShowH%, GridR
;WinSet, Transparent, %TransValue%, GridR
Gui, GridR:Default
return

GridCreate_Hor2:
If WMode = 1
{
	Gui,GridR:New 
	Gui,+AlwaysOnTop +E0x08000000
}
else
{
	If WMode = 2
	{
		Gui,GridR:New 
		Gui,+AlwaysOnTop -Caption +E0x08000000 +0x40000 -Sysmenu
	}
	else
	{
		If WMode = 3
		{
			Gui,GridR:New 
			Gui,+AlwaysOnTop +E0x08000000 +0x40000
		}
	}
}
XTp := FirstX
YTp := FirstY
XPrev := FirstX
YPrev := FirstY
CounterX = 0
Loop 4
{
	YPrev := YTp
	CTTp := CT%A_Index%
	PyVX := PyV%A_Index%
	BGX := BG%A_Index%
	MaxX := MxH%A_Index%
	CX := C%A_Index%
	Gui,Add,Progress, x%XTp% y%YTp% w%BW% h%BH% C%CX% Range0-%MaxX% Background%BGX% %Ori% vP%A_Index%
	XTP_TR:= XTp + (BW - Status_SizeX)
	Gui,Add,Picture,x%XTP_TR% y%YTp% w%Status_SizeX% h%Status_SizeY%,%A_ScriptDir%\Images\%Status_SizeX%x%Status_SizeY%_%StatusTR_Color%.png
	Gui,Add,Text,x%XTp% y%YTp% w%BW% h%BH% c%CTTp% +BackgroundTrans +center +0x200 vPyV%A_Index%,%PyVX%
	YTp2 := Round(YTp + (BH/ 2))
	BH2 := Round(BH / 2)
	Gui,Add,Text,x%XTp% y%YTp2% w%BW% h%BH2% c%CTTp% +BackgroundTrans +center +0x200 vPT%A_Index%,
	YTp := YPrev + BH + PixelGap
	XTp := FirstX
	YTp := FirstY
	XPrev := FirstX
	YPrev := FirstY
	XTp := XTp + BW + PixelGap + CounterX
	XPrev := XTp
	CounterX := CounterX + BW + PixelGap
}
XTp := FirstX
YTp := FirstY
XPrev := FirstX
YPrev := FirstY
YTp := YTp + BH + PixelGap
YPrev := YTp
ICounter = 4
CounterX = 0
Loop 4
{
	New_Index := A_Index + ICounter
	YPrev := YTp
	CTTp := CT%New_Index%
	PyVX := PyV%New_Index%
	BGX := BG%New_Index%
	MaxX := MxH%New_Index%
	CX := C%New_Index%
	Gui,Add,Progress, x%XTp% y%YTp% w%BW% h%BH% C%CX% Range0-%MaxX% Background%BGX% %Ori% vP%New_Index%
	XTP_TR:= XTp + (BW - Status_SizeX)
	Gui,Add,Picture,x%XTP_TR% y%YTp% w%Status_SizeX% h%Status_SizeY%,%A_ScriptDir%\Images\%Status_SizeX%x%Status_SizeY%_%StatusTR_Color%.png
	Gui,Add,Text,x%XTp% y%YTp% w%BW% h%BH% c%CTTp% +BackgroundTrans +center +0x200 vPyV%New_Index%,%PyVX%
	YTp2 := Round(YTp + (BH/ 2))
	BH2 := Round(BH / 2)
	Gui,Add,Text,x%XTp% y%YTp2% w%BW% h%BH2% c%CTTp% +BackgroundTrans +center +0x200 vPT%New_Index%,
	XTp := FirstX
	XPrev := FirstX
	YPrev := FirstY
	XTp := XTp + BW + PixelGap + CounterX
	XPrev := XTp
	CounterX := CounterX + BW + PixelGap
}
ShowW := (XTp - PixelGap) + 2
ShowH := (BH * 2) + PixelGap + 4
OnMessage(0x202, "WM_LBUTTONUP")
OnMessage(0x205, "WM_RBUTTONUP")
GuiControl,, P1,%CHP1%
GuiControl,, P2,%CHP2%
GuiControl,, P3,%CHP3%
GuiControl,, P4,%CHP4%
GuiControl,, P5,%CHP5%
GuiControl,, P6,%CHP6%
GuiControl,, P7,%CHP7%
GuiControl,, P8,%CHP8%
GuiControl, GridR:, PyV1, %PyV1%
GuiControl, GridR:, PT1, %CHP1%
GuiControl, GridR:, PyV2, %PyV2%
GuiControl, GridR:, PT2, %CHP2%
GuiControl, GridR:, PyV3, %PyV3%
GuiControl, GridR:, PT3, %CHP3%
GuiControl, GridR:, PyV4, %PyV4%
GuiControl, GridR:, PT4, %CHP4%
GuiControl, GridR:, PyV5, %PyV5%
GuiControl, GridR:, PT5, %CHP5%
GuiControl, GridR:, PyV6, %PyV6%
GuiControl, GridR:, PT6, %CHP6%
GuiControl, GridR:, PyV7, %PyV7%
GuiControl, GridR:, PT7, %CHP7%
GuiControl, GridR:, PyV8, %PyV8%
GuiControl, GridR:, PT8, %CHP8%
GoSub, GuiDotHide
GoSub, Font_Change
Gui,Show,x%ShowX% y%ShowY% w%ShowW% h%ShowH%, GridR
;WinSet, Transparent, %TransValue%, GridR
Gui, GridR:Default
return

PDU:
Guicontrolget,PixelMove
WinGetPos , ShowX, ShowY, ShowW, ShowH, GridR,
ShowH := ShowH - (8 * PixelMove)
BH := BH - PixelMove
GoSub, LayoutUpdate
return

PDD:
Guicontrolget,PixelMove
WinGetPos , ShowX, ShowY, ShowW, ShowH, GridR,
ShowH := ShowH + (8 * PixelMove)
BH := BH + PixelMove
GoSub, LayoutUpdate
return

PDL:
Guicontrolget,PixelMove
WinGetPos , ShowX, ShowY, ShowW, ShowH, GridR,
ShowW := ShowW - PixelMove
BW := BW - PixelMove
GoSub, LayoutUpdate
return

PDR:
Guicontrolget,PixelMove
WinGetPos , ShowX, ShowY, ShowW, ShowH, GridR,
ShowW := ShowW + PixelMove
BW := BW + PixelMove
GoSub, LayoutUpdate
return

GapPlus:
PixelGap += 1
WinGetPos , ShowX, ShowY, ShowW, ShowH, GridR,
ShowH := ShowH + 7
GoSub, LayoutUpdate
return

GapMinus:
PixelGap -= 1

If PixelGap <= 1
{
	PixelGap = 1
}
else
{
	WinGetPos , ShowX, ShowY, ShowW, ShowH, GridR,
	ShowH := ShowH - 7
}
GoSub, LayoutUpdate
return

PlayerMove:
ListSel1 =0
ListSel2 =0
Gui, Grid_Layout:default
ControlGet, ListSel2, List, Count Selected, SysListView322
ControlGet, ListSel1, List, Count Selected, SysListView321
ControlGet, SRNum2, List, Count Focused, SysListView322
ControlGet, SRNum1, List, Count Focused, SysListView321
If ListSel1 <> 0
{
	If ListSel2 <> 0
	{
		Gui, Listview, UHPList
		LV_GetText(TpLVName,SRNum2,1)
		LV_GetText(TpLVMxH,SRNum2,2)
		Gui, Listview, PlayerHPList
		LV_Delete(SRNum1)
		LV_Insert(SRNum1,"",TpLVMxH,TpLVName,SRNum1)
		PrAy := Array()
		SRNew := SRNum1 - 1
		SRFinal := 8 - SRNew - 1
		Loop %SRNew%
		{
			PyVX := PyV%A_Index%
			PrAy.insert(PyVX)
		}
		PrAy.Insert(TpLVName)
		Loop %SRFinal%
		{
			SRInsert := SRNum1 + A_Index
			PyVX := PyV%SRInsert%
			PrAy.insert(PyVX)
		}
		PyV%SRNum1% = %TpLVName%
		PT%SRNum1% = %TpLVMxH%
		MxH%SRNum1% = %TpLVMxH%
		MxHX := MxH%SRNum1%
		CHP%SRNum1% := MxHX
		GoSub, LayoutUpdate
	}
	else
	{
		msgbox,4096,, Select a U Name,2
	}
}
else
{
	msgbox ,4096,,Select a Player to Overwrite,2
}
Return

KeyBind_Save:
Gui Grid_Layout:Default
GuiControlget, LMC
GuiControlget, LMCtrl
GuiControlget, LMShift
GuiControlget, LMAlt
GuiControlget, LMCS
GuiControlget, LMCA
GuiControlget, LMSA
GuiControlget, RMC
GuiControlget, RMCtrl
GuiControlget, RMShift
GuiControlget, RMAlt
GuiControlget, RMCS
GuiControlget, RMCA
GuiControlget, RMSA
LMAy := Array()
LMAy.Insert(LMC)
LMAy.Insert(LMCtrl)
LMAy.Insert(LMShift)
LMAy.Insert(LMAlt)
LMAy.Insert(LMCS)
LMAy.Insert(LMCA)
LMAy.Insert(LMSA)
RMArray := Array()
RMArray.Insert(RMC)
RMArray.Insert(RMCtrl)
RMArray.Insert(RMShift)
RMArray.Insert(RMAlt)
RMArray.Insert(RMCS)
RMArray.Insert(RMCA)
RMArray.Insert(RMSA)
msgbox ,4096,,Keys Saved,1 ;`nLMC:%LMC%,2
return

OptV:
Ori = Vertical
GoSub, LayoutUpdate
Return

OptH:
Ori = 
GoSub, LayoutUpdate
Return

ColorWheelGo:
Clipboard = %CWWebsite%
msgbox, 4096,,Copied to Clipboard,2
Return

Opt14:
GuiControlGet, OptVar14
PAmount = 4
GoSub, LayoutUpdate
Return

Opt41:
GuiControlGet, OptVar41
PAmount = 4
GoSub, LayoutUpdate
Return

Opt42:
GuiControlGet, OptVar42
GoSub, LayoutUpdate
Return

Opt24:
GuiControlGet, OptVar24
GoSub, LayoutUpdate
Return

Opt18:
GuiControlGet, OptVar18
PAmount = 8
GoSub, LayoutUpdate
Return

Opt81:
GuiControlGet, OptVar81
PAmount = 8
GoSub, LayoutUpdate
Return

UClear:
Gui, Grid_Layout:default
Gui, Listview, UHPList
LV_Delete()
UNameVar =
Return

UStart:
UStart = 1
Return

UStop:
UStart = 0
Return

WModeUpdate:
GuiControlGet, WM1
GuiControlGet, WM2
GuiControlGet, WM3
If WM1 = 1
{
	WMode = 1
}
If WM2 = 1
{
	WMode = 2
}
If WM3 = 1
{
	WMode = 3
}
GoSub, LayoutUpdate
Return

Left_Cast:
Gui Grid_Layout:default
MOGui = 
MouseGetPos,,,,MOGui
	GetKeyState, StateShift, Shift
	GetKeyState, StateControl, Control
	GetKeyState, StateAlt, Alt
IF MOGui <>
{
	SendInput, {%BPd% down}
	SendInput, {%BPd% down}
	sleep, 50
	SendInput, {%BPd% up}
	SendInput, {%BPd% up}
	MoPd =
	If StateShift = D
	{
		MoPd = %MoPd%Shift
		SendInput, {Shift up}
	}
	If StateControl = D
	{
		MoPd = %MoPd%Control
		SendInput, {Control up}
	}
	If StateAlt = D
	{
		MoPd = %MoPd%Alt
		SendInput, {Alt up}
	}
	If MoPd =
	{
		SendVar := LMAy[1]
		GoSub, MainGo
	}
	else
	{
		If MoPd = Shift
		{
			SendVar := LMAy[3]
			GoSub, MainGo
		}
		else
		{
			If MoPd = Control
			{
				SendVar := LMAy[2]
				GoSub, MainGo
			}
			else
			{
				If MoPd = Alt
				{
					SendVar := LMAy[4]
					GoSub, MainGo
				}
				else
				{
					IF MoPd = ShiftControl
					{
						SendVar := LMAy[5]
						GoSub, MainGo
					}
					else
					{
						If MoPd = ShiftAlt
						{
							SendVar := LMAy[7]
							GoSub, MainGo
						}
						else
						{
							If MoPd = ControlAlt
							{
								SendVar := LMAy[6]
								GoSub, MainGo
							}
						}
					}
				}
			}
		}
	}
}
Return

Right_Cast:
Gui Grid_Layout:default
MOGui = 
MouseGetPos,,,,MOGui
	GetKeyState, StateShift, Shift
	GetKeyState, StateControl, Control
	GetKeyState, StateAlt, Alt
IF MOGui <>
{
	SendInput, {%BPd% down}
	SendInput, {%BPd% down}
	sleep, 50
	SendInput, {%BPd% up}
	SendInput, {%BPd% up}
	MoPd =
	If StateShift = D
	{
		MoPd = %MoPd%Shift
		SendInput, {Shift up}
	}
	If StateControl = D
	{
		MoPd = %MoPd%Control
		SendInput, {Control up}
	}
	If StateAlt = D
	{
		MoPd = %MoPd%Alt
		SendInput, {Alt up}
	}
	If MoPd =
	{
		SendVar := RMArray[1]
		GoSub, MainGo
	}
	else
	{
		If MoPd = Shift
		{
			SendVar := RMArray[3]
			GoSub, MainGo
		}
		else
		{
			If MoPd = Control
			{
				SendVar := RMArray[2]
				GoSub, MainGo
			}
			else
			{
				If MoPd = Alt
				{
					SendVar := RMArray[4]
					GoSub, MainGo
				}
				else
				{
					IF MoPd = ShiftControl
					{
						SendVar := RMArray[5]
						GoSub, MainGo
					}
					else
					{
						If MoPd = ShiftAlt
						{
							SendVar := RMArray[7]
							GoSub, MainGo
						}
						else
						{
							If MoPd = ControlAlt
							{
								SendVar := RMArray[6]
								GoSub, MainGo
							}
						}
					}
				}
			}
		}
	}
}
Return

MainGo:
If StrLen(SendVar) = 1
{

	SendInput, {%SendVar% down}
	SendInput, {%SendVar% down}
	sleep, 50
	SendInput, {%SendVar% up}
	SendInput, {%SendVar% up}
}
else
{
	If Strlen(SendVar) = 2
	{
		SendVar2 := substr(SendVar, 2,1)
		IF substr(SendVar, 1,1) = "S"
		{
			SendInput, {Shift down}
			SendInput, {Shift down}
			SendInput, {%SendVar2% down}
			SendInput, {%SendVar2% down}
			sleep, 75
			SendInput, {%SendVar2% up}
			SendInput, {%SendVar2% up}
			SendInput, {Shift up}
			SendInput, {Shift up}
		}
		else
		{
			IF substr(SendVar, 1,1) = "C"
			{
				SendInput, {Control down}
				SendInput, {Control down}
				SendInput, {%SendVar2% down}
				SendInput, {%SendVar2% down}
				sleep, 75
				SendInput, {%SendVar2% up}
				SendInput, {%SendVar2% up}
				SendInput, {Control up}
				SendInput, {Control up}
			}
			else
			{
				IF substr(SendVar, 1,1) = "A"
				{
					SendInput, {Alt down}
					SendInput, {Alt down}
					SendInput, {%SendVar2% down}
					SendInput, {%SendVar2% down}
					sleep, 75
					SendInput, {%SendVar2% up}
					SendInput, {%SendVar2% up}
					SendInput, {Alt up}
					SendInput, {Alt up}
				}
			}
		}
	}
	else
	{
		If Strlen(SendVar) = 3
		{
			IF (substr(SendVar, 1,1) = "S" or substr(SendVar, 2,1) = "S")
			{
				SendInput, {Shift down}
				SendInput, {Shift down}
				Sleep, 50
			}
			If (substr(SendVar, 1,1) = "C" or substr(SendVar, 2,1) = "C")
			{
				SendInput, {Control down}
				SendInput, {Control down}
				Sleep, 50
			}
			If (substr(SendVar, 1,1) = "A" or substr(SendVar, 2,1) = "A")
			{
				SendInput, {Alt down}
				SendInput, {Alt down}
				Sleep, 50
			}
			SendVar2 := substr(SendVar,3,1)
			SendInput, {%SendVar2% down}
			SendInput, {%SendVar2% down}
			Sleep, 50
			SendInput, {%SendVar2% up}
			SendInput, {%SendVar2% up}
			IF (substr(SendVar, 1,1) = "S" or substr(SendVar, 2,1) = "S")
			{
				SendInput, {Shift up}
				SendInput, {Shift up}
			}
			If (substr(SendVar, 1,1) = "C" or substr(SendVar, 2,1) = "C")
			{
				SendInput, {Control up}
				SendInput, {Control up}
			}
			If (substr(SendVar, 1,1) = "A" or substr(SendVar, 2,1) = "A")
			{
				SendInput, {Alt up}
				SendInput, {Alt up}
			}
		}
	}
}
return
;-------------------------------------------------------------------------------

WM_LBUTTONUP(wParam, lParam, msg, hwnd)
{
	MouseGetPos,,,,MOCL
	If (MOCL = "Static1" or MOCL = "Static2" or MOCL = "Static3")
	{
		BPd = F1
		GoSub, Left_Cast
	}
	If (MOCL = "Static4" or MOCL = "Static5" or MOCL = "Static6")
	{
		BPd = F2
		GoSub, Left_Cast
	}
	If (MOCL = "Static7" or MOCL = "Static8" or MOCL = "Static9")
	{
		BPd = F3
		GoSub, Left_Cast
	}
	If (MOCL = "Static10" or MOCL = "Static11" or MOCL = "Static12")
	{
		BPd = F4
		GoSub, Left_Cast
	}
	If (MOCL = "Static13" or MOCL = "Static14" or MOCL = "Static15")
	{
		BPd = F5
		GoSub, Left_Cast
	}
	If (MOCL = "Static16" or MOCL = "Static17" or MOCL = "Static18")
	{
		BPd = F6
		GoSub, Left_Cast
	}
	If (MOCL = "Static19" or MOCL = "Static20" or MOCL = "Static21")
	{
		BPd = F7
		GoSub, Left_Cast
	}
	If (MOCL = "Static22" or MOCL = "Static23" or MOCL = "Static24")
	{
		BPd = F8
		GoSub, Left_Cast
	}
}
return

WM_RBUTTONUP(wParam, lParam, msg, hwnd)
{
	MouseGetPos,,,,MOCL
	If (MOCL = "Static1" or MOCL = "Static2" or MOCL = "Static3")
	{
		BPd = F1
		GoSub, Right_Cast
	}
	If (MOCL = "Static4" or MOCL = "Static5" or MOCL = "Static6")
	{
		BPd = F2
		GoSub, Right_Cast
	}
	If (MOCL = "Static7" or MOCL = "Static8" or MOCL = "Static9")
	{
		BPd = F3
		GoSub, Right_Cast
	}
	If (MOCL = "Static10" or MOCL = "Static11" or MOCL = "Static12")
	{
		BPd = F4
		GoSub, Right_Cast
	}
	If (MOCL = "Static13" or MOCL = "Static14" or MOCL = "Static15")
	{
		BPd = F5
		GoSub, Right_Cast
	}
	If (MOCL = "Static16" or MOCL = "Static17" or MOCL = "Static18")
	{
		BPd = F6
		GoSub, Right_Cast
	}
	If (MOCL = "Static19" or MOCL = "Static20" or MOCL = "Static21")
	{
		BPd = F7
		GoSub, Right_Cast
	}
	If (MOCL = "Static22" or MOCL = "Static23" or MOCL = "Static24")
	{
		BPd = F8
		GoSub, Right_Cast
	}
}
return



GoSave:
WinGetPos , ShowX, ShowY,,,GridR
Gui Grid_Layout:Default
GuiControlget, LMC
GuiControlget, LMCtrl
GuiControlget, LMShift
GuiControlget, LMAlt
GuiControlget, LMCS
GuiControlget, LMCA
GuiControlget, LMSA
GuiControlget, RMC
GuiControlget, RMCtrl
GuiControlget, RMShift
GuiControlget, RMAlt
GuiControlget, RMCS
GuiControlget, RMCA
GuiControlget, RMSA
GuiControlGet, OptVar14
GuiControlGet, OptVar41
GuiControlGet, OptVar42
GuiControlGet, OptVar24
GuiControlGet, OptVar18
GuiControlGet, OptVar81
GuiControlGet, OptVarV
GuiControlGet, OptVarH
GuiControlGet, C1
GuiControlGet, BG1
GuiControlGet, C2
GuiControlGet, BG2
GuiControlGet, C3
GuiControlGet, BG3
GuiControlGet, C4
GuiControlGet, BG4
GuiControlGet, C5
GuiControlGet, BG5
GuiControlGet, C6
GuiControlGet, BG6
GuiControlGet, C7
GuiControlGet, BG7
GuiControlGet, C8
GuiControlGet, BG8
GuiControlGet, IS_Surr
GuiControlGet, IS_Full

	If FileExist(SaveFile) = ""
	{
				;	-----File Does NOT Exist
		GoSub, SaveMath
		MsgBox, 4096, Settings, Settings Saved to %SaveFile%, 4
		;Run,Notepad %CurrentFile%
	}
	else	
	{
				;	-----File DOES Exist
		FileDelete, %SaveFile%
		GoSub, SaveMath
		MsgBox, 4096, Settings, Settings Saved to %SaveFile%, 2
		;Run,Notepad %CurrentFile%
	}
return

SaveMath:
;msgbox About to save to %SaveFile%
FileAppend,%ShowX%`n, %SaveFile%
FileAppend,%ShowY%`n, %SaveFile%
FileAppend,%ShowW%`n, %SaveFile%
FileAppend,%ShowH%`n, %SaveFile%
FileAppend,%BH%`n, %SaveFile%
FileAppend,%BW%`n, %SaveFile%
FileAppend,%TransValue%`n, %SaveFile%
FileAppend,%PixelGap%`n, %SaveFile%
FileAppend,%PAmount%`n, %SaveFile%
FileAppend,%LMC%`n, %SaveFile%
FileAppend,%LMCtrl%`n, %SaveFile%
FileAppend,%LMShift%`n, %SaveFile%
FileAppend,%LMAlt%`n, %SaveFile%
FileAppend,%LMCS%`n, %SaveFile%
FileAppend,%LMCA%`n, %SaveFile%
FileAppend,%LMSA%`n, %SaveFile%
FileAppend,%RMC%`n, %SaveFile%
FileAppend,%RMCtrl%`n, %SaveFile%
FileAppend,%RMShift%`n, %SaveFile%
FileAppend,%RMAlt%`n, %SaveFile%
FileAppend,%RMCS%`n, %SaveFile%
FileAppend,%RMCA%`n, %SaveFile%
FileAppend,%RMSA%`n, %SaveFile%
FileAppend,%WMode%`n, %SaveFile%
FileAppend,%OptVar14%`n, %SaveFile%
FileAppend,%OptVar41%`n, %SaveFile%
FileAppend,%OptVar42%`n, %SaveFile%
FileAppend,%OptVar24%`n, %SaveFile%
FileAppend,%OptVar18%`n, %SaveFile%
FileAppend,%OptVar81%`n, %SaveFile%
FileAppend,%OptVarV%`n, %SaveFile%
FileAppend,%OptVarH%`n, %SaveFile%
FileAppend,%Ori%`n, %SaveFile%
FileAppend,%WM1%`n, %SaveFile%
FileAppend,%WM2%`n, %SaveFile%
FileAppend,%WM3%`n, %SaveFile%
FileAppend,%C1%`n, %SaveFile%
FileAppend,%BG1%`n, %SaveFile%
FileAppend,%C2%`n, %SaveFile%
FileAppend,%BG2%`n, %SaveFile%
FileAppend,%C3%`n, %SaveFile%
FileAppend,%BG3%`n, %SaveFile%
FileAppend,%C4%`n, %SaveFile%
FileAppend,%BG4%`n, %SaveFile%
FileAppend,%C5%`n, %SaveFile%
FileAppend,%BG5%`n, %SaveFile%
FileAppend,%C6%`n, %SaveFile%
FileAppend,%BG6%`n, %SaveFile%
FileAppend,%C7%`n, %SaveFile%
FileAppend,%BG7%`n, %SaveFile%
FileAppend,%C8%`n, %SaveFile%
FileAppend,%BG8%`n, %SaveFile%
FileAppend,%IS_Surr%`n, %SaveFile%
FileAppend,%IS_Full%`n, %SaveFile%
FileAppend,%GridFontSize%`n, %SaveFile%

return

Load_Check:
	If FileExist(SaveFile) = ""
	{
				;	-----File Does NOT Exist
	}
	else	
	{
				;	-----File DOES Exist
		GoSub, LoadMath
		;Traytip,Presets Loaded, Minimizing...
		;msgbox,4096,,Presets Loaded,2
		;Run,Notepad %SaveFile%
	}
return

LoadMath:
FileReadLine, ShowX, %SaveFile%, 1
FileReadLine, ShowY, %SaveFile%, 2
FileReadLine, ShowW, %SaveFile%, 3
FileReadLine, ShowH, %SaveFile%, 4
FileReadLine, BH, %SaveFile%, 5
FileReadLine, BW, %SaveFile%, 6
FileReadLine, TransValue, %SaveFile%, 7
FileReadLine, PixelGap, %SaveFile%, 8
FileReadLine, PAmount, %SaveFile%, 9
FileReadLine, LMC, %SaveFile%, 10
FileReadLine, LMCtrl, %SaveFile%, 11
FileReadLine, LMShift, %SaveFile%, 12
FileReadLine, LMAlt, %SaveFile%, 13
FileReadLine, LMCS, %SaveFile%, 14
FileReadLine, LMCA, %SaveFile%, 15
FileReadLine, LMSA, %SaveFile%, 16
FileReadLine, RMC, %SaveFile%, 17
FileReadLine, RMCtrl, %SaveFile%, 18
FileReadLine, RMShift, %SaveFile%, 19
FileReadLine, RMAlt, %SaveFile%, 20
FileReadLine, RMCS, %SaveFile%, 21
FileReadLine, RMCA, %SaveFile%, 22
FileReadLine, RMSA, %SaveFile%, 23
FileReadLine, WMode, %SaveFile%, 24
FileReadLine, OptVar14, %SaveFile%, 25
FileReadLine, OptVar41, %SaveFile%, 26
FileReadLine, OptVar42, %SaveFile%, 27
FileReadLine, OptVar24, %SaveFile%, 28
FileReadLine, OptVar18, %SaveFile%, 29
FileReadLine, OptVar81, %SaveFile%, 30
FileReadLine, OptVarV, %SaveFile%, 31
FileReadLine, OptVarH, %SaveFile%, 32
FileReadLine, Ori, %SaveFile%, 33
FileReadLine, WM1, %SaveFile%, 34
FileReadLine, WM2, %SaveFile%, 35
FileReadLine, WM3, %SaveFile%, 36
FileReadLine, C1, %SaveFile%, 37
FileReadLine, BG1, %SaveFile%, 38
FileReadLine, C2, %SaveFile%, 39
FileReadLine, BG2, %SaveFile%, 40
FileReadLine, C3, %SaveFile%, 41
FileReadLine, BG3, %SaveFile%, 42
FileReadLine, C4, %SaveFile%, 43
FileReadLine, BG4, %SaveFile%, 44
FileReadLine, C5, %SaveFile%, 45
FileReadLine, BG5, %SaveFile%, 46
FileReadLine, C6, %SaveFile%, 47
FileReadLine, BG6, %SaveFile%, 48
FileReadLine, C7, %SaveFile%, 49
FileReadLine, BG7, %SaveFile%, 50
FileReadLine, C8, %SaveFile%, 51
FileReadLine, BG8, %SaveFile%, 52
FileReadLine, IS_Surr, %SaveFile%, 53
FileReadLine, Is_Full, %SaveFile%, 54
FileReadLine, GridFontSize, %SaveFile%, 55

;------------------------
LMAy := Array()
LMAy.Insert(LMC)
LMAy.Insert(LMCtrl)
LMAy.Insert(LMShift)
LMAy.Insert(LMAlt)
LMAy.Insert(LMCS)
LMAy.Insert(LMCA)
LMAy.Insert(LMSA)
RMArray := Array()
RMArray.Insert(RMC)
RMArray.Insert(RMCtrl)
RMArray.Insert(RMShift)
RMArray.Insert(RMAlt)
RMArray.Insert(RMCS)
RMArray.Insert(RMCA)
RMArray.Insert(RMSA)

IsSaved = 1
return

