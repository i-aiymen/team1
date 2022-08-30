require 'dxruby'

Dir['./char/*.rb', './level/*.rb'].each do |file|
    require_relative file
  end

#window settings
Window.width = 640
Window.height = 676
Window.caption = "Shooting Game"
Window.bgcolor = C_WHITE
metalSprites, woodenSprites, spikeSprites = Level1.returnSprites


playerTank = PlayerTank.new

Window.loop do
    Sprite.draw(metalSprites)
    Sprite.draw(woodenSprites)
    Sprite.draw(spikeSprites)
    playerTank.draw

    playerTank.move

    Sprite.check(playerTank, metalSprites, nil)
    Sprite.check(playerTank, woodenSprites, nil)
    Sprite.check(playerTank, spikeSprites, nil)

end