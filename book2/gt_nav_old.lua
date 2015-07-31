
module(..., package.seeall)

function InsertForwardButton(params)
	local imagefile = imageDir .. "kwkBforward.png"
	local width = 111
	local height = 87
	local x = 475
	local y = 975
	local newPage = _G.kwk_currentPage + 1

	if params.width or params.defaultX then width = params.width or params.defaultX end
	if params.height or params.defaultY then height = params.height or params.defaultY end
	if params.filename then imagefile = params.filename end
	if params.x then x = params.x end
	if params.y then y = params.y end

	local function DoWhenPressed(self, event)
		local userPress = event.phase
		if userPress == "ended" then
			local goOnward = function() 
				cancelAllSounds()
				cancelAllTweens()
				cancelAllTimers()
				cancelAllTransitions()
				if _G.kwk_ShowDebugOutput then print("Go Forward!") end
				_G.kwk_currentPage = _G.kwk_currentPage + 1
				director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 
			end
			timerStash.navTimer = nil;
			timerStash.navTimer = timer.performWithDelay(0, goOnward, 1)
		end--if
	end--function

	button = display.newGroup()
	buttonImage = display.newImageRect(imagefile, width, height)
	button:insert(buttonImage, true)
	button._onRelease = function()
		print("Wow!")
	end
	button.isActive = true
	button.isVisible = true
	button.touch = PressForward
	button:addEventListener("touch", button)
	button._id = "NavigationForwardButton"
	button.x = 475; button.y = 975; button.alpha = 1; button.oldAlpha = 1 
end--function-insert-button

function InsertNewButton(filename, width, height, x, y, goto, animation, debugMessage)
	local function DoWhenPressed(self, event)
		local userPress = event.phase
		if userPress == "ended" then
			local goOnward = function() 
				cancelAllSounds()
				cancelAllTweens()
				cancelAllTimers()
				cancelAllTransitions()
				if _G.kwk_ShowDebugOutput then
					print("Go Forward!")
				if _G.kwk_currentPage == newPage then print("Going Nowhere!") end
				end
				_G.kwk_currentPage = newPage
				director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 
			end
			timerStash.navTimer = nil;
			timerStash.navTimer = timer.performWithDelay(0, goOnward, 1)
		end--if
	end--function
	button = display.newGroup()
	buttonImage = display.newImageRect(imagefile, width, height)
	button:insert(buttonImage, true)
	button._onRelease = function()
		print("Wow!")
	end
	button.isActive = true
	button.isVisible = true
	button.touch = PressForward
	button:addEventListener("touch", button)
	button._id = "NavigationForwardButton"
	button.x = 475; button.y = 975; button.alpha = 1; button.oldAlpha = 1 
end--function-insert-button

function DisplayDevelopmentVersion()
	if _G.kwk_ShowDebugOutput then
		if not _G.kwk_DebugText1_t then InitializeDevelopmentVersionText() end
		devtxt1 = display.newText(_G.kwk_DebugText1_t, _G.kwk_DebugText1_x, _G.kwk_DebugText1_y, _G.kwk_DebugText1_w, _G.kwk_DebugText1_h, _G.kwk_DebugText1_f, _G.kwk_DebugText1_s); devtxt1:setFillColor(_G.kwk_DebugText1_cr,_G.kwk_DebugText1_cg,_G.kwk_DebugText1_cb); devtxt1.alpha = 1
		devtxt2 = display.newText(_G.kwk_DebugText2_t, _G.kwk_DebugText2_x, _G.kwk_DebugText2_y, _G.kwk_DebugText2_w, _G.kwk_DebugText2_h, _G.kwk_DebugText2_f, _G.kwk_DebugText2_s); devtxt2:setFillColor(_G.kwk_DebugText2_cr,_G.kwk_DebugText2_cg,_G.kwk_DebugText2_cb); devtxt2.alpha = 1
		devtxt3 = display.newText(_G.kwk_DebugText3_t, _G.kwk_DebugText3_x, _G.kwk_DebugText3_y, _G.kwk_DebugText3_w, _G.kwk_DebugText3_h, _G.kwk_DebugText3_f, _G.kwk_DebugText3_s); devtxt3:setFillColor(_G.kwk_DebugText3_cr,_G.kwk_DebugText3_cg,_G.kwk_DebugText3_cb); devtxt3.alpha = 1
	else
		--
	end--if
end--function display-development-version

function InitializeDevelopmentVersionText()
if not _G.kwk_DebugBuildVersion then _G.kwk_DebugBuildVersion = "---------------" end
  _G.kwk_BuildDate = string.sub(_G.kwk_DebugBuildVersion, 4, 5) .. "/" .. string.sub(_G.kwk_DebugBuildVersion, 7, 8) .. "/20" .. string.sub(_G.kwk_DebugBuildVersion, 1, 2)
  _G.kwk_DebugText1_x = 0
  _G.kwk_DebugText1_y = -50
  _G.kwk_DebugText1_w = 760
  _G.kwk_DebugText1_h = 200
  _G.kwk_DebugText1_f = "Arbutus Slab"
  _G.kwk_DebugText1_s = 48
  _G.kwk_DebugText1_cr = 255
  _G.kwk_DebugText1_cg = 255
  _G.kwk_DebugText1_cb = 0
  _G.kwk_DebugText1_t = "DEVELOPMENT VERSION " .. string.sub(_G.kwk_DebugBuildVersion, string.len(_G.kwk_DebugBuildVersion))
  _G.kwk_DebugText2_x = 20
  _G.kwk_DebugText2_y = 1025
  _G.kwk_DebugText2_w = 600
  _G.kwk_DebugText2_h = 200
  _G.kwk_DebugText2_f = "Arbutus Slab"
  _G.kwk_DebugText2_s = 24
  _G.kwk_DebugText2_cr = 255
  _G.kwk_DebugText2_cg = 255
  _G.kwk_DebugText2_cb = 0
  _G.kwk_DebugText2_t = "Development Version v." .. _G.kwk_DebugBuildVersion
  _G.kwk_DebugText3_x = 600
  _G.kwk_DebugText3_y = 1025
  _G.kwk_DebugText3_w = 200
  _G.kwk_DebugText3_h = 100
  _G.kwk_DebugText3_f = "Arbutus Slab"
  _G.kwk_DebugText3_s = 24
  _G.kwk_DebugText3_cr = 255
  _G.kwk_DebugText3_cg = 255
  _G.kwk_DebugText3_cb = 0
  _G.kwk_DebugText3_t = string.sub(_G.kwk_DebugBuildVersion, 4, 5) .. "/" .. string.sub(_G.kwk_DebugBuildVersion, 7, 8) .. "/20" .. string.sub(_G.kwk_DebugBuildVersion, 1, 2)
end

--[[
function InsertForwardButton(params)
	if _G.kwk_ShowDebugOutput then
		print("Inserting a Forward button.")
		if params then print("Data!") else print("No data!") end
		for x in pairs(params) do print("Yay " .. x) end
		print.
		for i,x in ipairs(params) do print("Wow " .. tostring(x)) end
		print(params[_M])
		print("The _M is " .. a.M)
		print("The _NAME is " .. a._NAME)
		print("The _PACKAGE is " .. a._PACKAGE)
		print("The navigation is " .. navigation)
--		table.print(buttondata)
		if filename then print("File!") else print("No file!") end
		if params.filename then print("File!") else print("No file!") end
		if a[filename] then print("File!") else print("No file!") end
		if a["filename"] then print("File!") else print("No file!") end
	end
	print("Got past it."/)
	local onkwkBforwardTouch = function(event) 
		if event.phase=="ended" then 
			local myClosure_switch = function() 
				--disposeAudios()
				--disposeTweens() 
				print("GoForward!")
				_G.kwk_currentPage = _G.kwk_currentPage + 1
				director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 
			end--function-move-to-next-page
			timerStash.tempTimer = nil
			timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1) 
		end--if-touch-ended
	end--function-button-touch
	kwkBforward = ui.newButton{ 
		defaultSrc= imageDir .. filename, 
		defaultX = 110, 
		defaultY = 87, 
		overSrc= imageDir .. filename, 
		overX = 110,
		overY = 87, 
		onRelease=onkwkBforwardTouch, 
		id="kwkBforwardButton" 
	} 
	kwkBforward.x = 476; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1 
	return kwkBforward
end--function-forward-button
]]