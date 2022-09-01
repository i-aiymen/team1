class Bullet < Sprite
    @speed
    
    def initialize(x,y,img)
        @speed = 3
        super(x,y,img)
    end

    def move(tank_angle)

        case(tank_angle)
        when 0
            self.x += @speed
        when 90
            self.y += @speed
        when 180
            self.x -= @speed
        when -90
            self.y -= @speed
        end

    end

    def showExplosion
        explosionTime = 240
        timer = explosionTime

        # while timer >= 60
        #     case(timer / 60)
        #     when 4
        #         puts "---------------------"
        #         self.image=("image/exp_1.png")
        #     when 3
        #         self.image=("image/exp_3.png")
        #     when 2
        #         self.image=("image/exp_5.png")
        #     when 1
        #         self.image=("image/exp_7.png")
        #     end
        #     puts timer
        #     timer-=1
        # end

    end
end