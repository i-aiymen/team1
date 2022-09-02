class Home

    @@backgroundImage = Image.load('image/background.png')
    @@gameNameText = Image.load('image/gameName_text.png')
    @@isPlaying = false

    def initialize
        @@playButton = Sprite.new(290,372, Image.load('image/play.png'))
        @@settingsButton = Sprite.new(13,17, Image.load('image/settings.png'))
        @@rulesButton = Sprite.new(13,80, Image.load('image/rules.png'))
        @@musicButton = Sprite.new(660,17, Image.load('image/music.png'))
        @@exitButton = Sprite.new(660,80, Image.load('image/exit.png'))
        @sound = Sound.new("music/music1.wav")
    end

    def music
        @sound.play
        @@isPlaying = true
    end

    def musicStop 
        @sound.stop
        @@isPlaying = false
    end

    def musicPlaying
        return @@isPlaying
    end

    def update(x, y)
        m = Sprite.new(x, y, Image.new(1, 1, C_BLACK))
        if m === @@playButton
            @@playButton = Sprite.new(290,372, Image.load('image/playHover.png'))
            if Input.mouse_push?(M_LBUTTON)
                $flag = 1
            end
        end
        if m === @@settingsButton
            @@settingsButton = Sprite.new(13,17, Image.load('image/settingsHover.png'))
            if Input.mouse_push?(M_LBUTTON)
                $flag = 2
            end
        end
        if m === @@rulesButton
            @@rulesButton = Sprite.new(13,80, Image.load('image/rulesHover.png'))
            if Input.mouse_push?(M_LBUTTON)
                $flag = 3
            end
        end
        if m === @@musicButton
            @@musicButton = Sprite.new(660,17, Image.load('image/musicHover.png'))
            if Input.mouse_push?(M_LBUTTON)
                $flag = 4
            end
        end
        if m === @@exitButton
            @@exitButton = Sprite.new(660,80, Image.load('image/exitHover.png'))
            if Input.mouse_push?(M_LBUTTON)
                $flag = 5
            end
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