-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens      -- local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory)  
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

  navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}

       local bubble3         local bubble2         local bubble1  

       --local PageXCorner         local BG         BG = display.newImageRect(imageDir .. "p15_bg.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG 
--XPageXCornerX

       
--XPageXCornerX              bubble1 = display.newImageRect(imageDir .. "p15_bubble1.png", 164, 171 );        bubble1.x = 558; bubble1.y = 1395; bubble1.alpha = 1; bubble1.oldAlpha = 1        menuGroup:insert(bubble1)        menuGroup.bubble1 = bubble1        bubble2 = display.newImageRect(imageDir .. "p15_bubble2.png", 48, 49 );        bubble2.x = 489; bubble2.y = 1318; bubble2.alpha = 1; bubble2.oldAlpha = 1        menuGroup:insert(bubble2)        menuGroup.bubble2 = bubble2        bubble3 = display.newImageRect(imageDir .. "p15_bubble3.png", 102, 107 );        bubble3.x = 78; bubble3.y = 1347; bubble3.alpha = 1; bubble3.oldAlpha = 1        menuGroup:insert(bubble3)        menuGroup.bubble3 = bubble3        local onEndbubble2_355 = function()            bubble2.isVisible = false;            bubble2.x = 489; bubble2.y = 1318;            bubble2.xScale = 1;bubble2.yScale = 1;            bubble2.alpha = 1; bubble2.rotation = 0            bubble2.isVisible = true;         end        --1 --1        gtStash.gt_bubble2_355= gtween.new( bubble2, 12, { x = 489, y = -276, rotation = 0, xScale = 1, yScale = 1, alpha=1}, {ease = gtween.easing.linear, repeatCount = math.huge, reflect = false,  delay=4, onComplete = onEndbubble2_355 })        local onEndbubble1_368 = function()            bubble1.isVisible = false;            bubble1.x = 558; bubble1.y = 1395;            bubble1.xScale = 1;bubble1.yScale = 1;            bubble1.alpha = 1; bubble1.rotation = 0            bubble1.isVisible = true;         end        --1 --1        gtStash.gt_bubble1_368= gtween.new( bubble1, 12, { x = 558, y = -215, rotation = 0, xScale = 1, yScale = 1, alpha=1}, {ease = gtween.easing.linear, repeatCount = math.huge, reflect = false,  delay=5, onComplete = onEndbubble1_368 })        local onEndbubble3_380 = function()            bubble3.isVisible = false;            bubble3.x = 78; bubble3.y = 1347;            bubble3.xScale = 1;bubble3.yScale = 1;            bubble3.alpha = 1; bubble3.rotation = 0            bubble3.isVisible = true;         end        --1 --1        gtStash.gt_bubble3_380= gtween.new( bubble3, 11, { x = 78, y = -247, rotation = 0, xScale = 1, yScale = 1, alpha=1}, {ease = gtween.easing.linear, repeatCount = math.huge, reflect = false,  delay=7, onComplete = onEndbubble3_380 }) 
	end
   drawScreen()    function disposeAudios(event)                     -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 