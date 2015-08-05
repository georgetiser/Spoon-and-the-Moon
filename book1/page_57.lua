-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local crows_cawing_angrily_aud902 = audio.loadSound(audioDir .. "crows_cawing_angrily.mp3", system.ResourceDirectory)      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       --local PageXCorner         local CH03PG10         CH03PG10 = display.newImageRect(imageDir .. "p56_ch03pg10.png", 768, 1024 );        CH03PG10.x = 384; CH03PG10.y = 512; CH03PG10.alpha = 1; CH03PG10.oldAlpha = 1        menuGroup:insert(CH03PG10)        menuGroup.CH03PG10 = CH03PG10 --local PageZZCorner--local PageXXCorner
--XpaperXcornerX


--ForwardFunction--ForwardUI--PageNum Begin
--PlaceholderForPageCorner
--PageNumPlace
--PageNum End
--PlaceholderIndex --PlaceholderFor       --BackPlace--PlaceholderFor              local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        CH03PG10:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(crows_cawing_angrily_aud902); crows_cawing_angrily_aud902 =nil        -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_crows_cawing_angrily_aud902 = function()       audio.play(crows_cawing_angrily_aud902, {  channel=2, loops=0, fadein=500 } )    end    timerStash.newTimer_902 = timer.performWithDelay(0, myClosure_crows_cawing_angrily_aud902, 1)    return menuGroup end 