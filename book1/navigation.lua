function InsertForwardButton()


function InsertForwardButton()
	local onkwkBforwardTouch = function(event) 
		if event.phase=="ended" then 
			local myClosure_switch = function() 
				disposeAudios()
				disposeTweens() 
				print("GoForward!")
				_G.kwk_currentPage = _G.kwk_currentPage + 1
				director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" ) 
			end--function-move-to-next-page
			timerStash.tempTimer = nil
			timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1) 
		end--if-touch-ended
	end--function-button-touch
	kwkBforward = ui.newButton{ 
		defaultSrc= imgDir .."kwkBforward.png", 
		defaultX = 110, 
		defaultY = 87, 
		overSrc= imgDir .."kwkBforward.png", 
		overX = 110, 
		overY = 87, 
		onRelease=onkwkBforwardTouch, 
		id="kwkBforwardButton" 
	} 
	kwkBforward.x = 476; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1 
	menuGroup:insert(kwkBforward) 
	menuGroup.kwkBforward = kwkBforward 
end--function-forward-button
