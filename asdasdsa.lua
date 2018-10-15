local fire_key = nil
local r_fire = 4
local hold_breath_key = "lshift"

function OnEvent(event, arg)
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
        click = 0
    end

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
        recoil = not recoil
        if (recoil == false) then
            OutputLogMessage(">>>>>>>>>> OFF <<<<<<<<<<\n")
        else
            OutputLogMessage(">>>>>>>>>> ON <<<<<<<<<<\n")
        end
    end

    OutputLogMessage("event = %s, arg = %d\n", event, arg)
    --IF SHOOTING
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and recoil) then
        click = 1
        Click()
    end

    if (event == "M_RELEASED" and arg == 3) then
        Click()
    end

    if (event == "MOUSE_BUTTON_RELEASED" and arg == 1) then
        Stopclick()
    end
end

--SHOOT RED DOT/HOLO/2X
function Click()
    PressKey("lshift")
    PressAndReleaseMouseButton(1)
    Sleep(7)
    MoveMouseRelative(0, 2)
    if click == 0 then
        Stopclick()
        ReleaseKey("lshift")
    elseif click == 1 then
        SetMKeyState(3)
    else
        Stopclick()
    end
end

function Stopclick()
    click = 0
end

if IsKeyLockOn("numlock") then
    if IsMouseButtonPressed(3) then
        repeat
            --norecoil
            if IsMouseButtonPressed(1) then
                OutputLogMessage("nocoil on\n")
                repeat
                    MoveMouseRelative(0, 1)
                    Sleep(35)
                until not IsMouseButtonPressed(1)
                OutputLogMessage("nocoil off\n")
            end
        until not IsMouseButtonPressed(3)
    end
end
