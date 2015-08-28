-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local crows_cawing_angrily_aud902 = audio.loadSound(audioDir .. "crows_cawing_angrily.mp3", system.ResourceDirectory)      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       --local PageXCorner         local BG         BG = display.newImageRect(imageDir .. "p56_ch03pg10.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG --local PageZZCorner--local PageXXCorner
--XpaperXcornerX
	end
   drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(crows_cawing_angrily_aud902); crows_cawing_angrily_aud902 =nil        -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_crows_cawing_angrily_aud902 = function()       audio.play(crows_cawing_angrily_aud902, {  channel=2, loops=0, fadein=500 } )    end    timerStash.newTimer_902 = timer.performWithDelay(0, myClosure_crows_cawing_angrily_aud902, 1)    return menuGroup end 