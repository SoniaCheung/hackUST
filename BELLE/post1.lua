-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

function scene:create( event )
	local sceneGroup = self.view
	
	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
	-- create a white background to fill screen

	local bg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
	bg.anchorX = 0
	bg.anchorY = 0
	bg:setFillColor( 1 )	-- white
	
	-- -- create some text
	-- local title = display.newText( "Third View", 0, 0, native.systemFont, 32 )
	-- title:setFillColor( 0 )	-- black
	-- title.x = display.contentWidth * 0.5
	-- title.y = 125
	
	-- local newTextParams = { text = "TODO\nRONI - Blog like 扮靚Tips\n", 
	-- 						x = 0, y = 0, 
	-- 						width = 310, height = 310, 
	-- 						font = native.systemFont, fontSize = 14, 
	-- 						align = "center" }
	-- local summary = display.newText( newTextParams )
	-- summary:setFillColor( 0 ) -- black
	-- summary.x = display.contentWidth * 0.5 + 10
	-- summary.y = title.y + 215

	local pic = display.newImage ("img/button/darkWood.jpg")--, 0, 0, display.contentWidth, display.contentHeight)
	pic.height = display.contentHeight-10
	pic.width = display.contentWidth
	pic.x = display.contentWidth/2
	pic.y = display.contentHeight/2

	local panel = display.newRoundedRect (display.contentWidth/2+14, display.contentHeight/2+30, display.contentWidth-60, 1000, 20)
	panel:setFillColor(0.9, 0.66, 0.5, 0.6)
	panel.y = 530

	local scrollView = widget.newScrollView(
    	{
	        top = 0,
	        left = 0,
	        width = display.contentWidth,
	        height = display.contentHeight-30,
	        scrollWidth = display.contentWidth,
	        scrollHeight = 100,
	        topPadding = 0,
	        bottomPadding = 0,
	        horizontalScrollDisabled = true,
	        verticalScrollDisabled = false,
	        listener = scrollListener,
	        cornerRadius = 12,
	        backgroundColor = {0.9, 0.66, 0.5, 0.0}
	    }
	)

	local txtTitle = {
		text = "How NOT to Cake Your Makeup",
		x = display.contentWidth/2+40,
		y = 70,
		width = 200,
		fontSize = 20,
		font = "Arial Black",
		align = "left",
	}

	local txtContent = {
		text = "The dreaded cake face? Yeah. We’ve all been there. BUT, with a few simple tips—it’s easy to avoid this common makeup mistake. Let’s talk the four primary causes of cake face and how to remedy them…or better yet, avoid them all together!",
		x = display.contentWidth/2+20,
		y = 200,
		width = 220,
		fontSize = 16,
		font = "Arial",
		align = "left",
	}

	local txtSubtitle = {
		text = "THE CAUSE: TOO MUCH FOUNDATION OR CONCEALER",
		x = display.contentWidth/2+20,
		y = 350,
		width = 220,
		fontSize = 16,
		font = "Arial Black",
		align = "left",
	}

	local txtSubtitle2 = {
		text = "THE CURE: THIN LAYER OF FULL-COVERAGE FOUNDATION",
		x = display.contentWidth/2+20,
		y = 700,
		width = 220,
		fontSize = 16,
		font = "Arial Black",
		align = "left",
	}

	local txtContent2 = {
		text = "Let’s be honest, the majority of us weren’t blessed with perfectly flawless skin, so foundation and/or concealer are a must for covering acne, age spots, and other imperfections that are part of being, well…HUMAN! The trick though is to not go overboard. Too much foundation and concealer will begin building up, and there you have it…cake face. With frosting on top.",
		x = display.contentWidth/2+20,
		y = 520,
		width = 220,
		fontSize = 16,
		font = "Arial",
		align = "left",
	}

	local txtContent3 = {
		text = "Instead of applying multiple layers of light/medium-coverage face product to achieve your desired finish, use a Beauty Blender or foundation stippling brush to apply a THIN layer of FULL coverage foundation. If you don’t need foundation (lucky you!), apply concealer ONLY on the areas you’d like to smooth out and use your ring finger to gently blend into your natural skin.",		x = display.contentWidth/2+20,
		y = 880,
		width = 220,
		fontSize = 16,
		font = "Arial",
		align = "left",
	}

	local myText = display.newText (txtTitle)
	local myText2 = display.newText (txtContent)
	local myText3 = display.newText (txtSubtitle)
	local myText4 = display.newText (txtContent2)
	local myText5 = display.newText (txtSubtitle2)
	local myText6 = display.newText (txtContent3)

	local proPic = display.newImage ("img/profile/profileImg.png")
	proPic.height = 100
	proPic.width = 100
	proPic.x = display.contentWidth/6
	proPic.y = 50
	
	-- all objects must be added to group (e.g. self.view)
	--sceneGroup:insert( bg )
	--sceneGroup:insert( title )
	--sceneGroup:insert( summary )
	--sceneGroup:insert(scrollView)
	


	scrollView:insert(panel)
	-- scrollView:insert(proPic)
	-- scrollView:insert(myText)
	-- scrollView:insert(myText2)
	-- scrollView:insert(myText3)
	-- scrollView:insert(myText4)
	-- scrollView:insert(myText5)
	-- scrollView:insert(myText6)

	sceneGroup:insert(pic)
	sceneGroup:insert(scrollView)


end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- composer.removeScene( "post1" )

		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
