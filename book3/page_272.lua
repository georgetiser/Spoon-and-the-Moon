-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local smack_audio = audio.loadSound(audioDir.."slap.mp3" )         local path = system.pathForFile( "book.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )     local drawScreen = function() 

       navigation.DisplayDevelopmentVersion()

       menuGroup.navigator = navigation.InsertNavigation{}
        local howhode         local smack         local CH19PG11  --(2) regular layer        CH19PG11 = display.newImageRect( imageDir.. "p272_ch19pg11.png", 768, 1024 );        CH19PG11.x = 384; CH19PG11.y = 512; CH19PG11.alpha = 1; CH19PG11.oldAlpha = 1        menuGroup:insert(CH19PG11)        menuGroup.CH19PG11 = CH19PG11        local onsmackTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( smack_audio, {channel=myChannel} )              end                 if howhode.alpha == 0 then                    transitionStash.newTransition_361 = transition.to( howhode, {alpha=howhode.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_361 = transition.to( howhode, {alpha=0, time=1000, delay=0})                 end           end        end --(10) regular layer        smack = ui.newButton{            defaultSrc=imageDir.."p272_smack.png",            defaultX = 172,            defaultY = 303,            overSrc=imageDir.."p272_smack.png",            overX = 172,            overY = 303,            onRelease=onsmackTouch,            id="smackButton"        }        smack.x = 633; smack.y = 558; smack.alpha = 1; smack.oldAlpha = 1        menuGroup:insert(smack)        menuGroup.smack = smack --(2) regular layer        howhode = display.newImageRect( imageDir.. "p272_howhode.png", 396, 157 );        howhode.x = 416; howhode.y = 197; howhode.alpha = 1; howhode.oldAlpha = 1        menuGroup:insert(howhode)        menuGroup.howhode = howhode --pprcrnr--nav--navIn--nav       howhode.alpha = 0          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH19PG11:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(smack_audio); smack_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 