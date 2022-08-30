class MetalCrate < Sprite
    def initialize(x,y,img)
        super(x,y,img)
    end

    def hit 
        puts "COLLISION WITH METAL CRATE ================"
    end
end