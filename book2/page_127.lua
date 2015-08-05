-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local audio9_aud176 = audio.loadStream( audioDir.."audio9.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local chapter9titlepa  --(2) regular layer        chapter9titlepa = display.newImageRect( imageDir.. "p127_chapter9titlepa.png", 768, 1024 );        chapter9titlepa.x = 384; chapter9titlepa.y = 512; chapter9titlepa.alpha = 1; chapter9titlepa.oldAlpha = 1        menuGroup:insert(chapter9titlepa)        menuGroup.chapter9titlepa = chapter9titlepa          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < numPages) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        chapter9titlepa:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(audio9_aud176); audio9_aud176 =nil       audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_audio9_aud176 = function()       audio.play(audio9_aud176, {  channel=2, loops=-1, fadein=500 } )    end    timerStash.newTimer_177 = timer.performWithDelay(0, myClosure_audio9_aud176, 1)    return menuGroup end 