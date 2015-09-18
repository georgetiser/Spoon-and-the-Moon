-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local fish_audio = audio.loadSound(audioDir.."click.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.CachesDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    
local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.CachesDirectory ) 
local file = io.open( path, "w+" ) 
file:write( _G.kwk_currentPage ) 
io.close( file ) 

local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
        local showhide         local fish
local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p160_ch11pg2.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG 


        local onfishTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_170 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_170 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( fish_audio, {channel=myChannel} )              end           end        end --(10) regular layer        fish = ui.newButton{            defaultSrc=imageDir.."p160_fish.png",            defaultX = 611,            defaultY = 206,            overSrc=imageDir.."p160_fish.png",            overX = 611,            overY = 206,            onRelease=onfishTouch,            id="fishButton"        }        fish.x = 408; fish.y = 137; fish.alpha = 1; fish.oldAlpha = 1        menuGroup:insert(fish)        menuGroup.fish = fish --(2) regular layer        showhide = display.newImageRect( imageDir.. "p160_showhide.png", 537, 223 );        showhide.x = 330; showhide.y = 297; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide        showhide.alpha = 0 --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(fish_audio); fish_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 