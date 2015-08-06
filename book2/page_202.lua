-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local catvl_audio = audio.loadSound(audioDir.."v21.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local catvl         local BG  --(2) regular layer        BG = display.newImageRect( imageDir.. "p202_ch14pg4.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local oncatvlTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( catvl_audio, {channel=myChannel} )              end           end        end --(10) regular layer        catvl = ui.newButton{            defaultSrc=imageDir.."p202_catvl.png",            defaultX = 205,            defaultY = 349,            overSrc=imageDir.."p202_catvl.png",            overX = 205,            overY = 349,            onRelease=oncatvlTouch,            id="catvlButton"        }        catvl.x = 153; catvl.y = 269; catvl.alpha = 1; catvl.oldAlpha = 1        menuGroup:insert(catvl)        menuGroup.catvl = catvl --flip   end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(catvl_audio); catvl_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 