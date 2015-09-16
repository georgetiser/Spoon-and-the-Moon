-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local swoosh_audio = audio.loadSound(audioDir .. "sprinkler.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local swoosh         local BG         BG = display.newImageRect(imageDir .. "p100_ch7pg2.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onswooshTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( swoosh_audio, {channel=myChannel} )              end           end        end        swoosh = ui.newButton{            defaultSrc= imageDir .."p100_swoosh.png",            defaultX = 354,            defaultY = 59,            overSrc= imageDir .."p100_swoosh.png",            overX = 354,            overY = 59,            onRelease=onswooshTouch,            id="swooshButton"        }        swoosh.x = 329; swoosh.y = 439; swoosh.alpha = 1; swoosh.oldAlpha = 1        menuGroup:insert(swoosh)        menuGroup.swoosh = swoosh --local PageZZCorner
	end
   drawScreen()    return menuGroup end 