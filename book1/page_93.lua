-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local mtch_audio = audio.loadSound(audioDir .. "match.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local mtch         local BG         BG = display.newImageRect(imageDir .. "p92_ch06pg5.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onmtchTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( mtch_audio, {channel=myChannel} )              end           end        end        mtch = ui.newButton{            defaultSrc= imageDir .."p92_mtch.png",            defaultX = 320,            defaultY = 431,            overSrc= imageDir .."p92_mtch.png",            overX = 320,            overY = 431,            onRelease=onmtchTouch,            id="mtchButton"        }        mtch.x = 220; mtch.y = 658; mtch.alpha = 1; mtch.oldAlpha = 1        menuGroup:insert(mtch)        menuGroup.mtch = mtch --local PageZZCorner
	end
   drawScreen()    return menuGroup end 