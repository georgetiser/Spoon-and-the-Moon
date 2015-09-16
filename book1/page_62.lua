-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local ant_audio = audio.loadSound(audioDir .. "click.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local showhide         local ant         local BG         BG = display.newImageRect(imageDir .. "p61_ch04pg2.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onantTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_444 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_444 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( ant_audio, {channel=myChannel} )              end           end        end        ant = ui.newButton{            defaultSrc= imageDir .."p61_ant.png",            defaultX = 87,            defaultY = 290,            overSrc= imageDir .."p61_ant.png",            overX = 87,            overY = 290,            onRelease=onantTouch,            id="antButton"        }        ant.x = 724; ant.y = 353; ant.alpha = 1; ant.oldAlpha = 1        menuGroup:insert(ant)        menuGroup.ant = ant        showhide = display.newImageRect(imageDir .. "p61_showhide.png", 349, 252 );        showhide.x = 556; showhide.y = 333; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide              showhide.alpha = 0 
	end
   drawScreen()    return menuGroup end 