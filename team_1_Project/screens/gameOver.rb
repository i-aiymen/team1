class GameOver
    @@backgroundImage = Image.load('image/background.png')
    @@gameoverText = Image.load('image/gameover_text.png')

    def initialize
        @@homeButton = Sprite.new(290,380, Image.load('image/home.png'))
        @@replayButton = Sprite.new(370,380, Image.load('image/replay.png'))
    end

    

    def update(x, y)
        m = Sprite.new(x, y, Image.new(1, 1, C_RED))
        if m === @@homeButton
            @@homeButton = Sprite.new(290,380, Image.load('image/homeHover.png'))
        end
        if m === @@replayButton
            @@replayButton = Sprite.new(370,380, Image.load('image/replayHover.png'))
        end
    end

    def draw
        x = Input.mouse_pos_x
        y = Input.mouse_pos_y

        update(x, y)
        Window.draw(0, 0, @@backgroundImage)
        Window.draw(162,227,@@gameoverText)
        Sprite.draw([@@homeButton,@@replayButton])
    end
end