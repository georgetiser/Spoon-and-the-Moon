-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local viloin_audio = audio.loadSound(audioDir.."click.mp3" )         local path = system.pathForFile( "book.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )     local drawScreen = function() 

       navigation.DisplayDevelopmentVersion()

       menuGroup.navigator = navigation.InsertNavigation{}
       local shwohide         local viloin          local CH18PG13  --(2) regular layer        CH18PG13 = display.newImageRect( imageDir.. "p257_ch18pg13.png", 768, 1024 );        CH18PG13.x = 384; CH18PG13.y = 512; CH18PG13.alpha = 1; CH18PG13.oldAlpha = 1        menuGroup:insert(CH18PG13)        menuGroup.CH18PG13 = CH18PG13 --pprcrnr       local onviloinTouch = function(event)           if event.phase=="ended" then                  if shwohide.alpha == 0 then                    transitionStash.newTransition_941 = transition.to( shwohide, {alpha=shwohide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_941 = transition.to( shwohide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( viloin_audio, {channel=myChannel} )              end           end        end --(10) regular layer        viloin = ui.newButton{            defaultSrc=imageDir.."p257_viloin.png",            defaultX = 191,            defaultY = 449,            overSrc=imageDir.."p257_viloin.png",            overX = 191,            overY = 449,            onRelease=onviloinTouch,            id="viloinButton"        }        viloin.x = 607; viloin.y = 694; viloin.alpha = 1; viloin.oldAlpha = 1        menuGroup:insert(viloin)        menuGroup.viloin = viloin --(2) regular layer        shwohide = display.newImageRect( imageDir.. "p257_shwohide.png", 383, 206 );        shwohide.x = 377; shwohide.y = 599; shwohide.alpha = 1; shwohide.oldAlpha = 1        menuGroup:insert(shwohide)        menuGroup.shwohide = shwohide --nav--navIn--nav       shwohide.alpha = 0          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH18PG13:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(viloin_audio); viloin_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 