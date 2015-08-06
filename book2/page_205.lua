-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local bluejays_audio = audio.loadSound(audioDir.."click.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
        local showhide         local bluejays
local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p205_ch14pg7.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG 


        local onbluejaysTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_144 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_144 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( bluejays_audio, {channel=myChannel} )              end           end        end --(10) regular layer        bluejays = ui.newButton{            defaultSrc=imageDir.."p205_bluejays.png",            defaultX = 506,            defaultY = 160,            overSrc=imageDir.."p205_bluejays.png",            overX = 506,            overY = 160,            onRelease=onbluejaysTouch,            id="bluejaysButton"        }        bluejays.x = 428; bluejays.y = 110; bluejays.alpha = 1; bluejays.oldAlpha = 1        menuGroup:insert(bluejays)        menuGroup.bluejays = bluejays --(2) regular layer        showhide = display.newImageRect( imageDir.. "p205_showhide.png", 559, 175 );        showhide.x = 381; showhide.y = 233; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide        showhide.alpha = 0 --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(bluejays_audio); bluejays_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 