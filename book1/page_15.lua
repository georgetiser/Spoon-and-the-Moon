-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local beer_audio = audio.loadSound(audioDir .. "beeropen.mp3", system.ResourceDirectory)     statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page")     statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage)     local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local beer         local BG         BG = display.newImageRect(imageDir .. "p36_ch02pg12.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onbeerTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( beer_audio, {channel=myChannel} )              end           end        end        beer = ui.newButton{            defaultSrc= imageDir .."p36_beer.png",            defaultX = 283,            defaultY = 435,            overSrc= imageDir .."p36_beer.png",            overX = 283,            overY = 435,            onRelease=onbeerTouch,            id="beerButton"        }        beer.x = 194; beer.y = 633; beer.alpha = 1; beer.oldAlpha = 1        menuGroup:insert(beer)        menuGroup.beer = beer --local PageZZCorner
	end
   drawScreen()    return menuGroup end 