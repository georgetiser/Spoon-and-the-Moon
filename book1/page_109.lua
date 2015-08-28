-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local dentures_audio = audio.loadSound(audioDir .. "eating.mp3", system.ResourceDirectory)      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       --local PageXCorner         local showhide         local dentures         local BG         BG = display.newImageRect(imageDir .. "p108_ch7pg10.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local ondenturesTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( dentures_audio, {channel=myChannel} )              end                 if showhide.alpha == 0 then                    transitionStash.newTransition_666 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_666 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end           end        end        dentures = ui.newButton{            defaultSrc= imageDir .."p108_dentures.png",            defaultX = 266,            defaultY = 246,            overSrc= imageDir .."p108_dentures.png",            overX = 266,            overY = 246,            onRelease=ondenturesTouch,            id="denturesButton"        }        dentures.x = 263; dentures.y = 715; dentures.alpha = 1; dentures.oldAlpha = 1        menuGroup:insert(dentures)        menuGroup.dentures = dentures        showhide = display.newImageRect(imageDir .. "p108_showhide.png", 357, 135 );        showhide.x = 540; showhide.y = 607; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide --local PageZZCorner--local PageXXCorner
--XpaperXcornerX              showhide.alpha = 0 
	end
   drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(dentures_audio); dentures_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 