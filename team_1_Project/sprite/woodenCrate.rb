class WoodenCrate < Sprite
    def initialize(x,y,img)
        super(x,y,img)
    end

    # With the playerTank, bullet
    def hit_bullet_player
        self.vanish
    end
end