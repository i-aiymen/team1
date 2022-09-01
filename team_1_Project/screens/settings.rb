class Settings
    @@backgroundImage = Image.load('image/background.png')
    @@secondaryBackground = Image.load('image/secondaryBackground2.png')
    @@settingsText = Image.load('image/settings_text.png')
    @@avatarText = Image.load('image/avatar_text.png')

    def initialize
        @@changeButton = Sprite.new(277,334, Image.load('image/change.png'))
    end

    

    def update(x, y)
        m = Sprite.new(x, y, Image.new(1, 1, C_BLACK))
        if m === @@changeButton
            @@changeButton = Sprite.new(277,334, Image.load('image/changeHover.png'))
        end
    end

    def draw
        x = Input.mouse_pos_x
        y = Input.mouse_pos_y

        update(x, y)
        Window.draw(0, 0, @@backgroundImage)
        Window.draw(36, 42, @@secondaryBackground)
        Window.draw(199,65,@@settingsText)
        Window.draw(264,282,@@avatarText)
        # flag, nickName, caseType = NicknameInput.nameInput
        # Window.draw_font(255, 220, "(press Space to toggle Case)", Font.new(20),{:color => C_BLACK})
        # Window.draw(240,280,@@textBox)
        # Window.draw_font(240, 288, nickName, Font.new(25),{:color => C_BLACK})
        # Window.draw_font(295, 336, "Active:", Font.new(20),{:color => C_BLACK})
        # Window.draw_font(350, 336, ((caseType == 0)? "Lowercase" : "Uppercase"), Font.new(20),{:color => [255,164,47,68]})
        Sprite.draw([@@changeButton])
    end
end