-----------------------------------------------------------------------------------------
--
-- view1.lua
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
	--local pic = display.newImageRect( "img/button/flower.jpg", display.contentWidth*2, 50)--display.contentHeight*2 )
	--bg:setFillColor( 1, .7, .7 )	-- white
	
	-- create some text
	local title = display.newText( "First View", 0, 0, native.systemFont, 32 )
	title:setFillColor( 1 )	-- black
	title.x = display.contentWidth * 0.5
	title.y = 125
	
	local newTextParams = { text = "Loaded by the first tab's\n\"onPress\" listener\nspecified in the 'tabButtons' table", 
						x = 0, y = 0, 
						width = 310, height = 310, 
						font = native.systemFont, fontSize = 14, 
						align = "center" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 0 ) -- black
	summary.x = display.contentWidth * 0.5 + 10
	summary.y = title.y + 215


	-- MY CODE --
	--local pic = display.newImage( "flower.jpg" )
	--bg:insert(pic)

	local scrollView = widget.newScrollView(
    	{
	        top = 0,
	        left = 0,
	        width = display.contentWidth,
	        height = display.contentHeight,
	        scrollWidth = display.contentWidth,
	        scrollHeight = 100,
	        topPadding = 50,
	        bottomPadding = 50,
	        horizontalScrollDisabled = true,
	        verticalScrollDisabled = false,
	        listener = scrollListener,
	        backgroundColor = {1, .7, .7, 0.7}--{1, .7, .7, 0}
	    }
	)

	--rect:insert(shortButton)

	--local pic = display.newImageRect( "img/button/flower.jpg", display.contentWidth*2, 50)--display.contentHeight*2 )


	local Word = {
		left = 10,
		top = 0,
		width = display.contentWidth-20,
		height = 40,
		defaultFile = "img/button/white.bmp",
		overFile = "img/button/white.bmp",
	}

	local WordShort = {
		left = 10,
		top = 0,
		width = display.contentWidth/2-20,
		height = 40,
		defaultFile = "img/button/white.bmp",
		overFile = "img/button/white.bmp",
	}

	--local buttonGroup = display.newGroup ()
	--buttonGroup:insert (button)
	local word = {}
	local w = 0

	local shortButton = widget.newButton ({
		left = 10,
		top = 0,
		width = display.contentWidth-20,
		height = 120,
		defaultFile = "img/button/smokey.jpg",
		overFile = "",
		--onEvent = handleButtonEvent,
	})
	shortButton.y = 30
	scrollView:insert( shortButton )
	word[w] = widget.newButton (Word)
	word[w].y = 110
	word[w]:setLabel ("How NOT to Cake Your Makeup")
	scrollView:insert( word[w] )
	w = w + 1

	local longButton = widget.newButton ({
		left = 10,
		top = 0,
		width = display.contentWidth/2-20,
		height = 340,
		defaultFile = "img/button/pencil.jpg",
		overFile = "",
		--onEvent = handleButtonEvent,
	})
	longButton.x, longButton.y = display.contentWidth/4, 320
	word[w] = widget.newButton (WordShort)
	word[w].y = 510
	word[w]:setLabel ("Percil Brow Pencil")
	scrollView:insert( word[w] )
	w = w + 1

	local smallButton = {}
	smallButton[0] =  widget.newButton ({
		left = 10,
		top = 0,
		width = display.contentWidth/2-20,
		height = 140,
		defaultFile = "img/button/soap.jpg",
		overFile = "",
		--onEvent = handleButtonEvent,
	})
	smallButton[0].x, smallButton[0].y = display.contentWidth/4*3, 220
	word[w] = widget.newButton(WordShort)
	word[w].x, word[w].y = display.contentWidth/4*3, 310
	word[w]:setLabel ("Homemake Soap")
	scrollView:insert( word[w] )
	w = w + 1

	smallButton[1] =  widget.newButton ({
		left = 10,
		top = 0,
		width = display.contentWidth/2-20,
		height = 140,
		defaultFile = "img/button/facial.jpg",
		overFile = "",
		--onEvent = handleButtonEvent,
	})
	smallButton[1].x, smallButton[1].y = display.contentWidth/4*3, 420
	word[w] = widget.newButton(WordShort)
	word[w].x, word[w].y = display.contentWidth/4*3, 510
	word[w]:setLabel ("Everyday Facial")
	scrollView:insert( word[w] )
	w = w + 1

	local buttonGroup = display.newGroup ()
	local button = {}
	button[0] = widget.newButton ({
		left = 10,
		top = 0,
		width = display.contentWidth-20,
		height = 300,
		defaultFile = "img/button/foundation.jpg",
		overFile = "",
		onEvent = handleButtonEvent,
	})
	button[1] = widget.newButton ({
		left = 10,
		top = 0,
		width = display.contentWidth-20,
		height = 300,
		defaultFile = "img/button/lipstick.jpg",
		overFile = "",
		onEvent = handleButtonEvent,
	})

	word[w] = widget.newButton(Word)
	word[w]:setLabel("Best Foundations for All Skin Types")
	scrollView:insert( word[w] )
	w = w + 1
	word[w] = widget.newButton(Word)
	word[w]:setLabel("The Power of Red Lipstick")
	scrollView:insert( word[w] )
	w = w + 1

	w = w - 2

	for i = 0, 1, 1 do
		--button[i] = widget.newButton (BlockOpt)
		if i == 0 then
			button[i].y = 700
			word[w].y =  870
		else
			button[i].y = 700+360*i
		end
		--button[i]:setLabel (title)
		buttonGroup:insert ( button[i] )
		word[w].y = 870+360*i
		w = w + 1
	end

	
	--word[w]:setLabel ("Best Foundations for All Skin Types")

	scrollView:insert(buttonGroup)

	-- all objects must be added to group (e.g. self.view)
	sceneGroup:insert( bg )
	--sceneGroup:insert ( pic )
	sceneGroup:insert( title )
	sceneGroup:insert( summary )

	-- MY CODE --
	sceneGroup:insert( scrollView )
	
	scrollView:insert(longButton)
	scrollView:insert(smallButton[0])
	scrollView:insert(smallButton[1])
	--scrollView:insert ( buttonGroup )

end

function handleButtonEvent ( event )
	composer.gotoScene ("view4")
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

-- ScrollView listener
local function scrollListener( event )

    local phase = event.phase
    if ( phase == "began" ) then print( "Scroll view was touched" )
    elseif ( phase == "moved" ) then print( "Scroll view was moved" )
    elseif ( phase == "ended" ) then print( "Scroll view was released" )
    end

    -- In the event a scroll limit is reached...
    if ( event.limitReached ) then
        if ( event.direction == "up" ) then print( "Reached bottom limit" )
        elseif ( event.direction == "down" ) then print( "Reached top limit" )
        --elseif ( event.direction == "left" ) then print( "Reached right limit" )
        --elseif ( event.direction == "right" ) then print( "Reached left limit" )
        end
    end

    return true
end



---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
scene:addEventListener( "panel", scene )

-----------------------------------------------------------------------------------------

return scene