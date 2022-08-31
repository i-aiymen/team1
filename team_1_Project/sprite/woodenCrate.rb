class WoodenCrate < Sprite
    def initialize(x,y,img)
        super(x,y,img)
    end

    # With the playerTank, bullet
    def hit 
        self.vanish
    end
end