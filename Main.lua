function love.load()
    love.physics.setMeter(100)
    world = love.physics.newWorld(0, 10*love.physics.getMeter(), true) --[[this world will have no gravity horizontally, but will have a gravity of 9.8 meters vertically. Objects can sleep in this world.]]
    ground = {}
    ground.body = love.physics.newBody(world, 407, 421, "static")
    ground.shape = love.physics.newRectangleShape(429, 40) --I'm creating a new rectangle shape, that will be 429 pixels wide and 40 pixels tall. We don't need any coordinates, since this shape will be attached to the body!
    ground.fixture = love.physics.newFixture(ground.body, ground.shape) --I'm creating a new fixture, by attaching the shape ground.s to the body ground.b!

end

function love.update(dt)

end

function love.draw()

end