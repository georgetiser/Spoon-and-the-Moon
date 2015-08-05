-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local chpt1pv         local chpt1pvover         local CH12PG6  --(2) regular layer        CH12PG6 = display.newImageRect( imageDir.. "p180_ch12pg6.png", 768, 1024 );        CH12PG6.x = 384; CH12PG6.y = 512; CH12PG6.alpha = 1; CH12PG6.oldAlpha = 1        menuGroup:insert(CH12PG6)        menuGroup.CH12PG6 = CH12PG6        local onchpt1pvTouch = function(event)           if event.phase=="ended" then           media.playVideo( "movie_tomb.mp4", system.ResourceDirectory, false )           end        end --(10) regular layer        chpt1pv = ui.newButton{            defaultSrc=imageDir.."p180_chpt1pv.png",            defaultX = 102,            defaultY = 102,            overSrc=imageDir.."p180_chpt1pvover.png",            overX = 102,            overY = 102,            onRelease=onchpt1pvTouch,            id="chpt1pvButton"        }        chpt1pv.x = 378; chpt1pv.y = 869; chpt1pv.alpha = 1; chpt1pv.oldAlpha = 1        menuGroup:insert(chpt1pv)        menuGroup.chpt1pv = chpt1pv 


         local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < numPages) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH12PG6:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 