require 'dxruby'

Dir['./char/*.rb', './level/*.rb','./screens/*.rb'].each do |file|
    require_relative file
  end

#window settings
Window.width = 720
Window.height = 676
Window.caption = "Shooting Game"
Window.bgcolor = C_WHITE
metalSprites, woodenSprites, spikeSprites = Level1.returnSprites # Array containing the particular sprites


playerTank = PlayerTank.new

Window.loop do
    # Sprite.draw(metalSprites)
    # Sprite.draw(woodenSprites)
    # Sprite.draw(spikeSprites)
    # playerTank.draw
    
    # playerTank.move

    # Sprite.check(playerTank, metalSprites, :coll_with_metal)
    # Sprite.check(playerTank, woodenSprites, nil) # Hit method of WoodenSprite is called
    # Sprite.check(playerTank, spikeSprites, nil) # Hit method of spikeSprite is called

    # a = GameOver.new
    # a.draw

    a = ChangeAvatar.new
    a.draw

end