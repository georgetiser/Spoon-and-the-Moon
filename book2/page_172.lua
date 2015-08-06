-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local salute_audio = audio.loadSound(audioDir.."salute.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local salute         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p172_ch11pg13.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onsaluteTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( salute_audio, {channel=myChannel} )              end           end        end --(10) regular layer        salute = ui.newButton{            defaultSrc=imageDir.."p172_salute.png",            defaultX = 453,            defaultY = 59,            overSrc=imageDir.."p172_salute.png",            overX = 453,            overY = 59,            onRelease=onsaluteTouch,            id="saluteButton"        }        salute.x = 328; salute.y = 746; salute.alpha = 1; salute.oldAlpha = 1        menuGroup:insert(salute)        menuGroup.salute = salute --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(salute_audio); salute_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 