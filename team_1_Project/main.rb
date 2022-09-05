require 'dxruby'

Dir['./char/*.rb', './level/*.rb','./screens/*.rb','./sprite/*.rb'].each do |file|
    require_relative file
  end

$flag = 0
$playerNickname = 'Akio'
$avatar = 'playerYoru'
$tank = 'goldTank'
$tankChanged = false

#window settings
Window.width = 720
Window.height = 676
Window.caption = "SKYLINE"
Window.bgcolor = C_WHITE

$player = Player.new

startStory = StartStory.new
level1 = nil
$sound = Sound.new("music/music1.wav")



Window.loop do
case($flag)
    when 0
        a = Home.new
        a.draw
    when 1
        a = Nickname.new
        a.draw
    when 2
        a = Settings.new
        a.draw
    when 3
        a = Rules.new
        a.draw
    when 4
        a = Home.new
        a.musicPlaying ? a.musicStop : a.music
        $flag = 0
    when 5
      Window.close

    when 6
      a = ChangeAvatar.new
      a.draw
    
    when 7
      a = GameOver.new
      a.draw

    when 8
      startStory.draw
      startStory.update
    when 9
      a = ChangeTank.new
      a.draw
    when 10
      if $tankChanged
        puts "Level1 created"
        level1 = Level1.new
        $tankChanged = false
      end
      level1.draw
      level1.update
    when 11
     Level2.draw
    end
end