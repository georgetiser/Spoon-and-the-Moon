-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local fart_audio = audio.loadSound(audioDir.."fartss.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local fart         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p122_ch8pg8.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onfartTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( fart_audio, {channel=myChannel} )              end           end        end --(10) regular layer        fart = ui.newButton{            defaultSrc=imageDir.."p122_fart.png",            defaultX = 159,            defaultY = 30,            overSrc=imageDir.."p122_fart.png",            overX = 159,            overY = 30,            onRelease=onfartTouch,            id="fartButton"        }        fart.x = 504; fart.y = 300; fart.alpha = 1; fart.oldAlpha = 1        menuGroup:insert(fart)        menuGroup.fart = fart --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(fart_audio); fart_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 