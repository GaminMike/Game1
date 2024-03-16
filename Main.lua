p = love.physics
g = love.graphics
k = love.keyboard

function love.load()
  p.setMeter(100)
  w = p.newWorld(0, 9.8*p.getMeter(), true) 

  ground = {}

  ground.b = p.newBody(w, 407, 421, "static")
  ground.s = p.newRectangleShape(1000, 40)
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

  player.f:setRestitution(0.7)
end

function love.update(dt)
  w:update(dt)

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
  if k.isDown("space") then
    player.b:applyForce(0, -2000)
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
