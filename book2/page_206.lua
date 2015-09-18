-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local vlnsm_audio = audio.loadSound(audioDir.."v15.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.CachesDirectory ) 
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
        local chpt1pv         local chpt1pvover
local vlnsm         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p206_ch14pg8.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onvlnsmTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( vlnsm_audio, {channel=myChannel} )              end           end        end --(10) regular layer        vlnsm = ui.newButton{            defaultSrc=imageDir.."p206_vlnsm.png",            defaultX = 298,            defaultY = 25,            overSrc=imageDir.."p206_vlnsm.png",            overX = 298,            overY = 25,            onRelease=onvlnsmTouch,            id="vlnsmButton"        }        vlnsm.x = 362; vlnsm.y = 309; vlnsm.alpha = 1; vlnsm.oldAlpha = 1        menuGroup:insert(vlnsm)        menuGroup.vlnsm = vlnsm 


        local onchpt1pvTouch = function(event)           if event.phase=="ended" then           media.playVideo( "movie_bluejay.mp4", system.ResourceDirectory, false )           end        end --(10) regular layer        chpt1pv = ui.newButton{            defaultSrc=imageDir.."p206_chpt1pv.png",            defaultX = 102,            defaultY = 102,            overSrc=imageDir.."p206_chpt1pvover.png",            overX = 102,            overY = 102,            onRelease=onchpt1pvTouch,            id="chpt1pvButton"        }        chpt1pv.x = 384; chpt1pv.y = 870; chpt1pv.alpha = 1; chpt1pv.oldAlpha = 1        menuGroup:insert(chpt1pv)        menuGroup.chpt1pv = chpt1pv --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(vlnsm_audio); vlnsm_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 