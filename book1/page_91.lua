-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local atch_audio = audio.loadSound(audioDir .. "match.mp3", system.ResourceDirectory)      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       --local PageXCorner         local showhide         local atch         local CH06PG3         CH06PG3 = display.newImageRect(imageDir .. "p90_ch06pg3.png", 768, 1024 );        CH06PG3.x = 384; CH06PG3.y = 512; CH06PG3.alpha = 1; CH06PG3.oldAlpha = 1        menuGroup:insert(CH06PG3)        menuGroup.CH06PG3 = CH06PG3        local onatchTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( atch_audio, {channel=myChannel} )              end                 if showhide.alpha == 0 then                    transitionStash.newTransition_321 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_321 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end           end        end        atch = ui.newButton{            defaultSrc= imageDir .."p90_atch.png",            defaultX = 308,            defaultY = 428,            overSrc= imageDir .."p90_atch.png",            overX = 308,            overY = 428,            onRelease=onatchTouch,            id="atchButton"        }        atch.x = 219; atch.y = 290; atch.alpha = 1; atch.oldAlpha = 1        menuGroup:insert(atch)        menuGroup.atch = atch        showhide = display.newImageRect(imageDir .. "p90_showhide.png", 412, 292 );        showhide.x = 557; showhide.y = 246; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide --local PageZZCorner--local PageXXCorner
--XpaperXcornerX


--ForwardFunction--ForwardUI--PageNum Begin
--PlaceholderForPageCorner
--PageNumPlace
--PageNum End
--PlaceholderIndex --NA--PlaceholderFor       --BackPlace--PlaceholderFor              showhide.alpha = 0        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        CH06PG3:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(atch_audio); atch_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 