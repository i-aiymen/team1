require 'dxruby'
class Home
    @@backgroundImage = Image.load('image/background.png')
    @@gameNameText = Image.load('image/gameName_text.png')

    def initialize
        @@playButton = Sprite.new(290,372, Image.load('image/play.png'))
        @@settingsButton = Sprite.new(13,17, Image.load('image/settings.png'))
        @@rulesButton = Sprite.new(13,80, Image.load('image/rules.png'))
        @@musicButton = Sprite.new(660,17, Image.load('image/music.png'))
        @@exitButton = Sprite.new(660,80, Image.load('image/exit.png'))
    end

    

    def update(x, y)
        m = Sprite.new(x, y, Image.new(1, 1, C_RED))
        if m === @@playButton
            @@playButton = Sprite.new(290,372, Image.load('image/playHover.png'))
        end
        if m === @@settingsButton
            @@settingsButton = Sprite.new(13,17, Image.load('image/settingsHover.png'))
        end
        if m === @@rulesButton
            @@rulesButton = Sprite.new(13,80, Image.load('image/rulesHover.png'))
        end
        if m === @@musicButton
            @@musicButton = Sprite.new(660,17, Image.load('image/musicHover.png'))
        end
        if m === @@exitButton
            @@exitButton = Sprite.new(660,80, Image.load('image/exitHover.png'))
        end
    end

    def draw
        x = Input.mouse_pos_x
        y = Input.mouse_pos_y

        update(x, y)
        Window.draw(0, 0, @@backgroundImage)
        Window.draw(212,241,@@gameNameText)
        Sprite.draw([@@playButton,@@settingsButton,@@rulesButton,@@musicButton,@@exitButton])
    end
end