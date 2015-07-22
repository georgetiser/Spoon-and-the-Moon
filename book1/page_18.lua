-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local thunder_audio = audio.loadSound(audioDir .. "bolt.mp3", system.ResourceDirectory)     local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)     --local currPage = 39 
    print("----------------"); print(""); print("New Page") 
    print("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "book.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()


navigation.DisplayDevelopmentVersion()



       local kwkBback         local kwkBindex  
       local kwkPageCorner 
       local kwkBforward         --local PageXCorner         local thunder         local chpt2intropage  --(2) regular layer        chpt2intropage = display.newImageRect(imageDir .. "p39_chpt2intropage.png", 768, 1024 );        chpt2intropage.x = 384; chpt2intropage.y = 512; chpt2intropage.alpha = 1; chpt2intropage.oldAlpha = 1        menuGroup:insert(chpt2intropage)        menuGroup.chpt2intropage = chpt2intropage        local onthunderTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( thunder_audio, {channel=myChannel} )              end           end        end --(10) regular layer        thunder = ui.newButton{            defaultSrc= imageDir .."p39_thunder.png",            defaultX = 373,            defaultY = 393,            overSrc= imageDir .."p39_thunder.png",            overX = 373,            overY = 393,            onRelease=onthunderTouch,            id="thunderButton"        }        thunder.x = 249; thunder.y = 308; thunder.alpha = 1; thunder.oldAlpha = 1        menuGroup:insert(thunder)        menuGroup.thunder = thunder --local PageZZCorner--(10) regular layer --local PageXXCorner
--XpaperXcornerX




       local onkwkBforwardTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeAudios()
                disposeTweens() 
                print("GoForward!")
                _G.kwk_currentPage = _G.kwk_currentPage + 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" )             end             timerStash.newTimer_731 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBforward = ui.newButton{            defaultSrc= imageDir .."kwkBforward.png",            defaultX = 110,            defaultY = 87,            overSrc= imageDir .."kwkBforward.png",            overX = 110,            overY = 87,            onRelease=onkwkBforwardTouch,            id="kwkBforwardButton"        }        kwkBforward.x = 476; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1        menuGroup:insert(kwkBforward)        menuGroup.kwkBforward = kwkBforward --PageNum Begin
       local onkwkPageCornerTouch = function(event) 
          if event.phase=="ended" then  
            local myClosure_switch = function() 
                disposeAudios()
                disposeTweens() 
                _G.kwk_currentPage = _G.kwk_menuPage
                print("GoToMenu!")
                director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )
            end 
            timerStash.newTimer_518 = timer.performWithDelay(0, myClosure_switch, 1) 
          end 
       end 
       kwkPageCorner = ui.newButton{ 
           defaultSrc= imageDir .."PageCornerGrey.png", 
           defaultX = 72, 
           defaultY = 80, 
           overSrc= imageDir .."PageCornerGrey.png", 
           overX = 72, 
           overY = 80, 
           onRelease=onkwkPageCornerTouch, 
           id="kwkPageCornerButton" 
       } 
       kwkPageCorner.x = 732; kwkPageCorner.y = 984; kwkPageCorner.alpha = 1; kwkPageCorner.oldAlpha = 1 
       menuGroup:insert(kwkPageCorner) 
       menuGroup.kwkPageCorner = kwkPageCorner 
--TEXTFORPAGENUMBEGIN
local crnrtxtoffset = 730; if _G.kwk_currentPage < 99 then crnrtxtoffset = 737 end; if _G.kwk_currentPage < 9 then crnrtxtoffset = 745 end
crnrtxt = display.newText("" .. _G.kwk_currentPage .. "", crnrtxtoffset, 995, "Arbutus Slab", 20); crnrtxt:setFillColor(0,0,0)
--TEXTFORPAGENUMEND



--PageNum End

       local onkwkBindexTouch = function(event) 
          if event.phase=="ended" then
            soundeffects.PlayASound{filename = audioDir .. "indexflip.mp3"}  
             local myClosure_switch = function()                 disposeAudios()
                disposeTweens() 
                _G.kwk_currentPage = _G.kwk_menuPage
                print("GoToMenu!")
                director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )             end             timerStash.newTimer_820 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBindex = ui.newButton{            defaultSrc= imageDir .."kwkBindex.png",            defaultX = 66,            defaultY = 69,            overSrc= imageDir .."kwkBindex.png",            overX = 66,            overY = 69,            onRelease=onkwkBindexTouch,            id="kwkBindexButton"        }        kwkBindex.x = 383; kwkBindex.y = 969; kwkBindex.alpha = 1; kwkBindex.oldAlpha = 1        menuGroup:insert(kwkBindex)        menuGroup.kwkBindex = kwkBindex        local onkwkBbackTouch = function(event) 
          if event.phase=="ended" then            local myClosure_switch = function()                 disposeAudios()
                disposeTweens() 
                print("GoBack!")
                _G.kwk_currentPage = _G.kwk_currentPage - 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromLeft" )             end             timerStash.newTimer_882 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBback = ui.newButton{            defaultSrc= imageDir .."kwkBback.png",            defaultX = 111,            defaultY = 88,            overSrc= imageDir .."kwkBback.png",            overX = 111,            overY = 88,            onRelease=onkwkBbackTouch,            id="kwkBbackButton"        }        kwkBback.x = 293; kwkBback.y = 973; kwkBback.alpha = 1; kwkBback.oldAlpha = 1        menuGroup:insert(kwkBback)        menuGroup.kwkBback = kwkBback        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        chpt2intropage:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(thunder_audio); thunder_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 