-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local disposeAudios     local disposeTweens     local saw1_audio = audio.loadSound(audioDir .. "saw.mp3", system.ResourceDirectory)     local saw2_audio = audio.loadSound(audioDir .. "tablesaw.mp3", system.ResourceDirectory)     local saw3_audio = audio.loadSound(audioDir .. "chainsaw.mp3", system.ResourceDirectory)     local bs_audio = audio.loadSound(audioDir .. "click9.mp3", system.ResourceDirectory)     local kwkBindex_audio = audio.loadSound(audioDir .. "indexflip.mp3", system.ResourceDirectory) 
    print("----------------"); print(""); print("New Page") 
    print("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "book.txt", system.DocumentsDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()


navigation.DisplayDevelopmentVersion()



       local kwkBback         local kwkBindex  
       local kwkPageCorner 
       local kwkBforward         --local PageXCorner         local showhide         local bs         local saw3         local saw2         local saw1         local CH02PG5         CH02PG5 = display.newImageRect(imageDir .. "p29_ch02pg5.png", 768, 1024 );        CH02PG5.x = 384; CH02PG5.y = 512; CH02PG5.alpha = 1; CH02PG5.oldAlpha = 1        menuGroup:insert(CH02PG5)        menuGroup.CH02PG5 = CH02PG5        local onsaw1Touch = function(event)           if event.phase=="ended" then               local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( saw1_audio, {channel=myChannel} )              end           end        end        saw1 = ui.newButton{            defaultSrc= imageDir .."p29_saw1.png",            defaultX = 132,            defaultY = 113,            overSrc= imageDir .."p29_saw1.png",            overX = 132,            overY = 113,            onRelease=onsaw1Touch,            id="saw1Button"        }        saw1.x = 125; saw1.y = 820; saw1.alpha = 1; saw1.oldAlpha = 1        menuGroup:insert(saw1)        menuGroup.saw1 = saw1        local onsaw2Touch = function(event)           if event.phase=="ended" then               local myChannel = 3              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( saw2_audio, {channel=myChannel} )              end           end        end        saw2 = ui.newButton{            defaultSrc= imageDir .."p29_saw2.png",            defaultX = 197,            defaultY = 141,            overSrc= imageDir .."p29_saw2.png",            overX = 197,            overY = 141,            onRelease=onsaw2Touch,            id="saw2Button"        }        saw2.x = 120; saw2.y = 138; saw2.alpha = 1; saw2.oldAlpha = 1        menuGroup:insert(saw2)        menuGroup.saw2 = saw2        local onsaw3Touch = function(event)           if event.phase=="ended" then               local myChannel = 4              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( saw3_audio, {channel=myChannel} )              end           end        end        saw3 = ui.newButton{            defaultSrc= imageDir .."p29_saw3.png",            defaultX = 157,            defaultY = 132,            overSrc= imageDir .."p29_saw3.png",            overX = 157,            overY = 132,            onRelease=onsaw3Touch,            id="saw3Button"        }        saw3.x = 633; saw3.y = 191; saw3.alpha = 1; saw3.oldAlpha = 1        menuGroup:insert(saw3)        menuGroup.saw3 = saw3        local onbsTouch = function(event)           if event.phase=="ended" then                  if showhide.alpha == 0 then                    transitionStash.newTransition_988 = transition.to( showhide, {alpha=showhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_988 = transition.to( showhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 5              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( bs_audio, {channel=myChannel} )              end           end        end        bs = ui.newButton{            defaultSrc= imageDir .."p29_bs.png",            defaultX = 114,            defaultY = 194,            overSrc= imageDir .."p29_bs.png",            overX = 114,            overY = 194,            onRelease=onbsTouch,            id="bsButton"        }        bs.x = 711; bs.y = 580; bs.alpha = 1; bs.oldAlpha = 1        menuGroup:insert(bs)        menuGroup.bs = bs        showhide = display.newImageRect(imageDir .. "p29_showhide.png", 393, 250 );        showhide.x = 504; showhide.y = 574; showhide.alpha = 1; showhide.oldAlpha = 1        menuGroup:insert(showhide)        menuGroup.showhide = showhide --local PageZZCorner--local PageXXCorner
--XpaperXcornerX




       local onkwkBforwardTouch = function(event)           if event.phase=="ended" then              local myClosure_switch = function()                 disposeAudios()
                disposeTweens() 
                print("GoForward!")
                _G.kwk_currentPage = _G.kwk_currentPage + 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromRight" )             end             timerStash.tempTimer = nil             timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1)           end        end        kwkBforward = ui.newButton{            defaultSrc= imageDir .."kwkBforward.png",            defaultX = 110,            defaultY = 87,            overSrc= imageDir .."kwkBforward.png",            overX = 110,            overY = 87,            onRelease=onkwkBforwardTouch,            id="kwkBforwardButton"        }        kwkBforward.x = 476; kwkBforward.y = 975; kwkBforward.alpha = 1; kwkBforward.oldAlpha = 1        menuGroup:insert(kwkBforward)        menuGroup.kwkBforward = kwkBforward --PageNum Begin
       local onkwkPageCornerTouch = function(event) 
          if event.phase=="ended" then  
            local myClosure_switch = function() 
                disposeAudios()
                disposeTweens() 
                _G.kwk_currentPage = _G.kwk_menuPage
                print("GoToMenu!")
                director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )
            end 
            timerStash.tempTimer = nil 
            timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1) 
          end 
       end 
       kwkPageCorner = ui.newButton{ 
           defaultSrc= imageDir .."PageCornerGrey.png", 
           defaultX = 72, 
           defaultY = 80, 
           overSrc= imageDir .."PageCornerGrey.png", 
           overX = 72, 
           overY = 80, 
           onRelease=onkwkPageCornerTouch, 
           id="kwkPageCornerButton" 
       } 
       kwkPageCorner.x = 732; kwkPageCorner.y = 984; kwkPageCorner.alpha = 1; kwkPageCorner.oldAlpha = 1 
       menuGroup:insert(kwkPageCorner) 
       menuGroup.kwkPageCorner = kwkPageCorner 
--TEXTFORPAGENUMBEGIN
local crnrtxtoffset = 730; if _G.kwk_currentPage < 99 then crnrtxtoffset = 737 end; if _G.kwk_currentPage < 9 then crnrtxtoffset = 745 end
crnrtxt = display.newText("" .. _G.kwk_currentPage .. "", crnrtxtoffset, 995, "Arbutus Slab", 20); crnrtxt:setFillColor(0,0,0)
--TEXTFORPAGENUMEND



--PageNum End

       local onkwkBindexTouch = function(event) 
          if event.phase=="ended" then
            soundeffects.PlayASound{filename = audioDir .. "indexflip.mp3"}  
             local myClosure_switch = function()                 disposeAudios()
                disposeTweens() 
                _G.kwk_currentPage = _G.kwk_menuPage
                print("GoToMenu!")
                director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )             end             timerStash.tempTimer = nil             timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1)           end        end        kwkBindex = ui.newButton{            defaultSrc= imageDir .."kwkBindex.png",            defaultX = 66,            defaultY = 69,            overSrc= imageDir .."kwkBindex.png",            overX = 66,            overY = 69,            onRelease=onkwkBindexTouch,            id="kwkBindexButton"        }        kwkBindex.x = 383; kwkBindex.y = 969; kwkBindex.alpha = 1; kwkBindex.oldAlpha = 1        menuGroup:insert(kwkBindex)        menuGroup.kwkBindex = kwkBindex        local onkwkBbackTouch = function(event) 
          if event.phase=="ended" then            local myClosure_switch = function()                 disposeAudios()
                disposeTweens() 
                print("GoBack!")
                _G.kwk_currentPage = _G.kwk_currentPage - 1
                director:changeScene( "page_" .. _G.kwk_currentPage, "moveFromLeft" )             end             timerStash.tempTimer = nil             timerStash.tempTimer = timer.performWithDelay(0, myClosure_switch, 1)           end        end        kwkBback = ui.newButton{            defaultSrc= imageDir .."kwkBback.png",            defaultX = 111,            defaultY = 88,            overSrc= imageDir .."kwkBback.png",            overX = 111,            overY = 88,            onRelease=onkwkBbackTouch,            id="kwkBbackButton"        }        kwkBback.x = 293; kwkBback.y = 973; kwkBback.alpha = 1; kwkBback.oldAlpha = 1        menuGroup:insert(kwkBback)        menuGroup.kwkBback = kwkBback        showhide.alpha = 0        local function flip (event)           local spacer = 180            if event.phase =="ended" then               if event.xStart < event.x and (event.x - event.xStart) >= spacer then                 if (_G.kwk_currentPage > 1) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene( "page_" .. _G.kwk_currentPage-1 .. ".lua", "moveFromLeft" )                 end              elseif event.xStart > event.x and (event.xStart-event.x) >= spacer then                  if (_G.kwk_currentPage < _G.kwk_lastPage) then                      disposeAudios()
                    disposeTweens() 
                    director:changeScene("page_" .. _G.kwk_currentPage+1 .. ".lua", "moveFromRight")                 end              end           end        end        CH02PG5:addEventListener("touch", flip)    end    drawScreen()    function disposeAudios(event)                    audio.stop(2); audio.dispose(saw1_audio); saw1_audio = nil                           audio.stop(3); audio.dispose(saw2_audio); saw2_audio = nil                           audio.stop(4); audio.dispose(saw3_audio); saw3_audio = nil                           audio.stop(5); audio.dispose(bs_audio); bs_audio = nil                            -- audio.stop(13); audio.dispose(kwkBindex_audio); kwkBindex_audio = nil                        end    function disposeTweens(event)       cancelAllTweens();       cancelAllTimers();       cancelAllTransitions();    end    return menuGroup end 