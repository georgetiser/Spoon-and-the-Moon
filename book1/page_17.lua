-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local kwkBindex_audio = audio.loadSound(audioDir.."indexflip.mp3" )     local curPage = 17 
    print(""); print("New Page"); print("The deprecated curPage is: " .. curPage) 
    print("The current page is: " .. _G.kwk_currentPage); print("") 
    local path = system.pathForFile( "book.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( curPage )     io.close( file )     local drawScreen = function()        local showbox         local showbut         local kwkBback         local kwkBindex         local kwkBforward         local Layer1         local BG  --(2) regular layer        BG = display.newImageRect( imgDir.. "p17_bg.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onLayer1Touch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens() 
                _G.kwk_currentPage = 2
                print("GoToMenu!")
                director:changeScene( "page_2", "fade" )            end             timerStash.newTimer_402 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        Layer1 = ui.newButton{            defaultSrc=imgDir.."p17_layer1.png",            defaultX = 72,            defaultY = 80,            overSrc=imgDir.."p17_layer1.png",            overX = 72,            overY = 80,            onRelease=onLayer1Touch,            id="Layer1Button"        }        Layer1.x = 732; Layer1.y = 984; Layer1.alpha = 1; Layer1.oldAlpha = 1        menuGroup:insert(Layer1)        menuGroup.Layer1 = Layer1        local onkwkBforwardTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens() 
                print("GoForward!")
                _G.kwk_currentPage = _G.kwk_currentPage + 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" )             end             timerStash.newTimer_441 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBforward = ui.newButton{            defaultSrc=imgDir.."kwkbforward.png",            defaultX = 111,            defaultY = 87,            overSrc=imgDir.."kwkbforward.png",            overX = 111,            overY = 87,            onRelease=onkwkBforwardTouch,            id="kwkBforwardButton"        }        kwkBforward.x = 475; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1        menuGroup:insert(kwkBforward)        menuGroup.kwkBforward = kwkBforward        local onkwkBindexTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens() 
                _G.kwk_currentPage = 2
                print("GoToMenu!")
                director:changeScene( "page_2", "overFromTop" )             end             timerStash.newTimer_501 = timer.performWithDelay(0, myClosure_switch, 1)              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( kwkBindex_audio, {channel=myChannel} )              end           end        end --(10) regular layer        kwkBindex = ui.newButton{            defaultSrc=imgDir.."kwkbindex.png",            defaultX = 66,            defaultY = 69,            overSrc=imgDir.."kwkbindex.png",            overX = 66,            overY = 69,            onRelease=onkwkBindexTouch,            id="kwkBindexButton"        }        kwkBindex.x = 383; kwkBindex.y = 969; kwkBindex.alpha = 1; kwkBindex.oldAlpha = 1        menuGroup:insert(kwkBindex)        menuGroup.kwkBindex = kwkBindex        local onkwkBbackTouch = function(event) 
          if event.phase=="ended" then            local myClosure_switch = function()                 disposeAudios()                 disposeTweens() 
                print("GoBack!")
                _G.kwk_currentPage = _G.kwk_currentPage - 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromLeft" )             end             timerStash.newTimer_541 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBback = ui.newButton{            defaultSrc=imgDir.."kwkbback.png",            defaultX = 111,            defaultY = 88,            overSrc=imgDir.."kwkbback.png",            overX = 111,            overY = 88,            onRelease=onkwkBbackTouch,            id="kwkBbackButton"        }        kwkBback.x = 293; kwkBback.y = 973; kwkBback.alpha = 1; kwkBback.oldAlpha = 1        menuGroup:insert(kwkBback)        menuGroup.kwkBback = kwkBback        local onshowbutTouch = function(event)           if event.phase=="ended" then                  if showbox.alpha == 0 then                    transitionStash.newTransition_639 = transition.to( showbox, {alpha=showbox.oldAlpha, time=2000, delay=0})                 else                    transitionStash.newTransition_639 = transition.to( showbox, {alpha=0, time=2000, delay=0})                 end           end        end --(10) regular layer        showbut = ui.newButton{            defaultSrc=imgDir.."p17_showbut.png",            defaultX = 167,            defaultY = 130,            overSrc=imgDir.."p17_showbut.png",            overX = 167,            overY = 130,            onRelease=onshowbutTouch,            id="showbutButton"        }        showbut.x = 113; showbut.y = 105; showbut.alpha = 1; showbut.oldAlpha = 1        menuGroup:insert(showbut)        menuGroup.showbut = showbut --(2) regular layer        showbox = display.newImageRect( imgDir.. "p17_showbox.png", 472, 311 );        showbox.x = 284; showbox.y = 253; showbox.alpha = 1; showbox.oldAlpha = 1        menuGroup:insert(showbox)        menuGroup.showbox = showbox        showbox.alpha = 0        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (curPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_" .. curPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (curPage < _G.kwk_lastPage) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_" .. curPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        BG:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 