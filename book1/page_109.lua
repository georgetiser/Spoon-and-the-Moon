-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local dentures_audio = audio.loadSound(audioDir .. "eating.mp3", system.ResourceDirectory)     local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)     --local currPage = 108 
    print("----------------"); print(""); print("New Page") 
    print("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "book.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()


    --DEBUGTEXT
    if _G.kwk_ShowDebugOutput then
      print("PageDisplay called.")
      devtxt1 = display.newText(_G.kwk_DebugText1_t, _G.kwk_DebugText1_x, _G.kwk_DebugText1_y, _G.kwk_DebugText1_w, _G.kwk_DebugText1_h, _G.kwk_DebugText1_f, _G.kwk_DebugText1_s); devtxt1:setFillColor(_G.kwk_DebugText1_cr,_G.kwk_DebugText1_cg,_G.kwk_DebugText1_cb); devtxt1.alpha = 1
      devtxt2 = display.newText(_G.kwk_DebugText2_t, _G.kwk_DebugText2_x, _G.kwk_DebugText2_y, _G.kwk_DebugText2_w, _G.kwk_DebugText2_h, _G.kwk_DebugText2_f, _G.kwk_DebugText2_s); devtxt2:setFillColor(_G.kwk_DebugText2_cr,_G.kwk_DebugText2_cg,_G.kwk_DebugText2_cb); devtxt2.alpha = 1
      devtxt3 = display.newText(_G.kwk_DebugText3_t, _G.kwk_DebugText3_x, _G.kwk_DebugText3_y, _G.kwk_DebugText3_w, _G.kwk_DebugText3_h, _G.kwk_DebugText3_f, _G.kwk_DebugText3_s); devtxt3:setFillColor(_G.kwk_DebugText3_cr,_G.kwk_DebugText3_cg,_G.kwk_DebugText3_cb); devtxt3.alpha = 1


    end--if
    --DEBUGTEXTEND



       local kwkBback         local kwkBindex  
       local kwkPageCorner 
       local kwkBforward         --local PageXCorner         local showhide         local dentures         local CH7PG10  --(2) regular layer        CH7PG10 = display.newImageRect(imgDir .. "p108_ch7pg10.png", 768, 1024 );        CH7PG10.x = 384; CH7PG10.y = 512; CH7PG10.alpha = 1; CH7PG10.oldAlpha = 1        menuGroup:insert(CH7PG10)        menuGroup.CH7PG10 = CH7PG10        local ondenturesTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( dentures_audio, {channel=myChannel} )              end                 if showhide.alpha == 0 then                    transitionStash.newTransition_666 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_666 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end           end        end --(10) regular layer        dentures = ui.newButton{            defaultSrc= imgDir .."p108_dentures.png",            defaultX = 266,            defaultY = 246,            overSrc= imgDir .."p108_dentures.png",            overX = 266,            overY = 246,            onRelease=ondenturesTouch,            id="denturesButton"        }        dentures.x = 263; dentures.y = 715; dentures.alpha = 1; dentures.oldAlpha = 1        menuGroup:insert(dentures)        menuGroup.dentures = dentures --(2) regular layer        showhide = display.newImageRect(imgDir .. "p108_showhide.png", 357, 135 );        showhide.x = 540; showhide.y = 607; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide --local PageZZCorner--(10) regular layer --local PageXXCorner
--XpaperXcornerX




       local onkwkBforwardTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeAudios()
                disposeTweens() 
                print("GoForward!")
                _G.kwk_currentPage = _G.kwk_currentPage + 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" )             end             timerStash.newTimer_861 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBforward = ui.newButton{            defaultSrc= imgDir .."kwkBforward.png",            defaultX = 110,            defaultY = 87,            overSrc= imgDir .."kwkBforward.png",            overX = 110,            overY = 87,            onRelease=onkwkBforwardTouch,            id="kwkBforwardButton"        }        kwkBforward.x = 476; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1        menuGroup:insert(kwkBforward)        menuGroup.kwkBforward = kwkBforward --PageNum Begin
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
--TEXTFORPAGENUMBEGIN
local crnrtxtoffset = 730; if _G.kwk_currentPage < 99 then crnrtxtoffset = 737 end; if _G.kwk_currentPage < 9 then crnrtxtoffset = 745 end
crnrtxt = display.newText("" .. _G.kwk_currentPage .. "", crnrtxtoffset, 995, "Arbutus Slab", 20); crnrtxt:setFillColor(0,0,0)
--TEXTFORPAGENUMEND



--PageNum End

       local onkwkBindexTouch = function(event) 
          if event.phase=="ended" then
            soundeffects.PlayASound{filename = audioDir .. "indexflip.mp3"}              local myClosure_switch = function()                 disposeAudios()
                disposeTweens() 
                _G.kwk_currentPage = _G.kwk_menuPage
                print("GoToMenu!")
                director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )             end             timerStash.newTimer_923 = timer.performWithDelay(0, myClosure_switch, 1) 
--AudioGone3
          end        end --(10) regular layer        kwkBindex = ui.newButton{            defaultSrc= imgDir .."kwkBindex.png",            defaultX = 66,            defaultY = 69,            overSrc= imgDir .."kwkBindex.png",            overX = 66,            overY = 69,            onRelease=onkwkBindexTouch,            id="kwkBindexButton"        }        kwkBindex.x = 383; kwkBindex.y = 969; kwkBindex.alpha = 1; kwkBindex.oldAlpha = 1        menuGroup:insert(kwkBindex)        menuGroup.kwkBindex = kwkBindex        local onkwkBbackTouch = function(event) 
          if event.phase=="ended" then            local myClosure_switch = function()                 disposeAudios()
                disposeTweens() 
                print("GoBack!")
                _G.kwk_currentPage = _G.kwk_currentPage - 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromLeft" )             end             timerStash.newTimer_962 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBback = ui.newButton{            defaultSrc= imgDir .."kwkBback.png",            defaultX = 111,            defaultY = 88,            overSrc= imgDir .."kwkBback.png",            overX = 111,            overY = 88,            onRelease=onkwkBbackTouch,            id="kwkBbackButton"        }        kwkBback.x = 293; kwkBback.y = 973; kwkBback.alpha = 1; kwkBback.oldAlpha = 1        menuGroup:insert(kwkBback)        menuGroup.kwkBback = kwkBback        showhide.alpha = 0        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        CH7PG10:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(dentures_audio); dentures_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 