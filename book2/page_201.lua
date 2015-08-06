-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local vlsn_audio = audio.loadSound(audioDir.."v26.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local vlsn         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p201_ch14pg3.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onvlsnTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( vlsn_audio, {channel=myChannel} )              end           end        end --(10) regular layer        vlsn = ui.newButton{            defaultSrc=imageDir.."p201_vlsn.png",            defaultX = 563,            defaultY = 56,            overSrc=imageDir.."p201_vlsn.png",            overX = 563,            overY = 56,            onRelease=onvlsnTouch,            id="vlsnButton"        }        vlsn.x = 380; vlsn.y = 774; vlsn.alpha = 1; vlsn.oldAlpha = 1        menuGroup:insert(vlsn)        menuGroup.vlsn = vlsn --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(vlsn_audio); vlsn_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 