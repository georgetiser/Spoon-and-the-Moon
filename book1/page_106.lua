-- Code created by Kwik - Copyright: kwiksher.com 
-- Version: 2.4.6 

module(..., package.seeall) 
 function new()     local menuGroup = display.newGroup()     local elsa_audio = audio.loadSound(audioDir .. "click.mp3", system.ResourceDirectory) 
    statusreport.debugPrint("----------------"); statusreport.debugPrint(""); statusreport.debugPrint("New Page") 
    statusreport.debugPrint("The current page is: " .. _G.kwk_currentPage) 

    local path = system.pathForFile( "SpoonAndTheMoonPart1.txt", system.CachesDirectory )     local file = io.open( path, "w+" )     file:write( _G.kwk_currentPage )     io.close( file )   local drawScreen = function()

		navigation.DisplayDevelopmentVersion()
		menuGroup.navigator = navigation.InsertNavigation{}
       local showhhide         local elsa         local BG         BG = display.newImageRect(imageDir .. "p105_ch7pg7.png", 768, 1024 );        BG.x = 384; BG.y = 512; BG.alpha = 1; BG.oldAlpha = 1        menuGroup:insert(BG)        menuGroup.BG = BG        local onelsaTouch = function(event)           if event.phase=="ended" then                  if showhhide.alpha == 0 then                    transitionStash.newTransition_208 = transition.to( showhhide, {alpha=showhhide.oldAlpha, time=1000, delay=0})                 else                    transitionStash.newTransition_208 = transition.to( showhhide, {alpha=0, time=1000, delay=0})                 end              local myChannel = 2              local isChannelPlaying = audio.isChannelPlaying(myChannel)              if isChannelPlaying then                 --nothing              else                 audio.play( elsa_audio, {channel=myChannel} )              end           end        end        elsa = ui.newButton{            defaultSrc= imageDir .."p105_elsa.png",            defaultX = 211,            defaultY = 438,            overSrc= imageDir .."p105_elsa.png",            overX = 211,            overY = 438,            onRelease=onelsaTouch,            id="elsaButton"        }        elsa.x = 621; elsa.y = 650; elsa.alpha = 1; elsa.oldAlpha = 1        menuGroup:insert(elsa)        menuGroup.elsa = elsa        showhhide = display.newImageRect(imageDir .. "p105_showhhide.png", 385, 196 );        showhhide.x = 358; showhhide.y = 419; showhhide.alpha = 1; showhhide.oldAlpha = 1        menuGroup:insert(showhhide)        menuGroup.showhhide = showhhide --local PageZZCorner              showhhide.alpha = 0 
	end
   drawScreen()    return menuGroup end 