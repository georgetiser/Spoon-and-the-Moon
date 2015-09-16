-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local larva_audio = audio.loadSound(audioDir .. "children.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local larva         local BG         BG = display.newImageRect(imageDir .. "p76_ch05pg7.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onlarvaTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( larva_audio, {channel=myChannel} )              end           end        end        larva = ui.newButton{            defaultSrc= imageDir .."p76_larva.png",            defaultX = 617,            defaultY = 55,            overSrc= imageDir .."p76_larva.png",            overX = 617,            overY = 55,            onRelease=onlarvaTouch,            id="larvaButton"        }        larva.x = 369; larva.y = 530; larva.alpha = 1; larva.oldAlpha = 1        menuGroup:insert(larva)        menuGroup.larva = larva --local PageZZCorner
	end
   drawScreen()    return menuGroup end 