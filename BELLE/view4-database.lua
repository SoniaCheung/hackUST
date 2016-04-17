-------------------------------------------------------------------------------
--
-- <scene>.lua
--
-------------------------------------------------------------------------------

local sceneName = ...

local composer = require( "composer" )
local transition = require( "transition" )

-- Load scene with same root filename as this file
local scene = composer.newScene( sceneName )

local lastItem
local buttonAdd
local buttonAddBorder

-------------------------------------------------------------------------------

function onProductClicked( event )
    if event.phase == "ended" then
        composer.gotoScene( "scene1" )
    end
end

function onPickPhotoComplete( event )
    if event.completed then
        transition.fadeIn( lastItem, {time = 500, transition = easing.inQuint} )
        transition.moveTo( buttonAdd, {x = 162, time = 1000, transition = easing.outQuint} )
        transition.moveTo( buttonAddBorder, {x = 162, time = 1000, transition = easing.outQuint} )
    end
end

function onButtonAddClicked( event )
    if event.phase == "ended" then
        media.selectPhoto(
        {
            mediaSource = media.SavedPhotosAlbum,
            listener = onPickPhotoComplete,
            destination = { baseDir=system.TemporaryDirectory, filename="image.jpg", type="image" }
        })
    end
end

function scene:create( event )
    local sceneGroup = self.view
    local object = self:getObjectByName( "Object" )
    object:addEventListener("touch", onProductClicked)

    buttonAddBorder = self:getObjectByName( "Rect" )
    buttonAddBorder:addEventListener("touch", onButtonAddClicked)

    lastItem = self:getObjectByName( "Object7" )
    buttonAdd = self:getObjectByName( "Object8" )

    buttonAdd.x = lastItem.x
    buttonAddBorder.x = lastItem.x
    lastItem.alpha = 0

    -- Called when the scene's view does not exist
    -- 
    -- INSERT code here to initialize the scene
    -- e.g. add display objects to 'sceneGroup', add touch listeners, etc
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
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
