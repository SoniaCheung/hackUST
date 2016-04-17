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
	
	-- create some text
	local title = display.newText( "Third View", 0, 0, native.systemFont, 32 )
	title:setFillColor( 0 )	-- black
	title.x = display.contentWidth * 0.5
	title.y = 125
	
	local newTextParams = { text = "TODO\nRONI - Blog like 扮靚Tips\n", 
							x = 0, y = 0, 
							width = 310, height = 310, 
							font = native.systemFont, fontSize = 14, 
							align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 0 ) -- black
	summary.x = display.contentWidth * 0.5 + 10
	summary.y = title.y + 215

	local pic = display.newImage ("img/button/darkWood.jpg")--, 0, 0, display.contentWidth, display.contentHeight)
	pic.height = display.contentHeight+5
	pic.width = display.contentWidth
	pic.x = display.contentWidth/2
	pic.y = display.contentHeight/2

	local panel = display.newRoundedRect (display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight-50, 12)
	panel:setFillColor(0.9, 0.66, 0.5, 0.6)

	local scrollView = widget.newScrollView(
    	{
	        top = 25,
	        left = 40,
	        width = display.contentWidth-60,
	        height = display.contentHeight-50,
	        scrollWidth = display.contentWidth-60,
	        scrollHeight = 100,
	        topPadding = 50,
	        bottomPadding = 0,
	        horizontalScrollDisabled = true,
	        verticalScrollDisabled = false,
	        listener = scrollListener,
	        cornerRadius = 12,
	        backgroundColor = {0.9, 0.66, 0.5, 0.0}
	    }
	)

	scrollView:insert(panel)

	local proPic = display.newImage ("img/profile/profileImg.png")
	proPic.height = 100
	proPic.width = 100
	proPic.x = display.contentWidth/5
	proPic.y = 50

	
	
	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( bg )
	sceneGroup:insert( title )
	sceneGroup:insert( summary )
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
