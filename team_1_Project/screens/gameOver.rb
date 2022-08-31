class GameOver
    @@backgroundImage = Image.load('image/background.png')
    @@homeButton = Image.load('image/home.png')
    @@replayButton = Image.load('image/replay.png')
    @@gameoverText = Image.load('image/gameover_text.png')

    def self.draw
        Window.draw(0, 0, @@backgroundImage)
        Window.draw(162,227,@@gameoverText)
        Window.draw(290,380,@@homeButton)
        Window.draw(370,380,@@replayButton)
    end
end