-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local numPages = 330     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local curPage = 2     local path = system.pathForFile( "book.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( curPage )     io.close( file )     local drawScreen = function()        local staranima1         local kwkBforward         local layer08126  --(2) regular layer        print("abc")       layer08126 = display.newImageRect( imageDir.. "p1_bg.png", 768, 1024 );        layer08126.x = 369; layer08126.y = 512; layer08126.alpha = 1; layer08126.oldAlpha = 1        menuGroup:insert(layer08126)        menuGroup.layer08126 = layer08126       print("def")       local onkwkBforwardTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeTweens()                 director:changeScene( "page_3", "moveFromRight" )             end             timerStash.newTimer_106 = timer.performWithDelay(0, myClosure_switch, 1)          media.playVideo( "movie_part1_introLnS.mp4", system.ResourceDirectory, false )           end        end       print("ghi")       kwkBforward = uii.nuButton{            defaultSrc=imageDir.."kwkBforward.png",            defaultX = 111,            defaultY = 87,            overSrc=imageDir.."kwkBforward.png",            overX = 111,            overY = 87,            onRelease=onkwkBforwardTouch,            id="kwkBforwardButton"        }       print("jkl")       kwkBforward.x = 475; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1        menuGroup:insert(kwkBforward)        menuGroup.kwkBforward = kwkBforward       print("mno")--(2) regular layer        staranima1 = display.newImageRect( imageDir.. "p2_staranima1.png", 16, 16 );        staranima1.x = -12; staranima1.y = 101; staranima1.alpha = 1; staranima1.oldAlpha = 1        menuGroup:insert(staranima1)        menuGroup.staranima1 = staranima1        --2        gtStash.gt_staranima1_444= gtween.new( staranima1, 2.5, { x = 871, y = 618, rotation = 0, xScale = 1, yScale = 1, alpha=1}, {ease = gtween.easing.linear, repeatCount = 1, reflect = false,  delay=2})          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (curPage > 1) then                      disposeTweens()                     director:changeScene( "page_"..curPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (curPage < numPages) then                      disposeTweens()                     director:changeScene("page_"..curPage+1, "moveFromRight")                 end              end           end        end        layer08126:addEventListener("touch", flip)    end    drawScreen()    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 