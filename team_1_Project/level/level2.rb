class Level2

    @@playerX = 60
    @@playerY = 531
    @@enemyX = 590
    @@enemyY = 51
    @@playerDirection = 0
    @@enemyData = Enemy.new(30,10)

    @@backgroundImageLvl2 = Image.load('image/backgroundLvl2.png')
    @@playerImage = Image.load('image/playerYoru.png')
    @@enemyImage = Image.load('image/enemyRobot.png')

    def self.playerMovement
        if Input.key_push?(K_W) && @@playerY >= 10
            @@playerY -= 10
            @@playerDirection = 0
        end
        if Input.key_push?(K_A) && @@playerX >= 10
            @@playerX -= 10
            @@playerDirection = 3
        end
        if Input.key_push?(K_S) && @@playerY <= 600 - 10 - 75
            @@playerY += 10
            @@playerDirection = 2
        end
        if Input.key_push?(K_D) && @@playerX <= 600 - 10 - 75
            @@playerX += 10
            @@playerDirection = 1
        end
        if Input.key_push?(K_J) && $player.mp >= 5
            @@playerBullets.push([@@playerX, @@playerY, @@playerDirection])
            $player.mp = $player.mp - 5
        end
        if Input.key_push?(K_K) && $player.mp >= 7
            @@playerSplBullets.push([@@playerX, @@playerY, 250])
            $player.mp = $player.mp - 7
        end
    end

    def self.movements(enemy_data)
        Level2.playerMovement
        @@enemyX, @@enemyY = @@enemyData.move(@@enemyX, @@enemyY)
    end

    def self.draw
        Level2.movements(@@enemyData)
        Window.draw(0, 0, @@backgroundImageLvl2)
        Window.draw(@@playerX, @@playerY, @@playerImage)
        Window.draw(@@enemyX, @@enemyY, @@enemyImage)
        
    end
end