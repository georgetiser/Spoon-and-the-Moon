-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local star_audio = audio.loadSound(audioDir.."fart2.mp3" )         local path = system.pathForFile( "book.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )     local drawScreen = function() 

       navigation.DisplayDevelopmentVersion()

       menuGroup.navigator = navigation.InsertNavigation{}
        local shohwide         local star         local CH17PG9  --(2) regular layer        CH17PG9 = display.newImageRect( imageDir.. "p240_ch17pg9.png", 768, 1024 );        CH17PG9.x = 384; CH17PG9.y = 512; CH17PG9.alpha = 1; CH17PG9.oldAlpha = 1        menuGroup:insert(CH17PG9)        menuGroup.CH17PG9 = CH17PG9        local onstarTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( star_audio, {channel=myChannel} )              end                 if shohwide.alpha == 0 then                    transitionStash.newTransition_333 = transition.to( shohwide, {alpha=shohwide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_333 = transition.to( shohwide, {alpha=0, time=1000, delay=0})                 end           end        end --(10) regular layer        star = ui.newButton{            defaultSrc=imageDir.."p240_star.png",            defaultX = 305,            defaultY = 311,            overSrc=imageDir.."p240_star.png",            overX = 305,            overY = 311,            onRelease=onstarTouch,            id="starButton"        }        star.x = 571; star.y = 260; star.alpha = 1; star.oldAlpha = 1        menuGroup:insert(star)        menuGroup.star = star --(2) regular layer        shohwide = display.newImageRect( imageDir.. "p240_shohwide.png", 373, 128 );        shohwide.x = 282; shohwide.y = 146; shohwide.alpha = 1; shohwide.oldAlpha = 1        menuGroup:insert(shohwide)        menuGroup.shohwide = shohwide --pprcrnr--nav--navIn--nav       shohwide.alpha = 0          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH17PG9:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(star_audio); star_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 