-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)     --local currPage = 95 
    print("----------------"); print(""); print("New Page") 
    print("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "book.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()


    --DEBUGTEXT
    if _G.kwk_ShowDebugOutput then
      print("PageDisplay called.")
      devtxt1 = display.newText(_G.kwk_DebugText1_t, _G.kwk_DebugText1_x, _G.kwk_DebugText1_y, _G.kwk_DebugText1_w, _G.kwk_DebugText1_h, _G.kwk_DebugText1_f, _G.kwk_DebugText1_s); devtxt1:setFillColor(1,1,1); devtxt1.alpha = 1
      devtxt2 = display.newText(_G.kwk_DebugText2_t, _G.kwk_DebugText2_x, _G.kwk_DebugText2_y, _G.kwk_DebugText2_w, _G.kwk_DebugText2_h, _G.kwk_DebugText2_f, _G.kwk_DebugText2_s); devtxt2:setFillColor(1,1,1); devtxt2.alpha = 1
      devtxt3 = display.newText(_G.kwk_DebugText3_t, _G.kwk_DebugText3_x, _G.kwk_DebugText3_y, _G.kwk_DebugText3_w, _G.kwk_DebugText3_h, _G.kwk_DebugText3_f, _G.kwk_DebugText3_s); devtxt3:setFillColor(1,1,1); devtxt3.alpha = 1
    end--if
    --DEBUGTEXTEND



       local kwkBback         local kwkBindex  
       local kwkPageCorner 
       local kwkBforward         --local PageXCorner         local CH06PG8  --(2) regular layer        CH06PG8 = display.newImageRect(imgDir .. "p95_ch06pg8.png", 768, 1024 );        CH06PG8.x = 384; CH06PG8.y = 512; CH06PG8.alpha = 1; CH06PG8.oldAlpha = 1        menuGroup:insert(CH06PG8)        menuGroup.CH06PG8 = CH06PG8 
--XPageXCornerX


--XpaperXcornerX




       local onkwkBforwardTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens() 
                print("GoForward!")
                _G.kwk_currentPage = _G.kwk_currentPage + 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" )             end             timerStash.newTimer_099 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBforward = ui.newButton{            defaultSrc= imgDir .."kwkBforward.png",            defaultX = 110,            defaultY = 87,            overSrc= imgDir .."kwkBforward.png",            overX = 110,            overY = 87,            onRelease=onkwkBforwardTouch,            id="kwkBforwardButton"        }        kwkBforward.x = 476; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1        menuGroup:insert(kwkBforward)        menuGroup.kwkBforward = kwkBforward --PageNum Begin
       local onkwkPageCornerTouch = function(event) 
          if event.phase=="ended" then  
            local myClosure_switch = function() 
                disposeTweens() 
                _G.kwk_currentPage = _G.kwk_menuPage
                print("GoToMenu!")
                director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )
            end 
            timerStash.newTimer_518 = timer.performWithDelay(0, myClosure_switch, 1) 
          end 
       end 
       kwkPageCorner = ui.newButton{ 
           defaultSrc= imgDir .."PageCornerGrey.png", 
           defaultX = 72, 
           defaultY = 80, 
           overSrc= imgDir .."PageCornerGrey.png", 
           overX = 72, 
           overY = 80, 
           onRelease=onkwkPageCornerTouch, 
           id="kwkPageCornerButton" 
       } 
       kwkPageCorner.x = 732; kwkPageCorner.y = 984; kwkPageCorner.alpha = 1; kwkPageCorner.oldAlpha = 1 
       menuGroup:insert(kwkPageCorner) 
       menuGroup.kwkPageCorner = kwkPageCorner 
       crnrtxt = display.newText("" .. _G.kwk_currentPage .. "", 750, 1005, "Arbutus Slab", 20)
       crnrtxt:setFillColor(0,0,0) --black
--PageNum End

       local onkwkBindexTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens() 
                _G.kwk_currentPage = _G.kwk_menuPage
                print("GoToMenu!")
                director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )             end             timerStash.newTimer_157 = timer.performWithDelay(0, myClosure_switch, 1)              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( kwkBindex_audio, {channel=myChannel} )              end           end        end --(10) regular layer        kwkBindex = ui.newButton{            defaultSrc= imgDir .."kwkBindex.png",            defaultX = 66,            defaultY = 69,            overSrc= imgDir .."kwkBindex.png",            overX = 66,            overY = 69,            onRelease=onkwkBindexTouch,            id="kwkBindexButton"        }        kwkBindex.x = 383; kwkBindex.y = 969; kwkBindex.alpha = 1; kwkBindex.oldAlpha = 1        menuGroup:insert(kwkBindex)        menuGroup.kwkBindex = kwkBindex        local onkwkBbackTouch = function(event) 
          if event.phase=="ended" then            local myClosure_switch = function()                 disposeAudios()                 disposeTweens() 
                print("GoBack!")
                _G.kwk_currentPage = _G.kwk_currentPage - 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromLeft" )             end             timerStash.newTimer_192 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBback = ui.newButton{            defaultSrc= imgDir .."kwkBback.png",            defaultX = 111,            defaultY = 88,            overSrc= imgDir .."kwkBback.png",            overX = 111,            overY = 88,            onRelease=onkwkBbackTouch,            id="kwkBbackButton"        }        kwkBback.x = 293; kwkBback.y = 973; kwkBback.alpha = 1; kwkBback.oldAlpha = 1        menuGroup:insert(kwkBback)        menuGroup.kwkBback = kwkBback        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        CH06PG8:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 