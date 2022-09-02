class Settings
    @@backgroundImage = Image.load('image/background.png')
    @@secondaryBackground = Image.load('image/secondaryBackground2.png')
    @@settingsText = Image.load('image/settings_text.png')
    @@avatarText = Image.load('image/avatar_text.png')

    def initialize
        @@changeButton = Sprite.new(294,334, Image.load('image/change.png'))
        @@backButton = Sprite.new(344,487, Image.load('image/back.png'))
    end

    

    def update(x, y)
        m = Sprite.new(x, y, Image.new(1, 1, C_BLACK))
        if m === @@changeButton
            @@changeButton = Sprite.new(294,334, Image.load('image/changeHover.png'))
            if Input.mouse_push?(M_LBUTTON)
                $flag = 6
            end
        end
        if m === @@backButton
            @@backButton = Sprite.new(344,487, Image.load('image/backHover.png'))
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
        Window.draw(36, 42, @@secondaryBackground)
        Window.draw(210,70,@@settingsText)
        Window.draw(278,282,@@avatarText)
        Sprite.draw([@@changeButton,@@backButton])
    end
end