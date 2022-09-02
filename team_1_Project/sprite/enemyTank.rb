class EnemyTank < Sprite
    @movingStatus
    @currentPosX
    @currentPosY
    @img_width
    @img_height
    @isPotrait
    @movementAtColl_x # Contains the input.x at the time of collision
    @movementAtColl_y # Contains the input.x at the time of collision
    @movementOffset # No. of steps moved b4 changing the direction
    @movementMax # Max steps moved b4 changing the direction
    @speed_x 
    @speed_y
    @changeDirection

    def initialize(x,y,image)
        @img_width = image.width
        @img_height = image.height
        @movingStatus = true
        @currentPosX = x
        @currentPosY = y
        @isPotrait = false
        @movementAtColl_x = 0
        @movementAtColl_y = 0
        @movementOffset = 0
        @movementMax = 200
        @changeDirection = false

        super(@currentPosX,@currentPosY,image)
    end

    def move

        rotAngle = self.angle

        if (@movementOffset >= @movementMax)
            @changeDirection = true
            @movementOffset = 0
        end
        
        
        case(rotAngle)
        when 0
            if !@changeDirection
                i_x = 1
                i_y = 0
                @movementOffset += 1
            else
                puts "MAX UP ----------------"
                mov = rand(-1..1)
                while mov != 0
                    i_y = mov
                    i_x = 0
                    break
                end
            end

        when 90
            if !@changeDirection
                i_x = 0
                i_y = 1
                @movementOffset += 1
            else 
                mov = rand(-1..1)
                while mov != 0
                    i_x = mov
                    i_y = 0
                    break
                end
            end
        when 180
            if !@changeDirection
                i_x = -1
                i_y = 0
                @movementOffset += 1
            else 
                mov = rand(-1..1)
                while mov != 0
                    i_y = mov
                    i_x = 0
                    break
                end
            end
        when -90
            if !@changeDirection
                i_x = 0
                i_y = -1
                @movementOffset += 1
            else 
                mov = rand(-1..1)
                while mov != 0
                    i_x = mov
                    i_y = 0
                    break
                end
            end
        end


        # puts "i_x = #{i_x}, i_y = #{i_y}"
        # puts "mov_x = #{@movementAtColl_x}, mov_y = #{@movementAtColl_y}"

        if(@movingStatus == false && (i_x != @movementAtColl_x || i_y != @movementAtColl_y))
            # puts "movingStat : #{@movingStatus}"
            @movingStatus = true
        end
        # puts "movingStat : #{@movingStatus}"

        # If the user presses both the movement keys a time, tank should not move
        if(!@movingStatus || i_x != 0 && i_y != 0)
            return
        end

        # Vertical Direction Change
        if @changeDirection
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

            @changeDirection = false
        end

        puts "i_x : #{i_x}, i_y : #{i_y}, angle : #{self.angle}, img width : #{@img_width}"

        
        if  !(((self.x + i_x) >= 90 && (self.x + i_x) <= (540)) && 
            ((self.y + i_y) >= 95 && (self.y + i_y) <= (505)))
            @changeDirection = true
        end
        
        puts @movementOffset
        if !@changeDirection
            self.x += i_x
            self.y += i_y
        end
        

        # puts "Angle of Rotation : #{self.angle}, x : #{self.x}, y : #{self.y}"
    end

    def hit_bullet
        puts "BULLET COLLIDED WITH ENEMYTANK : x : #{self.x}, y : #{self.y}"
        self.vanish
    end

    def shot_sprites
        @changeDirection = true
    end
end