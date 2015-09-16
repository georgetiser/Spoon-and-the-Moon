-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local atch_audio = audio.loadSound(audioDir .. "match.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local showhide         local atch         local BG         BG = display.newImageRect(imageDir .. "p90_ch06pg3.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onatchTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( atch_audio, {channel=myChannel} )              end                 if showhide.alpha == 0 then                    transitionStash.newTransition_321 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_321 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end           end        end        atch = ui.newButton{            defaultSrc= imageDir .."p90_atch.png",            defaultX = 308,            defaultY = 428,            overSrc= imageDir .."p90_atch.png",            overX = 308,            overY = 428,            onRelease=onatchTouch,            id="atchButton"        }        atch.x = 219; atch.y = 290; atch.alpha = 1; atch.oldAlpha = 1        menuGroup:insert(atch)        menuGroup.atch = atch        showhide = display.newImageRect(imageDir .. "p90_showhide.png", 412, 292 );        showhide.x = 557; showhide.y = 246; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide --local PageZZCorner              showhide.alpha = 0 
	end
   drawScreen()    return menuGroup end 