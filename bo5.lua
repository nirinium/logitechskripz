function OnEvent(event, arg)
	if (event == "PROFILE_ACTIVATED") then
		EnablePrimaryMouseButtonEvents(true)
		click = 0
	end

	if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
		recoil = not recoil
		if (recoil == false) then
			OutputLogMessage(" [ 0FF ]\n")
		else
			OutputLogMessage("[ 0N ]\n")
		end
	end

	--DEBUG
	--OutputLogMessage("event = %s, arg = %d\n", event, arg)
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
	PressMouseButton(1)
	Sleep(20)
	ReleaseMouseButton(1)
	MoveMouseRelative(0, 1)
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
