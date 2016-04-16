-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local wSpacing = 30
local hSpacing = 40

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

	local coverImg = display.newImage( "img/profile/coverPhoto.png")
	coverImg.width = display.contentWidth
	coverImg.height = display.contentHeight * 2/5
	coverImg.x = display.contentCenterX
	coverImg.y = 0

	local profileImg = display.newImage( "img/profile/profileImg.png")
	profileImg.width = 125
	profileImg.height = 125
	profileImg.x = display.contentCenterX
	profileImg.y = display.contentHeight * 1/5

	local addBtn = display.newImage("img/profile/addBtn.png")
	addBtn.width = 40
	addBtn.height = 40
	addBtn.x = display.contentWidth * 3/4 
	addBtn.y = display.contentHeight * 1/5
	addBtn:addEventListener( "tap", addFriend)

	local nameTextPara = { text = "SONIA",
							x = 0, y = 0,
							font = native.systemFont, fontSize = 16,
							align = "Center"}
	local  nameText = display.newText( nameTextPara)
	nameText:setFillColor( 0 )
	nameText.x = wSpacing * 2
	nameText.y = profileImg.y + hSpacing * 0.75

	local widget = require("widget")

	scrollView = widget.newScrollView{ 
							x = display.contentCenterX,
							height = display.contentHeight * 3/5, width = display.contentWidth,
							horizontalScrollDisabled = true,
							backgroundColor = { 0.86, 0.61, 0.61 }
						}
	scrollView.y = display.contentHeight * 2/3 - hSpacing * 0.5
	addRowToScrollView()
	
	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( bg )
	sceneGroup:insert( coverImg)
	sceneGroup:insert( profileImg)
	sceneGroup:insert( addBtn)
	sceneGroup:insert( nameText)
	sceneGroup:insert( scrollView)
end

-- TO-DO: Add Friend Function
function addFriend(event)
	print ("Add Friend")
end

function addRowToScrollView()

	local nameSection = {"My Information", "My Cosmetic", "My Friend"}
	local sectionBlock = {}
	for i = 1, 3 do
		sectionBlock[i] = display.newText(nameSection[i], 10, 10, native.systemFont, 16)
		sectionBlock[i].x =  display.contentCenterX
		if i == 1 then
			sectionBlock[i].y = hSpacing
		else
			sectionBlock[i].y = sectionBlock[i-1].y + hSpacing *2
		end
		scrollView:insert( sectionBlock[i])
	end
	
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

-- button for My Cosmo Bag
local widget = require( "widget" )

-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
    	composer.gotoScene( "view4-database" )
        print( "Button was pressed and released" )
    end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
