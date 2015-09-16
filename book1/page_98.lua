-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local cupcake_audio = audio.loadSound(audioDir .. "eat2.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local cupcake         local BG         BG = display.newImageRect(imageDir .. "p97_ch06pg10.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local oncupcakeTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( cupcake_audio, {channel=myChannel} )              end           end        end        cupcake = ui.newButton{            defaultSrc= imageDir .."p97_cupcake.png",            defaultX = 327,            defaultY = 399,            overSrc= imageDir .."p97_cupcake.png",            overX = 327,            overY = 399,            onRelease=oncupcakeTouch,            id="cupcakeButton"        }        cupcake.x = 374; cupcake.y = 659; cupcake.alpha = 1; cupcake.oldAlpha = 1        menuGroup:insert(cupcake)        menuGroup.cupcake = cupcake --local PageZZCorner
	end
   drawScreen()    return menuGroup end 