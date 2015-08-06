
module(..., package.seeall)

-- Some major work on this remains to be done.

function bookNavigation(params)
	--Recognized parameters:
	--In what follows, [Type] = Back, Forward, Menu, PageCorner
	--	customize[Type]Button
	--	no[Type]Button
	--
	local navigationGroup = display.newGroup() 
	-- back
	if _G.kwk_currentPage > _G.kwk_firstPage and not params.noBackButton then
		local backParams
		backParams = initializeArray(defaultNavigation.defaultBackButton)
		if params.customizeBackButton then --load customizations
			for k,v in pairs(params.customizeBackButton) do backParams[k] = v end
		end
		backParams.customization = params.customizeBackButton
		--destination must be set manually (because the current page number varies)
		backParams.destinationPage = _G.kwk_currentPage - 1
		backButton = newObject(backParams)
		navigationGroup:insert(backButton)
		navigationGroup.backButton = backButton
	end--back-button
	--
	-- forward
	if _G.kwk_currentPage < _G.kwk_lastPage and not params.noForwardButton then
		local forwardParams
		forwardParams = initializeArray(defaultNavigation.defaultForwardButton)
		if params.customizeForwardButton then
			for k,v in pairs(params.customizeForwardButton) do forwardParams[k] = v end
		end
		forwardParams.customization = params.customizeForwardButton
		--destination must be set manually (because the current page number varies)
		forwardParams.destinationPage = _G.kwk_currentPage + 1
		newObject(forwardParams)
	end--forward-button
	--
	-- menu
	if not params.noMenuButton then
		local menuParams
		menuParams = initializeArray(defaultNavigation.defaultMenuButton)
		if params.customizeMenuButton then --load customizations
			for k,v in pairs(params.customizeMenuButton) do menuParams[k] = v end
		end--if
		menuParams.customization = params.customizeMenuButton
		if not menuParams.destinationPage then menuParams.destinationPage = _G.kwk_menuPage end
		newObject(menuParams)
	end--menu-button
	--
	--page corner
	if not params.noPageCorner then
		PageCornerGroup = display.newGroup()
		-- page corner button
		if not params.noPageCornerButton then
			local pageCornerParams
			pageCornerParams = initializeArray(defaultNavigation.defaultPageCornerButton)
			if params.customizePageCornerButton then --load customizations
				for k,v in pairs(params.customizePageCornerButton) do
					pageCornerParams[k] = v
				end
				pageCornerParams.customization = params.customizePageCornerButton
				if not pageCornerParams.destinationPage then pageCornerParams.destinationPage = _G.kwk_pageCornerPage end
				newObject(pageCornerParams)
			end
			--PageCornerGroup:insert(pageCornerButton)
		end--page-corner-button
		--
		--page number text
		if not params.noPageNumberText then
			local pageNumberTextParams = {}
			pageNumberTextParams = initializeArray(defaultNavigation.defaultPageNumberText)
			if params.customizePageNumberText then --load customizations
				for k,v in pairs(params.customizePageNumberText) do
					pageNumberTextParams[k] = v
--debugPrint("Custom: " .. k .. " = " .. v)
				end--pairs
			end--if-custom-options
			pageNumberTextParams.x = pageNumberTextParams.x - (pageNumberTextParams.xOffset * string.len(_G.kwk_currentPage))
			PageNumberText = display.newText("" .. _G.kwk_currentPage .. "", pageNumberTextParams.x, pageNumberTextParams.y, pageNumberTextParams.fontname, pageNumberTextParams.fontsize)
			PageNumberText:setFillColor(1,1,1)
			PageCornerGroup:insert(PageNumberText)
		end--if-page-number-text
	end--pageNumber-button
	return navigationGroup
end--function-create-navigation


--
--
--


function newObject(obj)

	function obj:wtfIsGoingOn()
--debugPrint(" ")
--debugPrint("new object")
		for k, v in pairs(self) do
--debugPrint("k " .. k .. " type " .. type(v) .. " value " .. v)
		end
	end--wtf

	if not obj.imageDir and imageDir then obj.imageDir = imageDir end
	if not obj.alpha then obj.alpha = 0.99 end
	if not obj.name and obj.id then obj.name = obj.id end
	if not obj.name and obj._id then obj.name = obj._id end

	obj.categoryIncludes = function(catToCheck)
		return string.find(obj.category, catToCheck)
	end

	if obj.categoryIncludes("background") then
		if not obj.x then obj.x = 384 end
		if not obj.y then obj.y = 512 end
		if not obj.width then obj.width = 768 end
		if not obj.height then obj.height = 1024 end
		if not obj.name then obj.name = "background" end
	end
	if obj.categoryIncludes("transparent") and not obj.imageFile then obj.imageFile = obj.imageDir .. "transparentbutton.png" end

	-- validation / error checking:
	local errMsg = "Object [" .. obj.name .. "]"
	if obj.x and obj.y and obj.imageFile and obj.name then
		errMsg = errMsg .. ":" .. "[" .. obj.imageFile .. "]"
	else
		if not obj.x then obj.x = 100; errMsg = errMsg .. " ?X" end
		if not obj.y then obj.y = 100; errMsg = errMsg .. " ?Y" end
		if not obj.imageFile then obj.imageFile = obj.imageDir .. "blankbutton.png"; errMsg = errMsg .. " ?FILE" end
		if not obj.name and obj.imageFile then obj.name = "Img" .. obj.imageFile .. "-" .. system.getTimer(); errMsg = errMsg .. " ?ID" end
		if not obj.name then obj.name = "defaultObject-" .. _G.kwk_currentPage .. "-" .. system.getTimer(); errMsg = errMsg .. " ?ID" end
	end
	if obj.imageDir and string.sub(obj.imageFile, 1, string.len(obj.imageDir)) ~= obj.imageDir then obj.imageFile = obj.imageDir .. obj.imageFile end

	local newObj = display.newGroup()

	local newObjImage
	if obj.width and obj.height then
		newObjImage = display.newImageRect(obj.imageFile, obj.width, obj.height)
		newObj:insert(newObjImage, true)
	else
		errMsg = errMsg .. " ?DIM"
		newObjImage = display.newImage(obj.imageFile)
		newObj:insert(newObjImage, true)
	end

	if obj.categoryIncludes("button") then
		errMsg = errMsg .. " button"
		local doWhenPressed = function(self, event)
			local userPress = event.phase
			if userPress == "ended" then
--debugPrint("pressed")
				if obj.customEffect and type(obj.customEffect) == "function" then customEffect() end
				if obj.touchSound then soundeffects.PlayASound{filename = obj.touchSound} end
				if obj.interstitial then media.playVideo(obj.interstitial, system.ResourceDirectory, false ) end
				if obj.categoryIncludes("navigation") then
					function goOnward()
						cancelAllSounds();cancelAllTweens();cancelAllTimers();cancelAllTransitions()
						if not obj.transitionEffect then
							obj.transitionEffect = "fade"
							errMsg = errMsg .. " ?TRANS"
						end
						if obj.destinationPage and obj.destinationPage <= _G.kwk_lastPage and obj.destinationPage >= _G.kwk_firstPage then
							_G.kwk_currentPage = obj.destinationPage
						else
							errMsg = errMsg .. " ?DEST"
						end
						director:changeScene( "page_" .. _G.kwk_currentPage, obj.transitionEffect )
					end--function
				end--navigation
				timerStash.navTimer = nil;
				timerStash.navTimer = timer.performWithDelay(0, goOnward, 1)
			end--if-press-ended
		end--function-when-pressed
		newObj.touch = DoWhenPressed
		newObj:addEventListener("touch", newObj)
	end

	newObj.isActive = true
	if obj.categoryIncludes("hidden") then newObj.isVisible = false else newObj.isVisible = true end
	newObj._id = obj.name
	newObj.x = obj.x
	newObj.y = obj.y
	newObj.alpha = obj.alpha
--debugPrint(errMsg)
	return newObj
end

--[[
	if obj.categoryIncludes("button") then
		local function DoWhenPressed(self, event)
			local userPress = event.phase
			if userPress == "ended" then
				obj.doWhenPressed();
				timerStash.navTimer = nil;
				timerStash.navTimer = timer.performWithDelay(0, goOnward, 1)
			end--if-press-ended
		end--function-when-pressed
		newObj.touch = DoWhenPressed
		newObj:addEventListener("touch", newObj)
	end

	return newObj
end]]

--[[
	if obj.categoryIncludes("button") then
--debugPrint("derp")
	end
	local destinationPage = _G.kwk_menuPage
	local transitionEffect = "fade"
	local id = "DefaultButtonID"
	if obj.destinationPage then destinationPage = obj.destinationPage end
	if obj.transitionEffect then transitionEffect = obj.transitionEffect end
	if obj.id then id = obj.id end
	if obj.categoryIncludes("navigation") then
		local function DoWhenPressed(self, event)
			local userPress = event.phase
			if userPress == "ended" then
				local goOnward = function() 
					cancelAllSounds()
					cancelAllTweens()
					cancelAllTimers()
					cancelAllTransitions()
					if obj.touchSound then
						soundeffects.PlayASound{filename = obj.touchSound}					
					end
					if obj.interstitial then
						verifyVideoExists = io.open(obj.interstitial, "r")
						if verifyVideoExists then media.playVideo(obj.interstitial, system.ResourceDirectory, false ) end
					end
					_G.kwk_currentPage = destinationPage
					director:changeScene( "page_" .. _G.kwk_currentPage, transitionEffect ) 
				end--onward-function
				timerStash.navTimer = nil;
				timerStash.navTimer = timer.performWithDelay(0, goOnward, 1)
			end--if-press-ended
		end--function-when-pressed
	end
	button = display.newGroup()
	buttonImage = display.newImageRect(imageFile, width, height)
	button:insert(buttonImage, true)
	button.isActive = true
	button.isVisible = true
	button.touch = DoWhenPressed
	button:addEventListener("touch", button)
	button._id = id
	button.x = x
	button.y = y
	button.alpha = 1
	button.oldAlpha = 1 
	return button
end--function-insert-button
]]

function DisplayDevelopmentVersion()
	if _G.kwk_ShowDebugOutput then
		if not _G.kwk_DebugText1_t then InitializeDevelopmentVersionText() end
		devtxt1 = display.newText(_G.kwk_DebugText1_t, _G.kwk_DebugText1_x, _G.kwk_DebugText1_y, _G.kwk_DebugText1_w, _G.kwk_DebugText1_h, _G.kwk_DebugText1_f, _G.kwk_DebugText1_s); devtxt1:setFillColor(_G.kwk_DebugText1_cr,_G.kwk_DebugText1_cg,_G.kwk_DebugText1_cb); devtxt1.alpha = 1
		devtxt2 = display.newText(_G.kwk_DebugText2_t, _G.kwk_DebugText2_x, _G.kwk_DebugText2_y, _G.kwk_DebugText2_w, _G.kwk_DebugText2_h, _G.kwk_DebugText2_f, _G.kwk_DebugText2_s); devtxt2:setFillColor(_G.kwk_DebugText2_cr,_G.kwk_DebugText2_cg,_G.kwk_DebugText2_cb); devtxt2.alpha = 1
		devtxt3 = display.newText(_G.kwk_DebugText3_t, _G.kwk_DebugText3_x, _G.kwk_DebugText3_y, _G.kwk_DebugText3_w, _G.kwk_DebugText3_h, _G.kwk_DebugText3_f, _G.kwk_DebugText3_s); devtxt3:setFillColor(_G.kwk_DebugText3_cr,_G.kwk_DebugText3_cg,_G.kwk_DebugText3_cb); devtxt3.alpha = 1
	end--if
end--function display-development-version

function InitializeDevelopmentVersionText()
if not _G.kwk_DebugBuildVersion then _G.kwk_DebugBuildVersion = "-------------" end
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

function initializeArray(defaulttable)
	local newtable = {}
	if type(defaulttable) == "table" then
		for k,v in pairs(defaulttable) do
			newtable[k] = v
		end
	end--if
	return newtable
end--function

function validateObjectParameters(params)
end