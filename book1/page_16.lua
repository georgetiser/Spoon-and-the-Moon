-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local sawme_audio = audio.loadSound(audioDir .. "click.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local showhide         local sawme         local BG         BG = display.newImageRect(imageDir .. "p37_bg.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onsawmeTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_995 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_995 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( sawme_audio, {channel=myChannel} )              end           end        end        sawme = ui.newButton{            defaultSrc= imageDir .."p37_sawme.png",            defaultX = 383,            defaultY = 174,            overSrc= imageDir .."p37_sawme.png",            overX = 383,            overY = 174,            onRelease=onsawmeTouch,            id="sawmeButton"        }        sawme.x = 393; sawme.y = 790; sawme.alpha = 1; sawme.oldAlpha = 1        menuGroup:insert(sawme)        menuGroup.sawme = sawme        showhide = display.newImageRect(imageDir .. "p37_showhide.png", 412, 346 );        showhide.x = 254; showhide.y = 582; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide              showhide.alpha = 0 
	end
   drawScreen()    return menuGroup end 