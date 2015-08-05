-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local elsa_audio = audio.loadSound(audioDir .. "click.mp3", system.ResourceDirectory)      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)      statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page")     statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage)     local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       local showhide         local elsa         --local PageXCorner         local crnrtxt         local CH05PG1         CH05PG1 = display.newImageRect(imageDir .. "p70_ch05pg1.png", 768, 1024 );        CH05PG1.x = 384; CH05PG1.y = 512; CH05PG1.alpha = 1; CH05PG1.oldAlpha = 1        menuGroup:insert(CH05PG1)        menuGroup.CH05PG1 = CH05PG1 
--XPageXCornerX


--XpaperXcornerX


       local onelsaTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_631 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_631 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( elsa_audio, {channel=myChannel} )              end           end        end        elsa = ui.newButton{            defaultSrc= imageDir .."p70_elsa.png",            defaultX = 156,            defaultY = 590,            overSrc= imageDir .."p70_elsa.png",            overX = 156,            overY = 590,            onRelease=onelsaTouch,            id="elsaButton"        }        elsa.x = 91; elsa.y = 407; elsa.alpha = 1; elsa.oldAlpha = 1        menuGroup:insert(elsa)        menuGroup.elsa = elsa        showhide = display.newImageRect(imageDir .. "p70_showhide.png", 405, 311 );        showhide.x = 364; showhide.y = 173; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide --ForwardFunction--ForwardUI--PageNum Begin
--PlaceholderForPageCorner
--PageNumPlace
--PageNum End
--PlaceholderIndex --NA--PlaceholderFor       --BackPlace--PlaceholderFor              showhide.alpha = 0        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        CH05PG1:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(elsa_audio); elsa_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 