require_relative '../char/playerTank.rb'

class Level1
    # For the maps
    # 1 - Metal Crate
    # 2 - Wooden Crate
    # 3 - Spike

    # Frame - 2
    @@map = [
        [1,1,1,1,1,1,1,1],
        [1,0,0,0,0,0,0,1],
        [3,0,0,0,0,0,0,3],
        [0,0,0,0,0,0,0,0],
        [0,0,1,2,1,1,0,0],
        [0,0,0,0,0,0,0,0],
        [4,0,0,0,0,0,0,4],
        [1,0,0,0,0,0,0,1],
        [1,1,1,1,1,1,1,1]
    ]

    @@movEffect = 0 # What should happen when playerTank moves
    @@y = 4 # y coordinate of the playerTank at an instant time
    @@x = 0 # x coordinate of the playerTank at an instant time

    @@metal_crate = Image.load("image/metal_crate.png")
    @@wooden_crate = Image.load("image/wooden_crate.png")
    @@spike = Image.load("image/spike.png")

    def self.returnSprites
        sprites = []
        num_y = @@map.size
        num_x = num_y ? @@map[0].size : 0 # Error proof

        # puts "num_x : #{num_x}, num_y = #{num_y}"

        for i in 0 ... num_y
            for j in 0 ... num_x
                case(@@map[i][j])
                when 1
                    metalCrate_sprite = Sprite.new(j * 80, i * 75, @@metal_crate)
                    sprites << metalCrate_sprite # Adding the sprite to the array
        
                when 2
                    woodenCrate_sprite = Sprite.new(j * 80, i * 75, @@wooden_crate)
                    sprites << woodenCrate_sprite
        
                when 3
                    spikeDown_sprite = Sprite.new(j * 80, i * 75, @@spike)
                    sprites << spikeDown_sprite
        
                when 4
                    spikeUp_sprite = Sprite.new(j * 80, i * 75, @@spike, 180)
                    spikeUp_sprite.angle=(180)
                    sprites << spikeUp_sprite
                end
            end
        end

        return sprites
    end

    # def self.p_moveTank(playerTank)
    #     # @@y += Input.y
    #     # @@x += Input.x 
        
    #     # puts "map val : #{@@map[@@y + Input.y][@@x + Input.x]}"
    #     exchange, tankWidth, tankHeight = playerTank.getImageSize

    #     if exchange
    #         tankWidth, tankHeight = tankHeight, tankWidth
    #     end

    #     # if(Input.x)
    #     #     currentPosX = playerTank.x + Input.x + tankWidth*Input.x
    #     # end

    #     # if(Input.y)
    #     #     currentPosY = playerTank.y + Input.y + tankHeight*Input.y
    #     # end

    #     # currentPosX = playerTank.x 
    #     # currentPosY = playerTank.y 

    #     # puts "Tank Width : #{tankWidth}, Tank Height : #{tankHeight}"
    #     # puts "Current Pos x : #{currentPosX}, y = #{currentPosY}"

    #     # @@y = (playerTank.y + Input.y + tankHeight * Input.y) / 75
    #     # @@x = (playerTank.x + Input.x + tankWidth * Input.x) / 80
        
    #     # puts "Current x : #{@@x}, #{@@y}, Map Value : #{@@map[@@y][@@x]}"

    #     # if(@@map[@@y + Input.y][@@x + Input.x] == 1)
    #     #     playerTank.setMovingStatus(false)
    #     # else
    #     #     @@y += Input.y
    #     #     @@x += Input.x
    #     #     playerTank.setMovingStatus(true)
    #     # end

    #     # puts "tank y = #{@@y}, x = #{@@x}, map val : #{@@map[@@y][@@x]}"
    # end
end