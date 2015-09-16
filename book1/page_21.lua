-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local bolt_audio = audio.loadSound(audioDir .. "lightning_bolt.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local bolt         local BG         BG = display.newImageRect(imageDir .. "p42_ch02pg18.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onboltTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( bolt_audio, {channel=myChannel} )              end           end        end        bolt = ui.newButton{            defaultSrc= imageDir .."p42_bolt.png",            defaultX = 121,            defaultY = 29,            overSrc= imageDir .."p42_bolt.png",            overX = 121,            overY = 29,            onRelease=onboltTouch,            id="boltButton"        }        bolt.x = 185; bolt.y = 533; bolt.alpha = 1; bolt.oldAlpha = 1        menuGroup:insert(bolt)        menuGroup.bolt = bolt --local PageZZCorner
	end
   drawScreen()    return menuGroup end 