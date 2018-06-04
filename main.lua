-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by:momin ahmed
-- Created on: May 2018
--
-----------------------------------------------------------------------------------------

local enterButton = display.newImageRect("./assets/sprites/enterButton.png", 500, 157 )
enterButton.x = display.contentCenterX + 500
enterButton.y = display.contentCenterY - 10
enterButton.id = "enter button"

local numberTextField = native.newTextField( display.contentCenterX - 550 , display.contentCenterY - 10 , 550, 150)
numberTextField.id = "number"

local results = display.newText( "", 700, 770, native.systemFont, 80 )

local instruction = display.newText( "Select a number ",900, 600, native.systemFont, 90 )


local function onButtonTouched( event )
    if ( event.phase == "ended" ) then
       print( "Touch event ended on: " .. event.target.id )
   
    end
    
    return true
end

local function calculatePi ( event )
    local numberUser = tonumber(numberTextField.text)
    local answer = 0.0
    local pi = 0
    local initial = 0
    
    if (numberUser < 0 ) then
		results.text = ("Positive intergers only!")
     elseif (numberUser > 0 ) then
		repeat
			answer = answer + ((-1)^initial/((2*initial)+1))
			initial = initial + 1
		until numberUser == initial
			results.text = (" PI is "..answer*4)
     else
		results.text = ("Digits only!")
     end		
end

enterButton:addEventListener( "touch", onButtonTouched )
enterButton:addEventListener( "touch", calculatePi )