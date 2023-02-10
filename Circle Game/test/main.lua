
function love.load()
    windowHeight = 500
    windowWidth = 1000
    love.window.setMode(windowWidth, windowHeight)
    circleX = windowWidth/2
    circleY = windowHeight/2
    radius = 50
    randX = love.math.random(radius, windowWidth - radius)
    randY = love.math.random(radius, windowHeight - radius)
    count = 0
    countdown = 0
    timer = 15
    round = 1

end
function love.mousepressed(x, y)
    if (x - circleX)^2 + (y - circleY)^2 < 2500 then
        hold = true
    end
end
function love.mousereleased()
    hold = false
end
function love.mousemoved(_x, _y, dx, dy)

    if hold then
        circleX = circleX + dx
        circleY = circleY + dy    
    end
end
function barColor(time)
    love.graphics.setColor(time/15, 0.0, 1.0 - time/15)
end
function love.update(dt)
    target = (circleX - randX)^2 + (circleY - randY)^2
    if target < 10 then
        randX = love.math.random(radius, windowWidth - radius + 10)
        randY = love.math.random(radius, windowHeight - radius + 10)
        count = count + 1
    end
    
    countdown = countdown + dt
    if countdown > timer then
        if count >= 5 then
            timer = timer - round
            count = 0
            round = round + 1
        end
        countdown = 0
    end
    
    
    

end

function love.draw()
    love.graphics.setColor(0.1, 0.5, 0.2)
    love.graphics.circle('fill', circleX, circleY, radius, 100)
    love.graphics.setColor(0.7, 0.1, 0.4)
    love.graphics.circle('line', randX, randY, radius + 10, 100)
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.print(tostring(count), windowWidth/2, 10)
    love.graphics.print(tostring(countdown), windowWidth/2, 5)
    barColor(countdown)
    love.graphics.rectangle('fill', countdown * windowWidth / 30, 0, windowWidth - countdown * windowWidth / 15, 10)
end
