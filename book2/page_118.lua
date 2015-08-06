-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local stomach_audio = audio.loadSound(audioDir.."pigeating.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local stomach         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p118_ch8pg4.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onstomachTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( stomach_audio, {channel=myChannel} )              end           end        end --(10) regular layer        stomach = ui.newButton{            defaultSrc=imageDir.."p118_stomach.png",            defaultX = 228,            defaultY = 237,            overSrc=imageDir.."p118_stomach.png",            overX = 228,            overY = 237,            onRelease=onstomachTouch,            id="stomachButton"        }        stomach.x = 167; stomach.y = 769; stomach.alpha = 1; stomach.oldAlpha = 1        menuGroup:insert(stomach)        menuGroup.stomach = stomach --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(stomach_audio); stomach_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 