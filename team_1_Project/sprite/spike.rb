class Spike < Sprite
    def initialize(x,y,img)
        super(x,y,img)
    end

    def hit_bullet_player
        # Vanish the spike after colliding with the bullet
        self.vanish
    end

    def hit 
        puts "COLLISION WITH THE SPIKE ================"
    end

end