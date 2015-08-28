-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       --local PageXCorner         local showhide         local kock         local BG         BG = display.newImageRect(imageDir .. "p71_ch05pg2.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onkockTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_877 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_877 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end           end        end        kock = ui.newButton{            defaultSrc= imageDir .."p71_kock.png",            defaultX = 252,            defaultY = 331,            overSrc= imageDir .."p71_kock.png",            overX = 252,            overY = 331,            onRelease=onkockTouch,            id="kockButton"        }        kock.x = 514; kock.y = 395; kock.alpha = 1; kock.oldAlpha = 1        menuGroup:insert(kock)        menuGroup.kock = kock        showhide = display.newImageRect(imageDir .. "p71_showhide.png", 246, 185 );        showhide.x = 511; showhide.y = 681; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide 
--XPageXCornerX


--XpaperXcornerX              showhide.alpha = 0 
	end
   drawScreen()    function disposeAudios(event)                     -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 