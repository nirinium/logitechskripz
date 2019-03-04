EnablePrimaryMouseButtonEvents(true);
 
function OnEvent(event, arg)
	OutputLogMessage("event = %s, arg = %d\n", event, arg)
	--only supported in v8.94.108+
	if IsKeyLockOn("numlock" )then
		if IsMouseButtonPressed(3)then
			repeat
				--Rapid Fire Script
				if IsMouseButtonPressed(4) then
					PressKey("Q")
					Sleep(20)
					ReleaseKey("Q")
					repeat
						PressMouseButton(1)
						Sleep(30)
						ReleaseMouseButton(1)
						MoveMouseRelative(0,3)
						Sleep(30)
					until not IsMouseButtonPressed(4)
				end
			until not IsMouseButtonPressed(3)
		end
	end    
end