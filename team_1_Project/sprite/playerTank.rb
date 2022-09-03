class PlayerTank < Sprite
    @movingStatus
    @currentPosX
    @currentPosY
    @img_width
    @img_height
    @isPotrait
    @movementAtColl_x # Contains the input.x at the time of collision
    @movementAtColl_y # Contains the input.x at the time of collision
    @hp_current
    @hp_max
    @hpDecreased # Bool : HP decreased upon collision with spike

    def initialize(image)
        @img_width = image.width
        @img_height = image.height
        @movingStatus = true
        @currentPosX = 0
        @currentPosY = 270
        @isPotrait = false
        @movementAtColl_x = 0
        @movementAtColl_y = 0
        @hp_max = 20
        @hp_current = @hp_max
        @hpDecreased = false

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

        # puts "i_x = #{i_x}, i_y = #{i_y}"
        # puts "mov_x = #{@movementAtColl_x}, mov_y = #{@movementAtColl_y}"

        if(@movingStatus == false && (i_x != @movementAtColl_x || i_y != @movementAtColl_y))
            puts "movingStat : #{@movingStatus}"
            @movingStatus = true
            @hpDecreased = false
        end
        # puts "movingStat : #{@movingStatus}"

        # If the user presses both the movement keys a time, tank should not move
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


        # puts "Angle of Rotation : #{self.angle}, x : #{self.x}, y : #{self.y}"
    end

    def getImageSize
        return @isPotrait, @img_width, @img_height
    end

    def setImageSize(width,height)
        @img_width = width
        @img_height = height
    end

    # Shot function - Collision with metal crate
    def coll_with_metal
        @movingStatus = false

        @movementAtColl_x = Input.x 
        @movementAtColl_y = Input.y 
    end

    def returnBulletPos

    end


    def coll_with_spike

        # Check if HP has already decreased
        if !@hpDecreased 
            self.decreaseCurrentHP(3)
            # Stopping the tank
            @movingStatus = false
            @movementAtColl_x = Input.x 
            @movementAtColl_y = Input.y
            
            # Will move the playertank a lil bit backward
            puts "Spike col x : #{self.x}, y : #{self.y}"
            self.x -= Input.x * 4 
            self.y-= Input.y * 4
            puts "Spike col x : #{self.x}, y : #{self.y}"
            
    
            # HP should only decrease once
            @hpDecreased = true 
        end
    end

    def getCurrentHP
        return @hp_current
    end

    def decreaseCurrentHP(dec)
        @hp_current -= dec

        if @hp_current == 0
            self.vanish
            $flag = 7
        end
    end

    def coll_with_bullet
        self.decreaseCurrentHP(5)
    end
end