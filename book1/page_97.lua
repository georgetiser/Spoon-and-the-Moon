-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local growl_audio = audio.loadSound(audioDir .. "bgrowl.mp3", system.ResourceDirectory)      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       --local PageXCorner         local growl         local CH06PG9         CH06PG9 = display.newImageRect(imageDir .. "p96_ch06pg9.png", 768, 1024 );        CH06PG9.x = 384; CH06PG9.y = 512; CH06PG9.alpha = 1; CH06PG9.oldAlpha = 1        menuGroup:insert(CH06PG9)        menuGroup.CH06PG9 = CH06PG9        local ongrowlTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( growl_audio, {channel=myChannel} )              end           end        end        growl = ui.newButton{            defaultSrc= imageDir .."p96_growl.png",            defaultX = 316,            defaultY = 35,            overSrc= imageDir .."p96_growl.png",            overX = 316,            overY = 35,            onRelease=ongrowlTouch,            id="growlButton"        }        growl.x = 243; growl.y = 408; growl.alpha = 1; growl.oldAlpha = 1        menuGroup:insert(growl)        menuGroup.growl = growl --local PageZZCorner--local PageXXCorner
--XpaperXcornerX


--ForwardFunction--ForwardUI--PageNum Begin
--PlaceholderForPageCorner
--PageNumPlace
--PageNum End
--PlaceholderIndex --NA--PlaceholderFor       --BackPlace--PlaceholderFor              local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        CH06PG9:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(growl_audio); growl_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 