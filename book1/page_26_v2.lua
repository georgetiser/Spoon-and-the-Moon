module(..., package.seeall) 

function new() 

	-- Initialize a context for interactivity, buttons etc.
	local menuGroup = display.newGroup() 

	-- Load each audio file we're going to use.
	local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory) 
	local kwkBindex_audio_channel = 2
	-- Each sound file above needs an entry in function disposeAudios!

	-- This function clears the audio when the page turns.
	-- Each sound loaded above should have an entry in this function!
	local disposeAudios 
	function disposeAudios(event) 
		audio.stop(2); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil
	end 
	-- This function clears other stuff when the page turns.
	local disposeTweens 
	function disposeTweens(event) 
		cancelAllTweens(); 
		cancelAllTimers(); 
		cancelAllTransitions(); 
	end 

	-- Confirm page number for debugging.
	if _G.kwk_ShowDebugOutput then
		print("----------------"); print(""); print("New Page") 
		print("The current page is: " .. _G.kwk_currentPage) 
	end--if
 
	-- Save the current page number.
	local path = system.pathForFile( "book.txt", system.DocumentsDirectory ) 
	local file = io.open( path, "w+" ) 
	file:write( _G.kwk_currentPage ) 
	io.close( file ) 

	-- This function displays each item on the page.
  local drawScreen = function()


    --DEBUGTEXT
    if _G.kwk_ShowDebugOutput then
      print("PageDisplay called.")
      devtxt1 = display.newText(_G.kwk_DebugText1_t, _G.kwk_DebugText1_x, _G.kwk_DebugText1_y, _G.kwk_DebugText1_w, _G.kwk_DebugText1_h, _G.kwk_DebugText1_f, _G.kwk_DebugText1_s); devtxt1:setFillColor(_G.kwk_DebugText1_cr,_G.kwk_DebugText1_cg,_G.kwk_DebugText1_cb); devtxt1.alpha = 1
      devtxt2 = display.newText(_G.kwk_DebugText2_t, _G.kwk_DebugText2_x, _G.kwk_DebugText2_y, _G.kwk_DebugText2_w, _G.kwk_DebugText2_h, _G.kwk_DebugText2_f, _G.kwk_DebugText2_s); devtxt2:setFillColor(_G.kwk_DebugText2_cr,_G.kwk_DebugText2_cg,_G.kwk_DebugText2_cb); devtxt2.alpha = 1
      devtxt3 = display.newText(_G.kwk_DebugText3_t, _G.kwk_DebugText3_x, _G.kwk_DebugText3_y, _G.kwk_DebugText3_w, _G.kwk_DebugText3_h, _G.kwk_DebugText3_f, _G.kwk_DebugText3_s); devtxt3:setFillColor(_G.kwk_DebugText3_cr,_G.kwk_DebugText3_cg,_G.kwk_DebugText3_cb); devtxt3.alpha = 1


    end--if
    --DEBUGTEXTEND




		--Declare a variable name for each item to display. 
		-- ..these are standard display items that appear on every page:
		local kwkBback	
		local kwkBindex	
		local kwkBforward	
		local kwkPageCorner 
		local BG		
		-- ..these are extra display items specifically only for this page:
		--[[
		local showbox2	
		local showbut2	
		local showbox1	
		local showbut1	
		local choke	
		]]

		-- BACKGROUND

		-- Create a rectangle for the background image. Specify file name, width and height.
		BG = display.newImageRect(imgDir .. "p3_bg.png", 768, 1024 ); 
		-- Specify where to put the background (in the middle) and its transparency (1=opaque)
		BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1 
		menuGroup:insert(BG) 
		menuGroup.BG = BG 

		-- BUTTONS
		-- For each button, we first define a Function (what the button should do).
		-- Then we define how to Display the button itself.

		-- Forward button Begin
		-- Function:
		local onkwkBforwardTouch = function(event) 
			-- The 'event' is, someone touched/is touching the button.
			-- We want to trigger the button if the touch ended. (This is standard for buttons.)
			if event.phase=="ended" then	
				local myClosure_switch = function() 
					if _G.kwk_ShowDebugOutput then
						print("Forward pressed. Advance one page!")
					end--if
					disposeAudios() 
					disposeTweens() 
					_G.kwk_currentPage = _G.kwk_currentPage + 1
					director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 
				end--function Closure
				timerStash.newTimer_10872 = timer.performWithDelay(0, myClosure_switch, 1) 
			end--if 
		end--function forwardTouch
		-- Display properties:
		kwkBforward = ui.newButton{
			defaultSrc= imgDir .."kwkBforward.png", --p7_kwkBforward.png", 
			defaultX = 111, 
			defaultY = 87, 
			overSrc= imgDir .."kwkBforward.png", --p7_kwkBforward.png", 
			overX = 111, 
			overY = 87, 
			onRelease=onkwkBforwardTouch, -- Trigger the button when the touch ends (release).
			id="kwkBforwardButton" 
		} 
		kwkBforward.x = 475; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1 
		-- Make it appear!
		menuGroup:insert(kwkBforward) 
		menuGroup.kwkBforward = kwkBforward 
		-- Forward button End

		-- Page Corner button Begin
		-- Function:
		local onkwkPageCornerTouch = function(event) 
			-- The 'event' is, someone touched/is touching the button.
			-- We want to trigger the button if the touch ended. (This is standard for buttons.)
			if event.phase=="ended" then
				local myClosure_switch = function() 
					if _G.kwk_ShowDebugOutput then
						print("PageNumber Pressed. Go To Menu!")
					end--if
					disposeAudios() 
					disposeTweens() 
					_G.kwk_currentPage = _G.kwk_menuPage
					director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )
				end 
				timerStash.newTimer_10518 = timer.performWithDelay(0, myClosure_switch, 1) 
				if audio.isChannelPlaying(kwkBindex_audio_channel) then 
					--If audio's already playing, don't start new audio.
				else -- If no audio's playing:
					audio.play( kwkBindex_audio, {channel=kwkBindex_audio_channel} ) 
				end 
			end 
		end 
		-- Display properties, corner icon:
		kwkPageCorner = ui.newButton{ 
			defaultSrc= imgDir .."PageCornerGrey.png", 
			defaultX = 72, 
			defaultY = 80, 
			overSrc= imgDir .."PageCornerGrey.png", 
			overX = 72, 
			overY = 80, 
			onRelease=onkwkPageCornerTouch, 
			id="kwkPageCornerButton" 
		} 
		kwkPageCorner.x = 732; kwkPageCorner.y = 984; kwkPageCorner.alpha = 1; kwkPageCorner.oldAlpha = 1 
		-- Put the page number, as text, on top of the corner icon:
--TEXTFORPAGENUMBEGIN
local crnrtxtoffset = 730; if _G.kwk_currentPage < 99 then crnrtxtoffset = 737 end; if _G.kwk_currentPage < 9 then crnrtxtoffset = 745 end
crnrtxt = display.newText("" .. _G.kwk_currentPage .. "", crnrtxtoffset, 995, "Arbutus Slab", 20); crnrtxt:setFillColor(0,0,0)
--TEXTFORPAGENUMEND



		-- Make it appear!
		menuGroup:insert(kwkPageCorner) 
		menuGroup.kwkPageCorner = kwkPageCorner 
		-- Page Corner button End

		-- Index gem-shaped button Begin
		-- Function:
		local onkwkBindexTouch = function(event) 
			if event.phase=="ended" then	
				local myClosure_switch = function() 
					disposeAudios() 
					disposeTweens() 
					_G.kwk_currentPage = _G.kwk_menuPage
					if _G.kwk_ShowDebugOutput then
						print("Gem button pressed. Go To Menu!")
					end--if
					director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" ) 
				end 
				timerStash.newTimer_10551 = timer.performWithDelay(0, myClosure_switch, 1) 
				if audio.isChannelPlaying(kwkBindex_audio_channel) then 
				--If the audio's already playing, don't start new audio.
				else -- If no audio's playing:
					audio.play( kwkBindex_audio, {channel=kwkBindex_audio_channel} ) 
				end 
			end
		end 
		-- Display properties
		kwkBindex = ui.newButton{ 
			defaultSrc= imgDir .."kwkBindex.png", --p7_kwkBindex.png", 
			defaultX = 66, 
			defaultY = 69, 
			overSrc= imgDir .."kwkBindex.png", --p7_kwkBindex.png", 
			overX = 66, 
			overY = 69, 
			onRelease=onkwkBindexTouch, 
			id="kwkBindexButton" 
		} 
		kwkBindex.x = 383; kwkBindex.y = 969; kwkBindex.alpha = 1; kwkBindex.oldAlpha = 1 
		-- Make it appear!
		menuGroup:insert(kwkBindex) 
		menuGroup.kwkBindex = kwkBindex 
		-- Index gem-shaped button End

		-- Back button Begin
		-- Function:
		local onkwkBbackTouch = function(event) 
			-- The 'event' is, someone touched/is touching the button.
			-- We want to trigger the button if the touch ended. (This is standard for buttons.)
			if event.phase=="ended" then	
				local myClosure_switch = function() 
					if _G.kwk_ShowDebugOutput then
						print("Back pressed. Backstep one page!")
					end--if
					disposeAudios() 
					disposeTweens() 
					_G.kwk_currentPage = _G.kwk_currentPage - 1
					director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 
				end--function Closure
				timerStash.newTimer_10650 = timer.performWithDelay(0, myClosure_switch, 1) 
			end--if 
		end--function backTouch
		-- Display properties:
		kwkBback = ui.newButton{ 
			defaultSrc= imgDir .."kwkBback.png", --p7_kwkBback.png", 
			defaultX = 111, 
			defaultY = 88, 
			overSrc= imgDir .."kwkBback.png", --p7_kwkBback.png", 
			overX = 111, 
			overY = 88, 
			onRelease=onkwkBbackTouch, -- Trigger the button when the touch ends (release).
			id="kwkBbackButton" 
		} 
		kwkBback.x = 293; kwkBback.y = 973; kwkBback.alpha = 1; kwkBback.oldAlpha = 1 
		-- Make it appear!
		menuGroup:insert(kwkBback) 
		menuGroup.kwkBback = kwkBback 
		-- Back button End

	end--function drawScreen

	drawScreen() 
	return menuGroup 
end--function