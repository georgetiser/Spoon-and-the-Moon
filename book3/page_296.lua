-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local ice_audio = audio.loadSound(audioDir.."click.mp3" )         local path = system.pathForFile( "SpoonAndTheMoonPart3.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )
    local drawScreen = function() 

       navigation.DisplayDevelopmentVersion()

       menuGroup.navigator = navigation.InsertNavigation{}
       local showhide         local ice          local CH20PG18  --(2) regular layer        CH20PG18 = display.newImageRect( imageDir.. "p296_ch20pg18.png", 768, 1024 );        CH20PG18.x = 384; CH20PG18.y = 512; CH20PG18.alpha = 1; CH20PG18.oldAlpha = 1        menuGroup:insert(CH20PG18)        menuGroup.CH20PG18 = CH20PG18 --pprcrnr       local oniceTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_894 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_894 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( ice_audio, {channel=myChannel} )              end           end        end --(10) regular layer        ice = ui.newButton{            defaultSrc=imageDir.."p296_ice.png",            defaultX = 229,            defaultY = 177,            overSrc=imageDir.."p296_ice.png",            overX = 229,            overY = 177,            onRelease=oniceTouch,            id="iceButton"        }        ice.x = 165; ice.y = 812; ice.alpha = 1; ice.oldAlpha = 1        menuGroup:insert(ice)        menuGroup.ice = ice --(2) regular layer        showhide = display.newImageRect( imageDir.. "p296_showhide.png", 412, 248 );        showhide.x = 387; showhide.y = 752; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide --nav--navIn--nav       showhide.alpha = 0          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH20PG18:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(ice_audio); ice_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 