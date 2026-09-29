#InstallMouseHook
#NoEnv
#InstallKeybdHook
#MenuMaskKey vkFF
#MaxHotkeysPerInterval 2000
SendMode Input
SetWorkingDir %A_ScriptDir%

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
SendControllerEvent("inspector-adjust", "{Click -1 0 0 Rel}")
return

Right::
SendControllerEvent("inspector-adjust", "{Click 1 0 0 Rel}")
return

#If
