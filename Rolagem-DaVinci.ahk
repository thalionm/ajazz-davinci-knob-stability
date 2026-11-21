; AJAZZ / DaVinci Resolve - versao consolidada em 2026-11-19
; Knob central + clique sustentado: movimento relativo fino.
#Requires AutoHotkey v1.1.37+
#SingleInstance Force
#MaxThreadsBuffer Off
SetBatchLines, -1
#InstallMouseHook
#NoEnv
#InstallKeybdHook
#MenuMaskKey vkFF
#MaxHotkeysPerInterval 2000
SendMode Input
SetWorkingDir %A_ScriptDir%
Menu, Tray, Tip, AJAZZ - DaVinci | Movimento relativo

^F11::
SendControllerEvent("ctrl-wheel", "{Blind}{WheelUp}")
return

^F12::
SendControllerEvent("ctrl-wheel", "{Blind}{WheelDown}")
return

^F4::
SendControllerEvent("alt-wheel", "!{WheelUp}")
return

^F5::
SendControllerEvent("alt-wheel", "!{WheelDown}")
return

^F7::
SendControllerEvent("horizontal-wheel", "{WheelLeft}")
return

^F8::
SendControllerEvent("horizontal-wheel", "{WheelRight}")
return

^F1::
SendControllerEvent("fast-vertical-wheel", "{WheelUp 3}")
return

^F2::
SendControllerEvent("fast-vertical-wheel", "{WheelDown 3}")
return

^F9::
SendControllerEvent("vertical-wheel", "{WheelUp}")
return

^F10::
SendControllerEvent("vertical-wheel", "{WheelDown}")
return

^F3::
SendControllerEvent("page-jump", "{WheelDown 15}")
return

SendControllerEvent(channel, keys, interval := 40)
{
    static lastSent := {}

    if (!WinActive("ahk_exe Resolve.exe"))
    {
        SendInput, %keys%
        return
    }

    now := A_TickCount
    if (lastSent.HasKey(channel))
    {
        elapsed := now - lastSent[channel]
        if (elapsed >= 0 && elapsed < interval)
            return
    }

    lastSent[channel] := now
    SendInput, %keys%
}

; Segunda funcao do knob:
; Resolve ativo + botao esquerdo fisicamente pressionado.

; Knob central ajusta o parametro durante o clique sustentado.
#If WinActive("ahk_exe Resolve.exe") && GetKeyState("LButton", "P")

Left::
MoveInspectorRelative(-1)
return

Right::
MoveInspectorRelative(1)
return

#If

; Ajuste direto: um movimento relativo por acionamento aceito.
; Sem filtro de 40 ms, acumulador, timer ou repeticao automatica.
MoveInspectorRelative(dx)
{
    static input, size := 0, offset := 0
    if (!WinActive("ahk_exe Resolve.exe") || !GetKeyState("LButton", "P"))
        return
    if (dx != -1 && dx != 1)
        return

    if (!size)
    {
        size := (A_PtrSize = 8) ? 40 : 28
        offset := (A_PtrSize = 8) ? 8 : 4
        VarSetCapacity(input, size, 0)
        NumPut(0x0001, input, offset + 12, "UInt") ; MOUSEEVENTF_MOVE somente
    }
    NumPut(dx, input, offset, "Int")
    return DllCall("user32\SendInput", "UInt", 1, "Ptr", &input, "Int", size, "UInt")
}