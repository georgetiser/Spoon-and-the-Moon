-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup() 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}

       local showbox         local showbut         local BG         BG = display.newImageRect(imageDir .. "p17_bg.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG                      local onshowbutTouch = function(event)           if event.phase=="ended" then                  if showbox.alpha == 0 then                    transitionStash.newTransition_639 = transition.to( showbox, {alpha=showbox.oldAlpha, time=2000, delay=0})                 else                    transitionStash.newTransition_639 = transition.to( showbox, {alpha=0, time=2000, delay=0})                 end           end        end        showbut = ui.newButton{            defaultSrc= imageDir .."p17_showbut.png",            defaultX = 167,            defaultY = 130,            overSrc= imageDir .."p17_showbut.png",            overX = 167,            overY = 130,            onRelease=onshowbutTouch,            id="showbutButton"        }        showbut.x = 113; showbut.y = 105; showbut.alpha = 1; showbut.oldAlpha = 1        menuGroup:insert(showbut)        menuGroup.showbut = showbut        showbox = display.newImageRect(imageDir .. "p17_showbox.png", 472, 311 );        showbox.x = 284; showbox.y = 253; showbox.alpha = 1; showbox.oldAlpha = 1        menuGroup:insert(showbox)        menuGroup.showbox = showbox        showbox.alpha = 0 
	end
   drawScreen()    return menuGroup end 