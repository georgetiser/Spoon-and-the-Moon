-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local flap_audio = audio.loadSound(audioDir.."flap.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.CachesDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    
local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.CachesDirectory ) 
local file = io.open( path, "w+" ) 
file:write( _G.kwk_currentPage ) 
io.close( file ) 

local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local showhide         local flap         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p116_ch8pg2.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onflapTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( flap_audio, {channel=myChannel} )              end                 if showhide.alpha == 0 then                    transitionStash.newTransition_988 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_988 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end           end        end --(10) regular layer        flap = ui.newButton{            defaultSrc=imageDir.."p116_flap.png",            defaultX = 442,            defaultY = 277,            overSrc=imageDir.."p116_flap.png",            overX = 442,            overY = 277,            onRelease=onflapTouch,            id="flapButton"        }        flap.x = 390; flap.y = 759; flap.alpha = 1; flap.oldAlpha = 1        menuGroup:insert(flap)        menuGroup.flap = flap --(2) regular layer        showhide = display.newImageRect( imageDir.. "p116_showhide.png", 432, 338 );        showhide.x = 253; showhide.y = 440; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide        showhide.alpha = 0 --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(flap_audio); flap_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 