-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup() 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local CowStar         local BG         BG = display.newImageRect(imageDir .. "p11_bg.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        
       CowStar = display.newImageRect(imageDir .. "p11_cowstar.png", 606, 618 );        CowStar.x = 493; CowStar.y = 477; CowStar.alpha = 1; CowStar.oldAlpha = 1        menuGroup:insert(CowStar)        menuGroup.CowStar = CowStar       		--DRAG Function        local function onDrag( event )        	local t = event.target       		local phase = event.phase        	if "began" == phase then                -- Make target the top-most object                local parent = t.parent                --parent:insert( t )                display.getCurrentStage():setFocus( t )                t.isFocus = true                -- Store initial position                t.x0 = event.x - t.x                t.y0 = event.y - t.y       		elseif t.isFocus then                if "moved" == phase then                        t.x = event.x - t.x0                        t.y = event.y - t.y0                elseif "ended" == phase or "cancelled" == phase then                        display.getCurrentStage():setFocus( nil )                        t.isFocus = false                end        	end 	       return true		end       --DRAG objects        --END DRAG objects          CowStar:addEventListener("touch", onDrag ) 
	end
   drawScreen()    return menuGroup end 