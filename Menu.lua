--Add composer library
local composer = require( "composer" )
local scene = composer.newScene()

--Function:changeScene
--Description: when touch the button, it reacts and change the scene
local function changeScene( )
	composer.gotoScene("Intro", {effect = "fade", time = 1000})
end

-- create()
function scene:create( event )
    
    ----------------------------------------------------------------------------------------
    --LOCAL VARIABLES
    ----------------------------------------------------------------------------------------
    local bkg 
    local mouse
    local cheese
    local cat
    local button
    local buttonText
    local cheese
    local bkgSound
    local bkgChannel
    local fridge
    local title

    local sceneGroup = self.view
   
    ----------------------------------------------------------------------------------------------------------
    --OBJECT CREATION
    ----------------------------------------------------------------------------------------------------------------

    --Create an image(mouse)
    mouse = display.newImage("Images/win mouse.png", 0, 0)
    sceneGroup:insert(mouse)
    --set its orientation and size
    mouse:scale(-1, 1)
    --set its position
    mouse.x = display.contentWidth - 180
    mouse.y = display.contentHeight/2+100

    --create an image(cheese)
    cheese = display.newImage("Images/cheese.png", 0, 0)
    sceneGroup:insert(cheese)
    --set its orientation and size
    cheese:scale(0.5, 0.5)
    --set its position
    cheese.x = display.contentWidth - 130
    cheese.y = display.contentHeight/2+280
    cheese:toBack()

    --create an image(fridge)
    fridge = display.newImage("Images/closeFridge.png", 0, 0)
    sceneGroup:insert(fridge)
    --set its orientation and size
    fridge:scale(-0.6, 0.6)
    --set its possition
    fridge.x = 140
    fridge.y = display.contentWidth/2-20
    fridge.rotation = 5

    --create an image(cat)
    cat = display.newImage("Images/sleepCat.png", 0, 0)
    sceneGroup:insert(cat)
    --set its size
    cat:scale(0.7, 0.7)
    --set its possition
    cat.x = 160
    cat.y = 220

    --create the title
    title = display.newText("Mousy\n Math", display.contentWidth/2+50, 250, "Georgia", 150)
    sceneGroup:insert(title)
    --set the color of the text
    title:setTextColor(58/255, 133/255, 144/255)
    
    --create the button
    button = display.newImage("Images/cheeseB.png", 0, 0)
    sceneGroup:insert(button)
    --set its size and position
    button:scale(-1.4, 1.4)
    button.x = display.contentWidth/2+20
    button.y = display.contentHeight/2+150

    --create the button text
    buttonText = display.newText("Start", 0, 0, "Georgia", 70)
    sceneGroup:insert(buttonText)
    --set text's position
    buttonText.x = display.contentWidth/2+25 
    buttonText.y = display.contentHeight/2+140
    --set the color of the button text
    buttonText:setTextColor(58/255, 133/255, 144/255)

    --Create the background
    bkg = display.newImageRect("Images/background.jpg", display.contentWidth, display.contentHeight)
    sceneGroup:insert(bkg)
    --anchor the image
    bkg.anchorX = 0
    bkg.anchorY = 0
    bkg:toBack()
    
    --load the sound
    bkgSound = audio.loadStream("Sounds/clear.mp3", {channel = 1})
    --play sound
    bkgChannel = audio.play(bkgSound)
    --add event listener to the button
    button:addEventListener("tap", changeScene)
end


scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene)
-- -----------------------------------------------------------------------------------
 
return scene