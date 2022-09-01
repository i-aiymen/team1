# hp => Health Points, mp => Mana Points

class Enemy
    @@time = 0
    @@enemyDirection = 0
    @@shootDelay = 0

    def initialize(hp,mp)
        @state = {
          "hp" => hp, 
          "mp" => mp
        }
    end

    def move(enemyX, enemyY)
        if @@time % 30 == 0
          @state["mp"] += 4 # mp heal
          @state["mp"] = [@state["mp"], 10].min
        end

        xDirection = [0, 1, 0, -1]
        yDirection = [-1, 0, 1, 0]
        if @@time % 30 == 0
            boundaryArray = [] # screen boundary condition checking array
            4.times do |i|
                if xDirection[i] * 30 + enemyX <= 525 && xDirection[i] * 30 + enemyX >= 0 && yDirection[i] * 30 + enemyY <= 525 && yDirection[i] * 30 + enemyY >= 0
                  boundaryArray.push(i)
                end
            end
        
            #srand(Time.now.to_i)
            @@enemyDirection = boundaryArray[rand(boundaryArray.size)]
            @@time += 1
            return enemyX, enemyY
        else
            @@time += 1
            return enemyX + xDirection[@@enemyDirection], enemyY + yDirection[@@enemyDirection]
        end
    end

    def shot(x, y, enemyBullet)
        #srand(Time.now.to_i)
        if @state["mp"] >= 1 && @@shootDelay == 0
            @state["mp"] -= 1
            enemyBullet.push([x, y, @@enemyDirection])
            @@shootDelay = 50
        end

        num = 0
        enemyBullet.size.times do |i|
            ch = i - num
            case(enemyBullet[ch][2])
                when 0
                  enemyBullet[ch][1] -= 3
                when 1
                  enemyBullet[ch][0] += 3
                when 2
                  enemyBullet[ch][1] += 3
                when 3
                  enemyBullet[ch][0] -= 3
            end

            if enemyBullet[ch][0] < -75 || enemyBullet[ch][0] > 675 || enemyBullet[ch][1] < -75 || enemyBullet[ch][1] > 675
                enemyBullet.delete_at(i)
                num += 1
            end
        end

        if @@shootDelay != 0
          @@shootDelay -= 1
        end
        return enemyBullet
    end

    def state
        @state
    end
end