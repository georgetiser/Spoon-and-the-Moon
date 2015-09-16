-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local vlin_audio = audio.loadSound(audioDir .. "v27.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local vlin         local BG         BG = display.newImageRect(imageDir .. "p101_ch7pg3.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onvlinTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( vlin_audio, {channel=myChannel} )              end           end        end        vlin = ui.newButton{            defaultSrc= imageDir .."p101_vlin.png",            defaultX = 438,            defaultY = 35,            overSrc= imageDir .."p101_vlin.png",            overX = 438,            overY = 35,            onRelease=onvlinTouch,            id="vlinButton"        }        vlin.x = 349; vlin.y = 433; vlin.alpha = 1; vlin.oldAlpha = 1        menuGroup:insert(vlin)        menuGroup.vlin = vlin
	end
   drawScreen()    return menuGroup end 