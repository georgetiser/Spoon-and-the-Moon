-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local flap_audio = audio.loadSound(audioDir.."flap.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local showhide         local flap         local CH8PG2  --(2) regular layer        CH8PG2 = display.newImageRect( imageDir.. "p116_ch8pg2.png", 768, 1024 );        CH8PG2.x = 384; CH8PG2.y = 512; CH8PG2.alpha = 1; CH8PG2.oldAlpha = 1        menuGroup:insert(CH8PG2)        menuGroup.CH8PG2 = CH8PG2        local onflapTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( flap_audio, {channel=myChannel} )              end                 if showhide.alpha == 0 then                    transitionStash.newTransition_988 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_988 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end           end        end --(10) regular layer        flap = ui.newButton{            defaultSrc=imageDir.."p116_flap.png",            defaultX = 442,            defaultY = 277,            overSrc=imageDir.."p116_flap.png",            overX = 442,            overY = 277,            onRelease=onflapTouch,            id="flapButton"        }        flap.x = 390; flap.y = 759; flap.alpha = 1; flap.oldAlpha = 1        menuGroup:insert(flap)        menuGroup.flap = flap --(2) regular layer        showhide = display.newImageRect( imageDir.. "p116_showhide.png", 432, 338 );        showhide.x = 253; showhide.y = 440; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide        showhide.alpha = 0          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < numPages) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH8PG2:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(flap_audio); flap_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 