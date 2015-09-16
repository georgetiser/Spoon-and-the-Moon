-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local mary_audio = audio.loadSound(audioDir .. "mary.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local mary         local BG         BG = display.newImageRect(imageDir .. "p52_ch03pg6.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onmaryTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( mary_audio, {channel=myChannel} )              end           end        end        mary = ui.newButton{            defaultSrc= imageDir .."p52_mary.png",            defaultX = 446,            defaultY = 423,            overSrc= imageDir .."p52_mary.png",            overX = 446,            overY = 423,            onRelease=onmaryTouch,            id="maryButton"        }        mary.x = 388; mary.y = 621; mary.alpha = 1; mary.oldAlpha = 1        menuGroup:insert(mary)        menuGroup.mary = mary --local PageZZCorner
	end
   drawScreen()    return menuGroup end 