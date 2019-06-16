-- 
-- Abstract: embeddablescrollview Library Plugin Test Project
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2015 Corona Labs Inc. All Rights Reserved.
--
------------------------------------------------------------

-- Load plugin library
local embeddableScrollview = require "plugin.embeddablescrollview"

local widget = require "widget"

-------------------------------------------------------------------------------
-- BEGIN (Insert your sample test starting here)
-------------------------------------------------------------------------------

-- screen positioning
local screenW = display.contentWidth
local screenH = display.contentHeight
local screenAW = display.actualContentWidth
local screenAH = display.actualContentHeight
local screenCX = display.contentCenterX
local screenCY = display.contentCenterY
local screenL = -(screenAW-screenW)*.5
local screenR = screenAW-(screenAW-screenW)*.5
local screenT = -(screenAH-screenH)*.5
local screenB = screenAH-(screenAH-screenH)*.5

-- main scrollview
local scrollView = embeddableScrollview.create(
    {
        top = screenT,
        left = screenL,
        width = screenAW,
        height = screenAH,
        horizontalScrollDisabled = true
    }
)

-- add shapes to scrollview
for i=1, 1 do
    local line = display.newLine( screenL, i*50, screenR, i*50 )
    line.strokeWidth = 3
    line:setStrokeColor( .85 )
    scrollView:insert(line)
    -- local embeddedScrollView = widget.newScrollView(
    local embeddedScrollView = embeddableScrollview.create(
        {
            top = i*50,
            left = screenL,
            width = screenAW,
            height = 50,
            verticalScrollDisabled = true,
            hideBackground = true,
            displayObjectToGiveTouchFocusFromVerticalScroll = scrollView
        }
    )
    scrollView:insert(embeddedScrollView)
    for i=1, 20 do
        local circle = display.newCircle( screenL + (i-.5)*50, 23, 20 )
        local num = math.random( 1, 3 )
        if num == 1 then
            circle:setFillColor( .85, .85, 1 )
        elseif num == 2 then
            circle:setFillColor( .85, 1, .85 )
        else
            circle:setFillColor( 1, .85, .85 )
        end
        embeddedScrollView:insert( circle )
    end
end


-------------------------------------------------------------------------------
-- END
-------------------------------------------------------------------------------
