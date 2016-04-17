-------------------------------------------------------------------------------
--
-- <scene>.lua
--
-------------------------------------------------------------------------------

local sceneName = ...

local composer = require( "composer" )

-- Load scene with same root filename as this file
local scene = composer.newScene( sceneName )

_G.isWishlistLastItemVisible = false

-------------------------------------------------------------------------------

function onButtonAddClicked( event )
    if event.phase == "ended" then
        composer.gotoScene( "wishlistAdd" )
    end
end

function scene:changeLastItem()
    local buttonBorder = self:getObjectByName("button1_copy001")
    local text = self:getObjectByName("Text_copy001")
    local text2 = self:getObjectByName("Text3_copy001")
    local color = self:getObjectByName("Circle_copy001")

    if _G.isWishlistLastItemVisible then
        transition.fadeIn( buttonBorder, {time = 500, transition = easing.inQuint} )
        transition.fadeIn( text, {time = 500, transition = easing.inQuint} )
        transition.fadeIn( text2, {time = 500, transition = easing.inQuint} )
        transition.fadeIn( color, {time = 500, transition = easing.inQuint} )
    else
        buttonBorder.alpha = 0
        text.alpha = 0
        text2.alpha = 0
        color.alpha = 0
    end
end

function scene:create( event )
    local sceneGroup = self.view

    local buttonAdd = self:getObjectByName( "button_add" )
    buttonAdd:addEventListener("touch", onButtonAddClicked)

    -- Called when the scene's view does not exist
    -- 
    -- INSERT code here to initialize the scene
    -- e.g. add display objects to 'sceneGroup', add touch listeners, etc
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        scene:changeLastItem()
        -- Called when the scene is off screen and is about to move on screen
    elseif phase == "did" then
        -- Called when the scene is now on screen
        -- 
        -- INSERT code here to make the scene come alive
        -- e.g. start timers, begin animation, play audio, etc
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
    -- e.g. remove display objects, remove touch listeners, save state, etc
end

-------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-------------------------------------------------------------------------------

return scene
