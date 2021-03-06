-----------------------------------------------------------------------------------------
--
-- view4-friendList.lua
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

	local  nameText = display.newImage("img/profile/SONIA.png")
	nameText.width = 90
	nameText.height = 70
	nameText.x = display.contentCenterX
	nameText.y = hSpacing 

	local divLine1 = display.newImage("img/profile/line.png")
	divLine1.width = display.contentWidth * 4/5
	divLine1.height = 20
	divLine1.x = display.contentCenterX
	divLine1.y = nameText.y + hSpacing * 0.95

	local widget = require("widget")

	scrollView = widget.newScrollView{ 
							x = display.contentCenterX,
							y = display.contentCenterY,
							height = display.contentHeight, width = display.contentWidth,
							horizontalScrollDisabled = true,
							backgroundColor = { 0.86, 0.61, 0.61 }
						}
	scrollView.y = display.contentHeight * 2/3 + hSpacing * 0.25
	addRowToScrollView()
	
	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( bg )
	sceneGroup:insert( nameText)
	sceneGroup:insert( scrollView)
	sceneGroup:insert( divLine1)
end

-- TO-DO: Add Friend Function
function addFriend( event )
	print ("Add Friend")
end

function addRowToScrollView()

	local nameSection = {"Ronnie", "Ivy","Neyva", "Steve"}
	local iconSection = {"img/profile/friendImg2.png", "img/profile/friendImg3.png", "img/profile/friendImg4.png", "img/profile/friendImg5.png"}
	local line = {"1","1","1","0"}
	local sectionBlock = {}
	local iconBlock = {}
	local lineImg = {}
	for i = 1, 4 do
		sectionBlock[i] = display.newText(nameSection[i], 150, 40, native.systemFont, 16)
		sectionBlock[i].x = display.contentCenterX
		if i == 1 then
			sectionBlock[i].y = hSpacing
		else
			sectionBlock[i].y = sectionBlock[i-1].y + hSpacing *1.5
		end

		-- if i == 3 then
		-- 	sectionBlock[i]:addEventListener("tap",changeSceneProduct)
		-- else if i == 4 then
		-- 	sectionBlock[i]:addEventListener("tap",changeSceneFriendList)

		-- 	end
		-- end

		if line[i] == "1" then
			lineImg[i] = display.newImage("img/profile/line2.png")
			lineImg[i].width = display.contentWidth
			lineImg[i].height = 7
			lineImg[i].x = display.contentCenterX
			lineImg[i].y = sectionBlock[i].y + hSpacing * 0.75
		else
			lineImg[i] = display.newText("", 150, 40, native.systemFont, 16)
		end

		if iconSection[i] ~= "" then
			iconBlock[i] = display.newImage(iconSection[i])
			iconBlock[i].width = 45
			iconBlock[i].height = 45
			iconBlock[i].x = display.contentCenterX - hSpacing * 3
			iconBlock[i].y = sectionBlock[i].y
		else
			iconBlock[i] = display.newText("", 150, 40, native.systemFont, 16)
		end

		scrollView:insert( iconBlock[i])
		scrollView:insert( sectionBlock[i])
		scrollView:insert( lineImg[i])
	end
	
end

function changeSceneProduct(event)
	_G.topTabBar.isVisible = true
	composer.gotoScene( "view4-database", {effect = "crossFade", time = 800} )
	composer.removeScene( "view4" )
end

function changeSceneFriendList(event)
	_G.topTabBar.isVisible = true
	composer.gotoScene( "view4-friendList", {effect = "crossFade", time = 800} )
	composer.removeScene( "view4" )
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
