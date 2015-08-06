-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local scary_audio = audio.loadSound(audioDir.."scarytrack4.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local scary         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p164_ch11pg6.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onscaryTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( scary_audio, {channel=myChannel} )              end           end        end --(10) regular layer        scary = ui.newButton{            defaultSrc=imageDir.."p164_scary.png",            defaultX = 127,            defaultY = 117,            overSrc=imageDir.."p164_scary.png",            overX = 127,            overY = 117,            onRelease=onscaryTouch,            id="scaryButton"        }        scary.x = 518; scary.y = 229; scary.alpha = 1; scary.oldAlpha = 1        menuGroup:insert(scary)        menuGroup.scary = scary --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(scary_audio); scary_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 