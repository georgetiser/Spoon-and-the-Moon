-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local scfeam_audio = audio.loadSound(audioDir.."scream.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.CachesDirectory ) 
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


local scfeam         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p138_ch9pg11.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onscfeamTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( scfeam_audio, {channel=myChannel} )              end           end        end --(10) regular layer        scfeam = ui.newButton{            defaultSrc=imageDir.."p138_scfeam.png",            defaultX = 266,            defaultY = 281,            overSrc=imageDir.."p138_scfeam.png",            overX = 266,            overY = 281,            onRelease=onscfeamTouch,            id="scfeamButton"        }        scfeam.x = 602; scfeam.y = 737; scfeam.alpha = 1; scfeam.oldAlpha = 1        menuGroup:insert(scfeam)        menuGroup.scfeam = scfeam --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(scfeam_audio); scfeam_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 