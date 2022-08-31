class GameOver
    @@backgroundImage = Image.load('image/background.png')

    def self.draw
        Window.draw(0, 0, @@backgroundImage)
    end
end