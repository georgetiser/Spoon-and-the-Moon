
module(..., package.seeall)

-- Some major work on this remains to be done.

function InsertNavigation(params)
	--Recognized parameters:
	--In what follows, [Type] = Back, Forward, Menu, PageCorner
	--	customize[Type]Button
	--	no[Type]Button

	--back
	if _G.kwk_currentPage > _G.kwk_firstPage and not params.noBackButton then
		local backParams
		backParams = initializeArray(defaultNavigation.defaultBackButton)
		if params.customizeBackButton then --load customizations
			for k,v in pairs(params.customizeBackButton) do buttonparams[k] = v end
		end
		InsertAButton{
			id = backParams.id,
			imageFile = backParams.imageFile,
			width = backParams.width,
			height = backParams.height,
			x = backParams.x,
			y = backParams.y,
			destinationPage = backParams.destinationPage or _G.kwk_currentPage - 1,
			transitionEffect = backParams.transitionEffect or "moveFromLeft",
			interstitial = backParams.interstitial,
			touchSound = backParams.touchSound,
			customization = params.customizeBackButton
		}
	end--back-button

	if _G.kwk_currentPage < _G.kwk_lastPage and not params.noForwardButton then
		local forwardParams
		forwardParams = initializeArray(defaultNavigation.defaultForwardButton)
		if params.customizeForwardButton then
			for k,v in pairs(params.customizeForwardButton) do forwardParams[k] = v end
		end
		forwardParams.customization = params.customizeForwardButton
		--destination must be set manually
		--(because the current page number varies)
		forwardParams.destinationPage = _G.kwk_currentPage + 1
		InsertAButton(forwardParams)
	end--forward-button

	if not params.noMenuButton then
		local menuParams
		menuParams = initializeArray(defaultNavigation.defaultMenuButton)
		if params.customizeMenuButton then --load customizations
			for k,v in pairs(params.customizeMenuButton) do menuParams[k] = v end
		end--if
		InsertAButton{
			id = menuParams.id,
			imageFile = menuParams.imageFile,
			alpha = menuParams.alpha,
			width = menuParams.width,
			height = menuParams.height,
			x = menuParams.x,
			y = menuParams.y,
			destinationPage = menuParams.destinationPage or _G.kwk_menuPage,
			transitionEffect = menuParams.transitionEffect or "moveFromLeft",
			interstitial = menuParams.interstitial,
			touchSound = menuParams.touchSound,
			customization = params.customizeMenuButton
		}
	end--menu-button

	--page corner
	if not params.noPageCorner then
		PageCornerGroup = display.newGroup()
		-- page corner button
		if not params.noPageCornerButton then
			local pageCornerParams
			pageCornerParams = initializeArray(defaultNavigation.defaultPageCornerButton)
			if params.customizePageCornerButton then --load customizations
				for k,v in pairs(params.customizePageCornerButton) do
					statusreport.debugPrint(k .. " ... " .. v)
					pageCornerParams[k] = v
				end
			end
			local pageCornerButton
			pageCornerButton = InsertAButton{
				id = pageCornerParams.id,
				imageFile = pageCornerParams.imageFile,
				alpha = pageCornerParams.alpha,
				width = pageCornerParams.width,
				height = pageCornerParams.height,
				x = pageCornerParams.x,
				y = pageCornerParams.y,
				destinationPage = pageCornerParams.destinationPage or _G.kwk_menuPage,
				transitionEffect = pageCornerParams.transitionEffect or "moveFromLeft",
				interstitial = pageCornerParams.interstitial or nil,
				touchSound = pageCornerParams.touchSound or nil,
				customization = params.customizePageCornerButton or nil
			}
		PageCornerGroup:insert(pageCornerButton)
		end--page-corner-button
		--page number text
		if not params.noPageNumberText then
			local pageNumberTextParams = {}
			pageNumberTextParams = initializeArray(defaultNavigation.defaultPageNumberText)
			if params.customizePageNumberText then --load customizations
				for k,v in pairs(params.customizePageNumberText) do
					pageNumberTextParams[k] = v
					statusreport.debugPrint("Custom: " .. k .. " = " .. v)
				end--pairs
			end--if-custom-options
			pageNumberTextParams.x = pageNumberTextParams.x - (pageNumberTextParams.xOffset * string.len(_G.kwk_currentPage))
			PageNumberText = display.newText("" .. _G.kwk_currentPage .. "", pageNumberTextParams.x, pageNumberTextParams.y, pageNumberTextParams.fontname, pageNumberTextParams.fontsize)
			PageNumberText:setFillColor(1,1,1)
			PageCornerGroup:insert(PageNumberText)
		end--if-page-number-text
	end--pageNumber-button
end--function-create-navigation

function InsertAButton(params)
	local width = 100
	local height = 100
	local x = 100
	local y = 100
	local imageFile = imageDir .. "blankbutton.png"
	local destinationPage = _G.kwk_firstPage
	local transitionEffect = "fade"
	local id = "DefaultButtonID"
	if params.width then width = params.width end
	if params.height then height = params.height end
	if params.imageFile then imageFile = params.imageFile end
	if params.x then x = params.x end
	if params.y then y = params.y end
	if params.destinationPage then destinationPage = params.destinationPage end
	if params.transitionEffect then transitionEffect = params.transitionEffect end
	if params.id then id = params.id end
	local function DoWhenPressed(self, event)
		local userPress = event.phase
		if userPress == "ended" then
			local goOnward = function() 
				cancelAllSounds()
				cancelAllTweens()
				cancelAllTimers()
				cancelAllTransitions()
				if params.touchSound then
					soundeffects.PlayASound{filename = params.touchSound}					
				end
				if params.interstitial then
					verifyVideoExists = io.open(params.interstitial, "r")
					media.playVideo(params.interstitial, system.ResourceDirectory, false )
				end
				_G.kwk_currentPage = destinationPage
				director:changeScene( "page_" .. _G.kwk_currentPage, transitionEffect ) 
			end--onward-function
			timerStash.navTimer = nil;
			timerStash.navTimer = timer.performWithDelay(0, goOnward, 1)
		end--if-press-ended
	end--function-when-pressed
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

function addObject(params)
	statusreport.debugPrint("ya")
end