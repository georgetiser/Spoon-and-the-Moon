-- Code created by Kwik - Copyright: kwiksher.com -- Version: 2.4.6 module(..., package.seeall)  function new()     local menuGroup = display.newGroup()   local disposeAudios  local disposeTweens  local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page")     statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage)     local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()
navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local showbox         local showbut2         local showbut         local BG         BG = display.newImageRect(imageDir .. "p25_bg.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG --XPageXCornerX--XpaperXcornerX --ForwardFunction--ForwardUI--PageNum Begin--PlaceholderForPageCorner--PageNumPlace--PageNum End--PlaceholderIndex --PlaceholderFor       --BackPlace--PlaceholderFor              local onshowbutTouch = function(event)           if event.phase=="ended" then                  if showbox.alpha == 0 then                    transitionStash.newTransition_695 = transition.to( showbox, {alpha=showbox.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_695 = transition.to( showbox, {alpha=0, time=1000, delay=0})                 end           end        end        showbut = ui.newButton{            defaultSrc= imageDir .."p25_showbut.png",            defaultX = 140,            defaultY = 167,            overSrc= imageDir .."p25_showbut.png",            overX = 140,            overY = 167,            onRelease=onshowbutTouch,            id="showbutButton"        }        showbut.x = 421; showbut.y = 83; showbut.alpha = 1; showbut.oldAlpha = 1        menuGroup:insert(showbut)        menuGroup.showbut = showbut        local onshowbut2Touch = function(event)           if event.phase=="ended" then                  if kwkshowbox2.alpha == 0 then                    transitionStash.newTransition_736 = transition.to( kwkshowbox2, {alpha=kwkshowbox2.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_736 = transition.to( kwkshowbox2, {alpha=0, time=1000, delay=0})                 end           end        end        showbut2 = ui.newButton{            defaultSrc= imageDir .."p25_showbut2.png",            defaultX = 172,            defaultY = 352,            overSrc= imageDir .."p25_showbut2.png",            overX = 172,            overY = 352,            onRelease=onshowbut2Touch,            id="showbut2Button"        }        showbut2.x = 183; showbut2.y = 343; showbut2.alpha = 1; showbut2.oldAlpha = 1        menuGroup:insert(showbut2)        menuGroup.showbut2 = showbut2        showbox = display.newImageRect(imageDir .. "p25_showbox.png", 511, 255 );        showbox.x = 367; showbox.y = 200; showbox.alpha = 1; showbox.oldAlpha = 1        menuGroup:insert(showbox)        menuGroup.showbox = showbox        kwkshowbox2 = display.newImageRect(imageDir .. "kwkshowbox2.png", 522, 596 );        kwkshowbox2.x = 373; kwkshowbox2.y = 294; kwkshowbox2.alpha = 1; kwkshowbox2.oldAlpha = 1        menuGroup:insert(kwkshowbox2)        menuGroup.kwkshowbox2 = kwkshowbox2        showbox.alpha = 0        kwkshowbox2.alpha = 0        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                    disposeTweens()                     director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()                    disposeTweens()                     director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        BG:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(dentures_audio); dentures_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 