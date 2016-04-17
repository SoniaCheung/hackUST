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
	addBackground:setFillColor( 0.86, 0.61, 0.61 )	
	local add = display.newText( "+", display.contentCenterX, 70, native.systemFont, 30 )
	add:setFillColor( 1 )	


	local tab1 = display.newText( "Routine", 0, 0, native.systemFont, 16 )
	local tab2 = display.newText( "Temp", 0, 0, native.systemFont, 16 )
	local tab3 = display.newText( "Humi", 0, 0, native.systemFont, 16 )
	local tab4 = display.newText( "Satisfaction", 0, 0, native.systemFont, 16 )

	tab1.x = display.contentWidth * 0.1
	tab2.x = display.contentWidth * 0.3
	tab3.x = display.contentWidth * 0.5
	tab4.x = display.contentWidth * 0.8
	tab1.y = 110
	tab2.y = 110
	tab3.y = 110
	tab4.y = 110
	tab1:setFillColor( 0 )
	tab2:setFillColor( 0 )
	tab3:setFillColor( 0 )
	tab4:setFillColor( 0 )
	
	list = display.newGroup()
	index = {}
	temp = {}
	humi = {}
	sat = {}
	for a = 1, 4, 1 do
		index[a] = display.newText( a, display.contentWidth * 0.1, 110 + a * 30, native.systemFont, 16 )
		index[a]:setFillColor( 0 )	-- black
		local random = math.random( 0,1)
		if (random==0) then
			temp[a] = display.newText( "Hot", display.contentWidth * 0.3, 110 + a * 30, native.systemFont, 16 )
		else
			temp[a] = display.newText( "Cold", display.contentWidth * 0.3, 110 + a * 30, native.systemFont, 16 )
		end
		random = math.random( 0,1)
		temp[a]:setFillColor( 0 )	-- black
		if (random==0) then
			humi[a] = display.newText( "Wet", display.contentWidth * 0.5, 110 + a * 30, native.systemFont, 16 )
		else
			humi[a] = display.newText( "Dry", display.contentWidth * 0.5, 110 + a * 30, native.systemFont, 16 )
		end
		humi[a]:setFillColor( 0 )	-- black
		random = math.random( 0,2)
		if (random==0) then
			sat[a] = display.newText( "Good", display.contentWidth * 0.8, 110 + a * 30, native.systemFont, 16 )
		elseif (random==1) then
			sat[a] = display.newText( "Fair", display.contentWidth * 0.8, 110 + a * 30, native.systemFont, 16 )
		else
			sat[a] = display.newText( "Bad", display.contentWidth * 0.8, 110 + a * 30, native.systemFont, 16 )
		end
		sat[a]:setFillColor( 0 )	-- black
	    list:insert(index[a])
	    list:insert(temp[a])
	    list:insert(humi[a])
	    list:insert(sat[a])
	end
	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( bg )
	sceneGroup:insert( title )
	sceneGroup:insert( tab1 )
	sceneGroup:insert( tab2 )
	sceneGroup:insert( tab3 )
	sceneGroup:insert( tab4 )
	sceneGroup:insert( addBackground )
	sceneGroup:insert( add )
	sceneGroup:insert( list )
	addBackground:addEventListener( "tap", addList )
	list:addEventListener( "tap", fakeReport )

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
	composer.removeScene( "view2")
	composer.gotoScene( "addView" )
end

function fakeReport()
	composer.removeScene( "view2")
	composer.gotoScene( "report" )
end
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
