-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local euphon_aud125 = audio.loadSound( audioDir.."euphon.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local CH9PG9  --(2) regular layer        CH9PG9 = display.newImageRect( imageDir.. "p136_ch9pg9.png", 768, 1024 );        CH9PG9.x = 384; CH9PG9.y = 512; CH9PG9.alpha = 1; CH9PG9.oldAlpha = 1        menuGroup:insert(CH9PG9)        menuGroup.CH9PG9 = CH9PG9          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < numPages) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH9PG9:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(euphon_aud125); euphon_aud125 =nil       audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_euphon_aud125 = function()       audio.play(euphon_aud125, {  channel=2, loops=-1, fadein=500 } )    end    timerStash.newTimer_125 = timer.performWithDelay(0, myClosure_euphon_aud125, 1)    return menuGroup end 