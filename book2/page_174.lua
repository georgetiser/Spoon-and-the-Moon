-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local audio12_aud021 = audio.loadStream( audioDir.."audio12.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local chapter12titlep  --(2) regular layer        chapter12titlep = display.newImageRect( imageDir.. "p174_chapter12titlep.png", 768, 1024 );        chapter12titlep.x = 384; chapter12titlep.y = 512; chapter12titlep.alpha = 1; chapter12titlep.oldAlpha = 1        menuGroup:insert(chapter12titlep)        menuGroup.chapter12titlep = chapter12titlep          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < numPages) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        chapter12titlep:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(audio12_aud021); audio12_aud021 =nil       audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_audio12_aud021 = function()       audio.play(audio12_aud021, {  channel=2, loops=-1, fadein=500 } )    end    timerStash.newTimer_021 = timer.performWithDelay(0, myClosure_audio12_aud021, 1)    return menuGroup end 