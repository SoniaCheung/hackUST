-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"

-----------------------------------------------------------------------------------------


local function onMyItemView( event )
	composer.gotoScene( "view4-database" )
	_G.topTabBar:setSelected(1)
	_G.topTabBar.isVisible = true
end

local function onWantItemView( event )
	composer.gotoScene( "wishlist" )
end

local function onGiveItemView( event )
	composer.gotoScene( "giveaway" )
end

_G.topTabButtons = {
	{ label="My item", defaultFile="icon1.png", overFile="icon1-down.png", width = 32, height = 32, onPress=onMyItemView, selected=true },
	{ label="Wishlist", defaultFile="icon2.png", overFile="icon2-down.png", width = 32, height = 32, onPress=onWantItemView },
	{ label="Giveaways", defaultFile="icon2.png", overFile="icon2-down.png", width = 32, height = 32, onPress=onGiveItemView },
}

-- create the actual tabBar widget
_G.topTabBar = widget.newTabBar{
	top = 0,
	buttons = _G.topTabButtons
}

-----------------------------------------------------------------------------------------

-- event listeners for tab buttons:
local function onFirstView( event )
	composer.gotoScene( "view1" )
	_G.topTabBar.isVisible = false
end

local function onSecondView( event )
	composer.gotoScene( "view2" )
	_G.topTabBar.isVisible = false
end

local function onThirdView( event )
	composer.gotoScene( "view3" )
	_G.topTabBar.isVisible = false
end

local function onForthView( event )
	composer.gotoScene( "view4" )
	_G.topTabBar.isVisible = false
end

-- create a tabBar widget with two buttons at the bottom of the screen

-- table to setup buttons
local tabButtons = {
	{ label="Newsfeed", defaultFile="img/icon/news-2.png", overFile="img/icon/news-1.png", width = 28, height = 24, onPress=onFirstView, selected=true },
	{ label="Diary", defaultFile="img/icon/database-2.png", overFile="img/icon/database-1.png", width = 28, height = 24, onPress=onSecondView },
	{ label="扮靚Tips", defaultFile="img/icon/tips-2.png", overFile="img/icon/tips-1.png", width = 28, height = 24, onPress=onThirdView },
	{ label="My Profile", defaultFile="img/icon/profile-2.png", overFile="img/icon/profile-1.png", width = 28, height = 24, onPress=onForthView },
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar{
	top = display.contentHeight,
	height = 40,
	buttons = tabButtons
}


-----------------------------------------------------------------------------------------
-- The Pink Color for the top status bar --
local topStatusBar = display.newRect(display.contentWidth * 0.5, -25,display.contentWidth, 70)
topStatusBar:setFillColor( 0.86, 0.61, 0.61)

-- The Search Bar on the top --
local  searchIcon = display.newImage("img/main/search.png")
searchIcon.width = 30
searchIcon.height = 30
searchIcon.x = 30
searchIcon.y = -10

function changeSceneLily(event)
	_G.topTabBar.isVisible = false
	composer.gotoScene( "view4-friend", {effect = "crossFade", time = 800} )
	composer.removeScene( "view4" )
end

local function textListener( event )

    if ( event.phase == "began" ) then
        -- user begins editing defaultField
        print( event.text )

    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- do something with defaultField text

        print( event.target.text )
        changeSceneLily()

    elseif ( event.phase == "editing" ) then
        print( event.text )
    end
end

local searchTextField = native.newTextField( display.contentCenterX + 20, -10, display.contentWidth * 4/5, 25)
searchTextField.inputType = "default"
searchTextField.placeholder = "Please type the key word"
searchTextField.size = 20
searchTextField.align = "left"
searchTextField:setTextColor( 0.86, 0.61, 0.61)
searchTextField:addEventListener( "userInput", textListener)



onFirstView()	-- invoke first tab button's onPress event manually