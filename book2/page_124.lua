-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local horses_races_aud787 = audio.loadSound( audioDir.."horses_races.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p124_ch8pg10.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(horses_races_aud787); horses_races_aud787 =nil       audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    local myClosure_horses_races_aud787 = function()       audio.play(horses_races_aud787, {  channel=2, loops=-1, fadein=500 } )    end    timerStash.newTimer_788 = timer.performWithDelay(0, myClosure_horses_races_aud787, 1)    return menuGroup end 