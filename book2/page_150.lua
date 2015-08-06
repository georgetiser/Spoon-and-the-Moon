-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local sandwich_audio = audio.loadSound(audioDir.."click.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
        local showhide         local sandwich
local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p150_ch10pg6.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG 


        local onsandwichTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_548 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_548 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( sandwich_audio, {channel=myChannel} )              end           end        end --(10) regular layer        sandwich = ui.newButton{            defaultSrc=imageDir.."p150_sandwich.png",            defaultX = 455,            defaultY = 209,            overSrc=imageDir.."p150_sandwich.png",            overX = 455,            overY = 209,            onRelease=onsandwichTouch,            id="sandwichButton"        }        sandwich.x = 406; sandwich.y = 165; sandwich.alpha = 1; sandwich.oldAlpha = 1        menuGroup:insert(sandwich)        menuGroup.sandwich = sandwich --(2) regular layer        showhide = display.newImageRect( imageDir.. "p150_showhide.png", 527, 156 );        showhide.x = 446; showhide.y = 306; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide        showhide.alpha = 0 --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(sandwich_audio); sandwich_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 