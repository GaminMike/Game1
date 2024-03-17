p = love.physics
g = love.graphics
k = love.keyboard

function love.load()
  p.setMeter(100)
  w = p.newWorld(0, 10*p.getMeter(), true) 
  
  window = {}
  local width, height = love.graphics.getDimensions()
  print(width, height)
  centerY = height/2
  centerX = width/2


  ground = {}
  local shapeLength = 1000
  ground.b = p.newBody(w, centerX, centerY, "static")
  ground.s = p.newRectangleShape(shapeLength, 2)
  ground.f = p.newFixture(ground.b, ground.s)

  blocks = {
    {},
    {}
  }
  
  blocks[1].b = p.newBody(w, 264, 254, "dynamic") 

  blocks[1].s = p.newRectangleShape(35, 75)

  blocks[1].f = p.newFixture(blocks[1].b, blocks[1].s) 


  blocks[2].b = p.newBody(w, 264, 254, "dynamic") 

  blocks[2].s = p.newRectangleShape(35, 75)

  blocks[2].f = p.newFixture(blocks[2].b, blocks[2].s) 

  player = {}

  player.b = p.newBody(w, 476, 270, "dynamic") 

  player.s = p.newCircleShape(30)

  player.f = p.newFixture(player.b, player.s)

  player.f:setRestitution(0.5)
end

function love.update(dt)
  w:update(dt)
  love.keyboard.setKeyRepeat(true)
  local gravity = "positive"
  local y = player.b:getY()
  if y > centerY then
    w:setGravity(0, -10*p.getMeter())
    gravity = "negative"
  elseif y <= centerY then
    w:setGravity(0, 10*p.getMeter())
    gravity = "positive"
  end

  if k.isDown("up") or k.isDown("w") then
    player.b:applyForce(0, -300) 
  end

  if k.isDown("down") or k.isDown("s") then
    player.b:applyForce(0, 300)
  end

  if k.isDown("left") or k.isDown("a") then
    player.b:applyForce(-300, 0)
  end

  if k.isDown("right") or k.isDown("d") then
    player.b:applyForce(300, 0)

  end
  love.keyboard.setKeyRepeat(false)
  if k.isDown("space") then
    if gravity == "positive" then
    player.b:applyForce(0, -2000)
    else
    player.b:applyForce(0, 2000)
    end
  end

end

function love.draw()
  g.setColor(255, 0, 0)
  g.circle("fill", player.b:getX(), player.b:getY(), player.s:getRadius()) 

  g.setColor(255, 255, 255) --setting the color to white for the ground. Because why not?
  g.polygon("fill", ground.b:getWorldPoints(ground.s:getPoints()))

  g.setColor(0, 255, 0) --setting the color for our blocks to green.
  g.polygon("fill", blocks[1].b:getWorldPoints(blocks[1].s:getPoints()))
  g.polygon("fill", blocks[2].b:getWorldPoints(blocks[2].s:getPoints()))

  g.setColor(255, 255, 255)
end
