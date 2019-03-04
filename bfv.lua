EnablePrimaryMouseButtonEvents(true);
 
function OnEvent(event, arg)
	--only supported in v8.94.108+
	if IsKeyLockOn("numlock" )then
		if IsMouseButtonPressed(3)then
			repeat
				--norecoil    
				if IsMouseButtonPressed(1) then
					PressKey("Q")
					Sleep(20)
					ReleaseKey("Q")
					repeat
						MoveMouseRelative(0,1)
						--change this value
						Sleep(26)
					until not IsMouseButtonPressed(1)
				end
 
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
				
				--perfect burst
				if IsMouseButtonPressed(5) then
					repeat
						PressMouseButton(1)
						Sleep(150)
						ReleaseMouseButton(1)
						Sleep(170)
					until not IsMouseButtonPressed(5)
				end
			until not IsMouseButtonPressed(3)
		end
	end    
end