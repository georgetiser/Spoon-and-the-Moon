-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local sun_audio = audio.loadSound(audioDir.."click.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.CachesDirectory ) 
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
        local showhide         local sun
local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p204_ch14pg6.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG 


        local onsunTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_522 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_522 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( sun_audio, {channel=myChannel} )              end           end        end --(10) regular layer        sun = ui.newButton{            defaultSrc=imageDir.."p204_sun.png",            defaultX = 191,            defaultY = 473,            overSrc=imageDir.."p204_sun.png",            overX = 191,            overY = 473,            onRelease=onsunTouch,            id="sunButton"        }        sun.x = 95; sun.y = 504; sun.alpha = 1; sun.oldAlpha = 1        menuGroup:insert(sun)        menuGroup.sun = sun --(2) regular layer        showhide = display.newImageRect( imageDir.. "p204_showhide.png", 412, 286 );        showhide.x = 354; showhide.y = 472; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide        showhide.alpha = 0 --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(sun_audio); sun_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 