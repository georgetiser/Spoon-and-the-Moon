-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 	local menuGroup = display.newGroup() 	local disposeTweens 	--local currPage = 2 	print("----------------"); print(""); print("New Page") 	print("The current page is: " .. _G.kwk_currentPage) 	local path = system.pathForFile( "book.txt", system.DocumentsDirectory ) 	local file = io.open( path, "w+" ) 	file:write( _G.kwk_currentPage ) 	io.close( file )   local drawScreen = function()    --DEBUGTEXT    if _G.kwk_ShowDebugOutput then      print("PageDisplay called.")      devtxt1 = display.newText(_G.kwk_DebugText1_t, _G.kwk_DebugText1_x, _G.kwk_DebugText1_y, _G.kwk_DebugText1_w, _G.kwk_DebugText1_h, _G.kwk_DebugText1_f, _G.kwk_DebugText1_s); devtxt1:setFillColor(_G.kwk_DebugText1_cr,_G.kwk_DebugText1_cg,_G.kwk_DebugText1_cb); devtxt1.alpha = 1      devtxt2 = display.newText(_G.kwk_DebugText2_t, _G.kwk_DebugText2_x, _G.kwk_DebugText2_y, _G.kwk_DebugText2_w, _G.kwk_DebugText2_h, _G.kwk_DebugText2_f, _G.kwk_DebugText2_s); devtxt2:setFillColor(_G.kwk_DebugText2_cr,_G.kwk_DebugText2_cg,_G.kwk_DebugText2_cb); devtxt2.alpha = 1      devtxt3 = display.newText(_G.kwk_DebugText3_t, _G.kwk_DebugText3_x, _G.kwk_DebugText3_y, _G.kwk_DebugText3_w, _G.kwk_DebugText3_h, _G.kwk_DebugText3_f, _G.kwk_DebugText3_s); devtxt3:setFillColor(_G.kwk_DebugText3_cr,_G.kwk_DebugText3_cg,_G.kwk_DebugText3_cb); devtxt3.alpha = 1    end--if    --DEBUGTEXTEND		local staranima1			local kwkBback			local kwkBindex			local kwkPageCorner 		local kwkBforward			local chapt1button			local chapt2button			local chapt3button			local chapt4button			local chapt5button			local chapt6button			local chapt7button			local CreditsButton		local PreviewButton		local BG		BG = display.newImageRect(imgDir .. "Book1_TableOfContents.png", 768, 1024 ); 		BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1 		menuGroup:insert(BG) 		menuGroup.BG = BG 		local onCreditsButtonTouch = function(event) 				print("Credits Button Clicked!")			if event.phase=="ended" then				local myClosure_switch = function() 				disposeTweens() 				print("Go to Chapter " .. 8 .. " at page ".. _G.kwk_firstPageOfChapter[7])				_G.kwk_currentPage = _G.kwk_creditsPage				director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 			end 			timerStash.newTimer_44536 = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end		CreditsButton = ui.newButton{ 			defaultSrc= imgDir .. "transparentbutton.png", 			defaultX = 100, 			defaultY = 25, 			overSrc= imgDir .. "blankbutton.png", 			overX = 100, 			overY = 25, 			onRelease=onCreditsButtonTouch, 			id="CreditsButtonButton" 		} 		CreditsButton.x = 410		CreditsButton.y = 500		CreditsButton.alpha = 0.5; CreditsButton.oldAlpha = 0.5 		menuGroup:insert(CreditsButton) 		menuGroup.CreditsButton = CreditsButton 		if _G.kwk_ShowDebugOutput then			local onPreviewButtonTouch = function(event) 				print("Preview Button Clicked!")				if event.phase=="ended" then					local myClosure_switch = function() 					disposeTweens() 					print("Go to Chapter " .. 8 .. " at page ".. _G.kwk_firstPageOfChapter[7])					_G.kwk_currentPage = _G.kwk_firstPageOfChapter[8]					director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 				end 				timerStash.newTimer_55536 = timer.performWithDelay(0, myClosure_switch, 1) 				end 			end			PreviewButton = ui.newButton{ 				defaultSrc= imgDir .. "previewbutton.png", 				defaultX = 200, 				defaultY = 80, 				overSrc= imgDir .. "previewbutton.png", 				overX = 200,				overY = 80,				onRelease=onPreviewButtonTouch, 				id="PreviewButtonbutton" 			} 			PreviewButton.x = 650			PreviewButton.y = 350			PreviewButton.alpha = 1; PreviewButton.oldAlpha = 0.5 			menuGroup:insert(PreviewButton) 			menuGroup.PreviewButton = PreviewButton 		end--if		local onchapt7buttonTouch = function(event) 			print("Chapter 7 Button Clicked!")			if event.phase=="ended" then				local myClosure_switch = function() 				disposeTweens() 				print("Go to Chapter " .. 7 .. " at page ".. _G.kwk_firstPageOfChapter[7])				_G.kwk_currentPage = _G.kwk_firstPageOfChapter[7]				director:changeScene( "page_" .. _G.kwk_firstPageOfChapter[7], "moveFromRight" ) 			end 			timerStash.newTimer_19536 = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end		chapt7button = ui.newButton{ 			defaultSrc= imgDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imgDir .. "blankbutton.png", 			overX = 251, 			overY = 25,			onRelease=onchapt7buttonTouch, 			id="chapt7buttonButton" 		} 		chapt7button.x = 257+125		chapt7button.y = 14+246+30*7		chapt7button.alpha = 0.5; chapt7button.oldAlpha = 0.5 		menuGroup:insert(chapt7button) 		menuGroup.chapt7button = chapt7button 		local onchapt6buttonTouch = function(event) 			if event.phase=="ended" then				local myClosure_switch = function() 				disposeTweens() 				print("Go to Chapter " .. 6 .. " at page ".. _G.kwk_firstPageOfChapter[6])				_G.kwk_currentPage = _G.kwk_firstPageOfChapter[6]				director:changeScene( "page_" .. _G.kwk_firstPageOfChapter[6], "moveFromRight" ) 			end 			timerStash.newTimer_536 = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end--(10) regular layer 		chapt6button = ui.newButton{ 			defaultSrc= imgDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imgDir .. "blankbutton.png", 			overX = 251,--204 			overY = 25,--36 			onRelease=onchapt6buttonTouch, 			id="chapt6buttonButton" 		} 		chapt6button.x = 257+125		chapt6button.y = 11+246+30*6		chapt6button.alpha = 0.5; chapt6button.oldAlpha = 0.5 		menuGroup:insert(chapt6button) 		menuGroup.chapt6button = chapt6button 		local onchapt5buttonTouch = function(event) 			if event.phase=="ended" then				local myClosure_switch = function() 				disposeTweens() 				print("Go to Chapter " .. 5 .. " at page ".. _G.kwk_firstPageOfChapter[5])				_G.kwk_currentPage = _G.kwk_firstPageOfChapter[5]				director:changeScene( "page_" .. _G.kwk_firstPageOfChapter[5], "moveFromRight" ) 			end 			timerStash.newTimer_776 = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end --(10) regular layer 		chapt5button = ui.newButton{ 			defaultSrc= imgDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imgDir .. "blankbutton.png", 			overX = 251,--204 			overY = 25,--36 			onRelease=onchapt5buttonTouch, 			id="chapt5buttonButton" 		} 		chapt5button.x = 257+125		chapt5button.y = 7+246+30*5		chapt5button.alpha = 0.5; chapt5button.oldAlpha = 0.5 		menuGroup:insert(chapt5button) 		menuGroup.chapt5button = chapt5button 		local onchapt4buttonTouch = function(event) 			if event.phase=="ended" then				local myClosure_switch = function() 				disposeTweens() 				print("Go to Chapter " .. 4 .. " at page ".. _G.kwk_firstPageOfChapter[4])				_G.kwk_currentPage = _G.kwk_firstPageOfChapter[4]				director:changeScene( "page_" .. _G.kwk_firstPageOfChapter[4], "moveFromRight" ) 			end 			timerStash.newTimer_990 = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end --(10) regular layer 		chapt4button = ui.newButton{ 			defaultSrc= imgDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imgDir .. "blankbutton.png", 			overX = 251,--204 			overY = 25,--36 			onRelease=onchapt4buttonTouch, 			id="chapt4buttonButton" 		} 		chapt4button.x = 257+125		chapt4button.y = 246+30*4		chapt4button.alpha = 0.5; chapt4button.oldAlpha = 0.5 		menuGroup:insert(chapt4button) 		menuGroup.chapt4button = chapt4button		local onchapt3buttonTouch = function(event) 			if event.phase=="ended" then				local myClosure_switch = function() 				disposeTweens() 				print("Go to Chapter " .. 3 .. " at page ".. _G.kwk_firstPageOfChapter[3])				_G.kwk_currentPage = _G.kwk_firstPageOfChapter[3]				director:changeScene( "page_" .. _G.kwk_firstPageOfChapter[3], "moveFromRight" ) 			end 			timerStash.newTimer_268 = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end --(10) regular layer 		chapt3button = ui.newButton{ 			defaultSrc= imgDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imgDir .. "blankbutton.png", 			overX = 251,--204 			overY = 25,--36 			onRelease=onchapt3buttonTouch, 			id="chapt3buttonButton" 		} 		chapt3button.x = 257+125		chapt3button.y = 246+30*3		chapt3button.alpha = 0.5; chapt3button.oldAlpha = 0.5 		menuGroup:insert(chapt3button) 		menuGroup.chapt3button = chapt3button3		local onchapt2buttonTouch = function(event) 			if event.phase=="ended" then				local myClosure_switch = function() 				disposeTweens() 				print("Go to Chapter " .. 2 .. " at page ".. _G.kwk_firstPageOfChapter[2])				_G.kwk_currentPage = _G.kwk_firstPageOfChapter[2]				director:changeScene( "page_" .. _G.kwk_firstPageOfChapter[2], "moveFromRight" ) 			end 			timerStash.newTimer_448 = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end --(10) regular layer 		chapt2button = ui.newButton{ 			defaultSrc= imgDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imgDir .. "blankbutton.png", 			overX = 251,--204 			overY = 25,--36 			onRelease=onchapt2buttonTouch, 			id="chapt2buttonButton" 		} 		chapt2button.x = 257+125		chapt2button.y = 246+30*2		chapt2button.alpha = 0.5; chapt2button.oldAlpha = 0.5 		menuGroup:insert(chapt2button) 		menuGroup.chapt2button = chapt2button 		local onchapt1buttonTouch = function(event) 			if event.phase=="ended" then			-- This plays the interstitial intro movie if they click Chapter 1.		--media.playVideo( FileForIntroMovie, system.ResourceDirectory, false ) 			local myClosure_switch = function() 				disposeTweens() 				print("GoForward!")				_G.kwk_currentPage = _G.kwk_currentPage+1				director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 			end 			timerStash.newTimer_778 = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end --(10) regular layer 		chapt1button = ui.newButton{ 			defaultSrc= imgDir .. "transparentbutton.png", 			defaultX = 251, 			defaultY = 25, 			overSrc= imgDir .. "blankbutton.png", 			overX = 251,--204 			overY = 25,--36 			onRelease=onchapt1buttonTouch, 			id="chapt1buttonButton" 		} 		chapt1button.x = 257+125		chapt1button.y = 246+30*1		chapt1button.alpha = 0.5; chapt1button.oldAlpha = 0.5 		menuGroup:insert(chapt1button) 		menuGroup.chapt1button = chapt1button 		local onkwkBforwardTouch = function(event) 			if event.phase=="ended" then				local myClosure_switch = function() 				disposeTweens() 				print("GoForward!")				_G.kwk_currentPage = _G.kwk_currentPage + 1				director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 			end 			timerStash.newTimer_106 = timer.performWithDelay(0, myClosure_switch, 1) 		-- This plays the interstitial intro movie if they click Next Page.		-- media.playVideo( FileForIntroMovie, system.ResourceDirectory, false ) 			end 		end 		kwkBforward = ui.newButton{ 			defaultSrc= imgDir .. "kwkBforward.png", 			defaultX = 111, 			defaultY = 87, 			overSrc= imgDir .. "kwkBforward.png", 			overX = 111, 			overY = 87, 			onRelease=onkwkBforwardTouch, 			id="kwkBforwardButton" 		} 		kwkBforward.x = 475; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1 		menuGroup:insert(kwkBforward) 		menuGroup.kwkBforward = kwkBforward 		kwkBindex = display.newImageRect(imgDir .. "kwkBindex.png", 66, 69 ); 		kwkBindex.x = 383; kwkBindex.y = 969; kwkBindex.alpha = 1; kwkBindex.oldAlpha = 1 		menuGroup:insert(kwkBindex) 		menuGroup.kwkBindex = kwkBindex 		local onkwkBbackTouch = function(event) 			if event.phase=="ended" then			local myClosure_switch = function() 				disposeTweens() 				print("GoBack!")				_G.kwk_currentPage = _G.kwk_currentPage - 1				director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromLeft" ) 			end 			timerStash.newTimer_330 = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end 		kwkBback = ui.newButton{ 			defaultSrc= imgDir .. "kwkBback.png", 			defaultX = 111, 			defaultY = 88, 			overSrc= imgDir .. "kwkBback.png", 			overX = 111, 			overY = 88, 			onRelease=onkwkBbackTouch, 			id="kwkBbackButton" 		} 		kwkBback.x = 293; kwkBback.y = 973; kwkBback.alpha = 1; kwkBback.oldAlpha = 1 		menuGroup:insert(kwkBback) 		menuGroup.kwkBback = kwkBback 		kwkPageCorner = ui.newButton{ 			defaultSrc= imgDir .."PageCornerGrey.png", 			defaultX = 72, 			defaultY = 80, 			overSrc= imgDir .."PageCornerGrey.png", 			overX = 72, 			overY = 80, 			onRelease=onkwkPageCornerTouch, 			id="kwkPageCornerButton" 		} 		kwkPageCorner.x = 732; kwkPageCorner.y = 984; kwkPageCorner.alpha = 1; kwkPageCorner.oldAlpha = 1 		menuGroup:insert(kwkPageCorner) 		menuGroup.kwkPageCorner = kwkPageCorner --TEXTFORPAGENUMBEGIN
local crnrtxtoffset = 730; if _G.kwk_currentPage < 99 then crnrtxtoffset = 737 end; if _G.kwk_currentPage < 9 then crnrtxtoffset = 745 end
crnrtxt = display.newText("" .. _G.kwk_currentPage .. "", crnrtxtoffset, 995, "Arbutus Slab", 20); crnrtxt:setFillColor(0,0,0)
--TEXTFORPAGENUMEND
--(2) regular layer 		staranima1 = display.newImageRect(imgDir .. "p2_staranima1.png", 16, 16 ); 		staranima1.x = -12; staranima1.y = 101; staranima1.alpha = 1; staranima1.oldAlpha = 1 		menuGroup:insert(staranima1) 		menuGroup.staranima1 = staranima1 		--2 		gtStash.gt_staranima1_444= gtween.new( staranima1, 2.5, { x = 871, y = 618, rotation = 0, xScale = 1, yScale = 1, alpha=1}, {ease = gtween.easing.linear, repeatCount = 1, reflect = false,	delay=2}) 		local function flip (event) 			local spacer = 180				if event.phase =="ended" then				if event.xStart < event.x and (event.x - event.xStart) >= spacer then 				if (_G.kwk_currentPage > 1) then						disposeTweens() 					director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" ) 				end 			elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then					if (_G.kwk_currentPage < _G.kwk_lastPage) then						disposeTweens() 					director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight") 				end 			end 			end 		end 		BG:addEventListener("touch", flip) 	end 	drawScreen() 	function disposeTweens(event) 		cancelAllTweens(); 		cancelAllTimers(); 		cancelAllTransitions(); 	end 	return menuGroup end 