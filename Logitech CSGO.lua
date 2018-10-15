local fire_key = PressMouseButton1
local ignore_key = "lshift"

function OnEvent(event, arg)
OutputLogMessage("event = %s, arg = %d\n", event, arg)
if (event == "PROFILE_ACTIVATED") then
EnablePrimaryMouseButtonEvents(true)
elseif event == "PROFILE_DEACTIVATED" then
ReleaseMouseButton(2) -- to prevent it from being stuck on
end
if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
recoil = not recoil
end
if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and recoil) then
        if ((current_weapon == "none") or IsModifierPressed(ignore_key)) then
            PressKey(fire_key)
            repeat
                Sleep(30)
            until not IsMouseButtonPressed(1)
            ReleaseKey(fire_key)
        else
if recoil then
repeat

MoveMouseRelative(0, 2)
Sleep(10)
MoveMouseRelative(0, 2)
Sleep(10)
MoveMouseRelative(0, 5)
Sleep(10)
MoveMouseRelative(0, 5)
Sleep(10)

until not IsMouseButtonPressed(1)
end
end
end
end