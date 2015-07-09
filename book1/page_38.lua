-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)     --local currPage = 15 
    print("----------------"); print(""); print("New Page") 
    print("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "book.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )     local drawScreen = function() 
		if _G.kwk_ShowDebugOutput then
				print("PageDisplay called.")
		end--if

       local bubble3         local bubble2         local bubble1         local kwkBback         local kwkBindex  
       local kwkPageCorner 
       local kwkBforward         --local PageXCorner         local BG  --(2) regular layer        BG = display.newImageRect(imgDir .. "p15_bg.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG 
--XPageXCornerX

       
--XPageXCornerX

       local onkwkBforwardTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens() 
                print("GoForward!")
                _G.kwk_currentPage = _G.kwk_currentPage + 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" )             end             timerStash.newTimer_060 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBforward = ui.newButton{            defaultSrc= imgDir .."kwkbforward.png",            defaultX = 111,            defaultY = 87,            overSrc= imgDir .."kwkbforward.png",            overX = 111,            overY = 87,            onRelease=onkwkBforwardTouch,            id="kwkBforwardButton"        }        kwkBforward.x = 475; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1        menuGroup:insert(kwkBforward)        menuGroup.kwkBforward = kwkBforward --PageNum Begin
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
                director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )             end             timerStash.newTimer_123 = timer.performWithDelay(0, myClosure_switch, 1)              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( kwkBindex_audio, {channel=myChannel} )              end           end        end --(10) regular layer        kwkBindex = ui.newButton{            defaultSrc= imgDir .."kwkbindex.png",            defaultX = 66,            defaultY = 69,            overSrc= imgDir .."kwkbindex.png",            overX = 66,            overY = 69,            onRelease=onkwkBindexTouch,            id="kwkBindexButton"        }        kwkBindex.x = 383; kwkBindex.y = 969; kwkBindex.alpha = 1; kwkBindex.oldAlpha = 1        menuGroup:insert(kwkBindex)        menuGroup.kwkBindex = kwkBindex        local onkwkBbackTouch = function(event) 
          if event.phase=="ended" then            local myClosure_switch = function()                 disposeAudios()                 disposeTweens() 
                print("GoBack!")
                _G.kwk_currentPage = _G.kwk_currentPage - 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromLeft" )             end             timerStash.newTimer_170 = timer.performWithDelay(0, myClosure_switch, 1)           end        end --(10) regular layer        kwkBback = ui.newButton{            defaultSrc= imgDir .."kwkbback.png",            defaultX = 111,            defaultY = 88,            overSrc= imgDir .."kwkbback.png",            overX = 111,            overY = 88,            onRelease=onkwkBbackTouch,            id="kwkBbackButton"        }        kwkBback.x = 293; kwkBback.y = 973; kwkBback.alpha = 1; kwkBback.oldAlpha = 1        menuGroup:insert(kwkBback)        menuGroup.kwkBback = kwkBback --(2) regular layer        bubble1 = display.newImageRect(imgDir .. "p15_bubble1.png", 164, 171 );        bubble1.x = 558; bubble1.y = 1395; bubble1.alpha = 1; bubble1.oldAlpha = 1        menuGroup:insert(bubble1)        menuGroup.bubble1 = bubble1 --(2) regular layer        bubble2 = display.newImageRect(imgDir .. "p15_bubble2.png", 48, 49 );        bubble2.x = 489; bubble2.y = 1318; bubble2.alpha = 1; bubble2.oldAlpha = 1        menuGroup:insert(bubble2)        menuGroup.bubble2 = bubble2 --(2) regular layer        bubble3 = display.newImageRect(imgDir .. "p15_bubble3.png", 102, 107 );        bubble3.x = 78; bubble3.y = 1347; bubble3.alpha = 1; bubble3.oldAlpha = 1        menuGroup:insert(bubble3)        menuGroup.bubble3 = bubble3        local onEndbubble2_355 = function()            bubble2.isVisible = false;            bubble2.x = 489; bubble2.y = 1318;            bubble2.xScale = 1;bubble2.yScale = 1;            bubble2.alpha = 1; bubble2.rotation = 0            bubble2.isVisible = true;         end        --1 --1        gtStash.gt_bubble2_355= gtween.new( bubble2, 12, { x = 489, y = -276, rotation = 0, xScale = 1, yScale = 1, alpha=1}, {ease = gtween.easing.linear, repeatCount = math.huge, reflect = false,  delay=4, onComplete = onEndbubble2_355 })        local onEndbubble1_368 = function()            bubble1.isVisible = false;            bubble1.x = 558; bubble1.y = 1395;            bubble1.xScale = 1;bubble1.yScale = 1;            bubble1.alpha = 1; bubble1.rotation = 0            bubble1.isVisible = true;         end        --1 --1        gtStash.gt_bubble1_368= gtween.new( bubble1, 12, { x = 558, y = -215, rotation = 0, xScale = 1, yScale = 1, alpha=1}, {ease = gtween.easing.linear, repeatCount = math.huge, reflect = false,  delay=5, onComplete = onEndbubble1_368 })        local onEndbubble3_380 = function()            bubble3.isVisible = false;            bubble3.x = 78; bubble3.y = 1347;            bubble3.xScale = 1;bubble3.yScale = 1;            bubble3.alpha = 1; bubble3.rotation = 0            bubble3.isVisible = true;         end        --1 --1        gtStash.gt_bubble3_380= gtween.new( bubble3, 11, { x = 78, y = -247, rotation = 0, xScale = 1, yScale = 1, alpha=1}, {ease = gtween.easing.linear, repeatCount = math.huge, reflect = false,  delay=7, onComplete = onEndbubble3_380 })        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        BG:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 