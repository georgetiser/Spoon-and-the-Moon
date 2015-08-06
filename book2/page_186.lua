-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local vlns_audio = audio.loadSound(audioDir.."v22.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local vlns         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p186_ch12pg12.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onvlnsTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( vlns_audio, {channel=myChannel} )              end           end        end --(10) regular layer        vlns = ui.newButton{            defaultSrc=imageDir.."p186_vlns.png",            defaultX = 430,            defaultY = 28,            overSrc=imageDir.."p186_vlns.png",            overX = 430,            overY = 28,            onRelease=onvlnsTouch,            id="vlnsButton"        }        vlns.x = 348; vlns.y = 577; vlns.alpha = 1; vlns.oldAlpha = 1        menuGroup:insert(vlns)        menuGroup.vlns = vlns --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(vlns_audio); vlns_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 