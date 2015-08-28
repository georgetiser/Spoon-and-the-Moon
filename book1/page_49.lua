-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       local cornber         local BG         BG = display.newImageRect(imageDir .. "p48_ch03pg2.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local oncornberTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()

                _G.kwk_currentPage = _G.kwk_menuPage
                statusreport.debugPrint("GoToMenu!")
                director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )            end             timerStash.tempTimer = nil             timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1)           end        end        cornber = ui.newButton{            defaultSrc= imageDir .."p48_cornber.png",            defaultX = 71,            defaultY = 78,            overSrc= imageDir .."p48_cornber.png",            overX = 71,            overY = 78,            onRelease=oncornberTouch,            id="cornberButton"        }        cornber.x = 732; cornber.y = 985; cornber.alpha = 1; cornber.oldAlpha = 1        menuGroup:insert(cornber)        menuGroup.cornber = cornber
	end
   drawScreen()    function disposeAudios(event)                     -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 