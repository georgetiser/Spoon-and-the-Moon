-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local rains_aud662 = audio.loadSound( audioDir.."rains.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local CH10PG12  --(2) regular layer        CH10PG12 = display.newImageRect( imageDir.. "p156_ch10pg12.png", 768, 1024 );        CH10PG12.x = 384; CH10PG12.y = 512; CH10PG12.alpha = 1; CH10PG12.oldAlpha = 1        menuGroup:insert(CH10PG12)        menuGroup.CH10PG12 = CH10PG12          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < numPages) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH10PG12:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(rains_aud662); rains_aud662 =nil       audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_rains_aud662 = function()       audio.play(rains_aud662, {  channel=2, loops=-2, fadein=500 } )    end    timerStash.newTimer_662 = timer.performWithDelay(0, myClosure_rains_aud662, 1)    return menuGroup end 