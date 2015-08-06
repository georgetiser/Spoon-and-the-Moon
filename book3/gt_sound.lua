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
	local audioFile, audioToUse, channelToUse, debugStatement
--debugPrint("Play a sound") end
	-- PARAMETERS filename, channel, audioDir
	if params.audioDir then
		audioFile = params.audioDir .. params.filename
	elseif string.find(params.filename, audioDir) then
		audioFile = params.filename
	else
		audioFile = audioDir .. params.filename
	end
	debugStatement = "Sound:"
	if audioFile and type(audioFile) == "string" then
		debugStatement = debugStatement .. " File[" .. params.filename .."]"
		audioToUse = audio.loadSound(audioFile)
		if not audioToUse then
			debugStatement = debugStatement .. " Failed to load. Abandon ship!"
--debugPrint(debugStatement)
			return
		end
	else
		debugStatement = debugStatement .. " Missing filename."
		return
	end--if-filename
	if params.channel and type(params.channel) == "number" then
--debugPrint(" on channel " .. params.channel) end
		channelToUse = params.channel
	else
		channelToUse = 13
	end

	local isChannelPlaying = audio.isChannelPlaying(channelToUse) 
	if isChannelPlaying then 
--debugPrint("It's already playing.") end
		audio.stop(channelToUse)
		audio.play( audioToUse, {channel=channelToUse} )
	else 
--debugPrint("It's not playing yet. Starting...") end
		audio.play( audioToUse, {channel=channelToUse} ) 
	end--if
end--function

function StopAllSounds()
	local i
	for i = 1, 32, 1 do
		isChannelPlaying = audio.isChannelPlaying(channelToUse) 
		if isChannelPlaying then audio.stop(i) end
	end--for-loop
end--function end-all-sounds

--[[
function InsertForwardButton(params)
	if _G.kwk_ShowDebugOutput then
--debugPrint("Inserting a Forward button.")
--debugPrint("No data!") end
--debugPrint("Yay " .. x) end
		print.
--debugPrint("Wow " .. tostring(x)) end
--debugPrint(params[_M])
--debugPrint("The _M is " .. a.M)
--debugPrint("The _NAME is " .. a._NAME)
--debugPrint("The _PACKAGE is " .. a._PACKAGE)
--debugPrint("The navigation is " .. navigation)
--debugPrint(buttondata)
--debugPrint("No file!") end
--debugPrint("No file!") end
--debugPrint("No file!") end
--debugPrint("No file!") end
	end
--debugPrint("Got past it."/)
	local onkwkBforwardTouch = function(event) 
		if event.phase=="ended" then 
			local myClosure_switch = function() 
				--disposeAudios()
				--disposeTweens() 
--debugPrint("GoForward!")
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