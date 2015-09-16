-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local drill_audio = audio.loadSound(audioDir .. "drill.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local drill         local BG         BG = display.newImageRect(imageDir .. "p67_ch04pg8.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local ondrillTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( drill_audio, {channel=myChannel} )              end           end        end        drill = ui.newButton{            defaultSrc= imageDir .."p67_drill.png",            defaultX = 295,            defaultY = 333,            overSrc= imageDir .."p67_drill.png",            overX = 295,            overY = 333,            onRelease=ondrillTouch,            id="drillButton"        }        drill.x = 221; drill.y = 292; drill.alpha = 1; drill.oldAlpha = 1        menuGroup:insert(drill)        menuGroup.drill = drill
	end
   drawScreen()    return menuGroup end 