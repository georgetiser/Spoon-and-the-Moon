-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local jig_audio = audio.loadSound(audioDir.."v5.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local jig         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p203_ch14pg5.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onjigTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( jig_audio, {channel=myChannel} )              end           end        end --(10) regular layer        jig = ui.newButton{            defaultSrc=imageDir.."p203_jig.png",            defaultX = 357,            defaultY = 33,            overSrc=imageDir.."p203_jig.png",            overX = 357,            overY = 33,            onRelease=onjigTouch,            id="jigButton"        }        jig.x = 346; jig.y = 417; jig.alpha = 1; jig.oldAlpha = 1        menuGroup:insert(jig)        menuGroup.jig = jig --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(jig_audio); jig_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 