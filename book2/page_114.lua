-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local horse_race_aud469 = audio.loadStream( audioDir.."horse_race.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local CH08INTRO--(2) regular layer        CH08INTRO = display.newImageRect( imageDir.. "p114_ch08intro.png", 768, 1024 );        CH08INTRO.x = 384; CH08INTRO.y = 512; CH08INTRO.alpha = 1; CH08INTRO.oldAlpha = 1        menuGroup:insert(CH08INTRO)        menuGroup.CH08INTRO = CH08INTRO --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(horse_race_aud469); horse_race_aud469 =nil       audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_horse_race_aud469 = function()       audio.play(horse_race_aud469, {  channel=2, loops=-1, fadein=500 } )    end    timerStash.newTimer_469 = timer.performWithDelay(0, myClosure_horse_race_aud469, 1)    return menuGroup end 