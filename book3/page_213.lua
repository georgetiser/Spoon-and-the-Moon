-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local glassesclink_aud986 = audio.loadSound( audioDir.."glassesclink.mp3" )         local path = system.pathForFile( "SpoonAndTheMoonPart3.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )
    local drawScreen = function() 

       navigation.DisplayDevelopmentVersion()

       menuGroup.navigator = navigation.InsertNavigation{}
        local CH15PG5  --(2) regular layer        CH15PG5 = display.newImageRect( imageDir.. "p213_ch15pg5.png", 768, 1024 );        CH15PG5.x = 384; CH15PG5.y = 512; CH15PG5.alpha = 1; CH15PG5.oldAlpha = 1        menuGroup:insert(CH15PG5)        menuGroup.CH15PG5 = CH15PG5 --pprcrnr--nav--navIn--nav         local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH15PG5:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(glassesclink_aud986); glassesclink_aud986 =nil       audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_glassesclink_aud986 = function()       audio.play(glassesclink_aud986, {  channel=2, loops=-1, fadein=500 } )    end    timerStash.newTimer_986 = timer.performWithDelay(0, myClosure_glassesclink_aud986, 1)    return menuGroup end 