-- NOTES
-- Rearming Trap > Light Attack > Endless Hail > Light Attack > Poison Injection > Light Attack > Razor Caltrops > Incapacitating Strike (if rready) > Weapon Swap
--Surprise Attack > Heavy Attack > Rending Slashes > Heavy Attack > Surprise Attack > LA > Surprise Attack > LA > Deadly Cloak > Restart
-- Activate the Spectral Bow whenever it is ready.
-- Execute Phase: Do not refresh Rending Slashes anymore and use Killers Blade instead of Surprise Attacks.

--[[ Configuration --]]
SCREEN_WIDTH = 2560		--[[ Change according to your screen resolution --]]
SCREEN_HEIGHT = 1440	--[[ eg. the default value stands for 2K resolution --]]
DELAY = 200				--[[ Auto delay between each key press or mouse click in milliseconds--]]

--[[ State variable --]]
DEBUG_MODE = true	--[[ In debug mode, each key press or mouse click is printed --]]

function OnEvent(event, arg)
	OutputLogMessage("event = %s, arg = %d\n", event, arg)
	if (event == "PROFILE_ACTIVATED") then
		EnablePrimaryMouseButtonEvents(true)
	elseif event == "PROFILE_DEACTIVATED" then
		ReleaseMouseButton(8) -- to prevent it from being stuck on
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
		Sleep(40)
		ReleaseMouseButton(1)
	end

	function RightClick()
		
		PressAndReleaseMouseButton(3)
			
		Sleep(DELAY)
	end
	
	function EndlessHail()
		PressAndReleaseKey("1") -- Endless Hail
			Sleep(100)
		LeftClick()
		PressAndReleaseKey("1") -- Endless Hail
			Sleep(100)
		LeftClick()
	end
	-- PRE COMBAT SELF BUFF
	if (event == "MOUSE_BUTTON_PRESSED" and arg == 8) then
		EnablePrimaryMouseButtonEvents(true)
		PressAndReleaseKey("5") -- Relentless Focus
			Sleep(500)
 		PressAndReleaseKey("2") -- Deadly Cloak
			Sleep(500)
		PressAndReleaseMouseButton(5) -- Switch to Backbar
			Sleep(500)
		PressAndReleaseKey("5") -- Leeching Strikes
			Sleep(500)		
	end
	
	-- BOW PRE FIGHT
	if (event == "MOUSE_BUTTON_PRESSED" and arg == 7) then
		EnablePrimaryMouseButtonEvents(true)
		PressAndReleaseKey("2") -- Rearming Trap
			Sleep(500)
		LeftClick()
			Sleep(1000)
		--ENDLESS HAIL
		EndlessHail()
		--END ENDLESS HAIL
		PressAndReleaseKey("3") -- Poison Injection
			Sleep(500)		
		LeftClick()
		PressAndReleaseKey("2") -- Rearming Trap // SUB FOR RAZSOR CALTROPS SOON
			Sleep(500)
		PressAndReleaseKey("R") -- ULT Incapacitating Strike
			Sleep(100)
		PressAndReleaseMouseButton(5) -- Switch to Backbar
			Sleep(100)
		end
	-- MAIN FIGHT ROTATION
		if (event == "MOUSE_BUTTON_PRESSED" and arg == 6) then
		EnablePrimaryMouseButtonEvents(true)
		PressAndReleaseKey("3") -- Surprise Attack
			Sleep(500)
		HeavyAttack()
		PressAndReleaseKey("4") -- Rending Slashes
			Sleep(500)
		HeavyAttack()
		PressAndReleaseKey("3") -- Surprise Attack
			Sleep(500)
		LightAttack()
		PressAndReleaseKey("3") -- Surprise Attack
			Sleep(500)
		LightAttack()
		PressAndReleaseKey("2") -- Deadly Cloak
			Sleep(500)
		end
		
	--TEST FUNCTIONS
	if (event == "MOUSE_BUTTON_PRESSED" and arg == 5) then
		EnablePrimaryMouseButtonEvents(true)
		HeavyAttack()
			Sleep(500)			
	end
end