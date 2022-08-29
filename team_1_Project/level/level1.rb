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

    @@metal_crate = Image.load("image/metal_crate.png")
    @@wooden_crate = Image.load("image/wooden_crate.png")
    @@spike = Image.load("image/spike.png")

    def self.draw
        num_y = @@map.size
        num_x = num_y ? @@map[0].size : 0 # Error proof

        puts "num_x : #{num_x}, num_y = #{num_y}"

        for i in 0 ... num_y
            for j in 0 ... num_x
                case(@@map[i][j])
                when 1
                    metal_crateSprite = Sprite.new(j * 80, i * 75, @@metal_crate)
                    puts "x = #{j * 80} y = #{i * 75}"
                    Sprite.draw(metal_crateSprite)
                when 2
                    wooden_crateSprite = Sprite.new(j * 80, i * 75, @@wooden_crate)
                    puts "x = #{j * 80} y = #{i * 75}"
                    Sprite.draw(wooden_crateSprite)
                when 3
                    spikeSprite = Sprite.new(j * 80, i * 75, @@spike)
                    puts "x = #{j * 80} y = #{i * 75}"
                    Sprite.draw(spikeSprite)
                when 4
                    spikeSprite = Sprite.new(j * 80, i * 75, @@spike)
                    spikeSprite.angle=(180)
                    puts "x = #{j * 80} y = #{i * 75}"
                    Sprite.draw(spikeSprite)
                end
            end
        end

    end
end