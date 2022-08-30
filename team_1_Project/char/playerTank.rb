class PlayerTank < Sprite
    def initialize
        image = Image.load("image/player_tank.png")
        x = 0
        y = 230

        super(x,y,image)
    end

end