-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local wings_audio = audio.loadSound(audioDir.."wings.mp3" )     local catfish_audio = audio.loadSound(audioDir.."click.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.CachesDirectory ) 
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


local showhide         local catfish         local wings         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p173_ch11pg14.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onwingsTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( wings_audio, {channel=myChannel} )              end           end        end --(10) regular layer        wings = ui.newButton{            defaultSrc=imageDir.."p173_wings.png",            defaultX = 434,            defaultY = 54,            overSrc=imageDir.."p173_wings.png",            overX = 434,            overY = 54,            onRelease=onwingsTouch,            id="wingsButton"        }        wings.x = 321; wings.y = 678; wings.alpha = 1; wings.oldAlpha = 1        menuGroup:insert(wings)        menuGroup.wings = wings        local oncatfishTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_279 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_279 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 3              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( catfish_audio, {channel=myChannel} )              end           end        end --(10) regular layer        catfish = ui.newButton{            defaultSrc=imageDir.."p173_catfish.png",            defaultX = 615,            defaultY = 192,            overSrc=imageDir.."p173_catfish.png",            overX = 615,            overY = 192,            onRelease=oncatfishTouch,            id="catfishButton"        }        catfish.x = 400; catfish.y = 128; catfish.alpha = 1; catfish.oldAlpha = 1        menuGroup:insert(catfish)        menuGroup.catfish = catfish --(2) regular layer        showhide = display.newImageRect( imageDir.. "p173_showhide.png", 513, 177 );        showhide.x = 318; showhide.y = 264; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide        showhide.alpha = 0 --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(wings_audio); wings_audio = nil                           audio.stop(3); audio.dispose(catfish_audio); catfish_audio = nil                           audio.stop(4); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 