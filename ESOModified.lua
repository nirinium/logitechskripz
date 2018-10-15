-- NOTES
-- Rearming Trap > Light Attack > Endless Hail > Light Attack > Poison Injection > Light Attack > Razor Caltrops > Incapacitating Strike (if rready) > Weapon Swap
--Surprise Attack > Heavy Attack > Rending Slashes > Heavy Attack > Surprise Attack > LA > Surprise Attack > LA > Deadly Cloak > Restart
-- Activate the Spectral Bow whenever it is ready.
-- Execute Phase: Do not refresh Rending Slashes anymore and use Killers Blade instead of Surprise Attacks.

-- [[ CONFIG ]] --
SCREEN_WIDTH = 2560		--[[ Change according to your screen resolution --]]
SCREEN_HEIGHT = 1440	--[[ eg. the default value stands for 2K resolution --]]
DELAY = 200				--[[ Auto delay between each key press or mouse click in milliseconds--]]
MACRO_ENABLED = false
QUIT_KEY = 4

function OnEvent(event, arg)
	OutputLogMessage("event = %s, arg = %d\n", event, arg)
	if (event == "PROFILE_ACTIVATED") then
		EnablePrimaryMouseButtonEvents(true)
	elseif event == "PROFILE_DEACTIVATED" then
		ReleaseMouseButton(8)
end

-- [[ BASE FUNCTIONS --]]
	function LeftClick()

		PressAndReleaseMouseButton(1)
			
		Sleep(DELAY)
	end
	
	function HeavyAttack()
		PressMouseButton(1)
		Sleep(2199)
		ReleaseMouseButton(1)
	end
	
	function LightAttack()
		PressMouseButton(1)
		Sleep(200)
		ReleaseMouseButton(1)
	end

	function RightClick()
		
		PressAndReleaseMouseButton(3)
			
		Sleep(DELAY)
	end

	function MoveTo(x, y)
	if (DEBUG_MODE) then
		Print("MoveTo(%d, %d)", x, y)
	end
	
	x = x / SCREEN_WIDTH * 65535
	y = y / SCREEN_HEIGHT * 65535
	MoveMouseTo(x, y)
	
	Sleep(DELAY)
	end

	function MoveToAndLeftClick(x, y)
	MoveTo(x, y)
	LeftClick()
	end
	
	function EndlessHail()
		PressAndReleaseKey("1") -- Endless Hail
			Sleep(200)
		MoveTo(0, 1440)
			LeftClick()
			--Sleep(500)
	end
		
	-- BUFFS
	if (event == "MOUSE_BUTTON_PRESSED" and arg == 8) then
			PressAndReleaseKey("5") -- Relentless Focus
				Sleep(750)
			PressAndReleaseKey("2") -- Deadly Cloak
				Sleep(500)
			PressAndReleaseMouseButton(5) -- Switch to Backbar
				Sleep(500)
			PressAndReleaseKey("5") -- Leeching Strikes
				Sleep(500)
	end
	
	if (event == "MOUSE_BUTTON_PRESSED" and arg == 7) then
		PressAndReleaseKey("2") -- Rearming Trap
			Sleep(1000)
		LightAttack()
			Sleep(1000)
		--ENDLESS HAIL
		EndlessHail()
			Sleep(950)
		--END ENDLESS HAIL
		PressAndReleaseKey("3") -- Poison Injection
			Sleep(1000)		
		--PressAndReleaseKey("2") -- Rearming Trap // SUB FOR RAZSOR CALTROPS SOON
			--Sleep(1000)
		PressAndReleaseMouseButton(5) -- Switch to Backbar
			Sleep(500)			
	end
	
	-- MAIN FIGHT ROTATION
		if (event == "MOUSE_BUTTON_PRESSED" and arg == 6) then
		OutputLogMessage("Main Rotation = %s, arg = %d\n", event, arg)
		EnablePrimaryMouseButtonEvents(true)
		PressAndReleaseKey("3") -- Surprise Attack
			Sleep(100)
		HeavyAttack()
		PressAndReleaseKey("4") -- Rending Slashes / CAN BE SWAPPED WITH STEEL TORNADO FOR AOE
			Sleep(100)
		HeavyAttack()
		PressAndReleaseKey("3") -- Surprise Attack / CAN BE SWAPPED WITH STEEL TORNADO FOR AOE
			Sleep(100)
		LightAttack()
		PressAndReleaseKey("3") -- Surprise Attack
			Sleep(100)
		LightAttack()
		PressAndReleaseKey("2") -- Deadly Cloak
			Sleep(100)
		end
		
	--TEST FUNCTIONS
	if (event == "MOUSE_BUTTON_PRESSED" and arg == 0) then
		EnablePrimaryMouseButtonEvents(true)
		HeavyAttack()
			Sleep(500)			
	end
end