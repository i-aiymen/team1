require 'dxruby'

Dir['./char/*.rb', './level/*.rb'].each do |file|
    require_relative file
  end

#window settings
Window.width = 720
Window.height = 676
Window.caption = "Shooting Game"
Window.bgcolor = C_WHITE

level1 = Level1.new

Window.loop do

    level1.draw
    
    level1.update
end