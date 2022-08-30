class PlayerTank < Sprite
    def initialize
        image = Image.load("image/player_tank.png")
        x = 0
        y = 230

        super(x,y,image)
    end

    def move
        i_x = Input.x
        i_y = Input.y 
        rotAngle = self.angle 

        # If the user presses both the movement keys a time, it should not move
        if(i_x != 0 && i_y != 0)
            return
        end

        # Vertical Direction Change
        case(i_y)
        when -1
            self.angle=(-90)
        when 1
            self.angle=(90)
        end    

        # Horizontal Direction Change
        case(i_x)
        when -1
            self.angle=(180)
        when 1
            self.angle=(0)
        end

        self.x += i_x
        self.y += i_y


        puts "Angle of Rotation : #{self.angle}, x_input : #{Input.x}, y_input : #{Input.y}"
    end

end