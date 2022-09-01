require_relative '../sprite/metalCrate'
require_relative '../sprite/bullet'
require_relative '../sprite/woodenCrate'
require_relative '../sprite/spike'
require_relative '../sprite/playerTank'
require_relative '../sprite/enemyTank'

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
    @playerTank_sprite
    @enemyTank_sprite
    @bulletSprite
    @playerShoot
    @bullet_x
    @bullet_y
    @bullet_speed
    @tankShooting_angle # Angle of the bullet after tank fires it
    @explodeBullet
    @explosion_x
    @explosion_y
    @explosion_maxTime
    @explosion_timer

    @@metalCrate_img = Image.load("image/metal_crate.png")
    @@woodenCrate_img = Image.load("image/wooden_crate.png")
    @@spike_img = Image.load("image/spike.png")
    @@playerTank_img = Image.load("image/player_tank.png")
    @@enemyTank_img = Image.load("image/enemy_l3.png")
    @@bullet_img = Image.load("image/bullet_l1.png")
    @@explosion_effects = []

    8.times do |idx|
        @@explosion_effects << Image.load("image/exp_#{idx + 1}.png")
    end


    def initialize
        @metalSprites = []
        @woodenSprites = []
        @spikeSprites = []
        @enemyTank_sprites = []
        @playerTank_sprite = PlayerTank.new(@@playerTank_img)
        @explosion_maxTime = 20
        @explosion_timer = 0
        
        2.times do 
            @enemyTank_sprites << EnemyTank.new(rand(90 .. 540),rand(95 .. 150),@@enemyTank_img)
        end

        2.times do 
            @enemyTank_sprites << EnemyTank.new(rand(90 .. 540),rand(390 .. 505),@@enemyTank_img)
        end

        @playerShoot = false
        @explodeBullet = false
        @bullet_speed = 3

        @map = [
            [1,1,1,1,1,1,1,1,1],
            [1,0,0,0,0,0,0,0,1],
            [3,0,0,0,0,0,0,0,3],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,1,2,1,0,0,0],
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
                    puts "Metal : #{j * 80}, #{i * 75}"
        
                when 2
                    @woodenSprites << WoodenCrate.new(j * 80, i * 75, @@woodenCrate_img)
                    puts "Wooden : #{j * 80}, #{i * 75}"
                    
                    
                when 3
                    @spikeSprites << Spike.new(j * 80, i * 75,  @@spike_img)
                    puts "Spike Top : #{j * 80}, #{i * 75}"
                    
                    
                when 4
                    spikeTopSprite =  Spike.new(j * 80, i * 75, @@spike_img)
                    spikeTopSprite.angle=(180)
                    puts "Spike Down : #{j * 80}, #{i * 75}"
                    
                    @spikeSprites << spikeTopSprite
                end
            end
        end

        
    end

    def draw
        Sprite.draw(@woodenSprites)
        Sprite.draw(@metalSprites)
        Sprite.draw(@spikeSprites)
        
        Sprite.draw(@enemyTank_sprites)
        @playerTank_sprite.draw
    end

    def update
        @playerTank_sprite.move
        @enemyTank_sprites.each do |enemyTank|
            enemyTank.move
        end

        Sprite.check(@playerTank_sprite, @metalSprites, :coll_with_metal)
        Sprite.check(@playerTank_sprite, @woodenSprites, nil) # Hit method of WoodenSprite is called
        Sprite.check(@playerTank_sprite, @spikeSprites, nil) # Hit method of spikeSprite is called
        Sprite.check(@enemyTank_sprites, @metalSprites, :shot_sprites, nil)
        Sprite.check(@enemyTank_sprites, @woodenSprites, :shot_sprites, nil)
        Sprite.check(@enemyTank_sprites, @spikeSprites, :shot_sprites, nil)

        if Input.key_push?(K_SPACE) && !@playerShoot
            @tankShooting_angle = @playerTank_sprite.angle
            
            # Setting the bullet pos
            case(@tankShooting_angle)
            when 0
                @bullet_x = @playerTank_sprite.x + @@playerTank_img.width + 2
                @bullet_y = @playerTank_sprite.y + @@playerTank_img.height / 2
            when 90
                @bullet_x = @playerTank_sprite.x + @@playerTank_img.width / 2
                @bullet_y = @playerTank_sprite.y + @@playerTank_img.height + 2
            when -90
                @bullet_x = @playerTank_sprite.x + @@playerTank_img.width / 2
                @bullet_y = @playerTank_sprite.y - 2
            when 180
                @bullet_x = @playerTank_sprite.x - 2
                @bullet_y = @playerTank_sprite.y + @@playerTank_img.height / 2
            end

            @playerShoot = true
        end

        if @playerShoot
            self.shoot_bullet
        end

        if @explodeBullet
            self.show_explosion
        end

    end

    def shoot_bullet
        @bulletSprite = Bullet.new(@bullet_x, @bullet_y, Image.load("image/bullet_l1.png"))
        @bulletSprite.angle=(@tankShooting_angle)
        @bulletSprite.draw

         # Collision with other sprites
         if Sprite.check(@bulletSprite, @metalSprites, :showExplosion) || Sprite.check(@bulletSprite, @woodenSprites) || Sprite.check(@bulletSprite, @spikeSprites, :showExplosion, :hit_bullet) || Sprite.check(@bulletSprite, @enemyTank_sprites, nil, :hit_bullet)
            @playerShoot = false # To stop the bullet movement after collision
            @explodeBullet = true
            @explosion_x = @bullet_x
            @explosion_y = @bullet_y
            @explosion_timer = @explosion_maxTime
        end

        case(@tankShooting_angle)
        when 0
            @bullet_x += @bullet_speed
        when 90
            @bullet_y += @bullet_speed
        when 180
            @bullet_x -= @bullet_speed
        when -90
            @bullet_y -= @bullet_speed
        end


        if (@bullet_x <= 0 || @bullet_x >= Window.width) ||
            (@bullet_y <= 0 || @bullet_y >= Window.height)
            puts "Player can shoot now --------------------------"
            @playerShoot = false
        end
    end

    def show_explosion
        if @explosion_timer >= 5
            case(@explosion_timer / 5)
            when 4
                Window.draw(@explosion_x - @@explosion_effects[0].width / 2, @explosion_y - @@explosion_effects[0].height / 2, @@explosion_effects[0])
            when 3
                Window.draw(@explosion_x - @@explosion_effects[2].width / 2, @explosion_y - @@explosion_effects[2].height / 2, @@explosion_effects[2])
            when 2
                Window.draw(@explosion_x - @@explosion_effects[4].width / 2, @explosion_y - @@explosion_effects[4].height / 2, @@explosion_effects[4])
            when 1
                Window.draw(@explosion_x - @@explosion_effects[6].width / 2, @explosion_y - @@explosion_effects[6].height / 2, @@explosion_effects[6])
            end
        end

        @explosion_timer -= 1
    end
end