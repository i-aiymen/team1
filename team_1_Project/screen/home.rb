
class Home #created a home
    def initialize
        @home_img1 = Image.load("image/1781 1.png")
        @home_img2 = Image.load("image/Button_182 1.png")
        @home_img3 = Image.load("image/Button_102 1.png")
        @home_img4 = Image.load("image/Button_150 1.png")
        @home_img5 = Image.load("image/Button_98 1.png")
        @home_img6 = Image.load("image/Group 2.png")
    end


    def draw
        Window.draw(0, 0, @home_img1)
        Window.draw(20, 20, @home_img2)
        Window.draw(20, 80, @home_img3)
        Window.draw(550, 20, @home_img4)
        Window.draw(550, 80, @home_img5)
        Window.draw(150, 400, @home_img6)
    end


end