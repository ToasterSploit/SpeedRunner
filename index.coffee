c = document.querySelector "canvas"
ctx = c.getContext "2d"

light = false

funcY = (x, y) ->
    light = !light
    col = "#8ECC39"

    if light
        col = "#A7D948"
    ctx.fillStyle = col
    ctx.fillRect x*40, y*40, 40, 40

funcX = (x) ->
    funcY(x, y) for y in [0..9]
    light = !light

controller = 
  left: false
  right: false
  up: false
  down: false
  keyListener: (event) ->
    key_state = if event.type == 'keydown' then true else false
    switch event.keyCode
      #keys
      when 65
        controller.left = key_state
      when 87
        controller.up = key_state
      when 68
        controller.right = key_state
      when 83
        controller.down = key_state
      #arrows
      when 37
        controller.left = key_state
      when 38
        controller.up = key_state
      when 39
        controller.right = key_state
      when 40
        controller.down = key_state
    return

playerPos = [
    Math.floor Math.random() * 9
    Math.floor Math.random() * 9 
]

fruitPos = [
    Math.floor Math.random() * 9
    Math.floor Math.random() * 9 
]
while fruitPos[0] == playerPos[0]
    fruitPos[0] = Math.floor Math.random() * 9
while fruitPos[1] == playerPos[1]
    fruitPos[1] = Math.floor Math.random() * 9

points = 0
maxpoints = 1

spawnFruit = ->
    points += 1
    if points == maxpoints
      points = 0
      maxpoints += maxpoints
    while fruitPos[0] == playerPos[0]
      fruitPos[0] = Math.floor Math.random() * 9
    while fruitPos[1] == playerPos[1]
      fruitPos[1] = Math.floor Math.random() * 9

loopFunc = ->
    ctx.fillStyle = "#202020"
    ctx.fillRect 0, 0, 400, 400
    funcX(x) for x in [0..9]

    if controller.left and playerPos[0] > 0
        playerPos[0] -= 1
    if controller.right and playerPos[0] < 9
        playerPos[0] += 1

    if controller.up and playerPos[1] > 0
        playerPos[1] -= 1
    if controller.down and playerPos[1] < 9
        playerPos[1] += 1

    if playerPos[0] == fruitPos[0] and playerPos[1] == fruitPos[1]
        spawnFruit()

    ctx.fillStyle = "#ff0000"
    ctx.fillRect fruitPos[0]*40, fruitPos[1]*40, 40, 40

    ctx.fillStyle = "#000"
    ctx.fillRect playerPos[0]*40, playerPos[1]*40, 40, 40
    
    document.getElementById("points").innerHTML = points + "/" + maxpoints + " points"

    console.log controller
    console.log playerPos
    console.log fruitPos
    
    window.requestAnimationFrame loopFunc

window.addEventListener "keydown", controller.keyListener
window.addEventListener "keyup", controller.keyListener
window.requestAnimationFrame loopFunc