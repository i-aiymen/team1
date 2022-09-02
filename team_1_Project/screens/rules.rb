class Rules
    @@backgroundImage = Image.load('image/background.png')
    @@secondaryBackground = Image.load('image/secondaryBackground3.png')
    @@rulesText = Image.load('image/rules_text.png')
    @@loremText = Image.load('image/loremText.png')

    def initialize
        @@backButton = Sprite.new(13,17, Image.load('image/back.png'))
    end

    

    def update(x, y)
        m = Sprite.new(x, y, Image.new(1, 1, C_BLACK))
        if m === @@backButton
            @@backButton = Sprite.new(13,17, Image.load('image/backHover.png'))
            if Input.mouse_push?(M_LBUTTON)
                $flag = 0
            end
        end
    end

    def draw
        x = Input.mouse_pos_x
        y = Input.mouse_pos_y

        update(x, y)
        Window.draw(0, 0, @@backgroundImage)
        Window.draw(96, 84, @@secondaryBackground)
        Window.draw(252,100,@@rulesText)
        Window.draw(122,177,@@loremText)
        Sprite.draw([@@backButton])
    end
end