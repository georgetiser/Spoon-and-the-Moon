-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


       --local PageXCorner         local man3         local man2         local man1         local BG         BG = display.newImageRect(imageDir .. "p16_bg.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        man1 = display.newImageRect(imageDir .. "p16_man1.png", 113, 156 );        man1.x = 639; man1.y = 525; man1.alpha = 1; man1.oldAlpha = 1        menuGroup:insert(man1)        menuGroup.man1 = man1        man2 = display.newImageRect(imageDir .. "p16_man2.png", 111, 141 );        man2.x = 259; man2.y = 839; man2.alpha = 1; man2.oldAlpha = 1        menuGroup:insert(man2)        menuGroup.man2 = man2        man3 = display.newImageRect(imageDir .. "p16_man3.png", 135, 165 );        man3.x = 305; man3.y = 198; man3.alpha = 1; man3.oldAlpha = 1        menuGroup:insert(man3)        menuGroup.man3 = man3 
--XPageXCornerX

       
--XPageXCornerX              --2        gtStash.gt_man1_148= gtween.new( man1, 2, { x = 639, y = 525, rotation = 15, xScale = 1, yScale = 1, alpha=1}, {ease = gtween.easing.linear, repeatCount = math.huge, reflect = true,  delay=0})        --2        gtStash.gt_man2_177= gtween.new( man2, 2, { x = 259, y = 839, rotation = -15, xScale = 1, yScale = 1, alpha=1}, {ease = gtween.easing.linear, repeatCount = math.huge, reflect = true,  delay=0})        --2        gtStash.gt_man3_194= gtween.new( man3, 2, { x = 305, y = 198, rotation = 15, xScale = 1, yScale = 1, alpha=1}, {ease = gtween.easing.linear, repeatCount = math.huge, reflect = true,  delay=0}) 
	end
   drawScreen()    function disposeAudios(event)                     -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 