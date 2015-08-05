-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local elsa_audio = audio.loadSound(audioDir .. "click.mp3", system.ResourceDirectory)      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       --local PageXCorner         local showhhide         local elsa         local CH7PG7         CH7PG7 = display.newImageRect(imageDir .. "p105_ch7pg7.png", 768, 1024 );        CH7PG7.x = 384; CH7PG7.y = 512; CH7PG7.alpha = 1; CH7PG7.oldAlpha = 1        menuGroup:insert(CH7PG7)        menuGroup.CH7PG7 = CH7PG7        local onelsaTouch = function(event)           if event.phase=="ended" then                  if showhhide.alpha == 0 then                    transitionStash.newTransition_208 = transition.to( showhhide, {alpha=showhhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_208 = transition.to( showhhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( elsa_audio, {channel=myChannel} )              end           end        end        elsa = ui.newButton{            defaultSrc= imageDir .."p105_elsa.png",            defaultX = 211,            defaultY = 438,            overSrc= imageDir .."p105_elsa.png",            overX = 211,            overY = 438,            onRelease=onelsaTouch,            id="elsaButton"        }        elsa.x = 621; elsa.y = 650; elsa.alpha = 1; elsa.oldAlpha = 1        menuGroup:insert(elsa)        menuGroup.elsa = elsa        showhhide = display.newImageRect(imageDir .. "p105_showhhide.png", 385, 196 );        showhhide.x = 358; showhhide.y = 419; showhhide.alpha = 1; showhhide.oldAlpha = 1        menuGroup:insert(showhhide)        menuGroup.showhhide = showhhide --local PageZZCorner--local PageXXCorner
--XpaperXcornerX


--ForwardFunction--ForwardUI--PageNum Begin
--PlaceholderForPageCorner
--PageNumPlace
--PageNum End
--PlaceholderIndex --NA--PlaceholderFor       --BackPlace--PlaceholderFor              showhhide.alpha = 0        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        CH7PG7:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(elsa_audio); elsa_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 