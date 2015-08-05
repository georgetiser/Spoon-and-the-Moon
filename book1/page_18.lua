-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local thunder_audio = audio.loadSound(audioDir .. "bolt.mp3", system.ResourceDirectory)      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       --local PageXCorner         local thunder         local chpt2intropage         chpt2intropage = display.newImageRect(imageDir .. "p39_chpt2intropage.png", 768, 1024 );        chpt2intropage.x = 384; chpt2intropage.y = 512; chpt2intropage.alpha = 1; chpt2intropage.oldAlpha = 1        menuGroup:insert(chpt2intropage)        menuGroup.chpt2intropage = chpt2intropage        local onthunderTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( thunder_audio, {channel=myChannel} )              end           end        end        thunder = ui.newButton{            defaultSrc= imageDir .."p39_thunder.png",            defaultX = 373,            defaultY = 393,            overSrc= imageDir .."p39_thunder.png",            overX = 373,            overY = 393,            onRelease=onthunderTouch,            id="thunderButton"        }        thunder.x = 249; thunder.y = 308; thunder.alpha = 1; thunder.oldAlpha = 1        menuGroup:insert(thunder)        menuGroup.thunder = thunder --local PageZZCorner--local PageXXCorner
--XpaperXcornerX


--ForwardFunction--ForwardUI--PageNum Begin
--PlaceholderForPageCorner
--PageNumPlace
--PageNum End
--PlaceholderIndex --PlaceholderFor       --BackPlace--PlaceholderFor              local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        chpt2intropage:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(thunder_audio); thunder_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 