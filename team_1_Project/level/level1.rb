require_relative '../sprite/metalCrate.rb'
require_relative '../sprite/woodenCrate.rb'
require_relative '../sprite/spike.rb'

class Level1
    # For the maps
    # 1 - Metal Crate
    # 2 - Wooden Crate
    # 3 - Spike

    # Frame - 2
    @@map = [
        [1,1,1,1,1,1,1,1,1],
        [1,0,0,0,0,0,0,0,1],
        [3,0,0,0,0,0,0,0,3],
        [0,0,0,0,0,0,0,0,0],
        [0,0,1,2,1,1,1,0,0],
        [0,0,0,0,0,0,0,0,0],
        [4,0,0,0,0,0,0,0,4],
        [1,0,0,0,0,0,0,0,1],
        [1,1,1,1,1,1,1,1,1]
    ]

    @@movEffect = 0 # What should happen when playerTank moves
    @@y = 4 # y coordinate of the playerTank at an instant time
    @@x = 0 # x coordinate of the playerTank at an instant time

    @@metal_crate = Image.load("image/metal_crate.png")
    @@wooden_crate = Image.load("image/wooden_crate.png")
    @@spike = Image.load("image/spike.png")

    def self.returnSprites
        metalSprites = []
        woodenSprites = []
        spikeSprites = []

        num_y = @@map.size
        num_x = num_y ? @@map[0].size : 0 # Error proof

        # puts "num_x : #{num_x}, num_y = #{num_y}"

        for i in 0 ... num_y
            for j in 0 ... num_x
                case(@@map[i][j])
                when 1
                    metalSprites << MetalCrate.new(j * 80, i * 75, @@metal_crate)
                    # Adding the sprite to the array
        
                when 2
                    woodenSprites << WoodenCrate.new(j * 80, i * 75, @@wooden_crate)
                    
        
                when 3
                    spikeSprites << Spike.new(j * 80, i * 75, @@spike)
                     
        
                when 4
                    spikeTopSprite =  Spike.new(j * 80, i * 75, @@spike)
                    spikeTopSprite.angle=(180)

                    spikeSprites << spikeTopSprite
                end
            end
        end

        return metalSprites, woodenSprites, spikeSprites
    end
end