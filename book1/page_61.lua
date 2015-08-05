-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local lady_audio = audio.loadSound(audioDir .. "click.mp3", system.ResourceDirectory)      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       local showhide         local lady         --local PageXCorner         local CH04PG1         CH04PG1 = display.newImageRect(imageDir .. "p60_ch04pg1.png", 768, 1024 );        CH04PG1.x = 384; CH04PG1.y = 512; CH04PG1.alpha = 1; CH04PG1.oldAlpha = 1        menuGroup:insert(CH04PG1)        menuGroup.CH04PG1 = CH04PG1 
--XPageXCornerX


--XpaperXcornerX


       local onladyTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_058 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_058 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( lady_audio, {channel=myChannel} )              end           end        end        lady = ui.newButton{            defaultSrc= imageDir .."p60_lady.png",            defaultX = 202,            defaultY = 276,            overSrc= imageDir .."p60_lady.png",            overX = 202,            overY = 276,            onRelease=onladyTouch,            id="ladyButton"        }        lady.x = 623; lady.y = 239; lady.alpha = 1; lady.oldAlpha = 1        menuGroup:insert(lady)        menuGroup.lady = lady        showhide = display.newImageRect(imageDir .. "p60_showhide.png", 349, 295 );        showhide.x = 384; showhide.y = 142; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide --ForwardFunction--ForwardUI--PageNum Begin
--PlaceholderForPageCorner
--PageNumPlace
--PageNum End
--PlaceholderIndex --NA--PlaceholderFor       --BackPlace--PlaceholderFor              showhide.alpha = 0        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        CH04PG1:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(lady_audio); lady_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 