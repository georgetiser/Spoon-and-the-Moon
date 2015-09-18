-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local maggot_audio = audio.loadSound(audioDir.."slimy.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.CachesDirectory ) 
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


local showhide         local maggot         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p175_ch12pg1.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onmaggotTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( maggot_audio, {channel=myChannel} )              end                 if showhide.alpha == 0 then                    transitionStash.newTransition_025 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_025 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end           end        end --(10) regular layer        maggot = ui.newButton{            defaultSrc=imageDir.."p175_maggot.png",            defaultX = 137,            defaultY = 147,            overSrc=imageDir.."p175_maggot.png",            overX = 137,            overY = 147,            onRelease=onmaggotTouch,            id="maggotButton"        }        maggot.x = 156; maggot.y = 220; maggot.alpha = 1; maggot.oldAlpha = 1        menuGroup:insert(maggot)        menuGroup.maggot = maggot --(2) regular layer        showhide = display.newImageRect( imageDir.. "p175_showhide.png", 412, 203 );        showhide.x = 404; showhide.y = 244; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide        showhide.alpha = 0 --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(maggot_audio); maggot_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 