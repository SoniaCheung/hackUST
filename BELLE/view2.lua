-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

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
	local title = display.newText( "Diary", 0, 0, native.systemFont, 32 )
	title:setFillColor( 0 )	-- black
	title.x = display.contentWidth * 0.5
	title.y = 32
	
	local addBackground = display.newRect( display.contentCenterX, 70, display.contentWidth * 0.8, 30 )
	addBackground:setFillColor( 0 )	
	local add = display.newText( "+", display.contentCenterX, 70, native.systemFont, 30 )
	add:setFillColor( 1 )	


	local tab1 = display.newText( "Routine", 0, 0, native.systemFont, 16 )
	local tab2 = display.newText( "Weather", 0, 0, native.systemFont, 16 )
	local tab3 = display.newText( "Satisfaction", 0, 0, native.systemFont, 16 )

	tab1.x = display.contentWidth * 0.2
	tab2.x = display.contentWidth * 0.5
	tab3.x = display.contentWidth * 0.8
	tab1.y = 110
	tab2.y = 110
	tab3.y = 110
	tab1:setFillColor( 0 )
	tab2:setFillColor( 0 )
	tab3:setFillColor( 0 )
	
	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( bg )
	sceneGroup:insert( title )
	sceneGroup:insert( tab1 )
	sceneGroup:insert( tab2 )
	addBackground:addEventListener( "tap", addList )

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

function addList()
	print( "object tapped")
end
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
