-- Code created by Kwik - Copyright: kwiksher.com -- Version: 2.4.6 module(..., package.seeall)  function new() 	local menuGroup = display.newGroup() 	local disposeTweens 	statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 	statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 	local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.DocumentsDirectory ) 	local file = io.open( path, "w+" ) 	file:write( _G.kwk_currentPage ) 	io.close( file ) 	local drawScreen = function()		navigation.DisplayDevelopmentVersion()		menuGroup.navigator = navigation.InsertNavigation{}		local staranima1			local kwkBback			local kwkBindex			local kwkBforward			local chapt1button			local chapt2button			local chapt3button			local chapt4button			local chapt5button			local chapt6button			local chapt7button			local CreditsButton		local PreviewButton		local BG		BG = display.newImageRect(imageDir .. "Book1_TableOfContents.png", 768, 1024 ); 		BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1 		menuGroup:insert(BG) 		menuGroup.BG = BG 		if _G.kwk_ShowDebugOutput then			local onDebugButtonTouch = function(event) 					statusreport.debugPrint("Debug Button Clicked!")				if event.phase=="ended" then						local myClosure_switch = function() 						disposeAudios()						disposeTweens() 						_G.kwk_ShowDebugOutput = nil						_G.kwk_currentPage = _G.kwk_firstPage						director:changeScene( "page_" .. _G.kwk_currentPage, "fade" ) 					end 					timerStash.tempTimer = nil 					timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1) 				end 			end			DebugButton = ui.newButton{ 				defaultSrc= imageDir .. "debugbutton.png", 				defaultX = 186, 				defaultY = 186, 				overSrc= imageDir .. "debugbutton.png", 				overX = 186, 				overY = 186, 				onRelease=onDebugButtonTouch, 				id="DebugButtonButton" 			} 			DebugButton.x = 600			DebugButton.y = 600			DebugButton.alpha = 1; DebugButton.oldAlpha = 1 			menuGroup:insert(DebugButton) 			menuGroup.DebugButton = DebugButton 		end--if		local onCreditsButtonTouch = function(event) 				statusreport.debugPrint("Credits Button Clicked!")			if event.phase=="ended" then				local myClosure_switch = function() 				disposeAudios()				disposeTweens() 				-- The page number here is set beyond the last page; it's a quick hack for navigational purposes.				_G.kwk_currentPage = _G.kwk_creditsPage + 1				director:changeScene( "page_" .. _G.kwk_creditsPage, "moveFromRight" ) 			end 			timerStash.tempTimer = nil 			timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end		CreditsButton = ui.newButton{ 			defaultSrc= imageDir .. "transparentbutton.png", 			defaultX = 100, 			defaultY = 25, 			overSrc= imageDir .. "blankbutton.png", 			overX = 100, 			overY = 25, 			onRelease=onCreditsButtonTouch, 			id="CreditsButtonButton" 		} 		CreditsButton.x = 410		CreditsButton.y = 500		CreditsButton.alpha = 0.5; CreditsButton.oldAlpha = 0.5 		menuGroup:insert(CreditsButton) 		menuGroup.CreditsButton = CreditsButton 		local onchapt7buttonTouch = function(event) 			statusreport.debugPrint("Chapter 7 Button Clicked!")			if event.phase=="ended" then				local myClosure_switch = function() 				disposeAudios()				disposeTweens() 				statusreport.debugPrint("Go to Chapter " .. 7 .. " at page ".. _G.kwk_firstPageOfChapter[7])				_G.kwk_currentPage = _G.kwk_firstPageOfChapter[7]				director:changeScene( "page_" .. _G.kwk_firstPageOfChapter[7], "moveFromRight" ) 			end 			timerStash.tempTimer = nil 			timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end		chapt7button = ui.newButton{ 			defaultSrc= imageDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imageDir .. "blankbutton.png", 			overX = 251, 			overY = 25,			onRelease=onchapt7buttonTouch, 			id="chapt7buttonButton" 		} 		chapt7button.x = 257+125		chapt7button.y = 14+246+30*7		chapt7button.alpha = 0.5; chapt7button.oldAlpha = 0.5 		menuGroup:insert(chapt7button) 		menuGroup.chapt7button = chapt7button 		local onchapt6buttonTouch = function(event) 			if event.phase=="ended" then				local myClosure_switch = function() 				disposeAudios()				disposeTweens() 				statusreport.debugPrint("Go to Chapter " .. 6 .. " at page ".. _G.kwk_firstPageOfChapter[6])				_G.kwk_currentPage = _G.kwk_firstPageOfChapter[6]				director:changeScene( "page_" .. _G.kwk_firstPageOfChapter[6], "moveFromRight" ) 			end 			timerStash.tempTimer = nil 			timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end		chapt6button = ui.newButton{ 			defaultSrc= imageDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imageDir .. "blankbutton.png", 			overX = 251,--204 			overY = 25,--36 			onRelease=onchapt6buttonTouch, 			id="chapt6buttonButton" 		} 		chapt6button.x = 257+125		chapt6button.y = 11+246+30*6		chapt6button.alpha = 0.5; chapt6button.oldAlpha = 0.5 		menuGroup:insert(chapt6button) 		menuGroup.chapt6button = chapt6button 		local onchapt5buttonTouch = function(event) 			if event.phase=="ended" then				local myClosure_switch = function() 				disposeAudios()				disposeTweens() 				statusreport.debugPrint("Go to Chapter " .. 5 .. " at page ".. _G.kwk_firstPageOfChapter[5])				_G.kwk_currentPage = _G.kwk_firstPageOfChapter[5]				director:changeScene( "page_" .. _G.kwk_firstPageOfChapter[5], "moveFromRight" ) 			end 			timerStash.tempTimer = nil 			timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end 		chapt5button = ui.newButton{ 			defaultSrc= imageDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imageDir .. "blankbutton.png", 			overX = 251,--204 			overY = 25,--36 			onRelease=onchapt5buttonTouch, 			id="chapt5buttonButton" 		} 		chapt5button.x = 257+125		chapt5button.y = 7+246+30*5		chapt5button.alpha = 0.5; chapt5button.oldAlpha = 0.5 		menuGroup:insert(chapt5button) 		menuGroup.chapt5button = chapt5button 		local onchapt4buttonTouch = function(event) 			if event.phase=="ended" then				local myClosure_switch = function() 				disposeAudios()				disposeTweens() 				statusreport.debugPrint("Go to Chapter " .. 4 .. " at page ".. _G.kwk_firstPageOfChapter[4])				_G.kwk_currentPage = _G.kwk_firstPageOfChapter[4]				director:changeScene( "page_" .. _G.kwk_firstPageOfChapter[4], "moveFromRight" ) 			end 			timerStash.tempTimer = nil 			timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end 		chapt4button = ui.newButton{ 			defaultSrc= imageDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imageDir .. "blankbutton.png", 			overX = 251,--204 			overY = 25,--36 			onRelease=onchapt4buttonTouch, 			id="chapt4buttonButton" 		} 		chapt4button.x = 257+125		chapt4button.y = 246+30*4		chapt4button.alpha = 0.5; chapt4button.oldAlpha = 0.5 		menuGroup:insert(chapt4button) 		menuGroup.chapt4button = chapt4button		local onchapt3buttonTouch = function(event) 			if event.phase=="ended" then				local myClosure_switch = function() 				disposeAudios()				disposeTweens() 				statusreport.debugPrint("Go to Chapter " .. 3 .. " at page ".. _G.kwk_firstPageOfChapter[3])				_G.kwk_currentPage = _G.kwk_firstPageOfChapter[3]				director:changeScene( "page_" .. _G.kwk_firstPageOfChapter[3], "moveFromRight" ) 			end 			timerStash.tempTimer = nil 			timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end 		chapt3button = ui.newButton{ 			defaultSrc= imageDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imageDir .. "blankbutton.png", 			overX = 251,--204 			overY = 25,--36 			onRelease=onchapt3buttonTouch, 			id="chapt3buttonButton" 		} 		chapt3button.x = 257+125		chapt3button.y = 246+30*3		chapt3button.alpha = 0.5; chapt3button.oldAlpha = 0.5 		menuGroup:insert(chapt3button) 		menuGroup.chapt3button = chapt3button3		local onchapt2buttonTouch = function(event) 			if event.phase=="ended" then				local myClosure_switch = function() 				disposeAudios()				disposeTweens() 				statusreport.debugPrint("Go to Chapter " .. 2 .. " at page ".. _G.kwk_firstPageOfChapter[2])				_G.kwk_currentPage = _G.kwk_firstPageOfChapter[2]				director:changeScene( "page_" .. _G.kwk_firstPageOfChapter[2], "moveFromRight" ) 			end 			timerStash.tempTimer = nil 			timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end 		chapt2button = ui.newButton{ 			defaultSrc= imageDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imageDir .. "blankbutton.png", 			overX = 251,--204 			overY = 25,--36 			onRelease=onchapt2buttonTouch, 			id="chapt2buttonButton" 		} 		chapt2button.x = 257+125		chapt2button.y = 246+30*2		chapt2button.alpha = 0.5; chapt2button.oldAlpha = 0.5 		menuGroup:insert(chapt2button) 		menuGroup.chapt2button = chapt2button 		local onchapt1buttonTouch = function(event) 			if event.phase=="ended" then			-- This plays the interstitial intro movie if they click Chapter 1.		--media.playVideo( FileForIntroMovie, system.ResourceDirectory, false ) 			local myClosure_switch = function() 				disposeAudios()				disposeTweens() 				statusreport.debugPrint("GoForward!")				_G.kwk_currentPage = _G.kwk_currentPage+1				director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 			end 			timerStash.tempTimer = nil 			timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end 		chapt1button = ui.newButton{ 			defaultSrc= imageDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imageDir .. "blankbutton.png", 			overX = 251,--204 			overY = 25,--36 			onRelease=onchapt1buttonTouch, 			id="chapt1buttonButton" 		} 		chapt1button.x = 257+125		chapt1button.y = 246+30*1		chapt1button.alpha = 0.5; chapt1button.oldAlpha = 0.5 		menuGroup:insert(chapt1button) 		menuGroup.chapt1button = chapt1button 		staranima1 = display.newImageRect(imageDir .. "p2_staranima1.png", 16, 16 ); 		staranima1.x = -12; staranima1.y = 101; staranima1.alpha = 1; staranima1.oldAlpha = 1 		menuGroup:insert(staranima1) 		menuGroup.staranima1 = staranima1 		--2 		gtStash.gt_staranima1_444= gtween.new( staranima1, 2.5, { x = 871, y = 618, rotation = 0, xScale = 1, yScale = 1, alpha=1}, {ease = gtween.easing.linear, repeatCount = 1, reflect = false,	delay=2}) 		local function flip (event) 			local spacer = 180				if event.phase =="ended" then				if event.xStart < event.x and (event.x - event.xStart) >= spacer then 				if (_G.kwk_currentPage > 1) then						disposeAudios()					disposeTweens() 					director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" ) 				end 			elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then					if (_G.kwk_currentPage < _G.kwk_lastPage) then						disposeAudios()					disposeTweens() 					director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight") 				end 			end 			end 		end 		BG:addEventListener("touch", flip) 	end 	drawScreen() 		function disposeAudios(event)			--nothing to dispose of 		end 	function disposeTweens(event) 		cancelAllTweens(); 		cancelAllTimers(); 		cancelAllTransitions(); 	end 	return menuGroup end 