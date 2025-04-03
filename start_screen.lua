local love = require('love')


function startLoad()
    love.graphics.setBackgroundColor(0.216, 0.165, 0.231)
    setColor = {1, 0, 0}
    unSetColor = {1, 1, 1}
    color = 0
    state = 0
    font = love.graphics.newFont()
end

function startUpdate(gameState)
    if gameState == 'levels' then
        state = 2
    end
    if gameState == 'started' then
        state = 1
    end
    if gameState == 'menu' then
        state = 0
    end
    
    if love.keyboard.isDown('w') and color == 1 then
        color = 0
    end
    if love.keyboard.isDown('s') and color == 0 then
        color = 1
    end
    if love.keyboard.isDown('return') and color == 0 then
        state = 1
    end
    if love.keyboard.isDown('return') and color == 1 then
        state = 2
    end

    if state == 0 then
        return 'menu'
    end
    if state == 1 then
        return 'started'
    end
    if state == 2 then
        return 'levels'
    end

end

function startDraw()
    love.graphics.setBackgroundColor(0.216, 0.165, 0.231)
    love.graphics.setColor(0.643, 0.62, 0.878)
    love.graphics.rectangle('fill', 150, 175, 200, 50)
    love.graphics.rectangle('fill', 150, 275, 200, 50)
    if color == 0 then
        love.graphics.setColor(setColor[1], setColor[2], setColor[3])
        love.graphics.rectangle('line', 150, 175, 200, 50)
        love.graphics.setColor(unSetColor[1], unSetColor[2], unSetColor[3])
        love.graphics.rectangle('line', 150, 275, 200, 50)
    end
    if color == 1 then
        love.graphics.setColor(unSetColor[1], unSetColor[2], unSetColor[3])
        love.graphics.rectangle('line', 150, 175, 200, 50)
        love.graphics.setColor(setColor[1], setColor[2], setColor[3])
        love.graphics.rectangle('line', 150, 275, 200, 50)
    end
    if state == 1 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(love.graphics.newText(font, 'Start'), 10, 10)
    end

    if state == 2 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(love.graphics.newText(font, 'levels'), 10, 10)
    end
end