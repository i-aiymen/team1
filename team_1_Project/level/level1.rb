require_relative '../sprite/metalCrate'
require_relative '../sprite/bullet'
require_relative '../sprite/woodenCrate'
require_relative '../sprite/spike'
require_relative '../sprite/playerTank'

class Level1
    # For the maps
    # 1 - Metal Crate
    # 2 - Wooden Crate
    # 3 - Spike

    # Frame - 2
    @map

    @movEffect = 0 # What should happen when playerTank moves
    @y = 4 # y coordinate of the playerTank at an instant time
    @x = 0 # x coordinate of the playerTank at an instant time
    @metalSprites
    @woodenSprites
    @spikeSprites
    @playerTankSprite
    @enemyTankSprite
    @bulletSprite
    @playerShoot
    @bullet_x
    @bullet_y
    @bullet_speed

    @@metalCrate_img = Image.load("image/metal_crate.png")
    @@woodenCrate_img = Image.load("image/wooden_crate.png")
    @@spike_img = Image.load("image/spike.png")
    @@playerTank_img = Image.load("image/player_tank.png")
    @@bullet_img = Image.load("image/bullet_l1.png")

    def initialize
        @metalSprites = []
        @woodenSprites = []
        @spikeSprites = []
        @playerTankSprite = PlayerTank.new(@@playerTank_img)
        @playerShoot = false
        @bullet_speed = 3

        @map = [
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

        num_y = @map.size
        num_x = num_y ? @map[0].size : 0 # Error proof

        # puts "num_x : #{num_x}, num_y = #{num_y}"

        for i in 0 ... num_y
            for j in 0 ... num_x
                case(@map[i][j])
                when 1
                    @metalSprites << MetalCrate.new(j * 80, i * 75, @@metalCrate_img)
                    # Adding the sprite to the array
        
                when 2
                    @woodenSprites << WoodenCrate.new(j * 80, i * 75, @@woodenCrate_img)
                    
        
                when 3
                    @spikeSprites << Spike.new(j * 80, i * 75,  @@spike_img)
                     
        
                when 4
                    spikeTopSprite =  Spike.new(j * 80, i * 75, @@spike_img)
                    spikeTopSprite.angle=(180)

                    @spikeSprites << spikeTopSprite
                end
            end
        end

        
    end

    def draw
        Sprite.draw(@woodenSprites)
        Sprite.draw(@metalSprites)
        Sprite.draw(@spikeSprites)
        
        @playerTankSprite.draw
    end

    def update
        @playerTankSprite.move

        Sprite.check(@playerTankSprite, @metalSprites, :coll_with_metal)
        Sprite.check(@playerTankSprite, @woodenSprites, nil) # Hit method of WoodenSprite is called
        Sprite.check(@playerTankSprite, @spikeSprites, nil) # Hit method of spikeSprite is called

        if Input.key_push?(K_SPACE)
            @bullet_x = @playerTankSprite.x + @@playerTank_img.width + 2
            @bullet_y = @playerTankSprite.y + @@playerTank_img.height / 2
            @playerShoot = true
        end

        if @playerShoot
            self.shoot_bullet
        end

    end

    def shoot_bullet
        puts "Shooting"
        @bulletSprite = Bullet.new(@bullet_x, @bullet_y, Image.load("image/bullet_l1.png"))
        @bulletSprite.draw

        case(@playerTankSprite.angle)
        when 0
            puts @bullet_x
            @bullet_x += @bullet_speed
            puts @bullet_x
        when 90
            @bullet_y += @bullet_speed
        when 180
            @bullet_x -= @bullet_speed
        when -90
            @bullet_y -= @bullet_speed
        end

        if @bullet_x == Window.width || @bullet_y == Window.height
            @playerShoot = false 
        end
    end
end