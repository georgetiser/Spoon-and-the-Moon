-- Code created by Kwik - Copyright: kwiksher.com -- Version: 2.4.6 module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)      statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page")     statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage)     local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()navigation.DisplayDevelopmentVersion()		menuGroup.navigator = navigation.InsertNavigation{}       local showbox         local showbutL         local showbutR         local BG         BG = display.newImageRect(imageDir .. "p5_bg.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG --ForwardFunction--PageNum Begin--PlaceholderForPageCorner--PageNumPlace--PageNum End       local onshowbutTouch = function(event)           if _G.kwk_ShowDebugOutput then            statusreport.debugPrint("Showbut!")            statusreport.debugPrint(event.phase)          end          if event.phase=="ended" then              showbox.flipswitch = showbox.flipswitch * -1              if _G.kwk_ShowDebugOutput then statusreport.debugPrint("Showbox flipswitch is now " .. showbox.flipswitch) end              if showbox.flipswitch > 0 then                  transition.cancel(showbox)                 transitionStash.newTransition_850 = transition.to( showbox, {alpha=1, time=2000, delay=0})               else                  transition.cancel(showbox)                 transitionStash.newTransition_850 = transition.to( showbox, {alpha=0, time=2000, delay=0})               end           end        end        showbutL = ui.newButton{            defaultSrc= imageDir .."transparentbutton.png",            defaultX = 110,            defaultY = 850,            overSrc= imageDir .."transparentbutton.png", --p5_showbut.png",            overX = 110,            overY = 850,            onRelease=onshowbutTouch,            id="showbutButtonL"       }        showbutL.x = 55; showbutL.y = 527; showbutL.alpha = 1; showbutL.oldAlpha = 1        menuGroup:insert(showbutL)        menuGroup.showbutL = showbutL        showbutR = ui.newButton{            defaultSrc= imageDir .."transparentbutton.png",            defaultX = 110,            defaultY = 850,            overSrc= imageDir .."transparentbutton.png", --p5_showbut.png",            overX = 110,            overY = 850,            onRelease=onshowbutTouch,            id="showbutButtonR"       }        showbutR.x = 713; showbutR.y = 527; showbutR.alpha = 1; showbutR.oldAlpha = 1        menuGroup:insert(showbutR)        menuGroup.showbutR = showbutR        showbox = display.newImageRect(imageDir .. "p5_showbox.png", 713, 494 );        showbox.x = 382; showbox.y = 661; showbox.alpha = 0; showbox.oldAlpha = 1        showbox.flipswitch = -1 --tells buttons it's currently hidden       menuGroup:insert(showbox)        menuGroup.showbox = showbox         local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                    disposeTweens()                     director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()                    disposeTweens()                     director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        BG:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                     -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 