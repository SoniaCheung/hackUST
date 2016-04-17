-----------------------------------------------------------------------------------------
--
-- view1.lua
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
	bg:setFillColor( 0.86, 0.61, 0.61 )	-- white
	local text = {}
	textGroup = display.newGroup()

	-- create some text
	local title = display.newText( "Routine 1", 0, 0, native.systemFont, 32 )
	title:setFillColor( 1 )	-- black
	title.x = display.contentWidth * 0.5
	title.y = 32

	text[0] = display.newText( "Product", display.contentWidth * 0.5, 60, native.systemFont, 20 )
	text[0]:setFillColor( 1 )	-- black
	textGroup:insert(text[0])

	productGroup = display.newGroup()
	name = {}
	for a = 1, 4, 1 do
		name[a] = display.newText( "Product" .. a, 50, 60 + a * 25 , native.systemFont, 16 )
		name[a]:setFillColor( 1 )	-- black
	    productGroup:insert(name[a])
	end
	
	divLine = {};
	lineGroup = display.newGroup()
	divLine[0] = display.newImage("img/profile/line2.png")
	divLine[0].width = display.contentWidth * 4/5
	divLine[0].height = 7
	divLine[0].x = display.contentCenterX
	divLine[0].y = 180
	lineGroup:insert(divLine[0])

	text[1] = display.newText( "Temperature", display.contentWidth * 0.5, 190, native.systemFont, 20 )
	text[1]:setFillColor( 1 )	-- black
	textGroup:insert(text[1])

	text[2] = display.newText( "Hot" , 50, 210 , native.systemFont, 16 )
	text[2]:setFillColor( 1 )
	textGroup:insert(text[2])
	
	divLine[1] = display.newImage("img/profile/line2.png")
	divLine[1].width = display.contentWidth * 4/5
	divLine[1].height = 7
	divLine[1].x = display.contentCenterX
	divLine[1].y = 330
	lineGroup:insert(divLine[1])
	
	text[3] = display.newText( "Humidity", display.contentWidth * 0.5, 240, native.systemFont, 20 )
	text[3]:setFillColor( 1 )	-- black
	textGroup:insert(text[3])

	text[4] = display.newText( "Dry" , 50, 260 , native.systemFont, 16 )
	text[4]:setFillColor( 1 )
	textGroup:insert(text[4])

	text[5] = display.newText( "Satisfaction", display.contentWidth * 0.5, 290, native.systemFont, 20 )
	text[5]:setFillColor( 1 )	-- black
	textGroup:insert(text[5])
	
	text[6] = display.newText( "Fair" , 50, 310 , native.systemFont, 16 )
	text[6]:setFillColor( 1 )
	textGroup:insert(text[6])

	text[7] = display.newText( "Comment", display.contentWidth * 0.5, 340, native.systemFont, 20 )
	text[7]:setFillColor( 1 )	-- black
	textGroup:insert(text[7])

	text[8] = display.newText( "Not as good as expected. \nMaybe I should replace Product 1 next time." , display.contentWidth * 0.5, 370 , native.systemFont, 16 )
	text[8]:setFillColor( 1 )
	textGroup:insert(text[8])


	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( bg )
	sceneGroup:insert( title )
	sceneGroup:insert( textGroup )
	sceneGroup:insert( productGroup )
	sceneGroup:insert( lineGroup )
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