class ChangeAvatar
    @@backgroundImage = Image.load('image/background.png')
    @@secondaryBackground = Image.load('image/secondaryBackground2.png')
    @@settingsText = Image.load('image/settings_text.png')

    def initialize
        @@avatar1 = Sprite.new(135,228, Image.load('image/yoruAvatar.png'))
        @@avatar2 = Sprite.new(296,214, Image.load('image/skyAvatar.png'))
        @@avatar3 = Sprite.new(479,214, Image.load('image/knightAvatar.png'))
        @@backButton = Sprite.new(344,550, Image.load('image/back.png'))
        @@avatarNameButton1 = Sprite.new(118,444, Image.load('image/avatarName1.png'))
        @@avatarNameButton2 = Sprite.new(291,444, Image.load('image/avatarName2.png'))
        @@avatarNameButton3 = Sprite.new(464,444, Image.load('image/avatarName3.png'))
        
    end

    

    def update(x, y)
        m = Sprite.new(x, y, Image.new(1, 1, C_BLACK))
        if m === @@avatarNameButton1
            @@avatarNameButton1 = Sprite.new(118,444, Image.load('image/avatarName1Hover.png'))
        end
        if m === @@avatarNameButton2
            @@avatarNameButton2 = Sprite.new(291,444, Image.load('image/avatarName2Hover.png'))
        end
        if m === @@avatarNameButton3
            @@avatarNameButton3 = Sprite.new(464,444, Image.load('image/avatarName3Hover.png'))
        end
        if m === @@avatar1
            @@avatar1 = Sprite.new(135,228, Image.load('image/yoruAvatarHover.png'))
        end
        if m === @@avatar2
            @@avatar2 = Sprite.new(296,214, Image.load('image/skyAvatarHover.png'))
        end
        if m === @@avatar3
            @@avatar3 = Sprite.new(479,214, Image.load('image/knightAvatarHover.png'))
        end
        if m === @@backButton
            @@backButton = Sprite.new(344,550, Image.load('image/backHover.png'))
            if Input.mouse_push?(M_LBUTTON)
                $flag = 2
            end
        end
    end

    def draw
        x = Input.mouse_pos_x
        y = Input.mouse_pos_y

        update(x, y)
        Window.draw(0, 0, @@backgroundImage)
        Window.draw(36, 42, @@secondaryBackground)
        Window.draw(199,65,@@settingsText)
        Sprite.draw([@@avatar1,@@avatar2,@@avatar3,@@avatarNameButton1,@@avatarNameButton2,@@avatarNameButton3,@@backButton])
    end
end