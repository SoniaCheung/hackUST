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
	{ label="Newsfeed", defaultFile="icon1.png", overFile="icon1-down.png", width = 32, height = 32, onPress=onFirstView, selected=true },
	{ label="Diary", defaultFile="icon2.png", overFile="icon2-down.png", width = 32, height = 32, onPress=onSecondView },
	{ label="扮靚Tips", defaultFile="icon2.png", overFile="icon2-down.png", width = 32, height = 32, onPress=onThirdView },
	{ label="My Profile", defaultFile="icon2.png", overFile="icon2-down.png", width = 32, height = 32, onPress=onForthView },
}

-- create the actual tabBar widget
local tabBar = widget.newTabBar{
	top = display.contentHeight - 50,	-- 50 is default height for tabBar widget
	buttons = tabButtons
}


onFirstView()	-- invoke first tab button's onPress event manually