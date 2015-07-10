-- Code created by Kwik - Copyright: kwiksher.com -- Version: 2.4.6 --Changelog--V1.01: NA--V1.02: Removed outdated infoboxmodule(..., package.seeall) function new() _G.kwk_ShowDebugOutput = 1_G.kwk_DebugBuildVersion = "15-07-10/g"	local menuGroup = display.newGroup() 	local dispose 	local _W = display.contentWidth; 	local _H = display.contentHeight; 	-- Audio callings 	local HeyDiddle64 = audio.loadStream(audioDir .. "heydiddle64.mp3", system.ResourceDirectory) 	local drawScreen = function() 		if _G.kwk_ShowDebugOutput then				print("PageDisplay called.")		end--if		if _G.kwk_ShowDebugOutput then			local devtxt1			local devtxt2			local devtxt3			local devdate = string.sub(_G.kwk_DebugBuildVersion, 4, 5) .. "/" .. string.sub(_G.kwk_DebugBuildVersion, 7, 8) .. "/20" .. string.sub(_G.kwk_DebugBuildVersion, 1, 2)			devtxt1 = display.newText("DEVELOPMENT VERSION", 370, 250, 715, 615, native.systemFont, 36)			devtxt1:setFillColor(1,1,1); devtxt1.alpha = 1			devtxt2 = display.newText("Development Version v." .. _G.kwk_DebugBuildVersion, 395, 1350, 715, 615, native.systemFont, 24)			devtxt2:setFillColor(1,1,1); devtxt1.alpha = 1			devtxt3 = display.newText(devdate, 975, 1350, 715, 615, native.systemFont, 24)			devtxt3:setFillColor(1,1,1); devtxt1.alpha = 1		end--if		print("----------------"); print(""); print("New Page") 		print("The current page is: " .. _G.kwk_currentPage) 		if (kBookmark == 1) then 			local path = system.pathForFile( "book.txt", system.DocumentsDirectory ) 			local file = io.open( path, "w+" ) 			file:write ( _G.kwk_currentPage.."\n1" ) 			io.close( file ) 		end 		math.randomseed(os.time()) 		if (kAutoPlay > 0) then 			local function act_autoPlay(event) 				if(_G.kwk_currentPage < _G.kwk_lastPage) then 					if(kBidi == false) then  							dispose()							_G.kwk_currentPage = _G.kwk_currentPage + 1							print("Act Autoplay (F): Go to page " .. _G.kwk_currentPage)							director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 					else  							dispose()							_G.kwk_currentPage = _G.kwk_currentPage - 1							print("Act Autoplay (T): Go to page " .. _G.kwk_currentPage)							director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromLeft" ) 					end--if  				end--if 			end--function 			timerStash.timer_AP = timer.performWithDelay( kAutoPlay*1000, act_autoPlay, 1 ) 		end--if 			-- Button names 			local Cright			-- Layer names 			local BG  			local kwkBforward  			-- (TOP) External code will render here 			-- BG positioning 			BG = display.newImageRect(imgDir .. "p1_bg.png", 768, 1024 ); 			BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1 			BG.oriX = BG.x; BG.oriY = BG.y 			BG.name = "BG" 			menuGroup:insert(1,BG); menuGroup.BG = BG 			-- kwkBforward positioning 			kwkBforward = display.newImageRect(imgDir .. "kwkbforward.png", 111, 87 ); 			kwkBforward.x = 475; kwkBforward.y = 971; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1 			kwkBforward.oriX = kwkBforward.x; kwkBforward.oriY = kwkBforward.y 			kwkBforward.name = "kwkBforward" 			menuGroup:insert(kwkBforward); menuGroup.kwkBforward = kwkBforward 			local function onkwkBforwardEvent(event) 				Cright(kwkBforward) 				return true 			end 			kwkBforward:addEventListener("tap", onkwkBforwardEvent ) 			local function onintroshowEvent(event) 				but_introshow_998(introshow) 				return true 			end 			function Cright(self) 				local myClosure_switch = function() 					dispose()					_G.kwk_currentPage = _G.kwk_currentPage + 1					print("Cright: Go forward to page " .. _G.kwk_currentPage)					director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 				end 				timerStash.newTimer_976 = timer.performWithDelay(0, myClosure_switch, 1) 			end 			-- swipe this page with spacer of 120 in normal direction 			Gesture.activate( BG, {swipeLength=120} ) 			local function pageSwap(event ) 				print("PageSwap: current page is " .. _G.kwk_currentPage)				if event.phase == "ended" and event.direction ~= nil then  					local wPage = _G.kwk_currentPage  					local direction  					if event.direction == "left" and kBidi == false then  							print("F. Event direction says: go left.")							wPage = _G.kwk_currentPage + 1  							if wPage > _G.kwk_lastPage then							print("Page number too high: " .. wPage)							print("Redirecting to last page.")							wPage = _G.kwk_lastPage							end  							direction = "moveFromRight"  					elseif event.direction == "left" and kBidi == true then  							print("T. Event direction says: go left.")							wPage = _G.kwk_currentPage - 1  							if wPage < 1 then							print("Page number too low: " .. wPage)							print("Redirecting to menu page.")							wPage = _G.kwk_menuPage							end  							direction = "moveFromLeft"  					elseif event.direction == "right" and kBidi == true then  							print("T. Event direction says: go right.")							wPage = _G.kwk_currentPage + 1  							if wPage > _G.kwk_lastPage then							print("Page number too high: " .. wPage)							print("Redirecting to last page.")							wPage = _G.kwk_lastPage							end  							direction = "moveFromRight"  					elseif event.direction == "right" and kBidi == false then  							print("F. Event direction says: go right.")							_G.kwk_currentPage = _G.kwk_currentPage - 1  							if _G.kwk_currentPage < 1 then							print("Page number too low: " .. _G.kwk_currentPage)							wPage = _G.kwk_menuPage							end  							direction = "moveFromLeft"  					end  					print("From " .. _G.kwk_currentPage .. " to " .. wPage)					if wPage ~= _G.kwk_currentPage then dispose(); 							dispose()							print("Changing current page to " .. wPage .. ".")							_G.kwk_currentPage = wPage							director:changeScene("page_".._G.kwk_currentPage, direction) 					end 				end  			end 			BG:addEventListener( Gesture.SWIPE_EVENT, pageSwap ) 			dispose = function(event) 				cancelAllTimers(); cancelAllTransitions() 				audio.stop(32); audio.dispose(HeyDiddle64); HeyDiddle64 = nil 				BG:removeEventListener( Gesture.SWIPE_EVENT, pageSwap ); Gesture.deactivate(BG) 			end 			-- (BOTTOM) External code will render here 	end 	drawScreen() 	local myClosure_HeyDiddle64 = function() 		--audio.setVolume(0, { channel=32} ); 		audio.play(HeyDiddle64, {  channel=32, loops=0, fadein=500 } ) 	end 	timerStash.newTimer_872 = timer.performWithDelay(0, myClosure_HeyDiddle64, 1) 	return menuGroup end 