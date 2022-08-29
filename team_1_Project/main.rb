require 'dxruby'
require_relative './level/level1'

#window settings
Window.width = 640
Window.height = 676
Window.caption = "Shooting Game"
Window.bgcolor = C_WHITE

Window.loop do
    Level1.draw
end