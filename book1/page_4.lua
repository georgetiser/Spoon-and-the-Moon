-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local Bindex_audio = audio.loadSound(audioDir.."indexflip.mp3" )     local choke_audio = audio.loadSound(audioDir.."choke.mp3" )     local showbut1_audio = audio.loadSound(audioDir.."click0.mp3" )     local showbut2_audio = audio.loadSound(audioDir.."click1.mp3" )     local curPage = 4 
    print(""); print("New Page"); print("The deprecated curPage is: " .. curPage) 
    print("The current page is: " .. _G.kwk_currentPage); print("") 
    local path = system.pathForFile( "book.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( curPage )     io.close( file )     local drawScreen = function()        local showbox2         local showbut2         local showbox1         local showbut1         local choke         local Bback         local Bindex         local Bforward         local pagen         local BG  --(2) regular layer        BG = display.newImageRect( imgDir.. "p4_bg.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onpagenTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens() 
                _G.kwk_currentPage = 2
                print("GoToMenu!")
                director:changeScene( "page_2", "fade" )            end             timerStash.newTimer_783 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        pagen = ui.newButton{            defaultSrc=imgDir.."p4_pagen.png",            defaultX = 72,            defaultY = 80,            overSrc=imgDir.."p4_pagen.png",            overX = 72,            overY = 80,            onRelease=onpagenTouch,            id="pagenButton"        }        pagen.x = 732; pagen.y = 984; pagen.alpha = 1; pagen.oldAlpha = 1        menuGroup:insert(pagen)        menuGroup.pagen = pagen        local onBforwardTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens() 
                print("GoForward!")
                _G.kwk_currentPage = _G.kwk_currentPage + 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" )             end             timerStash.newTimer_872 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        Bforward = ui.newButton{            defaultSrc=imgDir.."p4_bforward.png",            defaultX = 111,            defaultY = 87,            overSrc=imgDir.."p4_bforward.png",            overX = 111,            overY = 87,            onRelease=onBforwardTouch,            id="BforwardButton"        }        Bforward.x = 475; Bforward.y = 975; Bforward.alpha = 1; Bforward.oldAlpha = 1        menuGroup:insert(Bforward)        menuGroup.Bforward = Bforward        local onBindexTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens() 
                _G.kwk_currentPage = 2
                print("GoToMenu!")
                director:changeScene( "page_2", "overFromTop" )             end             timerStash.newTimer_937 = timer.performWithDelay(0, myClosure_switch, 1)              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( Bindex_audio, {channel=myChannel} )              end           end        end --(10) regular layer        Bindex = ui.newButton{            defaultSrc=imgDir.."p4_bindex.png",            defaultX = 66,            defaultY = 69,            overSrc=imgDir.."p4_bindex.png",            overX = 66,            overY = 69,            onRelease=onBindexTouch,            id="BindexButton"        }        Bindex.x = 383; Bindex.y = 969; Bindex.alpha = 1; Bindex.oldAlpha = 1        menuGroup:insert(Bindex)        menuGroup.Bindex = Bindex        local onBbackTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeAudios()                 disposeTweens() 
                print("GoBack!")
                _G.kwk_currentPage = _G.kwk_currentPage - 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromLeft" )             end             timerStash.newTimer_990 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        Bback = ui.newButton{            defaultSrc=imgDir.."p4_bback.png",            defaultX = 111,            defaultY = 88,            overSrc=imgDir.."p4_bback.png",            overX = 111,            overY = 88,            onRelease=onBbackTouch,            id="BbackButton"        }        Bback.x = 293; Bback.y = 973; Bback.alpha = 1; Bback.oldAlpha = 1        menuGroup:insert(Bback)        menuGroup.Bback = Bback        local onchokeTouch = function(event)           if event.phase=="ended" then               local myChannel = 3              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( choke_audio, {channel=myChannel} )              end           end        end --(10) regular layer        choke = ui.newButton{            defaultSrc=imgDir.."p4_choke.png",            defaultX = 399,            defaultY = 26,            overSrc=imgDir.."p4_choke.png",            overX = 399,            overY = 26,            onRelease=onchokeTouch,            id="chokeButton"        }        choke.x = 295; choke.y = 227; choke.alpha = 1; choke.oldAlpha = 1        menuGroup:insert(choke)        menuGroup.choke = choke        local onshowbut1Touch = function(event)           if event.phase=="ended" then                  if showbox1.alpha == 0 then                    transitionStash.newTransition_303 = transition.to( showbox1, {alpha=showbox1.oldAlpha, time=2000, delay=0})                 else                    transitionStash.newTransition_303 = transition.to( showbox1, {alpha=0, time=2000, delay=0})                 end              local myChannel = 4              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( showbut1_audio, {channel=myChannel} )              end           end        end --(10) regular layer        showbut1 = ui.newButton{            defaultSrc=imgDir.."p4_showbut1.png",            defaultX = 210,            defaultY = 332,            overSrc=imgDir.."p4_showbut1.png",            overX = 210,            overY = 332,            onRelease=onshowbut1Touch,            id="showbut1Button"        }        showbut1.x = 663; showbut1.y = 758; showbut1.alpha = 1; showbut1.oldAlpha = 1        menuGroup:insert(showbut1)        menuGroup.showbut1 = showbut1 --(2) regular layer        showbox1 = display.newImageRect( imgDir.. "p4_showbox1.png", 570, 446 );        showbox1.x = 473; showbox1.y = 473; showbox1.alpha = 1; showbox1.oldAlpha = 1        menuGroup:insert(showbox1)        menuGroup.showbox1 = showbox1        local onshowbut2Touch = function(event)           if event.phase=="ended" then                  if showbox2.alpha == 0 then                    transitionStash.newTransition_419 = transition.to( showbox2, {alpha=showbox2.oldAlpha, time=2000, delay=0})                 else                    transitionStash.newTransition_419 = transition.to( showbox2, {alpha=0, time=2000, delay=0})                 end              local myChannel = 5              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( showbut2_audio, {channel=myChannel} )              end           end        end --(10) regular layer        showbut2 = ui.newButton{            defaultSrc=imgDir.."p4_showbut2.png",            defaultX = 180,            defaultY = 299,            overSrc=imgDir.."p4_showbut2.png",            overX = 180,            overY = 299,            onRelease=onshowbut2Touch,            id="showbut2Button"        }        showbut2.x = 90; showbut2.y = 774; showbut2.alpha = 1; showbut2.oldAlpha = 1        menuGroup:insert(showbut2)        menuGroup.showbut2 = showbut2 --(2) regular layer        showbox2 = display.newImageRect( imgDir.. "p4_showbox2.png", 565, 734 );        showbox2.x = 292; showbox2.y = 359; showbox2.alpha = 1; showbox2.oldAlpha = 1        menuGroup:insert(showbox2)        menuGroup.showbox2 = showbox2        showbox1.alpha = 0        showbox2.alpha = 0          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (curPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_" .. curPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (curPage < _G.kwk_lastPage) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_" .. curPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        BG:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(Bindex_audio); Bindex_audio = nil                           audio.stop(3); audio.dispose(choke_audio); choke_audio = nil                           audio.stop(4); audio.dispose(showbut1_audio); showbut1_audio = nil                           audio.stop(5); audio.dispose(showbut2_audio); showbut2_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 