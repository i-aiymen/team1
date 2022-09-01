class Level2

    @@playerX = 60
    @@playerY = 531
    @@enemyX = 590
    @@enemyY = 51
    @@playerDirection = 0
    @@playerBullets = []
    @@enemyData = Enemy.new(30,10)

    @@backgroundImageLvl2 = Image.load('image/backgroundLvl2.png')
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
            @@playerBullets.push([@@playerX + 50, @@playerY + 50, @@playerDirection])
            $player.mp = $player.mp - 5
        end
        if Input.key_push?(K_K) && $player.mp >= 7
            @@playerSplBullets.push([@@playerX, @@playerY, 250])
            $player.mp = $player.mp - 7
        end
    end

    def self.bulletMovements
        num = 0
        @@playerBullets.size.times do |i|
            ch = i - num
            case(@@playerBullets[ch][2])
                when 0
                    @@playerBullets[ch][1] -= 1
                when 1
                    @@playerBullets[ch][0] += 1
                when 2
                    @@playerBullets[ch][1] += 1
                when 3
                    @@playerBullets[ch][0] -= 1
            end

            if @@playerBullets[ch][0] < -75 || @@playerBullets[ch][0] > 675 || @@playerBullets[ch][1] < -75 || @@playerBullets[ch][1] > 675
                  @@playerBullets.delete_at(ch)
                  num += 1
            end
        end
    end

    def self.movements(enemy_data)
        Level2.playerMovement
        Level2.bulletMovements
        @@enemyX, @@enemyY = @@enemyData.move(@@enemyX, @@enemyY)
    end

    def self.die?(enemy_data, num)
        if num == 0
            # player alive condition
            if $player.hp <= 0
                return true
            else
                return false
            end
        else
            # enemy alive condition
            if enemy_data.state["hp"] <= 0
                return true
            else
                return false
            end
        end
    end

    def self.draw
        Level2.movements(@@enemyData)
        Window.draw(0, 0, @@backgroundImageLvl2)
        @@playerImage = Image.load("image/playerYoru#{@@playerDirection}.png")
        @@playerBulletImage = Image.load("image/playerBulletImage#{@@playerDirection}.png")
        Window.draw(@@playerX, @@playerY, @@playerImage)
        if !Level2.die?(@@enemyData, 1)
            Window.draw(@@enemyX, @@enemyY, @@enemyImage)
        end

        @@playerBullets.size.times do |i|
            Window.draw(@@playerBullets[i][0], @@playerBullets[i][1], @@playerBulletImage)
        end
        
    end
end