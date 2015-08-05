-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
        local indian
local CH12PG8  --(2) regular layer        CH12PG8 = display.newImageRect( imageDir.. "p182_ch12pg8.png", 768, 1024 );        CH12PG8.x = 384; CH12PG8.y = 512; CH12PG8.alpha = 1; CH12PG8.oldAlpha = 1        menuGroup:insert(CH12PG8)        menuGroup.CH12PG8 = CH12PG8 


 --(2) regular layer        indian = display.newImageRect( imageDir.. "p182_indian.png", 441, 537 );        indian.x = 82; indian.y = 477; indian.alpha = 1; indian.oldAlpha = 1        menuGroup:insert(indian)        menuGroup.indian = indian          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < numPages) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH12PG8:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 