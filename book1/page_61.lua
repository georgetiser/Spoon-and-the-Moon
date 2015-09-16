-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local lady_audio = audio.loadSound(audioDir .. "click.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local showhide         local lady         local BG         BG = display.newImageRect(imageDir .. "p60_ch04pg1.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onladyTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_058 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_058 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( lady_audio, {channel=myChannel} )              end           end        end        lady = ui.newButton{            defaultSrc= imageDir .."p60_lady.png",            defaultX = 202,            defaultY = 276,            overSrc= imageDir .."p60_lady.png",            overX = 202,            overY = 276,            onRelease=onladyTouch,            id="ladyButton"        }        lady.x = 623; lady.y = 239; lady.alpha = 1; lady.oldAlpha = 1        menuGroup:insert(lady)        menuGroup.lady = lady        showhide = display.newImageRect(imageDir .. "p60_showhide.png", 349, 295 );        showhide.x = 384; showhide.y = 142; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide              showhide.alpha = 0 
	end
   drawScreen()    return menuGroup end 