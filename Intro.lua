--Add composer library
local composer = require( "composer" )
local scene = composer.newScene()

--stop sound from previous scene
audio.stop(1)
--Function:changeScene
--Description: when touch the button, it reacts and change the scene
local function changeScene( )
  composer.gotoScene("LibLab", {effect = "fade", time = 1000 })
end
-- create()
function scene:create( event )
    
    ----------------------------------------------------------------------------------------
    --LOCAL VARIABLES
    ----------------------------------------------------------------------------------------
   local mouse
   local textPannel1
   local bkg
   local button
   local buttonText
   local textMouse1
   local textMouse2
   local textMouse3
   local catSound
   local catChannel
   local mouseSound
   local mouseChannel
   local sceneGroup = self.view
   
    ----------------------------------------------------------------------------------------------------------
    --OBJECT CREATION
    ---------------------------------------------------------------------------------------------------------
    --create the background
    bkg = display.newImageRect("Images/background.jpg", display.contentWidth, display.contentHeight)
    sceneGroup:insert(bkg)
    --anchor the image
    bkg.anchorX = 0 
    bkg.anchorY = 0
    bkg:toBack()
     
    --create text pannel
    textPannel1 = display.newImage("Images/pannel.png", 0, 0)
    sceneGroup:insert(textPannel1)
    --set its size
    textPannel1:scale(0.5, 0.5)
    --set its possition
    textPannel1.x = 550
    textPannel1.y = 200

    --create the mouse
    mouse = display.newImage("Images/Mouse.png", 0, 0)
    sceneGroup:insert(mouse)
    --set its size and orientation
    mouse:scale(-1.3, 1.3)
    --set its position
    mouse.x = 200
    mouse.y = display.contentHeight-300

    --create the text    
    textMouse1 = display.newText("    Hi! My name is\nMolly. I have a huge\npassion for cheese\n       and math!", 0, 0, "Georgia", 50)
    sceneGroup:insert(textMouse1)
    --set its position
    textMouse1.x = 560
    textMouse1.y = 180

    --Create text
    textMouse2 = display.newText("        Help me to\nsolve math problems\nand get some cheese\n  from cat's fridge", 0, 0, "Georgia", 49)
    sceneGroup:insert(textMouse2)
    textMouse2.isVisible = false
    --set its possition
    textMouse2.x = 560
    textMouse2.y = 180

    --create text
    textMouse3 = display.newText("We'd better hurry\nbefore cat gets us", 0, 0, "Georgia", 50)
    sceneGroup:insert(textMouse3)
    textMouse3.isVisible = false
    --set its position
    textMouse3.x = 560
    textMouse3.y = 160

    --create object(button)
    button = display.newRoundedRect(0, 0, 200, 100, 15)
    button.strokeWidth = 5
    sceneGroup:insert(button)
    button.isVisible = false
    --set its position
    button.x = 540
    button.y = 270
    --set the color
    button:setStrokeColor(29/255, 138/255, 197/255)
    button:setFillColor(192/255, 225/255, 237/255)

    --create text
    buttonText = display.newText("Next...", 540, 270, "Georgia", 60)
    sceneGroup:insert(buttonText)
    buttonText.isVisible = false
    --set text color
    buttonText:setTextColor(29/255, 138/255, 197/255)

    --create sounds
    catSound = audio.loadStream("Sounds/cat.mp3")
    mouseSound = audio.loadStream("Sounds/mouse.mp3")
    --play the sound
    mouseChannel = audio.play(mouseSound)


    ----------------------------------------------------------------------------------------------------------------------------------------------
    --LOCAL FUNCTIONS
    ----------------------------------------------------------------------------------------------------------------------------------------------

    --Function: displayText
    --Description: displays the second text and hides the first one
    local function displayText(  )
      textMouse1.isVisible = false
      textMouse2.isVisible = true
    end
    timer.performWithDelay(2000, displayText)

    --Function:playCat
    --Description: plays the sound of the cat and change the text
    local function playCat( )
      catChannel = audio.play(catSound)
      textMouse3.isVisible = true
      textMouse2.isVisible = false
      button.isVisible = true
      buttonText.isVisible = true
    end
    timer.performWithDelay(4500, playCat)

    button:addEventListener("tap", changeScene)
end 



scene:addEventListener( "create", scene )
-- -----------------------------------------------------------------------------------
 
return scene