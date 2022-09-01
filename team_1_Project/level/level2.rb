class Level2
    @@backgroundImageLvl2 = Image.load('image/backgroundLvl2.png')
    @@playerImage = Image.load('image/playerYoru.png')
    @@enemyImage = Image.load('image/enemyRobot.png')

    def draw
        Window.draw(0, 0, @@backgroundImageLvl2)
        Window.draw(60, 531, @@playerImage)
        Window.draw(590, 51, @@enemyImage)
    end
end