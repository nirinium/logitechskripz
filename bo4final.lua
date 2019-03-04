function OnEvent(event, arg)
	if (event == "PROFILE_ACTIVATED") then
		EnablePrimaryMouseButtonEvents(true)
		click = 0
	end

	if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
		rapidfire = not rapidfire
		if (rapidfire == false) then
			OutputLogMessage("[ TOOL: N ]\n")
		else
			OutputLogMessage("[ TOOL: Y ]\n")
		end
	end

	--DEBUG
	--OutputLogMessage("event = %s, arg = %d\n", event, arg)
	--IF SHOOTING
	if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and rapidfire) then
		click = 1
		Rapidfire()
	end

	if (event == "M_RELEASED" and arg == 3) then
		Rapidfire()
	end

	if (event == "MOUSE_BUTTON_RELEASED" and arg == 1) then
		Stopclick()
	end
end

function Rapidfire()
	--PressKey("lshift")
	PressAndReleaseMouseButton(1)
	Sleep(15)
	--MoveMouseRelative(0, 1)
	
	if click == 0 then
		Stopclick()
		--ReleaseKey("lshift")
	elseif click == 1 then
		SetMKeyState(3)
	else
		Stopclick()
	end
end

function Stopclick()
	click = 0
end