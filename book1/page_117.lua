-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)     print("----------------"); print(""); print("New Page")     print("The current page is: " .. _G.kwk_currentPage)     local path = system.pathForFile( "book.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()    --DEBUGTEXT    if _G.kwk_ShowDebugOutput then      print("PageDisplay called.")      devtxt1 = display.newText(_G.kwk_DebugText1_t, _G.kwk_DebugText1_x, _G.kwk_DebugText1_y, _G.kwk_DebugText1_w, _G.kwk_DebugText1_h, _G.kwk_DebugText1_f, _G.kwk_DebugText1_s); devtxt1:setFillColor(_G.kwk_DebugText1_cr,_G.kwk_DebugText1_cg,_G.kwk_DebugText1_cb); devtxt1.alpha = 1      devtxt2 = display.newText(_G.kwk_DebugText2_t, _G.kwk_DebugText2_x, _G.kwk_DebugText2_y, _G.kwk_DebugText2_w, _G.kwk_DebugText2_h, _G.kwk_DebugText2_f, _G.kwk_DebugText2_s); devtxt2:setFillColor(_G.kwk_DebugText2_cr,_G.kwk_DebugText2_cg,_G.kwk_DebugText2_cb); devtxt2.alpha = 1      devtxt3 = display.newText(_G.kwk_DebugText3_t, _G.kwk_DebugText3_x, _G.kwk_DebugText3_y, _G.kwk_DebugText3_w, _G.kwk_DebugText3_h, _G.kwk_DebugText3_f, _G.kwk_DebugText3_s); devtxt3:setFillColor(_G.kwk_DebugText3_cr,_G.kwk_DebugText3_cg,_G.kwk_DebugText3_cb); devtxt3.alpha = 1    end--if    --DEBUGTEXTEND       local kwkBback         local kwkBindex         local kwkPageCorner        local BG       local goToGooglePlay         local goToCredits  --(2) regular layer        BG = display.newImageRect(imgDir .. "Book1_PreviewPart2_Page3.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG --PageNum Begin       local onkwkPageCornerTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens()                 _G.kwk_currentPage = _G.kwk_menuPage                print("GoToMenu!")                director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )            end             timerStash.newTimer_518 = timer.performWithDelay(0, myClosure_switch, 1)           end        end        kwkPageCorner = ui.newButton{            defaultSrc= imgDir .."PageCornerGrey.png",            defaultX = 72,            defaultY = 80,            overSrc= imgDir .."PageCornerGrey.png",            overX = 72,            overY = 80,            onRelease=onkwkPageCornerTouch,            id="kwkPageCornerButton"        }        kwkPageCorner.x = 732; kwkPageCorner.y = 984; kwkPageCorner.alpha = 1; kwkPageCorner.oldAlpha = 1        menuGroup:insert(kwkPageCorner)        menuGroup.kwkPageCorner = kwkPageCorner --TEXTFORPAGENUMBEGINlocal crnrtxtoffset = 730; if _G.kwk_currentPage < 99 then crnrtxtoffset = 737 end; if _G.kwk_currentPage < 9 then crnrtxtoffset = 745 endcrnrtxt = display.newText("" .. _G.kwk_currentPage .. "", crnrtxtoffset, 995, "Arbutus Slab", 20); crnrtxt:setFillColor(0,0,0)--TEXTFORPAGENUMEND--PageNum End       local onkwkBindexTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens()                 _G.kwk_currentPage = _G.kwk_menuPage                print("GoToMenu!")                director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )             end             timerStash.newTimer_804 = timer.performWithDelay(0, myClosure_switch, 1)              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( kwkBindex_audio, {channel=myChannel} )              end           end        end --(10) regular layer        kwkBindex = ui.newButton{            defaultSrc= imgDir .."kwkBindex.png",            defaultX = 66,            defaultY = 69,            overSrc= imgDir .."kwkBindex.png",            overX = 66,            overY = 69,            onRelease=onkwkBindexTouch,            id="kwkBindexButton"        }        kwkBindex.x = 383; kwkBindex.y = 969; kwkBindex.alpha = 1; kwkBindex.oldAlpha = 1        menuGroup:insert(kwkBindex)        menuGroup.kwkBindex = kwkBindex        local onkwkBbackTouch = function(event)           if event.phase=="ended" then            local myClosure_switch = function()                 disposeAudios()                 disposeTweens()                 print("GoBack!")                _G.kwk_currentPage = _G.kwk_currentPage - 1                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromLeft" )             end             timerStash.newTimer_888 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBback = ui.newButton{            defaultSrc= imgDir .."kwkBback.png",            defaultX = 111,            defaultY = 88,            overSrc= imgDir .."kwkBback.png",            overX = 111,            overY = 88,            onRelease=onkwkBbackTouch,            id="kwkBbackButton"        }        kwkBback.x = 293; kwkBback.y = 973; kwkBback.alpha = 1; kwkBback.oldAlpha = 1        menuGroup:insert(kwkBback)        menuGroup.kwkBback = kwkBback        local ongoToGooglePlayTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeAudios()                 disposeTweens()                 print("Go Googleward!")                -- --                -- --                -- --                -- --                -- --                system.openURL("https://play.google.com/store/search?q=Spoon%20and%20the%20Moon")                _G.kwk_currentPage = 1                director:changeScene( "page_" .. _G.kwk_currentPage, "overFromTop" )                 -- --                -- --                -- --                -- --                -- --                -- --            end             timerStash.newTimer_168 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        goToGooglePlay = ui.newButton{            defaultSrc= imgDir .."blankbutton.png",            defaultX = 420,            defaultY = 125,            overSrc= imgDir .."blankbutton.png",            overX = 420,            overY = 125,            onRelease=ongoToGooglePlayTouch,            id="goToGooglePlayButton"        }        goToGooglePlay.x = 276; goToGooglePlay.y = 740;       goToGooglePlay.alpha = 0.1; goToGooglePlay.oldAlpha = 0.5        menuGroup:insert(goToGooglePlay)        menuGroup.goToGooglePlay = goToGooglePlay        local ongoToCreditsTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeAudios()                 disposeTweens()                 print("Go To Credits!")                _G.kwk_currentPage = _G.kwk_creditsPage                director:changeScene( "page_" .. _G.kwk_currentPage, "overFromBottom" )             end             timerStash.newTimer_1168 = timer.performWithDelay(0, myClosure_switch, 1)           end        end        goToCredits = ui.newButton{            defaultSrc= imgDir .."creditsbutton.png",            defaultX = 125,            defaultY = 40,            overSrc= imgDir .."creditsbutton.png",            overX = 125,            overY = 40,            onRelease=ongoToCreditsTouch,            id="goToCreditsButton"        }        goToCredits.x = 600; goToCredits.y = 800;       goToCredits.alpha = 1; goToCredits.oldAlpha = 1       menuGroup:insert(goToCredits)        menuGroup.goToCredits = goToCredits        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        BG:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 