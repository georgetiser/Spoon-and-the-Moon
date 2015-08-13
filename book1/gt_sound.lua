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
	local audioFile, audioToUse, channelToUse, debugStatement
	if not params.filename and params.audioFile then params.filename = params.audioFile end
	if not params.audioDir and audioDir then params.audioDir = audioDir end
	if string.find(params.filename, audioDir) then
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
			return
		end
	else
		debugStatement = debugStatement .. " Missing filename."
		return
	end--if-filename
	if params.channel and type(params.channel) == "number" then
		if _G.kwk_ShowDebugOutput then print(" on channel " .. params.channel) end
		channelToUse = params.channel
	else
		channelToUse = 13
	end

	local isChannelPlaying = audio.isChannelPlaying(channelToUse) 
	if isChannelPlaying then 
		if _G.kwk_ShowDebugOutput then print("It's already playing.") end
		audio.stop(channelToUse)
		audio.play( audioToUse, {channel=channelToUse} )
	else 
		--if _G.kwk_ShowDebugOutput then print("It's not playing yet. Starting...") end
		audio.play( audioToUse, {channel=channelToUse} ) 
	end--if
end--function
