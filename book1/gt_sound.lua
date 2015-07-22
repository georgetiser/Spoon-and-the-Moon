-- Coded by George Tiser 2015.
-- 
module(..., package.seeall)

--[[ Readme
This function takes care of some basic error handling.

Usage:
In main.lua, add the following dependency:
-- soundeffects = require("gt_sound")

You can then play sound effects with
-- soundeffects.PlayASound{filename = "XYZ", channel=12} 

Specifying the channel is optional.
If you specify the audio directory, PlayASound take care of the concatenation.

Example use:
soundeffects.PlayASound{filename = audioDir .. "indexflip.mp3"} 
]]--end-readme

function PlayASound(params)
	-- PARAMETERS filename, channel, audioDir
	if params.audioDir then params.filename = params.audioDir .. params.filename end
	local AudioToUse, ChannelToUse, debugStatement
	debugStatement = "Sound:"
	if params.filename and type(params.filename) == "string" then
		debugStatement = debugStatement .. " File[" .. params.filename .."]"
		AudioToUse = audio.loadSound(params.filename)
		if not AudioToUse then
			debugStatement = debugStatement .. " Failed to load. Abandon ship!"
			print(debugStatement)
			return
		end
	else
		debugStatement = debugStatement .. "Missing filename."
		return
	end--if-filename
	if params.channel and type(params.channel) == "number" then
		if _G.kwk_ShowDebugOutput then print(" using channel " .. params.channel) end
		ChannelToUse = params.channel
	else
		ChannelToUse = 13
	end

	local isChannelPlaying = audio.isChannelPlaying(ChannelToUse) 
	if isChannelPlaying then 
		if _G.kwk_ShowDebugOutput then print("It's already playing.") end
		audio.stop(ChannelToUse)
		audio.play( AudioToUse, {channel=ChannelToUse} )
	else 
		if _G.kwk_ShowDebugOutput then print("It's not playing yet. Starting...") end
		audio.play( AudioToUse, {channel=ChannelToUse} ) 
	end--if
end--function

function EndAllSounds()
	local i
	for i = 1, 32, 1 do
		isChannelPlaying = audio.isChannelPlaying(ChannelToUse) 
		if isChannelPlaying then audio.stop(i) end
	end--for-loop
end--function end-all-sounds

--[[
function InsertForwardButton(params)
	if _G.kwk_ShowDebugOutput then
		print("Inserting a Forward button.")
		if params then print("Data!") else print("No data!") end
		for x in pairs(params) do print("Yay " .. x) end
		print.
		for i,x in ipairs(params) do print("Wow " .. tostring(x)) end
		print(params[_M])
		print("The _M is " .. a.M)
		print("The _NAME is " .. a._NAME)
		print("The _PACKAGE is " .. a._PACKAGE)
		print("The navigation is " .. navigation)
--		table.print(buttondata)
		if filename then print("File!") else print("No file!") end
		if params.filename then print("File!") else print("No file!") end
		if a[filename] then print("File!") else print("No file!") end
		if a["filename"] then print("File!") else print("No file!") end
	end
	print("Got past it."/)
	local onkwkBforwardTouch = function(event) 
		if event.phase=="ended" then 
			local myClosure_switch = function() 
				--disposeAudios()
				--disposeTweens() 
				print("GoForward!")
				_G.kwk_currentPage = _G.kwk_currentPage + 1
				director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 
			end--function-move-to-next-page
			timerStash.tempTimer = nil
			timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1) 
		end--if-touch-ended
	end--function-button-touch
	kwkBforward = ui.newButton{ 
		defaultSrc= imageDir .. filename, 
		defaultX = 110, 
		defaultY = 87, 
		overSrc= imageDir .. filename, 
		overX = 110,
		overY = 87, 
		onRelease=onkwkBforwardTouch, 
		id="kwkBforwardButton" 
	} 
	kwkBforward.x = 476; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1 
	return kwkBforward
end--function-forward-button
]]