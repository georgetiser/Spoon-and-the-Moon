-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local vnls_audio = audio.loadSound(audioDir.."v11b.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.CachesDirectory ) 
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


local vnls         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p187_ch12pg13.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onvnlsTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( vnls_audio, {channel=myChannel} )              end           end        end --(10) regular layer        vnls = ui.newButton{            defaultSrc=imageDir.."p187_vnls.png",            defaultX = 546,            defaultY = 57,            overSrc=imageDir.."p187_vnls.png",            overX = 546,            overY = 57,            onRelease=onvnlsTouch,            id="vnlsButton"        }        vnls.x = 382; vnls.y = 447; vnls.alpha = 1; vnls.oldAlpha = 1        menuGroup:insert(vnls)        menuGroup.vnls = vnls --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(vnls_audio); vnls_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 