-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local baby_audio = audio.loadSound(audioDir.."click.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
        local shhowhide         local baby
local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p199_ch14pg1.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG 


        local onbabyTouch = function(event)           if event.phase=="ended" then                  if shhowhide.alpha == 0 then                    transitionStash.newTransition_982 = transition.to( shhowhide, {alpha=shhowhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_982 = transition.to( shhowhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( baby_audio, {channel=myChannel} )              end           end        end --(10) regular layer        baby = ui.newButton{            defaultSrc=imageDir.."p199_baby.png",            defaultX = 147,            defaultY = 196,            overSrc=imageDir.."p199_baby.png",            overX = 147,            overY = 196,            onRelease=onbabyTouch,            id="babyButton"        }        baby.x = 685; baby.y = 770; baby.alpha = 1; baby.oldAlpha = 1        menuGroup:insert(baby)        menuGroup.baby = baby --(2) regular layer        shhowhide = display.newImageRect( imageDir.. "p199_shhowhide.png", 395, 203 );        shhowhide.x = 473; shhowhide.y = 733; shhowhide.alpha = 1; shhowhide.oldAlpha = 1        menuGroup:insert(shhowhide)        menuGroup.shhowhide = shhowhide        shhowhide.alpha = 0 --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(baby_audio); baby_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 