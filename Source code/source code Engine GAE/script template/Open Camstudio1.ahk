;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

program=%A_ProgramFiles%\CamStudio\Recorder.exe
;//program=notepad

hwndprogram:=WinExist("a")

Run, %program%

WinWaitNotActive, ahk_id %hwndprogram%

hwndprogram:=WinExist("a")

WinWait, CamStudio, 
IfWinNotActive, CamStudio, , WinActivate, CamStudio, 
WinWaitActive, CamStudio, 
MouseClick, left,  57,  38
Sleep, 100
MouseClick, left,  62,  93
Sleep, 100
MouseClick, left,  23,  67
Sleep, 100