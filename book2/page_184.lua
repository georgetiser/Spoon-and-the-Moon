-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local code         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p184_ch12pg10.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG --(2) regular layer        code = display.newImageRect( imageDir.. "p184_code.png", 298, 479 );        code.x = 619; code.y = 671; code.alpha = 1; code.oldAlpha = 1        menuGroup:insert(code)        menuGroup.code = code 


		--DRAG Function        local function onDrag( event )        	local t = event.target        	                   		local phase = event.phase        	if "began" == phase then                -- Make target the top-most object                local parent = t.parent                --parent:insert( t )                display.getCurrentStage():setFocus( t )                t.isFocus = true                 -- Store initial position                t.x0 = event.x - t.x                t.y0 = event.y - t.y       		elseif t.isFocus then                if "moved" == phase then                        t.x = event.x - t.x0                        t.y = event.y - t.y0                elseif "ended" == phase or "cancelled" == phase then                        display.getCurrentStage():setFocus( nil )                        t.isFocus = false	                        	                end        	end  	       return true		end       --DRAG objects        --END DRAG objects            code:addEventListener("touch", onDrag ) --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 