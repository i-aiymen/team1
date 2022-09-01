class Rules
    @@backgroundImage = Image.load('image/background.png')
    @@secondaryBackground = Image.load('image/secondaryBackground3.png')
    @@rulesText = Image.load('image/rules_text.png')
    @@loremText = Image.load('image/loremText.png')

    # g

    

    # def update(x, y)
    #     m = Sprite.new(x, y, Image.new(1, 1, C_BLACK))
    #     if m === @@changeButton
    #         @@changeButton = Sprite.new(277,334, Image.load('image/changeHover.png'))
    #     end
    # end

    def draw
        # x = Input.mouse_pos_x
        # y = Input.mouse_pos_y

        # update(x, y)
        Window.draw(0, 0, @@backgroundImage)
        Window.draw(96, 84, @@secondaryBackground)
        Window.draw(252,100,@@rulesText)
        Window.draw(122,177,@@loremText)
        # Window.draw(264,282,@@avatarText)
        # Sprite.draw([@@changeButton])
    end
end