-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local carsh_audio = audio.loadSound(audioDir .. "crash.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local carsh         local BG         BG = display.newImageRect(imageDir .. "p84_ch05pg15.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local oncarshTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( carsh_audio, {channel=myChannel} )              end           end        end        carsh = ui.newButton{            defaultSrc= imageDir .."p84_carsh.png",            defaultX = 503,            defaultY = 278,            overSrc= imageDir .."p84_carsh.png",            overX = 503,            overY = 278,            onRelease=oncarshTouch,            id="carshButton"        }        carsh.x = 383; carsh.y = 760; carsh.alpha = 1; carsh.oldAlpha = 1        menuGroup:insert(carsh)        menuGroup.carsh = carsh --local PageZZCorner
	end
   drawScreen()    return menuGroup end 