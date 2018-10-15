EnablePrimaryMouseButtonEvents (true)

function OnEvent(event, arg, family)
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
		Sleep (7)
	MoveMouseRelative(0, 2)
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

--SHOOT 4X
--	if IsModifierPressed("lshift") then
	--	PressAndReleaseMouseButton(1)		
	--		Sleep(2)
		--MoveMouseRelative(0, 8)
	--else 
	--end 

--STOP SHOOTING