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

        # puts "num_x : #{num_x}, num_y = #{num_y}"

        for i in 0 ... num_y
            for j in 0 ... num_x
                case(@@map[i][j])
                when 1
                    Window.draw(j * 80, i * 75, @@metal_crate)
                when 2
                    Window.draw(j * 80, i * 75, @@wooden_crate)
                when 3
                    Window.draw(j * 80, i * 75, @@spike)
                when 4
                    Window.draw_rot(j * 80, i * 75, @@spike, 180)
                end
            end
        end

    end
end