require 'dxruby'
require_relative './char/playerTank.rb'
require_relative './level/level1'

#window settings
Window.width = 640
Window.height = 676
Window.caption = "Shooting Game"
Window.bgcolor = C_WHITE

playerTank = PlayerTank.new

Window.loop do
    Level1.draw
    playerTank.draw
end