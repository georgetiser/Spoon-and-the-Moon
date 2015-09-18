-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local devil_audio = audio.loadSound(audioDir.."moo.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.CachesDirectory ) 
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


local showhide         local devil         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p132_ch9pg5.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local ondevilTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_026 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_026 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( devil_audio, {channel=myChannel} )              end           end        end --(10) regular layer        devil = ui.newButton{            defaultSrc=imageDir.."p132_devil.png",            defaultX = 258,            defaultY = 414,            overSrc=imageDir.."p132_devil.png",            overX = 258,            overY = 414,            onRelease=ondevilTouch,            id="devilButton"        }        devil.x = 602; devil.y = 687; devil.alpha = 1; devil.oldAlpha = 1        menuGroup:insert(devil)        menuGroup.devil = devil --(2) regular layer        showhide = display.newImageRect( imageDir.. "p132_showhide.png", 621, 376 );        showhide.x = 414; showhide.y = 263; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide        showhide.alpha = 0 --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(devil_audio); devil_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 