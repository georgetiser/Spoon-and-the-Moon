-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local bottle_audio = audio.loadSound(audioDir .. "mouthpop2.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local bottle         local BG         BG = display.newImageRect(imageDir .. "p62_ch04pg3.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onbottleTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( bottle_audio, {channel=myChannel} )              end           end        end        bottle = ui.newButton{            defaultSrc= imageDir .."p62_bottle.png",            defaultX = 266,            defaultY = 596,            overSrc= imageDir .."p62_bottle.png",            overX = 266,            overY = 596,            onRelease=onbottleTouch,            id="bottleButton"        }        bottle.x = 571; bottle.y = 516; bottle.alpha = 1; bottle.oldAlpha = 1        menuGroup:insert(bottle)        menuGroup.bottle = bottle
	end
   drawScreen()    return menuGroup end 