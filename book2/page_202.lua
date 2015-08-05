-- Code created by Kwik - Copyright: kwiksher.com -- Version: 1.9.7a module(..., package.seeall)  function new() 
    local menuGroup = display.newGroup() 
    local disposeAudios     local disposeTweens     local catvl_audio = audio.loadSound(audioDir.."v21.mp3" )     local path = system.pathForFile( "SpoonAndTheMoonPart2.txt", system.DocumentsDirectory ) 
    local file = io.open( path, "w+" ) 
    file:write( _G.kwk_currentPage ) 
    io.close( file ) 

    local drawScreen = function()

		 navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}


local catvl         local CH14PG4  --(2) regular layer        CH14PG4 = display.newImageRect( imageDir.. "p202_ch14pg4.png", 768, 1024 );        CH14PG4.x = 384; CH14PG4.y = 512; CH14PG4.alpha = 1; CH14PG4.oldAlpha = 1        menuGroup:insert(CH14PG4)        menuGroup.CH14PG4 = CH14PG4        local oncatvlTouch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( catvl_audio, {channel=myChannel} )              end           end        end --(10) regular layer        catvl = ui.newButton{            defaultSrc=imageDir.."p202_catvl.png",            defaultX = 205,            defaultY = 349,            overSrc=imageDir.."p202_catvl.png",            overX = 205,            overY = 349,            onRelease=oncatvlTouch,            id="catvlButton"        }        catvl.x = 153; catvl.y = 269; catvl.alpha = 1; catvl.oldAlpha = 1        menuGroup:insert(catvl)        menuGroup.catvl = catvl          local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()                     disposeTweens()                     director:changeScene( "page_".._G.kwk_currentPage-1, "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < numPages) then                      disposeAudios()                     disposeTweens()                     director:changeScene("page_".._G.kwk_currentPage+1, "moveFromRight")                 end              end           end        end        CH14PG4:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(catvl_audio); catvl_audio = nil                           audio.stop(3); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 