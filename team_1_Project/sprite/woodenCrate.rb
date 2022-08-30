class WoodenCrate < Sprite
    def initialize(x,y,img)
        super(x,y,img)
    end

    def hit 
        puts "COLLISION WITH WOODEN CRATE ================"
    end
end