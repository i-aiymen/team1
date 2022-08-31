class Bullet < Sprite
    @speed
    
    def initialize(x,y,img)
        @speed = 3
        super(x,y,img)
    end

    def move(tank_angle)
        case(tank_angle)
        when 0
            puts self.x
            self.x += @speed
            puts self.x
        when 90
            self.y += @speed
        when 180
            self.x -= @speed
        when -90
            self.y -= @speed
        end

    end
end