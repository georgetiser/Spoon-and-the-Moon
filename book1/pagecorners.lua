       local onSoutheastCornerTouch = function(event) 
          if event.phase=="ended" then  
            local myClosure_switch = function() 
                disposeTweens() 
                _G.kwk_currentPage = _G.kwk_menuPage
                print("GoToMenu!")
                director:changeScene( "page_" .. _G.kwk_menuPage, "overFromTop" )
            end 
            timerStash.newTimer_518 = timer.performWithDelay(0, myClosure_switch, 1) 
          end 
       end 
--(10) regular layer 
       SoutheastCorner = ui.newButton{ 
           defaultSrc= imgDir .."PageCornerGrey.png", 
           defaultX = 72, 
           defaultY = 80, 
           overSrc= imgDir .."PageCornerGrey.png", 
           overX = 72, 
           overY = 80, 
           onRelease=onSoutheastCornerTouch, 
           id="SoutheastCornerButton" 
       } 
       SoutheastCorner.x = 732; SoutheastCorner.y = 984; SoutheastCorner.alpha = 1; SoutheastCorner.oldAlpha = 1 
       menuGroup:insert(SoutheastCorner) 
       menuGroup.SoutheastCorner = SoutheastCorner 

       crnrtxt = display.newText("" .. _G.kwk_currentPage .. "", 750, 1005, "Arbutus Slab", 20)
       crnrtxt:setFillColor(0,0,0) --black





       local onPageCornerTouch = function\(event\) 
          if event.phase==\"ended\" then  
            local myClosure\_switch = function\(\) 
                disposeTweens\(\) 
                \_G\.kwk\_currentPage = \_G\.kwk\_menuPage
                print\(\"GoToMenu!\"\)
                director:changeScene\( \"page\_\" \.\. \_G\.kwk\_menuPage, \"overFromTop\" \)
            end 
            timerStash\.newTimer\_(\d+) = timer\.performWithDelay\(0, myClosure_switch, 1\) 
          end 
       end 
--\(10\) regular layer 
       PageCorner = ui\.newButton\{ 
           defaultSrc= imgDir \.\.\"PageCornerGrey\.png\",(.+)
           defaultX = (\d+), 
           defaultY = (\d+), 
           overSrc= imgDir \.\.\"PageCornerGrey.png\",(.+)
           overX = (\d+), 
           overY = (\d+), 
           onRelease=onPageCornerTouch, 
           id="PageCornerButton" 
       } 
       PageCorner.x = 732; PageCorner.y = 984; PageCorner.alpha = 1; PageCorner.oldAlpha = 1 
       menuGroup:insert(PageCorner) 
       menuGroup.PageCorner = PageCorner 

       crnrtxt = display.newText("" .. _G.kwk_currentPage .. "", 750, 1005, "Arbutus Slab", 20)
       crnrtxt:setFillColor(0,0,0) --black














       local onPageCornerTouch = function\(event\) 
          if event.phase==\"ended\" then  
            local myClosure\_switch = function\(\) 
                disposeTweens\(\) 
                \_G\.kwk\_currentPage = \_G\.kwk\_menuPage
                print\(\"GoToMenu!\"\)
                director:changeScene\( \"page\_\" \.\. \_G\.kwk\_menuPage, \"overFromTop\" \)
            end 
            timerStash\.newTimer\_(\d+) = timer\.performWithDelay\(0, myClosure_switch, 1\) 
          end 
       end 
--\(10\) regular layer 
       PageCorner = ui\.newButton\{ 
           defaultSrc= imgDir \.\.\"(\w+)\.png\",(.+)
           defaultX = 72, 
           defaultY = 80, 
           overSrc= imgDir \.\.\"(\w+)\.png\",(.+)
           overX = 72, 
           overY = 80, 
           onRelease=onPageCornerTouch, 
           id=\"PageCornerButton\" 
       } 
