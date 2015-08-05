-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local vlin_audio = audio.loadSound(audioDir .. "v27.mp3", system.ResourceDirectory)      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       local vlin         --local PageXCorner         local CH7PG3         CH7PG3 = display.newImageRect(imageDir .. "p101_ch7pg3.png", 768, 1024 );        CH7PG3.x = 384; CH7PG3.y = 512; CH7PG3.alpha = 1; CH7PG3.oldAlpha = 1        menuGroup:insert(CH7PG3)        menuGroup.CH7PG3 = CH7PG3 
--XPageXCornerX


--XpaperXcornerX


       local onvlinTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( vlin_audio, {channel=myChannel} )              end           end        end        vlin = ui.newButton{            defaultSrc= imageDir .."p101_vlin.png",            defaultX = 438,            defaultY = 35,            overSrc= imageDir .."p101_vlin.png",            overX = 438,            overY = 35,            onRelease=onvlinTouch,            id="vlinButton"        }        vlin.x = 349; vlin.y = 433; vlin.alpha = 1; vlin.oldAlpha = 1        menuGroup:insert(vlin)        menuGroup.vlin = vlin --ForwardFunction--ForwardUI--PageNum Begin
--PlaceholderForPageCorner
--PageNumPlace
--PageNum End
--PlaceholderIndex --NA--PlaceholderFor       --BackPlace--PlaceholderFor              local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        CH7PG3:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(vlin_audio); vlin_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 