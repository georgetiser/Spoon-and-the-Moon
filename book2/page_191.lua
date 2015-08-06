-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local audio13_aud001 = audio.loadStream( audioDir.."audio13.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local chapter13titlep  --(2) regular layer        chapter13titlep = display.newImageRect( imageDir.. "p191_chapter13titlep.png", 768, 1024 );        chapter13titlep.x = 384; chapter13titlep.y = 512; chapter13titlep.alpha = 1; chapter13titlep.oldAlpha = 1        menuGroup:insert(chapter13titlep)        menuGroup.chapter13titlep = chapter13titlep --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(audio13_aud001); audio13_aud001 =nil       audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_audio13_aud001 = function()       audio.play(audio13_aud001, {  channel=2, loops=-1, fadein=500 } )    end    timerStash.newTimer_002 = timer.performWithDelay(0, myClosure_audio13_aud001, 1)    return menuGroup end 