-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local sunday_audio = audio.loadSound(audioDir.."click.mp3" )         local path = system.pathForFile( "SpoonAndTheMoonPart3.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )
    local drawScreen = function() 

       navigation.DisplayDevelopmentVersion()

       menuGroup.navigator = navigation.InsertNavigation{}
        local showhide         local sunday         local CH17PG4  --(2) regular layer        CH17PG4 = display.newImageRect( imageDir.. "p235_ch17pg4.png", 768, 1024 );        CH17PG4.x = 384; CH17PG4.y = 512; CH17PG4.alpha = 1; CH17PG4.oldAlpha = 1        menuGroup:insert(CH17PG4)        menuGroup.CH17PG4 = CH17PG4        local onsundayTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_266 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_266 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( sunday_audio, {channel=myChannel} )              end           end        end --(10) regular layer        sunday = ui.newButton{            defaultSrc=imageDir.."p235_sunday.png",            defaultX = 228,            defaultY = 289,            overSrc=imageDir.."p235_sunday.png",            overX = 228,            overY = 289,            onRelease=onsundayTouch,            id="sundayButton"        }        sunday.x = 602; sunday.y = 717; sunday.alpha = 1; sunday.oldAlpha = 1        menuGroup:insert(sunday)        menuGroup.sunday = sunday --(2) regular layer        showhide = display.newImageRect( imageDir.. "p235_showhide.png", 391, 221 );        showhide.x = 346; showhide.y = 602; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide --pprcrnr--nav--navIn--nav       showhide.alpha = 0          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH17PG4:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(sunday_audio); sunday_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 