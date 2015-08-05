-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       --local PageXCorner         local showhide         local kock         local CH05PG2         CH05PG2 = display.newImageRect(imageDir .. "p71_ch05pg2.png", 768, 1024 );        CH05PG2.x = 384; CH05PG2.y = 512; CH05PG2.alpha = 1; CH05PG2.oldAlpha = 1        menuGroup:insert(CH05PG2)        menuGroup.CH05PG2 = CH05PG2        local onkockTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_877 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_877 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end           end        end        kock = ui.newButton{            defaultSrc= imageDir .."p71_kock.png",            defaultX = 252,            defaultY = 331,            overSrc= imageDir .."p71_kock.png",            overX = 252,            overY = 331,            onRelease=onkockTouch,            id="kockButton"        }        kock.x = 514; kock.y = 395; kock.alpha = 1; kock.oldAlpha = 1        menuGroup:insert(kock)        menuGroup.kock = kock        showhide = display.newImageRect(imageDir .. "p71_showhide.png", 246, 185 );        showhide.x = 511; showhide.y = 681; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide 
--XPageXCornerX


--XpaperXcornerX


--ForwardFunction--ForwardUI--PageNum Begin
--PlaceholderForPageCorner
--PageNumPlace
--PageNum End

--PlaceholderIndex--PlaceholderFor       --BackPlace--PlaceholderFor              showhide.alpha = 0        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        CH05PG2:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                     -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 