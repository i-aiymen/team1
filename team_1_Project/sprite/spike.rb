class Spike < Sprite
    def initialize(x,y,img)
        super(x,y,img)
    end

    def hit_bullet
        self.vanish
    end

    def hit 
        puts "COLLISION WITH THE SPIKE ================"
    end

end