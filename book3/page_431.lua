-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local path = system.pathForFile( "SpoonAndTheMoonPart3.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )     local showBackBtn = nil    print("Curr " .. _G.kwk_currentPage)    print("Last " .. _G.kwk_lastPage)    print("Cred " .. _G.kwk_lastPage)    print("..." .. _G.kwk_lastPage)    if _G.kwk_currentPage > _G.kwk_lastPage then      showBackBtn = true      print("Show True")      _G.kwk_currentPage = _G.kwk_lastPage    else      print("Show False")    end    print("Curr " .. _G.kwk_currentPage)    print("Last " .. _G.kwk_lastPage)    print("Cred " .. _G.kwk_lastPage)    navigation.DisplayDevelopmentVersion()    menuGroup.navigator = navigation.InsertNavigation{      noPageCorner = 1,      noBackButton = 1,      noForwardButton = 1    }
    local drawScreen = function()        navigation.DisplayDevelopmentVersion()       menuGroup.navigator = navigation.InsertNavigation{}        local BG         BG = display.newImageRect( imageDir.. "Book3_CreditsPage.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        BG:addEventListener("touch", flip)    end    drawScreen()    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 