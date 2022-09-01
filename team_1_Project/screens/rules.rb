class Rules
    def initialize
        @backgroundImage = Image.load("image/background.png")
        @rectengle = Image.load("image/Rectangle 1.png")
        @rule = Image.load("image/RUles.png")
    end


    def draw
        Window.draw(0, 0, @backgroundImage)
        Window.draw(20, 20, @rectengle)
        Window.draw(260, 40, @backgroundImage)
    end
end
