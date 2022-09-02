class StartStoryChar < Sprite

    def initialize(x,y,img)
        super(x,y,img)
    end

    def move
        i_x = Input.x 
        i_y = Input.y 

        if (self.x + i_x >= 0 && self.x + i_x <= Window.width - 60) &&
            (self.y + i_y >= 0 && self.y + i_y <= Window.height - 60)
            self.x += i_x
            self.y += i_y
        end
    end

end