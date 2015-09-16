-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local crow_audio = audio.loadSound(audioDir .. "click.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local showhide         local crow         local BG         BG = display.newImageRect(imageDir .. "p55_ch03pg9.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local oncrowTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_303 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_303 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( crow_audio, {channel=myChannel} )              end           end        end        crow = ui.newButton{            defaultSrc= imageDir .."p55_crow.png",            defaultX = 129,            defaultY = 111,            overSrc= imageDir .."p55_crow.png",            overX = 129,            overY = 111,            onRelease=oncrowTouch,            id="crowButton"        }        crow.x = 68; crow.y = 500; crow.alpha = 1; crow.oldAlpha = 1        menuGroup:insert(crow)        menuGroup.crow = crow        showhide = display.newImageRect(imageDir .. "p55_showhide.png", 349, 228 );        showhide.x = 284; showhide.y = 489; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide              showhide.alpha = 0 
	end
   drawScreen()    return menuGroup end 