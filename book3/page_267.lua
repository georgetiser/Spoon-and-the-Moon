-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local whisk_aud150 = audio.loadSound( audioDir.."whisk.mp3" )     local aaah_audio = audio.loadSound(audioDir.."aah.mp3" )         local path = system.pathForFile( "SpoonAndTheMoonPart3.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )
    local drawScreen = function() 

       navigation.DisplayDevelopmentVersion()

       menuGroup.navigator = navigation.InsertNavigation{}
        local aaah         local CH19PG6  --(2) regular layer        CH19PG6 = display.newImageRect( imageDir.. "p267_ch19pg6.png", 768, 1024 );        CH19PG6.x = 384; CH19PG6.y = 512; CH19PG6.alpha = 1; CH19PG6.oldAlpha = 1        menuGroup:insert(CH19PG6)        menuGroup.CH19PG6 = CH19PG6        local onaaahTouch = function(event)           if event.phase=="ended" then               local myChannel = 3              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( aaah_audio, {channel=myChannel} )              end           end        end --(10) regular layer        aaah = ui.newButton{            defaultSrc=imageDir.."p267_aaah.png",            defaultX = 71,            defaultY = 25,            overSrc=imageDir.."p267_aaah.png",            overX = 71,            overY = 25,            onRelease=onaaahTouch,            id="aaahButton"        }        aaah.x = 151; aaah.y = 647; aaah.alpha = 1; aaah.oldAlpha = 1        menuGroup:insert(aaah)        menuGroup.aaah = aaah --pprcrnr--nav--navIn--nav         local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH19PG6:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(whisk_aud150); whisk_aud150 =nil       audio.stop(3); audio.dispose(aaah_audio); aaah_audio = nil                           audio.stop(4); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_whisk_aud150 = function()       audio.play(whisk_aud150, {  channel=2, loops=-1, fadein=500 } )    end    timerStash.newTimer_150 = timer.performWithDelay(0, myClosure_whisk_aud150, 1)    return menuGroup end 