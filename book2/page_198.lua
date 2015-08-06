-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local audio14_aud923 = audio.loadStream( audioDir.."audio14.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local chapter14titlep  --(2) regular layer        chapter14titlep = display.newImageRect( imageDir.. "p198_chapter14titlep.png", 768, 1024 );        chapter14titlep.x = 384; chapter14titlep.y = 512; chapter14titlep.alpha = 1; chapter14titlep.oldAlpha = 1        menuGroup:insert(chapter14titlep)        menuGroup.chapter14titlep = chapter14titlep --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(audio14_aud923); audio14_aud923 =nil       audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_audio14_aud923 = function()       audio.play(audio14_aud923, {  channel=2, loops=-1, fadein=500 } )    end    timerStash.newTimer_924 = timer.performWithDelay(0, myClosure_audio14_aud923, 1)    return menuGroup end 