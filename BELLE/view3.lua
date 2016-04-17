-----------------------------------------------------------------------------------------
--
-- blog.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )

local displayMode = "post"
local pageTitle 
local icons
local params
local springStart
local needToReload
local spinner

local myList = nil


local tempA = {}
tempA.title = "Detoxifying Black Cleanser"
tempA.pubDate = os.date("%a")..", "..os.date("%d").." "..os.date("%b").." "..os.date("%Y").." "..os.date("%X")
tempA.content = "Here's another water-soluble gel cleanser infused with charcoal for its claimed ability to detoxify skin. As it turns out, skin cannot be detoxified (we explain why in the More Info section), but this is still an interesting cleanser to consider if you have normal to oily or combination skin."

local tempB = {}
tempB.title = "Lipstick review"
--tempB.pubDate = os.date("%a")..", "..os.date("%d").." "..os.date("%b").." "..os.date("%Y").." "..os.date("%X")
tempB.pubDate ="Sat, 16 Apr 2016 13:14:20"
tempB.content = "The first thing you'll notice upon using this is that when mixed with water, the cleanser warms up, a sensation some will find pleasing while others may find it unpleasant. The warming occurs when water reacts with certain ingredients in the cleanser, but this sensation doesn't allow the cleanser to penetrate any \"deeper\" into skin, nor does it aid in purging toxins."


local tempC = {}
tempC.title = "Simple makeup for beginners"
--tempC.pubDate = os.date("%a")..", "..os.date("%d").." "..os.date("%b").." "..os.date("%Y").." "..os.date("%X")
tempC.pubDate ="Wed, 06 Apr 2016 22:58:01"
tempC.content = "Things you need: 1. BB cream 2. a smile :)"


local tempD = {}
tempD.title = "How to choose your cosmetics"
--tempD.pubDate = os.date("%a")..", "..os.date("%d").." "..os.date("%b").." "..os.date("%Y").." "..os.date("%X")
tempD.pubDate = "Mon, 04 Apr 2016 23:59:59"
tempD.content = "Some useful tips for choosing your first cosmetics:"


local tempE = {}
tempE.title = "10 Makeup Tricks "
--tempE.pubDate = os.date("%a")..", "..os.date("%d").." "..os.date("%b").." "..os.date("%Y").." "..os.date("%X")
tempE.pubDate = "Mon, 28 Mar 2016 11:26:56"
tempE.content = "1. Never put concealer or foundation on your eyelids as a base, it will cause your eye makeup to crease."

local tempDB = {tempA,tempB,tempC,tempD,tempE}


local blogPosts = {}

local function handleButtonEvent( event )
    if event.phase == "ended" then
        local options = {
            effect = "slideLeft",
            time = 250,
            isModal = true,
            params = params
        }
        composer.showOverlay( "add", options)
    end
    return true
end

local onRowTouch = function( event )
    if event.phase == "release" then
        
        local id = event.row.index
        local blogPost = event.target.params.blogPost
        local params = {
            blogPost = blogPost
        }
        local options = {
            effect = "slideLeft",
            time = 250,
            isModal = true,
            params = params
        }
        composer.showOverlay(displayMode, options)
    end
    return true
end


local function onRowRender(event)
    print("row render")

    local row = event.row
    local blogPost = event.row.params.blogPost
    local id = row.index


    if id > #blogPosts then return true end

    row.bg = display.newRect(0, 0, display.contentWidth, 60)
    row.bg.anchorX = 0
    row.bg.anchorY = 0
    row.bg:setFillColor(0.86, 0.61, 0.61 )

    row:insert(row.bg)
    
    row.icon = display.newImageRect("icon1-down.png", 20, 20 )
    row.icon.x = 20
    row.icon.y = row.height / 2
    row:insert(row.icon)

    local titleLength = math.floor(display.contentWidth / 11) - 3


    local myTitle = blogPost.title
    if string.len(myTitle) > titleLength then
        myTitle = string.sub(blogPost.title, 1, titleLength) .. "..."
    end
    row.title = display.newText( myTitle, 12, 0, Constant, 18 )
    row.title.anchorX = 0
    row.title.anchorY = 0.5
    row.title:setFillColor( 1)

    row.title.y = 22
    row.title.x = 42
 
    --local timeStamp = string.match(blogPost.pubDate,"%w+, %d+ %w+ %w+ %w+:%w+")
    local timeStamp = blogPost.pubDate
    --print(blogPost.pubDate)
    print("pubDate ["..timeStamp.."]")
    row.subtitle = display.newText( timeStamp, 12, 0, Constant, 14)
    row.subtitle.anchorX = 0
    row.subtitle:setFillColor( 0.375, 0.375, 0.375 )
    row.subtitle.y = row.height - 18
    row.subtitle.x = 42


    row.rightArrow = display.newImageRect("rightArrow.png", 10, 10)
    row.rightArrow.x = display.contentWidth - 20
    row.rightArrow.y = row.height / 2


    row:insert(row.title )
    row:insert(row.subtitle)
    row:insert(row.rightArrow)
    return true
end


local function showTableView()
    print("Calling showTableView()")
    
    for i = 1, #blogPosts do

        print("insert row:  " .. i .. " [" .. blogPosts[i].title .. "]")
        
        myList:insertRow{
            rowHeight = 60,
            isCategory = false,
            rowColor = { 1, 1, 1 },
            lineColor = { 0.30, 0.30, 0.30 },
            params = {
                blogPost = blogPosts[i]
            }
        }
    end
end


local function purgeList(list)
    list:deleteAllRows()
end


function loadPost()
    --native.setActivityIndicator(true)
    print("entering loadPost")

    local blogPost = {}
    

    --blogPosts = {"Post1","Post2","Post3","Post4","Post5"}
    blogPosts = tempDB
    print("Num blogPosts: " .. #blogPosts)
    purgeList(myList)
    showTableView()

    local function onAlertComplete( event )
        return true
    end

    return true
end



local function reloadTable()
    loadPost()
end

local function tableViewListener(event)
    print("tableViewListener", event.phase, event.direction, event.limitReached, myList:getContentPosition( ))

    if event.phase == "began" then

        local currentPosition = nil
        if event.target.parent.parent.getContentPosition then 
            currentPosition = event.target.parent.parent:getContentPosition( )
        end
        springStart = currentPosition
        print("springStart", springStart)
        needToReload = false
        spinner.isVisible = true
        spinner:start()

    elseif event.phase == "moved" then

        local currentPosition = nil
        if event.target.parent.parent.getContentPosition then
            currentPosition = event.target.parent.parent:getContentPosition( )
        end
        if currentPosition and springStart and currentPosition > springStart + 60 then
            needToReload = true
            --print("needToReload", needToReload, myList:getContentPosition( ), springStart + 60)
        end

    elseif event.phase == nil and event.direction == "down" and event.limitReached == true and needToReload then

        --print("reloading Table!")
        needToReload = false
        spinner:stop()
        spinner.isVisible = false
        --reloadTable()

    end
    return true
end




function scene:create( event )
	local sceneGroup = self.view
	print("create scene")

	params = event.params

	local background = display.newRect(0,0,display.contentWidth, display.contentHeight)
    background:setFillColor( 0.86, 0.61, 0.61  )
    background.x = display.contentWidth / 2
    background.y = display.contentHeight / 2

    sceneGroup:insert(background)

    
	local reloadBar = display.newRect(0,0,display.contentWidth, display.contentHeight)
    reloadBar.isVisible = false
    reloadBar.isHitTestable = true
    reloadBar:addEventListener( "tap", reloadTable )


    spinner = widget.newSpinner({ 
        width = 32, 
        height = 32, 
    })
    sceneGroup:insert(spinner)
    spinner.x = display.contentWidth
    spinner.y = display.contentHeight
    spinner.isVisible = false

	local tWidth = display.contentWidth
    local tHeight = display.contentHeight

    myList = widget.newTableView{ 
        top = 50, 
        width = tWidth, 
        height = tHeight, 
        maskFile = maskFile,
        listener = tableViewListener,
        hideBackground = true, 
        onRowRender = onRowRender,
        onRowTouch = onRowTouch 
    }

    sceneGroup:insert(myList)

    local tabBar = display.newRect(0,0,display.contentWidth, 50)
    tabBar:setFillColor(1)
    tabBar.x = display.contentWidth / 2
    tabBar.y = 50 / 2

    sceneGroup:insert(tabBar)

    local title = display.newText( "TIPS", 0, 0, native.systemFont, 20)
    title:setFillColor( 0 ) -- black
    title.x = display.contentWidth * 0.5
    title.y = 25
    sceneGroup:insert(title)

    local addPost = widget.newButton(
	    {
	        left = display.contentWidth-130,
	        top = 0,
	        id = "addPost",
	        label = "ADD",
	        onEvent = handleButtonEvent
	    }
	)

	sceneGroup:insert(addPost)

end




function scene:show( event )
	local sceneGroup = self.view

	--local phase = event.phase
	
	params = event.params

	print("scene:show")

--	displayMode = params.displayMode
--	pageTitle = params.pageTitle
--	icons = params.icons


	if event.phase == "did" then
		print("event.phase == did")
        loadPost()
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
		print("scene:hide will")
		purgeList(myList)
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
	
	print("destroy")
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
