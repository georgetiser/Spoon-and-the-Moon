       local onpapercornerTouch = function\(event\) 
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
       papercorner = ui\.newButton\{ 
           defaultSrc= imgDir \.\.\"(\w+)\.png\",(.+)
           defaultX = 72, 
           defaultY = 80, 
           overSrc= imgDir \.\.\"(\w+)\.png\",(.+)
           overX = 72, 
           overY = 80, 
           onRelease=onpapercornerTouch, 
           id=\"papercornerButton\" 
       } 


papercorner.x = 732; papercorner.y = 984; papercorner.alpha = 1; papercorner.oldAlpha = 1 
       menuGroup:insert(papercorner) 
       menuGroup.papercorner = papercorner 