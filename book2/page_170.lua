-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local tomb_audio = audio.loadSound(audioDir.."click.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.CachesDirectory ) 
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
        local showhide         local tomb
local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p170_ch11pg11.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG 


        local ontombTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_265 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_265 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( tomb_audio, {channel=myChannel} )              end           end        end --(10) regular layer        tomb = ui.newButton{            defaultSrc=imageDir.."p170_tomb.png",            defaultX = 159,            defaultY = 498,            overSrc=imageDir.."p170_tomb.png",            overX = 159,            overY = 498,            onRelease=ontombTouch,            id="tombButton"        }        tomb.x = 147; tomb.y = 570; tomb.alpha = 1; tomb.oldAlpha = 1        menuGroup:insert(tomb)        menuGroup.tomb = tomb --(2) regular layer        showhide = display.newImageRect( imageDir.. "p170_showhide.png", 342, 137 );        showhide.x = 349; showhide.y = 428; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide        showhide.alpha = 0 --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(tomb_audio); tomb_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 