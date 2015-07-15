-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 	local menuGroup = display.newGroup() 	local disposeAudios 	local disposeTweens 	local Choking_audio = audio.loadSound(audioDir .. "choke.mp3", system.ResourceDirectory) 	local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory) 	local showbut1_audio = audio.loadSound(audioDir.."click0.mp3" )     local showbut2_audio = audio.loadSound(audioDir.."click1.mp3" ) 	--local currPage = 19 	print("----------------"); print(""); print("New Page") 	print("The current page is: " .. _G.kwk_currentPage) 	local path = system.pathForFile( "book.txt", system.DocumentsDirectory ) 	local file = io.open( path, "w+" ) 	file:write( _G.kwk_currentPage ) 	io.close( file ) 	local drawScreen = function()    --DEBUGTEXT    if _G.kwk_ShowDebugOutput then      print("PageDisplay called.")      devtxt1 = display.newText(_G.kwk_DebugText1_t, _G.kwk_DebugText1_x, _G.kwk_DebugText1_y, _G.kwk_DebugText1_w, _G.kwk_DebugText1_h, _G.kwk_DebugText1_f, _G.kwk_DebugText1_s); devtxt1:setFillColor(_G.kwk_DebugText1_cr,_G.kwk_DebugText1_cg,_G.kwk_DebugText1_cb); devtxt1.alpha = 1      devtxt2 = display.newText(_G.kwk_DebugText2_t, _G.kwk_DebugText2_x, _G.kwk_DebugText2_y, _G.kwk_DebugText2_w, _G.kwk_DebugText2_h, _G.kwk_DebugText2_f, _G.kwk_DebugText2_s); devtxt2:setFillColor(_G.kwk_DebugText2_cr,_G.kwk_DebugText2_cg,_G.kwk_DebugText2_cb); devtxt2.alpha = 1      devtxt3 = display.newText(_G.kwk_DebugText3_t, _G.kwk_DebugText3_x, _G.kwk_DebugText3_y, _G.kwk_DebugText3_w, _G.kwk_DebugText3_h, _G.kwk_DebugText3_f, _G.kwk_DebugText3_s); devtxt3:setFillColor(_G.kwk_DebugText3_cr,_G.kwk_DebugText3_cg,_G.kwk_DebugText3_cb); devtxt3.alpha = 1    end--if    --DEBUGTEXTEND		local kwkBback  		local kwkBindex  		local kwkPageCorner 		local kwkBforward  		local Choking  		local BG  		BG = display.newImageRect(imgDir .. "p4_bg.png", 768, 1024 ); 		BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1 		menuGroup:insert(BG) 		menuGroup.BG = BG 		local onChokingTouch = function(event) 			if event.phase=="ended" then  				local myChannel = 2 				local isChannelPlaying = audio.isChannelPlaying(myChannel) 				if isChannelPlaying then 					--nothing 				else 					audio.play( Choking_audio, {channel=myChannel} ) 				end 			end 		end 		Choking = ui.newButton{ 			defaultSrc= imgDir .."p4_choke.png", 			defaultX = 399, 			defaultY = 26, 			overSrc= imgDir .."p4_choke.png", 			overX = 399, 			overY = 26, 			onRelease=onChokingTouch, 			id="ChokingButton" 		} 		Choking.x = 295; Choking.y = 227; Choking.alpha = 1; Choking.oldAlpha = 1 		menuGroup:insert(Choking) 		menuGroup.Choking = Choking 		local onkwkBforwardTouch = function(event) 			if event.phase=="ended" then  				local myClosure_switch = function() 						disposeAudios() 						disposeTweens() 						print("GoForward!")						_G.kwk_currentPage = _G.kwk_currentPage + 1						director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 				end 				timerStash.newTimer_523 = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end 		kwkBforward = ui.newButton{ 				defaultSrc= imgDir .."kwkBforward.png", 				defaultX = 111, 				defaultY = 87, 				overSrc= imgDir .."kwkBforward.png", 				overX = 111, 				overY = 87, 				onRelease=onkwkBforwardTouch, 				id="kwkBforwardButton" 		} 		kwkBforward.x = 475; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1 		menuGroup:insert(kwkBforward) 		menuGroup.kwkBforward = kwkBforward --PageNum Begin		local onkwkPageCornerTouch = function(event) 			if event.phase=="ended" then  				local myClosure_switch = function() 						disposeTweens() 						_G.kwk_currentPage = _G.kwk_menuPage						print("GoToMenu!")						director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )				end 				timerStash.newTimer_518 = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end 		kwkPageCorner = ui.newButton{ 				defaultSrc= imgDir .."PageCornerGrey.png", 				defaultX = 72, 				defaultY = 80, 				overSrc= imgDir .."PageCornerGrey.png", 				overX = 72, 				overY = 80, 				onRelease=onkwkPageCornerTouch, 				id="kwkPageCornerButton" 		} 		kwkPageCorner.x = 732; kwkPageCorner.y = 984; kwkPageCorner.alpha = 1; kwkPageCorner.oldAlpha = 1 		menuGroup:insert(kwkPageCorner) 		menuGroup.kwkPageCorner = kwkPageCorner --TEXTFORPAGENUMBEGINlocal crnrtxtoffset = 730; if _G.kwk_currentPage < 99 then crnrtxtoffset = 737 end; if _G.kwk_currentPage < 9 then crnrtxtoffset = 745 endcrnrtxt = display.newText("" .. _G.kwk_currentPage .. "", crnrtxtoffset, 995, "Arbutus Slab", 20); crnrtxt:setFillColor(0,0,0)--TEXTFORPAGENUMEND		local onkwkBindexTouch = function(event) 			if event.phase=="ended" then  				local myClosure_switch = function() 					disposeAudios() 					disposeTweens() 					_G.kwk_currentPage = _G.kwk_menuPage					print("GoToMenu!")					director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" ) 				end --function				timerStash.newTimer_589 = timer.performWithDelay(0, myClosure_switch, 1) 				local myChannel = 3 				local isChannelPlaying = audio.isChannelPlaying(myChannel) 				if isChannelPlaying then 					--nothing 				else 					audio.play( kwkBindex_audio, {channel=myChannel} ) 				end 			end 		end 		kwkBindex = ui.newButton{ 				defaultSrc= imgDir .."kwkBindex.png", 				defaultX = 66, 				defaultY = 69, 				overSrc= imgDir .."kwkBindex.png", 				overX = 66, 				overY = 69, 				onRelease=onkwkBindexTouch, 				id="kwkBindexButton" 		} 		kwkBindex.x = 383; kwkBindex.y = 969; kwkBindex.alpha = 1; kwkBindex.oldAlpha = 1 		menuGroup:insert(kwkBindex) 		menuGroup.kwkBindex = kwkBindex 		local onkwkBbackTouch = function(event) 			if event.phase=="ended" then				local myClosure_switch = function() 						disposeAudios() 						disposeTweens() 						print("GoBack!")						_G.kwk_currentPage = _G.kwk_currentPage - 1						director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromLeft" ) 				end 				timerStash.newTimer_634 = timer.performWithDelay(0, myClosure_switch, 1) 			end 		end --(10) regular layer 		kwkBback = ui.newButton{ 				defaultSrc= imgDir .."kwkBback.png", 				defaultX = 111, 				defaultY = 88, 				overSrc= imgDir .."kwkBback.png", 				overX = 111, 				overY = 88, 				onRelease=onkwkBbackTouch, 				id="kwkBbackButton" 		} 		kwkBback.x = 293; kwkBback.y = 973; kwkBback.alpha = 1; kwkBback.oldAlpha = 1 		menuGroup:insert(kwkBback) 		menuGroup.kwkBback = kwkBback 		local onshowbut1Touch = function(event) 			if event.phase=="ended" then  				if showbox1.alpha == 0 then 					transitionStash.newTransition_303 = transition.to( showbox1, {alpha=showbox1.oldAlpha, time=2000, delay=0}) 				else 					transitionStash.newTransition_303 = transition.to( showbox1, {alpha=0, time=2000, delay=0}) 				end 			   local myChannel = 4 			   local isChannelPlaying = audio.isChannelPlaying(myChannel) 			   if isChannelPlaying then 				--nothing 			   else 				audio.play( showbut1_audio, {channel=myChannel} ) 			   end 			end 		end 		showbut1 = ui.newButton{ 			 defaultSrc=imgDir.."p4_showbut1.png", 			 defaultX = 210, 			 defaultY = 332, 			 overSrc=imgDir.."p4_showbut1.png", 			 overX = 210, 			 overY = 332, 			 onRelease=onshowbut1Touch, 			 id="showbut1Button" 		} 		showbut1.x = 663; showbut1.y = 758; showbut1.alpha = 1; showbut1.oldAlpha = 1 		menuGroup:insert(showbut1)		menuGroup.showbut1 = showbut1		showbox1 = display.newImageRect( imgDir.. "p4_showbox1.png", 570, 446 ); 		showbox1.x = 473; showbox1.y = 473; showbox1.alpha = 0; showbox1.oldAlpha = 1 		menuGroup:insert(showbox1)		menuGroup.showbox1 = showbox1		local onshowbut2Touch = function(event) 			if event.phase=="ended" then  				if showbox2.alpha == 0 then 					transitionStash.newTransition_419 = transition.to( showbox2, {alpha=showbox2.oldAlpha, time=2000, delay=0}) 				else 					transitionStash.newTransition_419 = transition.to( showbox2, {alpha=0, time=2000, delay=0}) 				end			   local myChannel = 5 			   local isChannelPlaying = audio.isChannelPlaying(myChannel) 			   if isChannelPlaying then 				--nothing 			   else 				audio.play( showbut2_audio, {channel=myChannel} ) 			   end 			end 		end 		showbut2 = ui.newButton{ 			 defaultSrc=imgDir.. "p4_showbut2.png",			 defaultX = 180, 			 defaultY = 299, 			 overSrc=imgDir.."p4_showbut2.png", 			 overX = 180, 			 overY = 299, 			 onRelease=onshowbut2Touch, 			 id="showbut2Button" 		} 		showbut2.x = 90; showbut2.y = 774; showbut2.alpha = 1; showbut2.oldAlpha = 1 		menuGroup:insert(showbut2) 		menuGroup.showbut2 = showbut2		showbox2 = display.newImageRect( imgDir.. "p4_showbox2.png", 565, 734 ); 		showbox2.x = 292; showbox2.y = 359; showbox2.alpha = 0; showbox2.oldAlpha = 1 		menuGroup:insert(showbox2)		menuGroup.showbox2 = showbox2		local function flip (event) 			local spacer = 180  			if event.phase =="ended" then  				if event.xStart < event.x and (event.x - event.xStart) >= spacer then 					if (_G.kwk_currentPage > 1) then  						disposeAudios() 						disposeTweens() 						director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" ) 					end 				elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then  					if (_G.kwk_currentPage < _G.kwk_lastPage) then  						disposeAudios() 						disposeTweens() 						director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight") 					end 				end 			end 		end 		BG:addEventListener("touch", flip) 	end 	drawScreen() 	function disposeAudios(event) 		audio.stop(2); audio.dispose(Choking_audio); Choking_audio = nil								audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil								audio.stop(4); audio.dispose(showbut1_audio); showbut1_audio = nil								audio.stop(5); audio.dispose(showbut2_audio); showbut2_audio = nil							end 	function disposeTweens(event) 		cancelAllTweens(); 		cancelAllTimers(); 		cancelAllTransitions(); 	end 	return menuGroup end 