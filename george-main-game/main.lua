local love = require('love')
local start_screen = require('start_screen')
require('game')

function love.load()
    startLoad() --loads the start menu
    if startUpdate() == 'started' then -- if the game is selected and started
        gameLoad() -- loads game files
    end
end

function love.keypressed(key)
    if key == 'escape' then -- quit with escape press
        love.event.quit()
    end
    if key == 'p' then -- allows menu to be accessed from whatever menu
        startUpdate('menu')
    end
    
end

function love.update()
    if startUpdate() == 'started' then -- if the game is started, then start game update loop
        gameUpdate()
    end
    
end

function love.draw()
    if startUpdate() == 'menu' then -- if the game is in menu state, then draw the menu, same for each state
        startDraw()
    end
    if startUpdate() == 'paused' then 
        love.graphics.setBackgroundColor(1,0,0)
    end
    if startUpdate() == 'started' then
        gameDraw()
    end

end
