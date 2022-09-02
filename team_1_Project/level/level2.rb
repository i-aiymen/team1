class Level2

    @@playerX = 60
    @@playerY = 531
    @@enemyX = 590
    @@enemyY = 51
    @@playerDirection = 0
    @@graphicsTime = 0
    @@flag = -1
    @@playerBullets = []
    @@playerSplBullets = []
    @@enemyBullets = []
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

        num = 0
        @@playerSplBullets.size.times do |i|
            ch = i - num
            if @@playerSplBullets[ch][0] > @@enemyX
                @@playerSplBullets[ch][0] -= [(1 / 2).ceil, 1].max
            elsif @@playerSplBullets[ch][0] < @@enemyX
                @@playerSplBullets[ch][0] += [(1 / 2).ceil, 1].max
            end
            if @@playerSplBullets[ch][1] > @@enemyY
                @@playerSplBullets[ch][1] -= [(1 / 2).ceil, 1].max
            elsif @@playerSplBullets[ch][1] < @@enemyY
                @@playerSplBullets[ch][1] += [(1 / 2).ceil, 1].max
            end

            @@playerSplBullets[ch][2] -= 1
            if @@playerSplBullets[ch][2] <= 0
                @@playerSplBullets.delete_at(ch)
                num += 1
            end
        end
    end

    def self.wait()
        if Input.key_push?(K_RETURN)
            case(@@flag)
                when 1
                    @@flag = 0
                when 2
                    @@flag = 3
                when 3
                  
                when 4
                    @@flag = 5
                when 5
                    if $player.lv_up?
                        @@flag = 6
                    end
            end
        end
    end

    def self.atack(enemy_data, num)
        sum = 0
        case(num)
            when 0
                sum += 3
                sum = [1, sum].max
                @@enemyData.state["hp"] -= sum
                @@enemyData.state["hp"] = [enemy_data.state["hp"], 0].max
            when 1
                sum += 3
                sum = [1, sum].max
                $player.hp -= sum
                $player.hp = [$player.hp, 0].max
        end
    end

    def self.hit(enemy_data)
        com_spr = Sprite.new(@@playerX, @@playerY, Image.new(75, 75, C_WHITE))
        enemy_spr = Sprite.new(@@enemyX, @@enemyY, Image.new(75, 75, C_WHITE))
        num = 0
        @@playerBullets.size.times do |i|
            ch = i - num
            b_sprite = Sprite.new(@@playerBullets[ch][0], @@playerBullets[ch][1], Image.new(75, 75, C_BLACK))
            if enemy_spr === b_sprite
                Level2.atack(@@enemyData, 0)
                @@playerBullets.delete_at(i)
                num += 1
            end
        end
        @@playerSplBullets.size.times do |i|
            ch = i - num
            b_sprite = Sprite.new(@@playerSplBullets[ch][0], @@playerSplBullets[ch][1], Image.new(75, 75, C_BLACK))
            if enemy_spr === b_sprite
                Level2.atack(@@enemyData, 0)
                @@playerSplBullets.delete_at(i)
                num += 1
            end
        end

        num = 0
        @@enemyBullets.size.times do |i|
            ch = i - num
            b_sprite = Sprite.new(@@enemyBullets[ch][0], @@enemyBullets[ch][1], Image.new(75, 75, C_BLACK))
            if com_spr === b_sprite
                Level2.atack(@@enemyData, 1)
                @@enemyBullets.delete_at(i)
                num += 1
            end
        end
    end

    def self.movements(enemy_data)
        case(@@flag)
            when 0
                Level2.playerMovement
                Level2.bulletMovements
                Level2.hit(@@enemyData)
                @@enemyBullets = @@enemyData.shot(@@enemyX, @@enemyY, @@enemyBullets)
                @@enemyX, @@enemyY = @@enemyData.move(@@enemyX, @@enemyY)
                $player.mp_heal
                if Level2.die?(@@enemyData, 0) 
                    @@flag = 2
                end
                if Level2.die?(@@enemyData, 1) 
                    @@flag = 4
                end
            when 1, 2, 3, 4, 5, 6
                Level2.wait()
            end
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
        @@playerImage = Image.load("image/#{$avatar}#{@@playerDirection}.png")
        @@playerBulletImage = Image.load("image/playerBulletImage#{@@playerDirection}.png")
        @@playerSplBulletImage = Image.load('image/playerSplBulletImage.png')
        @@enemyBulletImage = Image.load('image/enemyBulletImage.png')

        Level2.movements(@@enemyData)
        Window.draw(0, 0, @@backgroundImageLvl2) 
        Window.draw(@@playerX, @@playerY, @@playerImage)
        if !Level2.die?(@@enemyData, 1)
            Window.draw(@@enemyX, @@enemyY, @@enemyImage)
            @@enemyBullets.size.times do |i|
                Window.draw(@@enemyBullets[i][0], @@enemyBullets[i][1], @@enemyBulletImage)
            end
        end

        @@playerBullets.size.times do |i|
            Window.draw(@@playerBullets[i][0], @@playerBullets[i][1], @@playerBulletImage)
        end

        @@playerSplBullets.size.times do |i|
            Window.draw(@@playerSplBullets[i][0], @@playerSplBullets[i][1], @@playerSplBulletImage)
        end

        case(@@flag)
        when -1
            @@board1 = Sprite.new(0, 0, Image.new(720, 380 - @@graphicsTime, C_BLACK))
            @@board2 = Sprite.new(0, 300 + @@graphicsTime, Image.new(720, 380 - @@graphicsTime, C_BLACK))
            @@graphicsTime += 10
            Sprite.draw([@@board1, @@board2])
            if @@graphicsTime >= 300
                @@flag = 1
            end
        when 0
            @@scoreBoard = Image.load('image/scoreBoard.png')
            Window.draw(15,12,@@scoreBoard)
            Window.draw_font(160, 31, "#{$player.hp}/20", Font.new(30),{:color => C_BLACK})
            Window.draw_font(30, 31, "#{$playerNickname}", Font.new(20),{:color => C_BLACK})
            Window.draw_font(30, 50, "Player", Font.new(14),{:color => [255,0, 255, 0]})
            Window.draw_font(240, 31, "#{@@enemyData.state["hp"]}/30", Font.new(30),{:color => C_BLACK})
            Window.draw_font(360, 31, "ROBO-EL", Font.new(20),{:color => C_BLACK})
            Window.draw_font(400, 50, "Enemy", Font.new(14),{:color => [255,255, 0, 0]})

        when 1, 2, 3, 4, 5, 6
            @@board = Sprite.new(7, 420, Image.new(705, 241, C_BLACK))
            Sprite.draw([@@board])

            #comment
            case(@@flag)
                when 1
                    Window.draw_font(15, 430, "Level 2 : ROBO-EL appeared", Font.new(30))
                when 2
                    Window.draw_font(15, 430, "You failed to kill the ROBO-EL. The invasion will continue", Font.new(30))
                    $flag = 7
                when 4
                    Window.draw_font(15, 430, "ROBO-EL fell down", Font.new(30))
                    $flag = 7
            end
        end
        
    end
end