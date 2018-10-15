fast_mining = 5
----------------------------------------------------------------------
function OnEvent(event, arg)
	if (event == "PROFILE_ACTIVATED") then
		EnablePrimaryMouseButtonEvents(true)
	elseif event == "PROFILE_DEACTIVATED" then
		ReleaseMouseButton(2) -- to prevent it from being stuck on
	end

	if (event == "MOUSE_BUTTON_PRESSED" and arg == fast_mining) then 
		--Fast Mining
		OutputLogMessage("Fast Mining \n")
		repeat
		PressAndReleaseKey("2")
		PressAndReleaseKey("1")
		Sleep(295)
		PressMouseButton(1)
		Sleep(160)
		ReleaseMouseButton(1)
		until not IsMouseButtonPressed(5)
	end
end