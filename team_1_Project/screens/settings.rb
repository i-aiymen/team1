class Settings
    @@backgroundImage = Image.load('image/background.png')
    @@secondaryBackground = Image.load('image/secondaryBackground2.png')
    @@nicknameText = Image.load('image/nickName_text.png')

    # def initialize
    #     @@backButton = Sprite.new(13,17, Image.load('image/back.png'))
    #     @@playGameButton = Sprite.new(344,457, Image.load('image/playGame.png'))
    # end

    

    # def update(x, y)
    #     m = Sprite.new(x, y, Image.new(1, 1, C_BLACK))
    #     if m === @@backButton
    #         @@backButton = Sprite.new(13,17, Image.load('image/backHover.png'))
    #     end
    #     if m === @@playGameButton
    #         @@playGameButton = Sprite.new(344,457, Image.load('image/playGameHover.png'))
    #     end
    # end

    def draw
        # x = Input.mouse_pos_x
        # y = Input.mouse_pos_y

        # update(x, y)
        Window.draw(0, 0, @@backgroundImage)
        Window.draw(36, 42, @@secondaryBackground)
        # Window.draw(228,165,@@nicknameText)
        # flag, nickName, caseType = NicknameInput.nameInput
        # Window.draw_font(255, 220, "(press Space to toggle Case)", Font.new(20),{:color => C_BLACK})
        # Window.draw(240,280,@@textBox)
        # Window.draw_font(240, 288, nickName, Font.new(25),{:color => C_BLACK})
        # Window.draw_font(295, 336, "Active:", Font.new(20),{:color => C_BLACK})
        # Window.draw_font(350, 336, ((caseType == 0)? "Lowercase" : "Uppercase"), Font.new(20),{:color => [255,164,47,68]})
        # Sprite.draw([@@backButton,@@playGameButton])
    end
end