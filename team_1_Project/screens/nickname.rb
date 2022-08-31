require_relative '../providers/inputName.rb'
class Nickname
    @@backgroundImage = Image.load('image/background.png')
    @@secondaryBackground = Image.load('image/secondaryBackground.png')
    @@nicknameText = Image.load('image/nickName_text.png')
    @@textBox = Image.new(231, 42,[127, 255, 255, 255])
    @@textBox.box_fill(0, 0, 231, 0.5, [200, 0, 0, 0])

    def initialize
        @@backButton = Sprite.new(13,17, Image.load('image/back.png'))
        @@playGameButton = Sprite.new(344,457, Image.load('image/playGame.png'))
    end

    

    # def update(x, y)
    #     m = Sprite.new(x, y, Image.new(1, 1, C_RED))
    #     if m === @@playButton
    #         @@playButton = Sprite.new(290,372, Image.load('image/playHover.png'))
    #     end
    #     if m === @@settingsButton
    #         @@settingsButton = Sprite.new(13,17, Image.load('image/settingsHover.png'))
    #     end
    #     if m === @@rulesButton
    #         @@rulesButton = Sprite.new(13,80, Image.load('image/rulesHover.png'))
    #     end
    #     if m === @@musicButton
    #         @@musicButton = Sprite.new(660,17, Image.load('image/musicHover.png'))
    #     end
    #     if m === @@exitButton
    #         @@exitButton = Sprite.new(660,80, Image.load('image/exitHover.png'))
    #     end
    # end

    def draw
        # x = Input.mouse_pos_x
        # y = Input.mouse_pos_y

        # update(x, y)
        Window.draw(0, 0, @@backgroundImage)
        Window.draw(165, 143, @@secondaryBackground)
        Window.draw(228,165,@@nicknameText)
        flag, nickName, caseType = NicknameInput.nameInput
        Window.draw_font(255, 220, "(press Space to toggle Case)", Font.new(20),{:color => C_BLACK})
        Window.draw(240,280,@@textBox)
        Window.draw_font(240, 288, nickName, Font.new(25),{:color => C_BLACK})
        Window.draw_font(295, 336, "Active:", Font.new(20),{:color => C_BLACK})
        Window.draw_font(350, 336, ((caseType == 0)? "lowercase" : "uppercase"), Font.new(20),{:color => [255,164,47,68]})
        Sprite.draw([@@backButton,@@playGameButton])
    end
end