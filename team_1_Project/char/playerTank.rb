class PlayerTank < Sprite
    @movingStatus
    @currentPosX
    @currentPosY
    @img_width
    @img_height
    @isPotrait

    def initialize
        image = Image.load("image/player_tank.png")
        @img_width = image.width
        @img_height = image.height
        @movingStatus = true
        @currentPosX = 0
        @currentPosY = 230
        @isPotrait = false

        super(@currentPosX,@currentPosY,image)
    end

    def setMovingStatus(status)
        @movingStatus = status

        if(@movingStatus == false)
            puts "SET TO FALSE ==================="
        end
    end

    def getMovingStatus
        return @movingStatus
    end
    def move
        i_x = Input.x
        i_y = Input.y 
        rotAngle = self.angle 

        # If the user presses both the movement keys a time, it should not move
        if(!@movingStatus || i_x != 0 && i_y != 0)
            return
        end

        # Vertical Direction Change
        case(i_y)
        when -1
            self.angle=(-90)
            @isPotrait = true
        when 1
            self.angle=(90)
            @isPotrait = true
        end    

        # Horizontal Direction Change
        case(i_x)
        when -1
            self.angle=(180)
            @isPotrait = false
        when 1
            self.angle=(0)
            @isPotrait = false
        end

        self.x += i_x
        self.y += i_y


        puts "Angle of Rotation : #{self.angle}, x : #{self.x}, y : #{self.y}"
    end

    def getImageSize
        return @isPotrait, @img_width, @img_height
    end

    def setImageSize(width,height)
        @img_width = width
        @img_height = height
    end

    def coll_with_metal
        
    end

end