-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local audio11_aud052 = audio.loadStream( audioDir.."audio11.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local chapter11titlep  --(2) regular layer        chapter11titlep = display.newImageRect( imageDir.. "p158_chapter11titlep.png", 774, 1033 );        chapter11titlep.x = 384; chapter11titlep.y = 512; chapter11titlep.alpha = 1; chapter11titlep.oldAlpha = 1        menuGroup:insert(chapter11titlep)        menuGroup.chapter11titlep = chapter11titlep          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < numPages) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        chapter11titlep:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(audio11_aud052); audio11_aud052 =nil       audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_audio11_aud052 = function()       audio.play(audio11_aud052, {  channel=2, loops=-1, fadein=500 } )    end    timerStash.newTimer_053 = timer.performWithDelay(0, myClosure_audio11_aud052, 1)    return menuGroup end 