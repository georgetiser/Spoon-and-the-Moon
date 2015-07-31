-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local numPages = 330     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local kwkBindex_audio = audio.loadSound(audioDir.."indexflip.mp3" )     local curPage = 185     local path = system.pathForFile( "book.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( curPage )     io.close( file )     local drawScreen = function()        local kwkBback         local kwkBindex         local kwkBforward         local papercorner         local CH12PG11  --(2) regular layer        CH12PG11 = display.newImageRect( imageDir.. "p185_ch12pg11.png", 768, 1024 );        CH12PG11.x = 384; CH12PG11.y = 512; CH12PG11.alpha = 1; CH12PG11.oldAlpha = 1        menuGroup:insert(CH12PG11)        menuGroup.CH12PG11 = CH12PG11        local onpapercornerTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens()                 director:changeScene( "page_2", "fade" )             end             timerStash.newTimer_331 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        papercorner = ui.newButton{            defaultSrc=imageDir.."PageCornerGrey.png",            defaultX = 72,            defaultY = 80,            overSrc=imageDir.."PageCornerGrey.png",            overX = 72,            overY = 80,            onRelease=onpapercornerTouch,            id="papercornerButton"        }        papercorner.x = 732; papercorner.y = 984; papercorner.alpha = 1; papercorner.oldAlpha = 1        menuGroup:insert(papercorner)               menuGroup.papercorner = papercorner 

local crnrtxtoffset = 730; if curPage < 99 then crnrtxtoffset = 737 end; if curPage < 9 then crnrtxtoffset = 745 end
crnrtxt = display.newText("" .. curPage .. "", crnrtxtoffset, 995, "Arbutus Slab", 20); crnrtxt:setFillColor(0,0,0)
        local onkwkBforwardTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens()                 director:changeScene( "page_186", "moveFromRight" )             end             timerStash.newTimer_401 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBforward = ui.newButton{            defaultSrc=imageDir.."kwkBforward.png",            defaultX = 110,            defaultY = 87,            overSrc=imageDir.."kwkBforward.png",            overX = 110,            overY = 87,            onRelease=onkwkBforwardTouch,            id="kwkBforwardButton"        }        kwkBforward.x = 476; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1        menuGroup:insert(kwkBforward)        menuGroup.kwkBforward = kwkBforward        local onkwkBindexTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens()                 director:changeScene( "page_2", "overFromTop" )             end             timerStash.newTimer_458 = timer.performWithDelay(0, myClosure_switch, 1)              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( kwkBindex_audio, {channel=myChannel} )              end           end        end --(10) regular layer        kwkBindex = ui.newButton{            defaultSrc=imageDir.."kwkBindex.png",            defaultX = 66,            defaultY = 69,            overSrc=imageDir.."kwkBindex.png",            overX = 66,            overY = 69,            onRelease=onkwkBindexTouch,            id="kwkBindexButton"        }        kwkBindex.x = 383; kwkBindex.y = 969; kwkBindex.alpha = 1; kwkBindex.oldAlpha = 1        menuGroup:insert(kwkBindex)        menuGroup.kwkBindex = kwkBindex        local onkwkBbackTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeAudios()                 disposeTweens()                 director:changeScene( "page_184", "moveFromLeft" )             end             timerStash.newTimer_498 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBback = ui.newButton{            defaultSrc=imageDir.."kwkBback.png",            defaultX = 111,            defaultY = 88,            overSrc=imageDir.."kwkBback.png",            overX = 111,            overY = 88,            onRelease=onkwkBbackTouch,            id="kwkBbackButton"        }        kwkBback.x = 293; kwkBback.y = 973; kwkBback.alpha = 1; kwkBback.oldAlpha = 1        menuGroup:insert(kwkBback)        menuGroup.kwkBback = kwkBback          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (curPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_"..curPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (curPage < numPages) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_"..curPage+1, "moveFromRight")                 end              end           end        end        CH12PG11:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 