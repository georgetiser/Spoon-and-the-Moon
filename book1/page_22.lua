-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local blue_audio = audio.loadSound(audioDir .. "click.mp3", system.ResourceDirectory)      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       local showhide         local blue         --local PageXCorner         local CH02PG19         CH02PG19 = display.newImageRect(imageDir .. "p43_ch02pg19.png", 768, 1024 );        CH02PG19.x = 384; CH02PG19.y = 512; CH02PG19.alpha = 1; CH02PG19.oldAlpha = 1        menuGroup:insert(CH02PG19)        menuGroup.CH02PG19 = CH02PG19 
--XPageXCornerX


--XpaperXcornerX


       local onblueTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_533 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_533 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( blue_audio, {channel=myChannel} )              end           end        end        blue = ui.newButton{            defaultSrc= imageDir .."p43_blue.png",            defaultX = 376,            defaultY = 250,            overSrc= imageDir .."p43_blue.png",            overX = 376,            overY = 250,            onRelease=onblueTouch,            id="blueButton"        }        blue.x = 271; blue.y = 742; blue.alpha = 1; blue.oldAlpha = 1        menuGroup:insert(blue)        menuGroup.blue = blue        showhide = display.newImageRect(imageDir .. "p43_showhide.png", 521, 346 );        showhide.x = 278; showhide.y = 472; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide --ForwardFunction--ForwardUI--PageNum Begin
--PlaceholderForPageCorner
--PageNumPlace
--PageNum End
--PlaceholderIndex --PlaceholderFor       --BackPlace--PlaceholderFor              showhide.alpha = 0        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        CH02PG19:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(blue_audio); blue_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 