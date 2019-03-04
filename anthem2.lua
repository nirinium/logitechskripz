EnablePrimaryMouseButtonEvents(true)

dbgState = false

function OnEvent(event, arg, family)
	
	if (dbgState == true) then
		OutputLogMessage("event = %s, arg = %d\n", event, arg)
	end

	if (event == "PROFILE_ACTIVATED") then
		EnablePrimaryMouseButtonEvents(true)
		click = 0
	end

	if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
		recoil = not recoil
         if (recoil == false) then
             OutputLogMessage(">>>>>>>>>> OFF <<<<<<<<<\n")
		    PressAndReleaseKey("capslock")	
         else 
             OutputLogMessage(">>>>>>>>>> ON <<<<<<<<<<\n")	
         end
	end
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

function Click()
	PressKey("lshift")
	PressAndReleaseMouseButton(1)
		Sleep (100)
	--MoveMouseRelative(0, 2)
if click == 0 then
	Stopclick()
	ReleaseKey("lshift")
	elseif click == 1 then SetMKeyState(3)
		else Stopclick()
	end
end

function Stopclick()
	click = 0
end

function scr() -- SCROLL LOCK ON/OFF INDICATOR
	if macro and not IsKeyLockOn("scrolllock") then
		PressAndReleaseKey("scrolllock")
	end
	if not macro and IsKeyLockOn("scrolllock") then
		PressAndReleaseKey("scrolllock")
	end
end