-----------------------------------------------------------------------------------------
--
-- post.lua
--
-----------------------------------------------------------------------------------------

-- Project: Business Sample App
--
-- File name: webpage.lua
--
-- Author: Corona Labs
--
-- Abstract: Display a web page.
--
--
-- Target devices: simulator, device
--
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2013 Corona Labs Inc. All Rights Reserved.
---------------------------------------------------------------------------------------
--[[

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in the
Software without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject to the
following conditions:

The above copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

]]--
---------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local widget = require("widget")

local function handletabBarEvent( event )
    print( event.target.id )  -- Reference to button's 'id' parameter
end

local playButton
local webView
local backButton
local navBar

local function goBack(event)
    if event.phase == "ended" then
        composer.hideOverlay( "slideRight", 250)
    end
    return true
end

function scene:create( event )
    local sceneGroup = self.view

    print("create scene")
    local background = display.newRect(0,0,display.contentWidth, display.contentHeight)
    background:setFillColor( 1, 1, 1 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    sceneGroup:insert(background)


    local title = display.newText("New Post", 0, 0, native.systemFont, 20)
    title:setFillColor( 0 ) -- black
    title.x = display.contentWidth * 0.5
    title.y = 80
    
    -- all objects must be added to group (e.g. self.view)
 

    local tabBar = display.newRect(0,0,display.contentWidth, 50)
    tabBar:setFillColor(0.8,0.8,0.8)
    tabBar.x = display.contentWidth / 2
    tabBar.y = 50 / 2

    local backPost = widget.newButton(
        {
            left = 0,
            top = 0,
            id = "backPost",
            label = "<<GO BACK",
            onEvent = goBack
        }
    )

    local submitPost = widget.newButton(
        {
            left = display.contentWidth-150,
            top = 0,
            id = "submitPost",
            label = "SUBMIT",
            onEvent = goBack
        }
    )
    local titleDis = display.newText("Title", 0, 0, native.systemFont, 15)
    titleDis:setFillColor( 0 ) -- black
    titleDis.x = 65
    titleDis.y = 140

    local titleField = native.newTextField( 150, 170, 200, 30 )

    local contentDis = display.newText("Content", 0, 0, native.systemFont, 15)
    contentDis:setFillColor( 0 ) -- black
    contentDis.x = 80
    contentDis.y = 210

    local contentField = native.newTextBox( 150, 300, 200, 150 )
    contentField.isEditable = true


    -- all objects must be added to group (e.g. self.view)
    sceneGroup:insert(titleDis)
    sceneGroup:insert(contentDis)
    sceneGroup:insert(titleField)
    sceneGroup:insert(contentField)
    sceneGroup:insert( title )
    sceneGroup:insert(tabBar)
    sceneGroup:insert(backPost)
    sceneGroup:insert(submitPost)
end

function scene:show( event )
    local sceneGroup = self.view

    -- load the blogPost data in from global space, was put there in feed.lua

    if event.phase == "did" then

    end              
end

function scene:hide( event )
    local sceneGroup = self.view

    --
    -- Clean up any native objects and Runtime listeners, timers, etc.
    --
    if event.phase == "will" then
        
    end
end

function scene:destroy( event )
    local sceneGroup = self.view
    
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
