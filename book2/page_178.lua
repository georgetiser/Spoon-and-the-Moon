-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local vln_audio = audio.loadSound(audioDir.."v19.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.CachesDirectory ) 
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


local vln         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p178_ch12pg4.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onvlnTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( vln_audio, {channel=myChannel} )              end           end        end --(10) regular layer        vln = ui.newButton{            defaultSrc=imageDir.."p178_vln.png",            defaultX = 205,            defaultY = 294,            overSrc=imageDir.."p178_vln.png",            overX = 205,            overY = 294,            onRelease=onvlnTouch,            id="vlnButton"        }        vln.x = 139; vln.y = 256; vln.alpha = 1; vln.oldAlpha = 1        menuGroup:insert(vln)        menuGroup.vln = vln --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(vln_audio); vln_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 