EnablePrimaryMouseButtonEvents (true)
local step = 2.0
local recoil = false
local recoil_4 = false
function OnEvent(event, arg)
  OutputLogMessage("event = %s, arg = %d\n", event, arg)
  if (event == "PROFILE_ACTIVATED") then
    EnablePrimaryMouseButtonEvents(true)
  end

  if (event == "MOUSE_BUTTON_PRESSED" and arg == 5) then
    recoil = false
    recoil_4 = false
  end

  if (event == "MOUSE_BUTTON_PRESSED" and arg == 8) then
		step = 2.0
		recoil = true
		recoil_4 = false
  end

  if (event == "MOUSE_BUTTON_PRESSED" and arg == 7) then
		step = 8.0
		recoil_4 = true
		recoil = false
  end


  if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and recoil) then
    repeat
      Sleep(8)
      MoveMouseRelative(0, step)
    until not IsMouseButtonPressed(1)
  end
  if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and recoil_4) then
	MoveMouseRelative(0, step)
  end
end