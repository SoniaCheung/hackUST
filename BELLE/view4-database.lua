-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local GRID_WIDTH = 3
local GRID_HEIGHT = 3
local CELL_WIDTH = 106
local CELL_HEIGHT = 106

local contentBg = display.newImageRect("Icon-167.png", 320, 320)
contentBg.x = display.contentCenterX
contentBg.y = display.contentCenterY

local gbOffsetX = contentBg.x - ( contentBg.width * contentBg.anchorX )
local gbOffsetY = contentBg.y - ( contentBg.height * contentBg.anchorY )
local grid = {}

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
	local title = display.newText( "Second View", 0, 0, native.systemFont, 32 )
	title:setFillColor( 0 )	-- black
	title.x = display.contentWidth * 0.5
	title.y = 125

	local newTextParams = { text = "Loaded by the second tab's\n\"onPress\" listener\nspecified in the 'tabButtons' table",
							x = 0, y = 0,
							width = 310, height = 310,
							font = native.systemFont, fontSize = 14,
							align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 0 ) -- black
	summary.x = display.contentWidth * 0.5 + 10
	summary.y = title.y + 215

	----

	for i = 1, GRID_HEIGHT do
		grid[i] = {}
	end

	local lastObject
	for xPos = 1, 3 do
		for yPos = 1,3 do
			local color = "1"
			if math.random(2) == 2 then
				color = "2"
			end
			grid[yPos][xPos] = spawnPiece(xPos, yPos, color, contentBg)
			lastObject = grid[yPos][xPos]
		end
	end

	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( bg )
	sceneGroup:insert( title )
	sceneGroup:insert( summary )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if phase == "will" then
		_G.topTabBar.isVisible = true
		contentBg.isVisible = true
		for xPos = 1, 3 do
			for yPos = 1,3 do
				grid[yPos][xPos].isVisible = true
			end
		end
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
		contentBg.isVisible = false
		for xPos = 1, 3 do
			for yPos = 1,3 do
				grid[yPos][xPos].isVisible = false
			end
		end
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


function spawnPiece( xPos, yPos, pieceType )
	if pieceType ~= "1" and pieceType ~= "2" then
		print( "Invalid piece type", pieceType )
		return nil
	end
	if xPos < 1 or xPos > GRID_WIDTH or yPos < 1 or yPos > GRID_HEIGHT then
		print( "Position out of range:", xPos, yPos )
		return nil
	end

	local piece = display.newImageRect( "icon" .. pieceType .. ".png", CELL_WIDTH, CELL_HEIGHT )
	--
	-- record the pieces logical position on the board
	--
	piece.xPos = xPos
	piece.yPos = yPos
	--
	-- Position the piece
	--
	piece.x = (xPos - 1) * CELL_WIDTH + (CELL_WIDTH * 0.5) + gbOffsetX
	piece.y = (yPos - 1) * CELL_HEIGHT + (CELL_HEIGHT * 0.5) + gbOffsetY

	return piece
end

-----------------------------------------------------------------------------------------

return scene
