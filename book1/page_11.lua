-- Code created by Kwik - Copyright: kwiksher.com -- Version: 2.4.6 module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local tablesaw_audio = audio.loadSound(audioDir .. "saw.mp3", system.ResourceDirectory)      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)      statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page")     statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage)     local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()
navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       --local PageXCorner         local tablesaw         local CH02PG8         CH02PG8 = display.newImageRect(imageDir .. "p32_ch02pg8.png", 768, 1024 );        CH02PG8.x = 384; CH02PG8.y = 512; CH02PG8.alpha = 1; CH02PG8.oldAlpha = 1        menuGroup:insert(CH02PG8)        menuGroup.CH02PG8 = CH02PG8        local ontablesawTouch = function(event)           if event.phase=="ended" then  --4             if gtStash.gt_tablesaw_563 then                gtStash.gt_tablesaw_563:toBeginning()             end             gtStash.gt_tablesaw_563= gtween.new( tablesaw, 3, { x = 384, y = 234, rotation = -360, xScale = 1, yScale = 1, alpha=1}, {ease = gtween.easing.linear, repeatCount = 1, reflect = false,  delay=0})              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( tablesaw_audio, {channel=myChannel} )              end           end        end        tablesaw = ui.newButton{            defaultSrc= imageDir .."p32_tablesaw.png",            defaultX = 458,            defaultY = 461,            overSrc= imageDir .."p32_tablesaw.png",            overX = 458,            overY = 461,            onRelease=ontablesawTouch,            id="tablesawButton"        }        tablesaw.x = 384; tablesaw.y = 234; tablesaw.alpha = 1; tablesaw.oldAlpha = 1        menuGroup:insert(tablesaw)        menuGroup.tablesaw = tablesaw --ForwardFunction--ForwardUI--PageNum Begin--PlaceholderForPageCorner--PageNumPlace--PageNum End--PlaceholderIndex --PlaceholderFor       --local PageZZCorner--local PageXXCorner--XpaperXcornerX--BackPlace--PlaceholderFor              local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                    disposeTweens()                     director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()                    disposeTweens()                     director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        CH02PG8:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(tablesaw_audio); tablesaw_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 