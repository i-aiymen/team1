class ChangeTank
    @@backgroundImage = Image.load('image/background.png')
    @@secondaryBackground = Image.load('image/secondaryBackground2.png')
    @@settingsText = Image.load('image/tanks_text.png')

    def initialize
        @@tank1 = Sprite.new(120,216, Image.load('image/goldTank1.png'))
        @@tank2 = Sprite.new(296,216, Image.load('image/blackTank1.png'))
        @@tank3 = Sprite.new(472,216, Image.load('image/greenTank1.png'))
        @@backButton = Sprite.new(344,550, Image.load('image/back.png'))
        @@tankNameButton1 = Sprite.new(118,444, Image.load('image/tankName1.png'))
        @@tankNameButton2 = Sprite.new(291,444, Image.load('image/tankName2.png'))
        @@tankNameButton3 = Sprite.new(464,444, Image.load('image/tankName3.png'))
        
    end

    

    def update(x, y)
        m = Sprite.new(x, y, Image.new(1, 1, C_BLACK))
        if m === @@tankNameButton1
            @@tankNameButton1 = Sprite.new(118,444, Image.load('image/tankName1Hover.png'))
            if Input.mouse_push?(M_LBUTTON)
                $tank = 'goldTank'
                $flag = 10
            end
        end
        if m === @@tankNameButton2
            @@tankNameButton2 = Sprite.new(291,444, Image.load('image/tankName2Hover.png'))
            if Input.mouse_push?(M_LBUTTON)
                $tank = 'blackTank'
                $flag = 10
            end
        end
        if m === @@tankNameButton3
            @@tankNameButton3 = Sprite.new(464,444, Image.load('image/tankName3Hover.png'))
            if Input.mouse_push?(M_LBUTTON)
                $tank = 'greenTank'
                $flag = 10
            end
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
        Window.draw(248,65,@@settingsText)
        Sprite.draw([@@tank1,@@tank2,@@tank3,@@tankNameButton1,@@tankNameButton2,@@tankNameButton3,@@backButton])
    end
end