local fire_key = nil 
local r_fire = 4
local hold_breath_key = "lshift"

function OnEvent(event, arg)
	OutputLogMessage("event = %s, arg = %d\n", event, arg)
	EnablePrimaryMouseButtonEvents(true)
	if IsKeyLockOn("numlock") then
		if IsMouseButtonPressed(3) then
			repeat
				--norecoil    
				if IsMouseButtonPressed(1) then
					PressAndReleaseKey("capslock")
					OutputLogMessage("nocoil on\n")
					repeat
						MoveMouseRelative(0,1)
						Sleep(35)
						until not IsMouseButtonPressed(1)
					OutputLogMessage("nocoil off\n")
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