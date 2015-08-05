-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local horses_races_aud787 = audio.loadSound( audioDir.."horses_races.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local CH8PG10  --(2) regular layer        CH8PG10 = display.newImageRect( imageDir.. "p124_ch8pg10.png", 768, 1024 );        CH8PG10.x = 384; CH8PG10.y = 512; CH8PG10.alpha = 1; CH8PG10.oldAlpha = 1        menuGroup:insert(CH8PG10)        menuGroup.CH8PG10 = CH8PG10          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < numPages) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH8PG10:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(horses_races_aud787); horses_races_aud787 =nil       audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_horses_races_aud787 = function()       audio.play(horses_races_aud787, {  channel=2, loops=-1, fadein=500 } )    end    timerStash.newTimer_788 = timer.performWithDelay(0, myClosure_horses_races_aud787, 1)    return menuGroup end 