-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local match_audio = audio.loadSound(audioDir .. "match.mp3", system.ResourceDirectory)      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       local showhide         local match         local BG         BG = display.newImageRect(imageDir .. "p91_ch06pg4.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onmatchTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( match_audio, {channel=myChannel} )              end                 if showhide.alpha == 0 then                    transitionStash.newTransition_596 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_596 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end           end        end        match = ui.newButton{            defaultSrc= imageDir .."p91_match.png",            defaultX = 310,            defaultY = 415,            overSrc= imageDir .."p91_match.png",            overX = 310,            overY = 415,            onRelease=onmatchTouch,            id="matchButton"        }        match.x = 545; match.y = 649; match.alpha = 1; match.oldAlpha = 1        menuGroup:insert(match)        menuGroup.match = match        showhide = display.newImageRect(imageDir .. "p91_showhide.png", 397, 178 );        showhide.x = 262; showhide.y = 468; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide              showhide.alpha = 0 
	end
   drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(match_audio); match_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 